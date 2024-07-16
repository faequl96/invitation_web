import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:invitation_web/enum/enums.dart';
import 'package:invitation_web/firestore.dart';
import 'package:invitation_web/methods/methods.dart';
import 'package:invitation_web/models/db_models/invited_guest.dart';
import 'package:invitation_web/models/db_models/rsvp.dart';
import 'package:invitation_web/view_model.dart';
import 'package:invitation_web/views/page_6/dropdown_attendance_widget.dart';
import 'package:invitation_web/views/page_6/dropdown_avatar_widget.dart';
import 'package:invitation_web/views/page_6/text_field_widget.dart';
import 'package:invitation_web/views/shared/get_size_render_box.dart';

class Page6Slider extends StatelessWidget {
  const Page6Slider({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewModel vM = locator<ViewModel>();

    return SizedBox(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            GetSizeRenderBox(
              onChange: (size) {
                vM.page6SliderHeight = size.height;
              },
              child: Column(
                children: [
                  Container(
                    height: 24,
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 230, 211, 164),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                  ),
                  SizedBox(height: s(vM.h, 62, 68, 74, 80)),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 230, 211, 164),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        TextFieldWidget(
                          labelText: "Nama",
                          hintText: "Guest",
                          textEditingController: vM.nameController,
                        ),
                        const SizedBox(height: 12),
                        TextFieldWidget(
                          labelText: "Ucapan",
                          hintText: "Selamat Yaa",
                          textEditingController: vM.remarkController,
                        ),
                        const SizedBox(height: 12),
                        DropDownAttendanceWidget(
                          labelText: "Kehadiran",
                          textEditingController: vM.attendanceController,
                        ),
                        const SizedBox(height: 12),
                        DropDownAvatarWidget(
                          labelText: "Avatar",
                          hintText: "Pilih Avatar",
                          textEditingController: vM.avatarController,
                        ),
                        const SizedBox(height: 12),
                        const SizedBox(height: 46, child: SubmitButton()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewModel vM = locator<ViewModel>();

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 32),
      ),
      onPressed: () async {
        vM.isLoadingSubmit = true;

        if (vM.invitedGuest != null) {
          final nickName = vM.invitedGuest!.nameInstance == "__"
              ? "Guest"
              : vM.nameController.text.isEmpty
                  ? toCapitalize(vM.toName)
                  : vM.nameController.text;
          final avatar = vM.avatarController.text.isEmpty
              ? "avatars"
              : vM.avatarController.text;
          final attendance = vM.attendanceController.text.isEmpty
              ? "Hadir"
              : vM.attendanceController.text;
          final invitedGuest = vM.invitedGuest!.copyWith(
            nickName: nickName,
            avatar: avatar,
            attendance: attendance,
          );

          await DBRepository.update(
            request: invitedGuest.toJson(),
            collectionRef: DBCollection.invitedGuests,
            documentId: vM.invitedGuest!.id,
          );
        }

        final rsvp = RSVP.message(
          invitedGuestId: vM.invitedGuest?.id ?? "",
          guestName: vM.nameController.text,
          avatar: vM.avatarController.text.isEmpty
              ? "avatars"
              : vM.avatarController.text,
          invited: vM.invitedGuest!.nameInstance == "__" ? false : true,
          attendance: vM.attendanceController.text.isEmpty
              ? "Hadir"
              : vM.attendanceController.text,
          remark: vM.remarkController.text.isEmpty
              ? "Selamat Yaa"
              : vM.remarkController.text,
          dateTime: DateTime.now().millisecondsSinceEpoch,
        );

        await DBRepository.create(
          request: rsvp.toJson(),
          collectionRef: DBCollection.rsvps,
        );

        vM.isLoadingSubmit = false;
        vM.isLoadingSkeleton = true;

        await DBRepository.getAll(
          collectionRef: DBCollection.rsvps,
          orderBy: DBOrderBy(field: "dateTime", descending: true),
        ).then((values) {
          if (values != null) {
            List<RSVP> rsvps = [];
            for (var item in values) {
              rsvps.add(RSVP.fromJson(RSVPType.Message, item));
            }
            vM.rsvps = rsvps;
          }
        });

        await DBRepository.getAll(
          collectionRef: DBCollection.invitedGuests,
          orderBy: DBOrderBy(field: "dateTime", descending: true),
        ).then((values) {
          if (values != null) {
            List<InvitedGuest> invitedGuests = [];
            for (var item in values) {
              invitedGuests.add(InvitedGuest.fromJson(item));
            }
            vM.invitedGuests = invitedGuests;
          }
        });

        vM.isLoadingSkeleton = false;
      },
      child: SubmitButtonDesign(),
    );
  }
}

class SubmitButtonDesign extends StatelessWidget with GetItMixin {
  SubmitButtonDesign({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewModel vM = get<ViewModel>();

    watchOnly((ViewModel x) => x.isLoadingSubmit);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (vM.isLoadingSubmit) ...[
          SizedBox(
            width: s(vM.w, 24.6, 25.2, 25.8, 26.4),
            height: s(vM.w, 24.6, 25.2, 25.8, 26.4),
            child: const CircularProgressIndicator(),
          ),
          const SizedBox(width: 10),
        ],
        Text(
          "Submit",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: s(vM.w, 14, 14.4, 15, 15.8),
          ),
        ),
      ],
    );
  }
}
