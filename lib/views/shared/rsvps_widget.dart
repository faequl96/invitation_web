import 'dart:async';
import 'dart:math';

import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:invitation_web/methods/methods.dart';
import 'package:invitation_web/models/db_models/invited_guest.dart';
import 'package:invitation_web/models/db_models/rsvp.dart';
import 'package:invitation_web/view_model.dart';
import 'package:watch_it/watch_it.dart';

class GetRSVPsWidget extends StatefulWidget {
  const GetRSVPsWidget({super.key, this.isModalContent = false});

  final bool isModalContent;

  @override
  State<GetRSVPsWidget> createState() => _GetRSVPsWidgetState();
}

class _GetRSVPsWidgetState extends State<GetRSVPsWidget> {
  @override
  void initState() {
    if (widget.isModalContent == false) getRSVPsData();
    super.initState();
  }

  @override
  Widget build(_) => _RSVPsWidget(isModalContent: widget.isModalContent);
}

class _RSVPsWidget extends WatchingWidget {
  const _RSVPsWidget({required this.isModalContent});

  final bool isModalContent;

  @override
  Widget build(BuildContext context) {
    final ViewModel vM = di<ViewModel>();

    watchPropertyValue((ViewModel x) => x.isLoadingSkeleton);

    return ListView(
      children: [
        if (vM.isLoadingSkeleton == true) ...[
          const SizedBox(height: 8),
          ...List.generate(4, (i) {
            if (i == 3) {
              return const Column(
                children: [_RSVPSkeleton(), SizedBox(height: 4)],
              );
            }
            return Column(
              children: [
                const _RSVPSkeleton(),
                const SizedBox(height: 4),
                Container(
                  height: 1,
                  width: double.maxFinite,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  color: Colors.black26,
                ),
                const SizedBox(height: 10),
              ],
            );
          }),
          const SizedBox(height: 8),
        ] else if (vM.rsvps.isNotEmpty) ...[
          const SizedBox(height: 8),
          if (vM.rsvps.length > 6 && isModalContent == false)
            ...List.generate(6, (i) {
              if (i == 5) return _RSVPItem(vM: vM, rsvp: vM.rsvps[i]);
              return Column(
                children: [
                  _RSVPItem(vM: vM, rsvp: vM.rsvps[i]),
                  Container(
                    height: 1,
                    width: double.maxFinite,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    color: Colors.black26,
                  ),
                  const SizedBox(height: 10),
                ],
              );
            })
          else
            ...List.generate(vM.rsvps.length, (i) {
              final length = vM.rsvps.length;
              if (i == length - 1) return _RSVPItem(vM: vM, rsvp: vM.rsvps[i]);
              return Column(
                children: [
                  _RSVPItem(vM: vM, rsvp: vM.rsvps[i]),
                  Container(
                    height: 1,
                    width: double.maxFinite,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    color: Colors.black26,
                  ),
                  const SizedBox(height: 10),
                ],
              );
            }),
          const SizedBox(height: 8),
        ],
      ],
    );
  }
}

class _RSVPItem extends StatefulWidget {
  const _RSVPItem({required this.vM, required this.rsvp});

  final ViewModel vM;
  final RSVP rsvp;

  @override
  State<_RSVPItem> createState() => _RSVPItemState();
}

class _RSVPItemState extends State<_RSVPItem> {
  InvitedGuest? invitedGuest;

  _setInvitedGuest() async {
    final ViewModel vM = di<ViewModel>();

    for (var item in vM.invitedGuests) {
      if (item.id == widget.rsvp.invitedGuestId) {
        invitedGuest = item;
        break;
      }
    }
  }

