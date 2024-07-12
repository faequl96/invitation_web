import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:invitation_web/firestore.dart';
import 'package:invitation_web/models/db_models/invited_guest.dart';
import 'package:invitation_web/view_model.dart';
import 'package:invitation_web/views/shared/get_size_render_box.dart';

class Page6 extends StatelessWidget with GetItMixin {
  Page6({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewModel vM = locator<ViewModel>();

    return Positioned(
      top: vM.sV > vM.s.height * 5 + (vM.page6SliderHeight + 20)
          ? vM.s.height -
              (vM.sV - (vM.s.height * 5 + (vM.page6SliderHeight + 20)))
          : vM.s.height,
      child: GetSizeRenderBox(
        onChange: (size) async {
          await Future.delayed(const Duration(microseconds: 100));
          vM.page6Height = size.height;
          final remainingHeight = vM.s.height - vM.page6SliderHeight;

          vM.additionalPage =
              ((vM.page6Height - remainingHeight) / vM.s.height).ceil();
        },
        child: Container(
          width: vM.s.width - 32,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 230, 211, 164),
            borderRadius: BorderRadius.circular(16),
          ),
          child: StreamBuilder(
            stream: DBCollection.rsvps.orderBy("dateTime").snapshots(),
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 8),
                    ...snapshot.data!.docs.map((e) {
                      return RSVPsItem(vM: vM, rsvpData: e.data());
                    }),
                    const SizedBox(height: 8),
                  ],
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}

class RSVPsItem extends StatefulWidget {
  const RSVPsItem({
    super.key,
    required this.vM,
    required this.rsvpData,
  });

  final ViewModel vM;
  final Map<String, dynamic> rsvpData;

  @override
  State<RSVPsItem> createState() => _RSVPsItemState();
}

class _RSVPsItemState extends State<RSVPsItem> {
  InvitedGuest? invitedGuest;

  _getInvitedGuestData() async {
    DBRepository.getOne(
      collectionRef: DBCollection.invitedGuests,
      documentId: widget.rsvpData["invitedGuestsId"],
    ).then((value) {
      if (value != null) {
        invitedGuest = InvitedGuest.fromJson(value);
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    _getInvitedGuestData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(
        children: [
          if (widget.rsvpData["invited"] == false)
            SizedBox(
              height: 32,
              width: 32,
              child: Image(
                image: AssetImage(
                  "assets/avatars/${widget.rsvpData["avatar"]}.png",
                ),
                fit: BoxFit.fitWidth,
              ),
            )
          else if (invitedGuest != null)
            SizedBox(
              height: 32,
              width: 32,
              child: Image(
                image: AssetImage(
                  "assets/avatars/${invitedGuest!.avatar}.png",
                ),
                fit: BoxFit.fitWidth,
              ),
            ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.rsvpData["invited"] == false
                      ? widget.rsvpData["guestName"]
                      : invitedGuest?.nickName ?? "",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(widget.rsvpData["remark"]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
