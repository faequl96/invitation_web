import 'package:flutter/material.dart';
import 'package:invitation_web/enum/enums.dart';
import 'package:invitation_web/methods/methods.dart';
import 'package:invitation_web/views/cover_page/invitation_wrap.dart';
import 'package:invitation_web/views/cover_page/invitation_key.dart';
import 'package:invitation_web/views/cover_page/invitation_seal.dart';
import 'package:invitation_web/views/shared/countdown.dart';
import 'package:invitation_web/views/cover_page/swipe_up.dart';
import 'package:invitation_web/view_model.dart';
import 'package:invitation_web/views/shared/animated_shake_widget.dart';
import 'package:watch_it/watch_it.dart';

class FrontView extends WatchingWidget {
  const FrontView({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewModel vM = di<ViewModel>();
    watchPropertyValue((ViewModel x) => x.swipeUpViewState);
    watchPropertyValue((ViewModel x) => x.countdownViewState);
    watchPropertyValue((ViewModel x) => x.isKeyOpened);
    watchPropertyValue((ViewModel x) => x.isSealOpened);
    watchPropertyValue((ViewModel x) => x.isSealOpenCompleted);
    watchPropertyValue((ViewModel x) => x.isCompleted);

    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        if (vM.isSealOpenCompleted)
          if (vM.sV < 1) const Positioned(bottom: 0, child: SwipeUp()),
        if (vM.cdPositionY2 < 50 + 140 * 2 && vM.sV <= vM.s.height * 2) ...[
          Positioned(
            left: (s(vM.w, 62, 66, 70, 74) +
                ((vM.s.width - s(vM.w, 140, 148, 156, 164)) / 4)),
            bottom: vM.cdPositionY2,
            child: const CountDown(
              unitTimeType: UnitTimeType.Hour,
              sizeType: CountdownSizeType.Lg,
            ),
          ),
          Positioned(
            right: (s(vM.w, 62, 66, 70, 74) +
                ((vM.s.width - s(vM.w, 140, 148, 156, 164)) / 4)),
            bottom: vM.cdPositionY2,
            child: const CountDown(
              unitTimeType: UnitTimeType.Minute,
              sizeType: CountdownSizeType.Lg,
            ),
          ),
          Positioned(
            right: s(vM.w, 46, 50, 54, 58),
            bottom: vM.cdPositionY2,
            child: const CountDown(
              unitTimeType: UnitTimeType.Second,
              sizeType: CountdownSizeType.Lg,
            ),
          ),
          Positioned(
            left: s(vM.w, 46, 50, 54, 58),
            bottom: vM.cdPositionY2,
            child: const CountDown(
              unitTimeType: UnitTimeType.Day,
              sizeType: CountdownSizeType.Lg,
            ),
          ),
        ],
        if (vM.sV > vM.s.height * 2 && vM.sV <= vM.s.height * 3) ...[
          Positioned(
            left: (s(vM.w, 62, 66, 70, 74) +
                ((vM.s.width - s(vM.w, 140, 148, 156, 164)) / 4)),
            bottom: vM.cdPositionY23,
            child: const CountDown(
              unitTimeType: UnitTimeType.Hour,
              sizeType: CountdownSizeType.Lg,
            ),
          ),
          Positioned(
            right: (s(vM.w, 62, 66, 70, 74) +
                ((vM.s.width - s(vM.w, 140, 148, 156, 164)) / 4)),
            bottom: vM.cdPositionY22,
            child: const CountDown(
              unitTimeType: UnitTimeType.Minute,
              sizeType: CountdownSizeType.Lg,
            ),
          ),
          Positioned(
            right: s(vM.w, 46, 50, 54, 58),
            bottom: vM.cdPositionY24,
            child: const CountDown(
              unitTimeType: UnitTimeType.Second,
              sizeType: CountdownSizeType.Lg,
            ),
          ),
          Positioned(
            left: s(vM.w, 46, 50, 54, 58),
            bottom: vM.cdPositionY21,
            child: const CountDown(
              unitTimeType: UnitTimeType.Day,
              sizeType: CountdownSizeType.Lg,
            ),
          ),
        ],
        if (vM.sV > vM.s.height * 3 && vM.sV <= vM.s.height * 5) ...[
          Positioned(
            left: (s(vM.w, 62, 66, 70, 74) +
                ((vM.s.width - s(vM.w, 140, 148, 156, 164)) / 4)),
            bottom: 48 + vM.cdPositionY3,
            child: const AnimatedShakeWidget(
              child: CountDown(
                unitTimeType: UnitTimeType.Hour,
                sizeType: CountdownSizeType.Lg,
              ),
            ),
          ),
          Positioned(
            right: (s(vM.w, 62, 66, 70, 74) +
                ((vM.s.width - s(vM.w, 140, 148, 156, 164)) / 4)),
            bottom: 48 + vM.cdPositionY3,
            child: const AnimatedShakeWidget(
              child: CountDown(
                unitTimeType: UnitTimeType.Minute,
                sizeType: CountdownSizeType.Lg,
              ),
            ),
          ),
          Positioned(
            right: s(vM.w, 46, 50, 54, 58),
            bottom: 48 + vM.cdPositionY3,
            child: const AnimatedShakeWidget(
              child: CountDown(
                unitTimeType: UnitTimeType.Second,
                sizeType: CountdownSizeType.Lg,
              ),
            ),
          ),
          Positioned(
            left: s(vM.w, 46, 50, 54, 58),
            bottom: 48 + vM.cdPositionY3,
            child: const AnimatedShakeWidget(
              child: CountDown(
                unitTimeType: UnitTimeType.Day,
                sizeType: CountdownSizeType.Lg,
              ),
            ),
          ),
        ],
        if (vM.isCompleted == false) ...[
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInCubic,
            right: vM.isSealOpenCompleted ? -(vM.s.width / 2) : 0,
            child: InvitationWrap(),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInCubic,
            left: vM.isSealOpenCompleted ? -(vM.s.width / 2) : 0,
            child: InvitationWrap(),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeInCubic,
            top: vM.isSealOpened ? -vM.s.height : 0,
            child: InvitationSeal(isSealOpened: vM.isSealOpened),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            bottom: vM.isKeyOpened ? -50 : 20,
            child: InvitationKey(
              onOpened: () async {
                vM.isKeyOpened = true;

                await Future.delayed(const Duration(milliseconds: 300));
                vM.isSealOpened = true;

                await Future.delayed(const Duration(milliseconds: 1000));
                vM.isSealOpenCompleted = true;

                await Future.delayed(const Duration(milliseconds: 600));
                vM.isCompleted = true;
              },
            ),
          ),
        ],
      ],
    );
  }
}
