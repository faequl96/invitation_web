import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:invitation_web/firestore.dart';
import 'package:invitation_web/methods/methods.dart';
import 'package:invitation_web/models/db_models/rsvp.dart';
import 'package:invitation_web/view_model.dart';
import 'package:invitation_web/views/page_6/dropdown_attendance_widget.dart';
import 'package:invitation_web/views/page_6/dropdown_avatar_widget.dart';
import 'package:invitation_web/views/page_6/text_field_widget.dart';

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
                  SizedBox(height: 46, child: SubmitButton()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget with GetItMixin {
  SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewModel vM = locator<ViewModel>();

    watchOnly((ViewModel x) => x.isBusy);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 32),
      ),
      onPressed: () async {
        vM.isBusy = true;

        if (vM.invitedGuest != null) {
          final nickName = vM.invitedGuest!.nameInstance == "__"
              ? "Guest"
              : vM.nameController.text.isEmpty
                  ? toCapitalize(vM.toName)
                  : vM.nameController.text;
          final avatar = vM.avatarController.text.isEmpty
              ? null
              : vM.avatarController.text;
          final invitedGuest = vM.invitedGuest!.copyWith(
            nickName: nickName,
            attendance: vM.attendance,
            avatar: avatar,
          );

          await DBRepository.update(
            request: invitedGuest.toJson(),
            collectionRef: DBCollection.invitedGuests,
            documentId: vM.invitedGuest!.id,
          );
        }

        final rsvp = RSVP.message(
          invitedGuestsId: vM.invitedGuest?.id ?? "",
          remark: vM.remarkController.text.isEmpty
              ? "Selamat Yaa"
              : vM.remarkController.text,
          dateTime: DateTime.now().millisecondsSinceEpoch,
          guestName:
              "${vM.invitedGuest!.nameInstance == "__" ? "Guest" : "Invited"}_${vM.nameController.text}",
        );

        await DBRepository.create(
          request: rsvp.toJson(),
          collectionRef: DBCollection.rsvps,
        );

        vM.isBusy = false;
        // getFromDB(vM);
        // showModalBottomSheet(
        //   backgroundColor: Colors.transparent,
        //   barrierColor: Colors.black54,
        //   isDismissible: false,
        //   isScrollControlled: true,
        //   context: context,
        //   builder: (context) {
        //     return Padding(
        //       padding: EdgeInsets.only(
        //         bottom: MediaQuery.of(context).viewInsets.bottom,
        //       ),
        //       child: SizedBox(
        //         height: 480,
        //         child: Column(
        //           children: [
        //             Container(
        //               width: 80,
        //               height: 8,
        //               margin:
        //                   const EdgeInsets.symmetric(vertical: 6),
        //               decoration: BoxDecoration(
        //                 color: Colors.white,
        //                 borderRadius: BorderRadius.circular(4),
        //               ),
        //             ),
        //             Expanded(
        //               child: Container(
        //                 decoration: BoxDecoration(
        //                   color: Colors.white,
        //                   borderRadius: BorderRadius.circular(10),
        //                 ),
        //                 clipBehavior: Clip.hardEdge,
        //                 child: Column(
        //                   children: [
        //                     TextFieldWidget(
        //                       labelText: "Nama",
        //                       textEditingController:
        //                           vM.nameController,
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     );
        //   },
        // );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (vM.isBusy) ...[
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
      ),
    );
  }
}
