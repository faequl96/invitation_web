import 'package:flutter/material.dart';
import 'package:invitation_web/enum/enums.dart';
import 'package:invitation_web/methods/methods.dart';
import 'package:invitation_web/pages/cover_page/countdown.dart';
import 'package:invitation_web/pages/cover_page/left_bg.dart';
import 'package:invitation_web/pages/cover_page/light_effect.dart';
import 'package:invitation_web/pages/cover_page/right_bg.dart';
import 'package:invitation_web/pages/cover_page/swipe_up.dart';
import 'package:invitation_web/pages/cover_page/title_invitation.dart';
import 'package:invitation_web/pages/page_1/page_1.dart';
import 'package:invitation_web/pages/page_2/page_2.dart';
import 'package:invitation_web/view_model.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  bool isKeyOpened = false;
  bool isSealOpened = false;
  bool isOpenCompleted = false;

  String _toName = "";
  String _instance = "";

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _toName = Uri.base.queryParameters["to"] ?? "";
      _instance = Uri.base.queryParameters["instance"] ?? "";

      final ViewModel vM = locator<ViewModel>();

      vM.pageController.addListener(() {
        superLogic(vM);
        setState(() {});
      });

      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ViewModel vM = locator<ViewModel>();

    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        if (vM.sV < vM.s.height * 2) Page1(),
        if (vM.sV < vM.s.height)
          Container(
            height: vM.s.height,
            width: vM.s.width,
            color: Colors.white.withOpacity(vM.opacity),
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
            child: TitleInvitation(),
          ),
          Positioned(
            top: s(vM.h, 50, 56, 74, 104) - (vM.sV / 14),
            right: s(vM.w, 45, 48, 51, 54),
            child: TitleInvitation(isBottomTitle: true),
          ),
        ],
        Positioned(
          left: vM.cdPosition2.xAxis >=
                      (s(vM.w, 68, 72, 76, 80) +
                          ((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4)) &&
                  vM.cdPosition2.xAxis <=
                      (vM.s.width / 2) -
                          (((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4) / 2)
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
                          (((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4) / 2)
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
                          (((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4) / 2)
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
                          (((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4) / 2)
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
        if (vM.cdPositionY1 > 50 && vM.cdPositionY1 <= 50 + 140 * 2) ...[
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
          if (_toName.isNotEmpty)
            Positioned(
              bottom: s(vM.h, 136, 146, 156, 166),
              child: Text(
                toCapitalize(_toName),
                style: TextStyle(
                  fontSize: s(vM.w, 16, 18, 19, 20),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          if (_instance.isNotEmpty)
            Positioned(
              bottom: s(vM.h, 108, 116, 124, 132),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage("assets/$_instance.png"),
                    height: s(vM.w, 20, 22, 24, 26),
                    fit: BoxFit.fitHeight,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        toCapitalize(_instance),
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
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            SizedBox(
              height: vM.s.height,
              width: vM.s.width,
              child: PageView(
                controller: vM.pageController,
                scrollDirection: Axis.vertical,
                children: [
                  SizedBox(height: vM.s.height, width: double.maxFinite),
                  SizedBox(height: vM.s.height, width: double.maxFinite),
                  const Page2(),
                  SizedBox(height: vM.s.height, width: double.maxFinite),
                ],
              ),
            ),
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
            // AnimatedPositioned(
            //   duration: const Duration(milliseconds: 1000),
            //   top: isSealOpened ? -s.height : 0,
            //   child: SealInvitation(isSealOpened: isSealOpened),
            // ),
            // if (isOpenCompleted)
            if (vM.sV < 10) const Positioned(bottom: 0, child: SwipeUp()),
            // AnimatedPositioned(
            //   duration: const Duration(milliseconds: 200),
            //   bottom: isKeyOpened ? -50 : 20,
            //   child: KeyInvitation(
            //     onOpened: () async {
            //       isKeyOpened = true;
            //       setState(() {});

            //       await Future.delayed(const Duration(milliseconds: 300));
            //       isSealOpened = true;
            //       setState(() {});

            //       await Future.delayed(const Duration(milliseconds: 1000));
            //       isOpenCompleted = true;
            //       setState(() {});
            //     },
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
}