  @override
  void initState() {
    _setInvitedGuest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.rsvp.invited == false)
            SizedBox(
              height: 32,
              width: 32,
              child: Image(
                image: AssetImage("assets/avatars/${widget.rsvp.avatar}.png"),
                fit: BoxFit.fitWidth,
              ),
            )
          else if (invitedGuest != null)
            SizedBox(
              height: 32,
              width: 32,
              child: Image(
                image: AssetImage("assets/avatars/${invitedGuest!.avatar}.png"),
                fit: BoxFit.fitWidth,
              ),
            )
          else
            CardLoading(
              height: 32,
              width: 32,
              borderRadius: BorderRadius.circular(10),
            ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (widget.rsvp.invited == false)
                      Text(
                        "Guest_${widget.rsvp.guestName}",
                        style: TextStyle(
                          fontSize: s(widget.vM.w, 12.8, 13.2, 13.8, 14.6),
                          fontWeight: FontWeight.bold,
                          height: 1.16,
                        ),
                      )
                    else if (invitedGuest != null)
                      Text(
                        invitedGuest?.nickName ?? "",
                        style: TextStyle(
                          fontSize: s(widget.vM.w, 12.8, 13.2, 13.8, 14.6),
                          fontWeight: FontWeight.bold,
                          height: 1.16,
                        ),
                      )
                    else
                      CardLoading(
                        height: s(widget.vM.w, 11, 12, 13, 14),
                        width: 50 + Random().nextInt(20).toDouble(),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    const SizedBox(width: 8),
                    _TimeLapse(dateTimeEpoch: widget.rsvp.dateTime),
                  ],
                ),
                if (widget.rsvp.invited == false)
                  Text(
                    "@__Guest",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: s(widget.vM.w, 10.8, 11.2, 11.8, 12.6),
                      height: 1.16,
                    ),
                  )
                else if (invitedGuest != null)
                  Text(
                    "@${invitedGuest!.nameInstance}",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: s(widget.vM.w, 10.8, 11.2, 11.8, 12.6),
                      height: 1.16,
                    ),
                  )
                else ...[
                  const SizedBox(height: 4),
                  CardLoading(
                    height: s(widget.vM.w, 8, 9, 10, 11),
                    width: 100 + Random().nextInt(60).toDouble(),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  )
                ],
                const SizedBox(height: 4),
                Text(
                  widget.rsvp.attendance,
                  style: TextStyle(
                    color: widget.rsvp.attendance == "Hadir"
                        ? Colors.green
                        : widget.rsvp.attendance == "Tidak Hadir"
                            ? Colors.red
                            : Colors.grey.shade700,
                    fontWeight: widget.rsvp.attendance == "Hadir"
                        ? FontWeight.bold
                        : null,
                    fontSize: s(widget.vM.w, 10.8, 11.2, 11.8, 12.6),
                  ),
                ),
                Text(
                  widget.rsvp.remark,
                  style: TextStyle(
                    fontSize: s(widget.vM.w, 12.8, 13.2, 13.8, 14.6),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TimeLapse extends StatefulWidget {
  const _TimeLapse({required this.dateTimeEpoch});

  final int dateTimeEpoch;

  @override
  State<_TimeLapse> createState() => _TimeLapseState();
}

class _TimeLapseState extends State<_TimeLapse> {
  late final Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ViewModel vM = di<ViewModel>();

    return Text(
      getTime(diffOfMillisecondsSinceEpoch(widget.dateTimeEpoch)),
      style: TextStyle(
        color: Colors.grey.shade600,
        fontSize: s(vM.w, 12.8, 13.2, 13.8, 14.6),
        height: 1.16,
      ),
    );
  }
}

class _RSVPSkeleton extends StatelessWidget {
  const _RSVPSkeleton();

  @override
  Widget build(BuildContext context) {
    final ViewModel vM = di<ViewModel>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CardLoading(
            height: 32,
            width: 32,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 1),
                Row(
                  children: [
                    CardLoading(
                      height: s(vM.w, 11, 12, 13, 14),
                      width: 50 + Random().nextInt(20).toDouble(),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    const SizedBox(width: 8),
                    CardLoading(
                      height: s(vM.w, 11, 12, 13, 14),
                      width: 32,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                CardLoading(
                  height: s(vM.w, 8, 9, 10, 11),
                  width: 100 + Random().nextInt(60).toDouble(),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                const SizedBox(height: 7),
                CardLoading(
                  height: s(vM.w, 9, 10, 11, 12),
                  width: 40 + Random().nextInt(20).toDouble(),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                const SizedBox(height: 7),
                CardLoading(
                  height: s(vM.w, 11, 12, 13, 14),
                  width: 140 + Random().nextInt(120).toDouble(),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
