import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:invitation_web/enum/enums.dart';
import 'package:invitation_web/methods/methods.dart';
import 'package:invitation_web/views/shared/countdown.dart';
import 'package:invitation_web/views/cover_page/swipe_up.dart';
import 'package:invitation_web/view_model.dart';

class FrontView extends StatelessWidget with GetItMixin {
  FrontView({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewModel vM = get<ViewModel>();
    watchOnly((ViewModel x) => x.swipeUpViewState);
    watchOnly((ViewModel x) => x.frontViewState);

    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        if (vM.sV < 1) const Positioned(bottom: 0, child: SwipeUp()),
        if (vM.cdPositionY2 < 50 + 140 * 2) ...[
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
      ],
    );
  }
}
