import 'package:flutter/material.dart';
import 'package:invitation_web/enum/enums.dart';
import 'package:invitation_web/methods/methods.dart';
import 'package:invitation_web/views/page_3/page_3.dart';
import 'package:invitation_web/views/shared/shared_page.dart';
import 'package:invitation_web/views/page_6/page_6.dart';
import 'package:invitation_web/views/shared/countdown.dart';
import 'package:invitation_web/views/cover_page/left_bg.dart';
import 'package:invitation_web/views/cover_page/light_effect.dart';
import 'package:invitation_web/views/cover_page/right_bg.dart';
import 'package:invitation_web/views/cover_page/invitation_title.dart';
import 'package:invitation_web/views/page_1/page_1.dart';
import 'package:invitation_web/view_model.dart';
import 'package:watch_it/watch_it.dart';

class SuperView extends StatefulWidget {
  const SuperView({super.key});

  @override
  State<SuperView> createState() => _SuperViewState();
}

class _SuperViewState extends State<SuperView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final ViewModel vM = di<ViewModel>();
      vM.pageController.addListener(() {
        superLogic(vM);
        setState(() {});
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ViewModel vM = di<ViewModel>();

    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        if (vM.sV > vM.s.height * 4) SharedPage(),
        if (vM.sV > vM.s.height * 5) Page6(),
        if (vM.sV > vM.s.height * 2 && vM.sV <= vM.s.height * 4)
          Positioned(
            bottom: vM.sV < vM.s.height * 3 ? 0 : vM.sV - vM.s.height * 3,
            child: Page3(),
          ),
        if (vM.cdPositionY1 > 0 && vM.sV <= vM.s.height * 4) ...[
          Positioned(
            left: (s(vM.w, 68, 72, 76, 80) +
                ((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4)),
            bottom: vM.cdPositionY1 -
                ((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4),
            child: const CountDown(
              unitTimeType: UnitTimeType.Hour,
              sizeType: CountdownSizeType.Sm,
            ),
          ),
          Positioned(
            right: (s(vM.w, 68, 72, 76, 80) +
                ((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4)),
            bottom: vM.cdPositionY1 -
                ((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4),
            child: const CountDown(
              unitTimeType: UnitTimeType.Minute,
              sizeType: CountdownSizeType.Sm,
            ),
          ),
          Positioned(
            right: s(vM.w, 48, 52, 56, 60),
            bottom: vM.cdPositionY1 -
                ((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4),
            child: const CountDown(
              unitTimeType: UnitTimeType.Second,
              sizeType: CountdownSizeType.Sm,
            ),
          ),
          Positioned(
            left: s(vM.w, 48, 52, 56, 60),
            bottom: vM.cdPositionY1 -
                ((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4),
            child: const CountDown(
              unitTimeType: UnitTimeType.Day,
              sizeType: CountdownSizeType.Sm,
            ),
          ),
        ],
        if (vM.sV < vM.s.height * 2) Page1(),
        if (vM.sV < vM.s.height)
          Container(
            height: vM.s.height,
            width: vM.s.width,
            color: Colors.white.withValues(alpha: vM.opacity),
          ),
        if (vM.sV < vM.s.height + 110) ...[
          Positioned(right: -vM.bgPositionX, child: LightEffect(isRight: true)),
          Positioned(left: -vM.bgPositionX, child: LightEffect(isRight: false)),
          Positioned(right: -vM.bgPositionX, child: RightBackground()),
          Positioned(left: -vM.bgPositionX, child: LeftBackground()),
          Positioned(
            right: -vM.bgPositionX,
            child: RightBackground(isTransparent: true),
          ),
        ],
        if (vM.sV < vM.s.height) ...[
          Positioned(
            top: s(vM.h, 6, 12, 30, 60) - (vM.sV / 14),
            left: s(vM.w, 45, 48, 51, 54),
            child: InvitationTitle(),
          ),
          Positioned(
            top: s(vM.h, 50, 56, 74, 104) - (vM.sV / 14),
            right: s(vM.w, 45, 48, 51, 54),
            child: InvitationTitle(isBottomTitle: true),
          ),
        ],
        if (vM.sV < vM.s.height + 100) ...[
          Positioned(
            left: vM.cdPosition2.xAxis >=
                        (s(vM.w, 68, 72, 76, 80) +
                            ((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4)) &&
                    vM.cdPosition2.xAxis <=
                        (vM.s.width / 2) -
                            (((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4) /
                                2)
                ? vM.cdPosition2.xAxis
                : vM.cdPosition2.xAxis <
                        (s(vM.w, 68, 72, 76, 80) +
                            ((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4))
                    ? (s(vM.w, 68, 72, 76, 80) +
                        ((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4))
                    : (vM.s.width / 2) -
                        (((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4) / 2),
            bottom: vM.cdPosition2.yAxis >= 40
                ? vM.cdPosition2.yAxis
                : vM.cdPosition2.yAxis < 40
                    ? 40
                    : s(vM.h, 202, 218, 234, 250),
            child: const CountDown(
              unitTimeType: UnitTimeType.Hour,
              sizeType: CountdownSizeType.Sm,
            ),
          ),
          Positioned(
            right: vM.cdPosition2.xAxis >=
                        (s(vM.w, 68, 72, 76, 80) +
                            ((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4)) &&
                    vM.cdPosition2.xAxis <=
                        (vM.s.width / 2) -
                            (((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4) /
                                2)
                ? vM.cdPosition2.xAxis
                : vM.cdPosition2.xAxis <
                        (s(vM.w, 68, 72, 76, 80) +
                            ((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4))
                    ? (s(vM.w, 68, 72, 76, 80) +
                        ((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4))
                    : (vM.s.width / 2) -
                        (((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4) / 2),
            bottom: vM.cdPosition2.yAxis >= 40
                ? vM.cdPosition2.yAxis
                : vM.cdPosition2.yAxis < 40
                    ? 40
                    : s(vM.h, 202, 218, 234, 250),
            child: const CountDown(
              unitTimeType: UnitTimeType.Minute,
              sizeType: CountdownSizeType.Sm,
            ),
          ),
          Positioned(
            right: vM.cdPosition1.xAxis >= s(vM.w, 48, 52, 56, 60) &&
                    vM.cdPosition1.xAxis <=
                        (vM.s.width / 2) -
                            (((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4) /
                                2)
                ? vM.cdPosition1.xAxis
                : vM.cdPosition1.xAxis < s(vM.w, 48, 52, 56, 60)
                    ? s(vM.w, 48, 52, 56, 60)
                    : (vM.s.width / 2) -
                        (((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4) / 2),
            bottom: vM.cdPosition1.yAxis >= 40
                ? vM.cdPosition1.yAxis
                : vM.cdPosition1.yAxis < 40
                    ? 40
                    : s(vM.h, 202, 218, 234, 250),
            child: const CountDown(
              unitTimeType: UnitTimeType.Second,
              sizeType: CountdownSizeType.Sm,
            ),
          ),
          Positioned(
            left: vM.cdPosition1.xAxis >= s(vM.w, 48, 52, 56, 60) &&
                    vM.cdPosition1.xAxis <=
                        (vM.s.width / 2) -
                            (((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4) /
                                2)
                ? vM.cdPosition1.xAxis
                : vM.cdPosition1.xAxis < s(vM.w, 48, 52, 56, 60)
                    ? s(vM.w, 48, 52, 56, 60)
                    : (vM.s.width / 2) -
                        (((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4) / 2),
            bottom: vM.cdPosition1.yAxis >= 40
                ? vM.cdPosition1.yAxis
                : vM.cdPosition1.yAxis < 40
                    ? 40
                    : s(vM.h, 202, 218, 234, 250),
            child: const CountDown(
              unitTimeType: UnitTimeType.Day,
              sizeType: CountdownSizeType.Sm,
            ),
          ),
        ],
        if (vM.cdPositionY1 > 50 &&
            vM.cdPositionY1 <= 50 + 140 * 2 &&
            vM.sV <= vM.s.height * 2) ...[
          Positioned(
            left: (s(vM.w, 68, 72, 76, 80) +
                ((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4)),
            bottom: vM.cdPositionY1,
            child: const CountDown(
              unitTimeType: UnitTimeType.Hour,
              sizeType: CountdownSizeType.Sm,
            ),
          ),
          Positioned(
            right: (s(vM.w, 68, 72, 76, 80) +
                ((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4)),
            bottom: vM.cdPositionY1,
            child: const CountDown(
              unitTimeType: UnitTimeType.Minute,
              sizeType: CountdownSizeType.Sm,
            ),
          ),
          Positioned(
            right: s(vM.w, 48, 52, 56, 60),
            bottom: vM.cdPositionY1,
            child: const CountDown(
              unitTimeType: UnitTimeType.Second,
              sizeType: CountdownSizeType.Sm,
            ),
          ),
          Positioned(
            left: s(vM.w, 48, 52, 56, 60),
            bottom: vM.cdPositionY1,
            child: const CountDown(
              unitTimeType: UnitTimeType.Day,
              sizeType: CountdownSizeType.Sm,
            ),
          ),
        ],
        if (vM.sV == 0) ...[
          if (vM.toName.isNotEmpty)
            Positioned(
              bottom: s(vM.h, 136, 146, 156, 166),
              child: Text(
                toCapitalize(vM.toName),
                style: TextStyle(
                  fontSize: s(vM.w, 16, 18, 19, 20),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          if (vM.instance.isNotEmpty)
            Positioned(
              bottom: s(vM.h, 108, 116, 124, 132),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (vM.isInstanceAvailable) ...[
                    Image(
                      image: AssetImage(
                        "assets/${toUnderScore(vM.instance)}.png",
                      ),
                      height: s(vM.w, 20, 22, 24, 26),
                      fit: BoxFit.fitHeight,
                    ),
                    const SizedBox(width: 10),
                  ],
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        toRemoveStrip(vM.instance),
                        style: TextStyle(
                          fontSize: s(vM.w, 15, 16, 17, 18),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ],
    );
  }
}
