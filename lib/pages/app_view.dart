import 'package:flutter/material.dart';
import 'package:invitation_web/enum/enums.dart';
import 'package:invitation_web/methods/methods.dart';
import 'package:invitation_web/models/position_value.dart';
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
  final PageController _pageController = PageController();

  double fraction = 0;

  double sV = 0;

  double moveValue = 0;
  double opacityValue = 1;
  double flashValue = 1;

  PositionValue cdPosition1 = PositionValue(xAxis: 0, yAxis: 0);
  PositionValue cdPosition2 = PositionValue(xAxis: 0, yAxis: 0);

  double bTPositionY = 50;
  double fTPositionY = 0;

  bool isKeyOpened = false;
  bool isSealOpened = false;
  bool isOpenCompleted = false;

  String _toName = "";
  String _instance = "";

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final ViewModel vM = locator<ViewModel>();

      if (vM.s.height <= 660) {
        vM.h = H.Sm;
      } else if (vM.s.height > 660 && vM.s.height <= 720) {
        vM.h = H.Md;
      } else if (vM.s.height > 720 && vM.s.height <= 780) {
        vM.h = H.Lg;
      } else if (vM.s.height > 780) {
        vM.h = H.Xl;
      }

      if (vM.s.width <= 360) {
        vM.w = W.Sm;
      } else if (vM.s.width > 360 && vM.s.width <= 376) {
        vM.w = W.Md;
      } else if (vM.s.width > 376 && vM.s.width <= 392) {
        vM.w = W.Lg;
      } else if (vM.s.width > 392) {
        vM.w = W.Xl;
      }

      fraction = vM.s.height / 20;

      _initCountdownPosition(vM);

      _toName = Uri.base.queryParameters["to"] ?? "";
      _instance = Uri.base.queryParameters["instance"] ?? "";

      _pageController.addListener(_scrollListener);

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
        if (sV < vM.s.height * 2) Page1(scrollValue: sV),
        if (sV < vM.s.height)
          Container(
            height: vM.s.height,
            width: vM.s.width,
            color: Colors.white.withOpacity(opacityValue),
          ),
        if (sV < vM.s.height + 110) ...[
          Positioned(
            right: -moveValue,
            child: LightEffect(opacityValue: opacityValue, isRight: true),
          ),
          Positioned(
            left: -moveValue,
            child: LightEffect(opacityValue: opacityValue, isRight: false),
          ),
          Positioned(
            right: -moveValue,
            child: RightBackground(
              moveValue: moveValue,
              flashValue: flashValue,
            ),
          ),
          Positioned(
            left: -moveValue,
            child: LeftBackground(moveValue: moveValue, flashValue: flashValue),
          ),
          Positioned(
            right: -moveValue,
            child: RightBackground(isTransparent: true),
          ),
        ],
        if (sV < vM.s.height) ...[
          Positioned(
            top: s(vM.h, 6, 12, 30, 60) - (sV / 14),
            left: s(vM.w, 45, 48, 51, 54),
            child: TitleInvitation(flashValue: flashValue),
          ),
          Positioned(
            top: s(vM.h, 50, 56, 74, 104) - (sV / 14),
            right: s(vM.w, 45, 48, 51, 54),
            child: TitleInvitation(isBottomTitle: true, flashValue: flashValue),
          ),
        ],
        Positioned(
          left: cdPosition2.xAxis >=
                      (s(vM.w, 68, 72, 76, 80) +
                          ((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4)) &&
                  cdPosition2.xAxis <=
                      (vM.s.width / 2) -
                          (((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4) / 2)
              ? cdPosition2.xAxis
              : cdPosition2.xAxis <
                      (s(vM.w, 68, 72, 76, 80) +
                          ((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4))
                  ? (s(vM.w, 68, 72, 76, 80) +
                      ((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4))
                  : (vM.s.width / 2) -
                      (((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4) / 2),
          bottom: cdPosition2.yAxis >= 40
              ? cdPosition2.yAxis
              : cdPosition2.yAxis < 40
                  ? 40
                  : s(vM.h, 202, 218, 234, 250),
          child: CountDown(
            unitTimeType: UnitTimeType.Hour,
            size: (vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4,
          ),
        ),
        Positioned(
          right: cdPosition2.xAxis >=
                      (s(vM.w, 68, 72, 76, 80) +
                          ((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4)) &&
                  cdPosition2.xAxis <=
                      (vM.s.width / 2) -
                          (((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4) / 2)
              ? cdPosition2.xAxis
              : cdPosition2.xAxis <
                      (s(vM.w, 68, 72, 76, 80) +
                          ((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4))
                  ? (s(vM.w, 68, 72, 76, 80) +
                      ((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4))
                  : (vM.s.width / 2) -
                      (((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4) / 2),
          bottom: cdPosition2.yAxis >= 40
              ? cdPosition2.yAxis
              : cdPosition2.yAxis < 40
                  ? 40
                  : s(vM.h, 202, 218, 234, 250),
          child: CountDown(
            unitTimeType: UnitTimeType.Minute,
            size: (vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4,
          ),
        ),
        Positioned(
          right: cdPosition1.xAxis >= s(vM.w, 48, 52, 56, 60) &&
                  cdPosition1.xAxis <=
                      (vM.s.width / 2) -
                          (((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4) / 2)
              ? cdPosition1.xAxis
              : cdPosition1.xAxis < s(vM.w, 48, 52, 56, 60)
                  ? s(vM.w, 48, 52, 56, 60)
                  : (vM.s.width / 2) -
                      (((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4) / 2),
          bottom: cdPosition1.yAxis >= 40
              ? cdPosition1.yAxis
              : cdPosition1.yAxis < 40
                  ? 40
                  : s(vM.h, 202, 218, 234, 250),
          child: CountDown(
            unitTimeType: UnitTimeType.Second,
            size: (vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4,
          ),
        ),
        Positioned(
          left: cdPosition1.xAxis >= s(vM.w, 48, 52, 56, 60) &&
                  cdPosition1.xAxis <=
                      (vM.s.width / 2) -
                          (((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4) / 2)
              ? cdPosition1.xAxis
              : cdPosition1.xAxis < s(vM.w, 48, 52, 56, 60)
                  ? s(vM.w, 48, 52, 56, 60)
                  : (vM.s.width / 2) -
                      (((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4) / 2),
          bottom: cdPosition1.yAxis >= 40
              ? cdPosition1.yAxis
              : cdPosition1.yAxis < 40
                  ? 40
                  : s(vM.h, 202, 218, 234, 250),
          child: CountDown(
            unitTimeType: UnitTimeType.Day,
            size: (vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4,
          ),
        ),
        if (bTPositionY > 50 && bTPositionY <= 50 + 140 * 2) ...[
          Positioned(
            left: (s(vM.w, 68, 72, 76, 80) +
                ((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4)),
            bottom: bTPositionY,
            child: CountDown(
              unitTimeType: UnitTimeType.Hour,
              size: (vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4,
            ),
          ),
          Positioned(
            right: (s(vM.w, 68, 72, 76, 80) +
                ((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4)),
            bottom: bTPositionY,
            child: CountDown(
              unitTimeType: UnitTimeType.Minute,
              size: (vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4,
            ),
          ),
          Positioned(
            right: s(vM.w, 48, 52, 56, 60),
            bottom: bTPositionY,
            child: CountDown(
              unitTimeType: UnitTimeType.Second,
              size: (vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4,
            ),
          ),
          Positioned(
            left: s(vM.w, 48, 52, 56, 60),
            bottom: bTPositionY,
            child: CountDown(
              unitTimeType: UnitTimeType.Day,
              size: (vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4,
            ),
          ),
        ],
        if (sV == 0) ...[
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
                controller: _pageController,
                scrollDirection: Axis.vertical,
                children: [
                  SizedBox(height: vM.s.height, width: double.maxFinite),
                  SizedBox(height: vM.s.height, width: double.maxFinite),
                  Page2(),
                  SizedBox(height: vM.s.height, width: double.maxFinite),
                ],
              ),
            ),
            if (fTPositionY < 50 + 140 * 2) ...[
              Positioned(
                left: (s(vM.w, 62, 66, 70, 74) +
                    ((vM.s.width - s(vM.w, 140, 148, 156, 164)) / 4)),
                bottom: fTPositionY,
                child: CountDown(
                  unitTimeType: UnitTimeType.Hour,
                  size: (vM.s.width - s(vM.w, 140, 148, 156, 164)) / 4,
                ),
              ),
              Positioned(
                right: (s(vM.w, 62, 66, 70, 74) +
                    ((vM.s.width - s(vM.w, 140, 148, 156, 164)) / 4)),
                bottom: fTPositionY,
                child: CountDown(
                  unitTimeType: UnitTimeType.Minute,
                  size: (vM.s.width - s(vM.w, 140, 148, 156, 164)) / 4,
                ),
              ),
              Positioned(
                right: s(vM.w, 46, 50, 54, 58),
                bottom: fTPositionY,
                child: CountDown(
                  unitTimeType: UnitTimeType.Second,
                  size: (vM.s.width - s(vM.w, 140, 148, 156, 164)) / 4,
                ),
              ),
              Positioned(
                left: s(vM.w, 46, 50, 54, 58),
                bottom: fTPositionY,
                child: CountDown(
                  unitTimeType: UnitTimeType.Day,
                  size: (vM.s.width - s(vM.w, 140, 148, 156, 164)) / 4,
                ),
              ),
            ],
            // AnimatedPositioned(
            //   duration: const Duration(milliseconds: 1000),
            //   top: isSealOpened ? -s.height : 0,
            //   child: SealInvitation(isSealOpened: isSealOpened),
            // ),
            // if (isOpenCompleted)
            if (sV < 10)
              Positioned(
                bottom: 0,
                child: SwipeUp(isOpenCompleted: isOpenCompleted),
              ),
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

  void _initCountdownPosition(ViewModel vM) {
    cdPosition1 = PositionValue(
      xAxis: s(vM.w, 48, 52, 56, 60),
      yAxis: s(vM.h, 202, 218, 234, 250),
    );
    cdPosition2 = PositionValue(
      xAxis: s(vM.w, 68, 72, 76, 80) +
          ((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4),
      yAxis: s(vM.h, 202, 218, 234, 250),
    );

    fTPositionY = 50 + 140 * 2;
  }

  _scrollListener() {
    final ViewModel vM = locator<ViewModel>();

    final double divideds = vM.s.height / vM.s.width;

    sV = _pageController.offset.ceil().toDouble();
    moveValue = (_pageController.offset / divideds) / 2;

    if (sV > 0 && sV <= vM.s.height / 3) {
      cdPosition1 = PositionValue(
        xAxis: s(vM.w, 48, 52, 56, 60) + sV,
        yAxis: s(vM.h, 202, 218, 234, 250),
      );
      cdPosition2 = PositionValue(
        xAxis: (s(vM.w, 68, 72, 76, 80) +
                ((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4)) +
            sV,
        yAxis: s(vM.h, 202, 218, 234, 250),
      );
    } else if (sV > vM.s.height / 3 && sV <= (vM.s.height / 3) * 2) {
      cdPosition1 = PositionValue(
        xAxis: ((vM.s.width / 2) -
            (((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4) / 2)),
        yAxis: s(vM.h, 202, 218, 234, 250) - (sV - (vM.s.height / 3)),
      );
      cdPosition2 = PositionValue(
        xAxis: ((vM.s.width / 2) -
            (((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4) / 2)),
        yAxis: s(vM.h, 202, 218, 234, 250) - (sV - (vM.s.height / 3)),
      );
    } else if (sV > (vM.s.height / 3) * 2 && sV <= (vM.s.height / 3) * 3) {
      cdPosition1 = PositionValue(
        xAxis: ((vM.s.width / 2) -
                (((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4) / 2)) -
            (sV - ((vM.s.height / 3) * 2)),
        yAxis: s(vM.h, 202, 218, 234, 250) - (sV - (vM.s.height / 3)),
      );
      cdPosition2 = PositionValue(
        xAxis: ((vM.s.width / 2) -
                (((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4) / 2)) -
            (sV - ((vM.s.height / 3) * 2)),
        yAxis: s(vM.h, 202, 218, 234, 250) - (sV - (vM.s.height / 3)),
      );
    }

    if (sV <= vM.s.height) {
      if (sV <= fraction) {
        opacityValue = 1;
        flashValue = 1;
      } else if (sV > fraction && sV <= fraction * 2) {
        opacityValue = 0.95;
        flashValue = 0.85;
      } else if (sV > fraction * 2 && sV <= fraction * 3) {
        opacityValue = 0.9;
        flashValue = 0.7;
      } else if (sV > fraction * 3 && sV <= fraction * 4) {
        opacityValue = 0.85;
        flashValue = 0.55;
      } else if (sV > fraction * 4 && sV <= fraction * 5) {
        opacityValue = 0.8;
        flashValue = 0.4;
      } else if (sV > fraction * 5 && sV <= fraction * 6) {
        opacityValue = 0.75;
        flashValue = 0.25;
      } else if (sV > fraction * 6 && sV <= fraction * 7) {
        opacityValue = 0.7;
        flashValue = 0.1;
      } else if (sV > fraction * 7 && sV <= fraction * 8) {
        opacityValue = 0.65;
        flashValue = 0;
      } else if (sV > fraction * 8 && sV <= fraction * 9) {
        opacityValue = 0.6;
        flashValue = 0;
      } else if (sV > fraction * 9 && sV <= fraction * 10) {
        opacityValue = 0.55;
      } else if (sV > fraction * 10 && sV <= fraction * 11) {
        opacityValue = 0.5;
      } else if (sV > fraction * 11 && sV <= fraction * 12) {
        opacityValue = 0.45;
      } else if (sV > fraction * 12 && sV <= fraction * 13) {
        opacityValue = 0.4;
      } else if (sV > fraction * 13 && sV <= fraction * 14) {
        opacityValue = 0.35;
      } else if (sV > fraction * 14 && sV <= fraction * 15) {
        opacityValue = 0.3;
      } else if (sV > fraction * 15 && sV <= fraction * 16) {
        opacityValue = 0.25;
      } else if (sV > fraction * 16 && sV <= fraction * 17) {
        opacityValue = 0.2;
      } else if (sV > fraction * 17 && sV <= fraction * 18) {
        opacityValue = 0.15;
      } else if (sV > fraction * 18 && sV <= fraction * 19) {
        opacityValue = 0.1;
      } else if (sV > fraction * 19 && sV <= fraction * 20) {
        opacityValue = 0.05;
        flashValue = 0;
      } else if (sV > fraction * 20 && sV <= fraction * 21) {
        opacityValue = 0;
        flashValue = 0;
      }
    }

    if (sV > vM.s.height && sV <= vM.s.height * 2) {
      if (sV - vM.s.height <= 140) {
        bTPositionY = 50;
      } else if (sV - vM.s.height > 140 && sV - vM.s.height <= 280) {
        bTPositionY = 50 + ((sV - vM.s.height) - 140) * 2;
        fTPositionY = 50 + 140 * 2;
      } else if (sV - vM.s.height > 280 && sV - vM.s.height <= 420) {
        bTPositionY = 331;
        fTPositionY = (50 + 140 * 2) - ((sV - vM.s.height) - 280) * 2;
      } else if (sV - vM.s.height > 420 && sV - vM.s.height <= vM.s.height) {
        fTPositionY = 50;
      }
    }

    if (sV > vM.s.height * 2 && sV <= vM.s.height * 3) {}

    // if (sV > s.height * 2 && sV <= s.height * 3) {
    //   if (sV - (s.height * 2) <= fraction) {
    //     opacityValue = 1;
    //     flashValue = 1;
    //   } else if (sV - (s.height * 2) > fraction &&
    //       sV - (s.height * 2) <= fraction * 2) {
    //     opacityValue = 0.95;
    //     flashValue = 0.85;
    //   } else if (sV - (s.height * 2) > fraction * 2 &&
    //       sV - (s.height * 2) <= fraction * 3) {
    //     opacityValue = 0.9;
    //     flashValue = 0.7;
    //   } else if (sV - (s.height * 2) > fraction * 3 &&
    //       sV - (s.height * 2) <= fraction * 4) {
    //     opacityValue = 0.85;
    //     flashValue = 0.55;
    //   } else if (sV - (s.height * 2) > fraction * 4 &&
    //       sV - (s.height * 2) <= fraction * 5) {
    //     opacityValue = 0.8;
    //     flashValue = 0.4;
    //   } else if (sV - (s.height * 2) > fraction * 5 &&
    //       sV - (s.height * 2) <= fraction * 6) {
    //     opacityValue = 0.75;
    //     flashValue = 0.25;
    //   } else if (sV - (s.height * 2) > fraction * 6 &&
    //       sV - (s.height * 2) <= fraction * 7) {
    //     opacityValue = 0.7;
    //     flashValue = 0.1;
    //   } else if (sV - (s.height * 2) > fraction * 7 &&
    //       sV - (s.height * 2) <= fraction * 8) {
    //     opacityValue = 0.65;
    //     flashValue = 0;
    //   } else if (sV - (s.height * 2) > fraction * 8 &&
    //       sV - (s.height * 2) <= fraction * 9) {
    //     opacityValue = 0.6;
    //     flashValue = 0;
    //   } else if (sV - (s.height * 2) > fraction * 9 &&
    //       sV - (s.height * 2) <= fraction * 10) {
    //     opacityValue = 0.55;
    //     flashValue = 0;
    //   } else if (sV - (s.height * 2) > fraction * 10 &&
    //       sV - (s.height * 2) <= fraction * 11) {
    //     opacityValue = 0.5;
    //     flashValue = 0;
    //   } else if (sV - (s.height * 2) > fraction * 11 &&
    //       sV - (s.height * 2) <= fraction * 12) {
    //     opacityValue = 0.45;
    //   } else if (sV - (s.height * 2) > fraction * 12 &&
    //       sV - (s.height * 2) <= fraction * 13) {
    //     opacityValue = 0.4;
    //   } else if (sV - (s.height * 2) > fraction * 13 &&
    //       sV - (s.height * 2) <= fraction * 14) {
    //     opacityValue = 0.35;
    //   } else if (sV - (s.height * 2) > fraction * 14 &&
    //       sV - (s.height * 2) <= fraction * 15) {
    //     opacityValue = 0.3;
    //   } else if (sV - (s.height * 2) > fraction * 15 &&
    //       sV - (s.height * 2) <= fraction * 16) {
    //     opacityValue = 0.25;
    //   } else if (sV - (s.height * 2) > fraction * 16 &&
    //       sV - (s.height * 2) <= fraction * 17) {
    //     opacityValue = 0.2;
    //   } else if (sV - (s.height * 2) > fraction * 17 &&
    //       sV - (s.height * 2) <= fraction * 18) {
    //     opacityValue = 0.15;
    //   } else if (sV - (s.height * 2) > fraction * 18 &&
    //       sV - (s.height * 2) <= fraction * 19) {
    //     opacityValue = 0.1;
    //   } else if (sV - (s.height * 2) > fraction * 19 &&
    //       sV - (s.height * 2) <= fraction * 20) {
    //     opacityValue = 0.05;
    //   } else if (sV - (s.height * 2) > fraction * 20 &&
    //       sV - (s.height * 2) <= fraction * 21) {
    //     opacityValue = 0;
    //   }
    // }

    setState(() {});
  }
}
