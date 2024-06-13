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

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final PageController _pageController = PageController();

  H hType = H.Sm;
  W wType = W.Sm;

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
    _pageController.addListener(_scrollListener);

    _toName = Uri.base.queryParameters["to"] ?? "";
    _instance = Uri.base.queryParameters["instance"] ?? "";

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final Size size = MediaQuery.of(context).size;

      if (size.height <= 660) {
        hType = H.Sm;
      } else if (size.height > 660 && size.height <= 720) {
        hType = H.Md;
      } else if (size.height > 720 && size.height <= 780) {
        hType = H.Lg;
      } else if (size.height > 780) {
        hType = H.Xl;
      }

      if (size.width <= 360) {
        wType = W.Sm;
      } else if (size.width > 360 && size.width <= 376) {
        wType = W.Md;
      } else if (size.width > 376 && size.width <= 392) {
        wType = W.Lg;
      } else if (size.width > 392) {
        wType = W.Xl;
      }

      fraction = size.height / 20;
      _initCountdownPosition();

      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        if (sV < size.height * 2)
          Page1(scrollValue: sV, hType: hType, wType: wType),
        if (sV < size.height)
          Container(
            height: size.height,
            width: size.width,
            color: Colors.white.withOpacity(opacityValue),
          ),
        if (sV < size.height + 110)
          Positioned(
            right: -moveValue,
            child: LightEffect(opacityValue: opacityValue, isRight: true),
          ),
        if (sV < size.height + 110)
          Positioned(
            left: -moveValue,
            child: LightEffect(opacityValue: opacityValue, isRight: false),
          ),
        if (sV < size.height + 110)
          Positioned(
            right: -moveValue,
            child: RightBackground(
              hType: hType,
              wType: wType,
              moveValue: moveValue,
              flashValue: flashValue,
            ),
          ),
        if (sV < size.height + 110)
          Positioned(
            left: -moveValue,
            child: LeftBackground(
              hType: hType,
              wType: wType,
              moveValue: moveValue,
              flashValue: flashValue,
            ),
          ),
        if (sV < size.height + 110)
          Positioned(
            right: -moveValue,
            child: RightBackground(
              hType: hType,
              wType: wType,
              isTransparent: true,
            ),
          ),
        if (sV < size.height)
          Positioned(
            top: h(hType, 6, 12, 30, 60) - (sV / 14),
            left: w(wType, 45, 48, 51, 54),
            child: TitleInvitation(wType: wType, flashValue: flashValue),
          ),
        if (sV < size.height)
          Positioned(
            top: h(hType, 50, 56, 74, 104) - (sV / 14),
            right: w(wType, 45, 48, 51, 54),
            child: TitleInvitation(
              wType: wType,
              isBottomTitle: true,
              flashValue: flashValue,
            ),
          ),
        Positioned(
          left: cdPosition2.xAxis >=
                      (w(wType, 68, 72, 76, 80) +
                          ((size.width - w(wType, 156, 164, 172, 180)) / 4)) &&
                  cdPosition2.xAxis <=
                      (size.width / 2) -
                          (((size.width - w(wType, 156, 164, 172, 180)) / 4) /
                              2)
              ? cdPosition2.xAxis
              : cdPosition2.xAxis <
                      (w(wType, 68, 72, 76, 80) +
                          ((size.width - w(wType, 156, 164, 172, 180)) / 4))
                  ? (w(wType, 68, 72, 76, 80) +
                      ((size.width - w(wType, 156, 164, 172, 180)) / 4))
                  : (size.width / 2) -
                      (((size.width - w(wType, 156, 164, 172, 180)) / 4) / 2),
          bottom: cdPosition2.yAxis >= 40
              ? cdPosition2.yAxis
              : cdPosition2.yAxis < 40
                  ? 40
                  : h(hType, 202, 218, 234, 250),
          child: CountDown(
            hType: hType,
            wType: wType,
            unitTimeType: UnitTimeType.Hour,
            size: (size.width - w(wType, 156, 164, 172, 180)) / 4,
          ),
        ),
        Positioned(
          right: cdPosition2.xAxis >=
                      (w(wType, 68, 72, 76, 80) +
                          ((size.width - w(wType, 156, 164, 172, 180)) / 4)) &&
                  cdPosition2.xAxis <=
                      (size.width / 2) -
                          (((size.width - w(wType, 156, 164, 172, 180)) / 4) /
                              2)
              ? cdPosition2.xAxis
              : cdPosition2.xAxis <
                      (w(wType, 68, 72, 76, 80) +
                          ((size.width - w(wType, 156, 164, 172, 180)) / 4))
                  ? (w(wType, 68, 72, 76, 80) +
                      ((size.width - w(wType, 156, 164, 172, 180)) / 4))
                  : (size.width / 2) -
                      (((size.width - w(wType, 156, 164, 172, 180)) / 4) / 2),
          bottom: cdPosition2.yAxis >= 40
              ? cdPosition2.yAxis
              : cdPosition2.yAxis < 40
                  ? 40
                  : h(hType, 202, 218, 234, 250),
          child: CountDown(
            hType: hType,
            wType: wType,
            unitTimeType: UnitTimeType.Minute,
            size: (size.width - w(wType, 156, 164, 172, 180)) / 4,
          ),
        ),
        Positioned(
          right: cdPosition1.xAxis >= w(wType, 48, 52, 56, 60) &&
                  cdPosition1.xAxis <=
                      (size.width / 2) -
                          (((size.width - w(wType, 156, 164, 172, 180)) / 4) /
                              2)
              ? cdPosition1.xAxis
              : cdPosition1.xAxis < w(wType, 48, 52, 56, 60)
                  ? w(wType, 48, 52, 56, 60)
                  : (size.width / 2) -
                      (((size.width - w(wType, 156, 164, 172, 180)) / 4) / 2),
          bottom: cdPosition1.yAxis >= 40
              ? cdPosition1.yAxis
              : cdPosition1.yAxis < 40
                  ? 40
                  : h(hType, 202, 218, 234, 250),
          child: CountDown(
            hType: hType,
            wType: wType,
            unitTimeType: UnitTimeType.Second,
            size: (size.width - w(wType, 156, 164, 172, 180)) / 4,
          ),
        ),
        Positioned(
          left: cdPosition1.xAxis >= w(wType, 48, 52, 56, 60) &&
                  cdPosition1.xAxis <=
                      (size.width / 2) -
                          (((size.width - w(wType, 156, 164, 172, 180)) / 4) /
                              2)
              ? cdPosition1.xAxis
              : cdPosition1.xAxis < w(wType, 48, 52, 56, 60)
                  ? w(wType, 48, 52, 56, 60)
                  : (size.width / 2) -
                      (((size.width - w(wType, 156, 164, 172, 180)) / 4) / 2),
          bottom: cdPosition1.yAxis >= 40
              ? cdPosition1.yAxis
              : cdPosition1.yAxis < 40
                  ? 40
                  : h(hType, 202, 218, 234, 250),
          child: CountDown(
            hType: hType,
            wType: wType,
            unitTimeType: UnitTimeType.Day,
            size: (size.width - w(wType, 156, 164, 172, 180)) / 4,
          ),
        ),
        if (bTPositionY > 50 && bTPositionY < 50 + 140 * 2)
          Positioned(
            left: (w(wType, 68, 72, 76, 80) +
                ((size.width - w(wType, 156, 164, 172, 180)) / 4)),
            bottom: bTPositionY,
            child: CountDown(
              hType: hType,
              wType: wType,
              unitTimeType: UnitTimeType.Hour,
              size: (size.width - w(wType, 156, 164, 172, 180)) / 4,
            ),
          ),
        if (bTPositionY > 50 && bTPositionY < 50 + 140 * 2)
          Positioned(
            right: (w(wType, 68, 72, 76, 80) +
                ((size.width - w(wType, 156, 164, 172, 180)) / 4)),
            bottom: bTPositionY,
            child: CountDown(
              hType: hType,
              wType: wType,
              unitTimeType: UnitTimeType.Minute,
              size: (size.width - w(wType, 156, 164, 172, 180)) / 4,
            ),
          ),
        if (bTPositionY > 50 && bTPositionY < 50 + 140 * 2)
          Positioned(
            right: w(wType, 48, 52, 56, 60),
            bottom: bTPositionY,
            child: CountDown(
              hType: hType,
              wType: wType,
              unitTimeType: UnitTimeType.Second,
              size: (size.width - w(wType, 156, 164, 172, 180)) / 4,
            ),
          ),
        if (bTPositionY > 50 && bTPositionY < 50 + 140 * 2)
          Positioned(
            left: w(wType, 48, 52, 56, 60),
            bottom: bTPositionY,
            child: CountDown(
              hType: hType,
              wType: wType,
              unitTimeType: UnitTimeType.Day,
              size: (size.width - w(wType, 156, 164, 172, 180)) / 4,
            ),
          ),
        if (sV == 0)
          if (_toName.isNotEmpty)
            Positioned(
              bottom: h(hType, 136, 146, 156, 166),
              child: Text(
                toCapitalize(_toName),
                style: TextStyle(
                  fontSize: w(wType, 16, 18, 19, 20),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        if (sV == 0)
          if (_instance.isNotEmpty)
            Positioned(
              bottom: h(hType, 108, 116, 124, 132),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage("assets/$_instance.png"),
                    height: w(wType, 20, 22, 24, 26),
                    fit: BoxFit.fitHeight,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        toCapitalize(_instance),
                        style: TextStyle(
                          fontSize: w(wType, 15, 16, 17, 18),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                ],
              ),
            ),
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            SizedBox(
              height: size.height,
              width: size.width,
              child: PageView(
                controller: _pageController,
                scrollDirection: Axis.vertical,
                children: [
                  SizedBox(height: size.height, width: double.maxFinite),
                  SizedBox(height: size.height, width: double.maxFinite),
                  Page2(hType: hType, wType: wType),
                  SizedBox(height: size.height, width: double.maxFinite),
                ],
              ),
            ),
            if (fTPositionY < 50 + 140 * 2)
              Positioned(
                left: (w(wType, 62, 66, 70, 74) +
                    ((size.width - w(wType, 140, 148, 156, 164)) / 4)),
                bottom: fTPositionY,
                child: CountDown(
                  hType: hType,
                  wType: wType,
                  unitTimeType: UnitTimeType.Hour,
                  size: (size.width - w(wType, 140, 148, 156, 164)) / 4,
                ),
              ),
            if (fTPositionY < 50 + 140 * 2)
              Positioned(
                right: (w(wType, 62, 66, 70, 74) +
                    ((size.width - w(wType, 140, 148, 156, 164)) / 4)),
                bottom: fTPositionY,
                child: CountDown(
                  hType: hType,
                  wType: wType,
                  unitTimeType: UnitTimeType.Minute,
                  size: (size.width - w(wType, 140, 148, 156, 164)) / 4,
                ),
              ),
            if (fTPositionY < 50 + 140 * 2)
              Positioned(
                right: w(wType, 46, 50, 54, 58),
                bottom: fTPositionY,
                child: CountDown(
                  hType: hType,
                  wType: wType,
                  unitTimeType: UnitTimeType.Second,
                  size: (size.width - w(wType, 140, 148, 156, 164)) / 4,
                ),
              ),
            if (fTPositionY < 50 + 140 * 2)
              Positioned(
                left: w(wType, 46, 50, 54, 58),
                bottom: fTPositionY,
                child: CountDown(
                  hType: hType,
                  wType: wType,
                  unitTimeType: UnitTimeType.Day,
                  size: (size.width - w(wType, 140, 148, 156, 164)) / 4,
                ),
              ),
            // AnimatedPositioned(
            //   duration: const Duration(milliseconds: 1000),
            //   top: isSealOpened ? -size.height : 0,
            //   child: SealInvitation(isSealOpened: isSealOpened),
            // ),
            // if (isOpenCompleted)
            if (sV < 10)
              Positioned(
                bottom: 0,
                child: SwipeUp(
                  hType: hType,
                  wType: wType,
                  isOpenCompleted: isOpenCompleted,
                ),
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

  void _initCountdownPosition() {
    final Size size = MediaQuery.of(context).size;

    cdPosition1 = PositionValue(
      xAxis: w(wType, 48, 52, 56, 60),
      yAxis: h(hType, 202, 218, 234, 250),
    );
    cdPosition2 = PositionValue(
      xAxis: w(wType, 68, 72, 76, 80) +
          ((size.width - w(wType, 156, 164, 172, 180)) / 4),
      yAxis: h(hType, 202, 218, 234, 250),
    );

    fTPositionY = 50 + 140 * 2;
  }

  _scrollListener() {
    final Size size = MediaQuery.of(context).size;

    final double dividedSize = size.height / size.width;

    sV = _pageController.offset.ceil().toDouble();
    moveValue = (_pageController.offset / dividedSize) / 2;

    if (sV > 0 && sV <= size.height / 3) {
      cdPosition1 = PositionValue(
        xAxis: w(wType, 48, 52, 56, 60) + sV,
        yAxis: h(hType, 202, 218, 234, 250),
      );
      cdPosition2 = PositionValue(
        xAxis: (w(wType, 68, 72, 76, 80) +
                ((size.width - w(wType, 156, 164, 172, 180)) / 4)) +
            sV,
        yAxis: h(hType, 202, 218, 234, 250),
      );
    } else if (sV > size.height / 3 && sV <= (size.height / 3) * 2) {
      cdPosition1 = PositionValue(
        xAxis: ((size.width / 2) -
            (((size.width - w(wType, 156, 164, 172, 180)) / 4) / 2)),
        yAxis: h(hType, 202, 218, 234, 250) - (sV - (size.height / 3)),
      );
      cdPosition2 = PositionValue(
        xAxis: ((size.width / 2) -
            (((size.width - w(wType, 156, 164, 172, 180)) / 4) / 2)),
        yAxis: h(hType, 202, 218, 234, 250) - (sV - (size.height / 3)),
      );
    } else if (sV > (size.height / 3) * 2 && sV <= (size.height / 3) * 3) {
      cdPosition1 = PositionValue(
        xAxis: ((size.width / 2) -
                (((size.width - w(wType, 156, 164, 172, 180)) / 4) / 2)) -
            (sV - ((size.height / 3) * 2)),
        yAxis: h(hType, 202, 218, 234, 250) - (sV - (size.height / 3)),
      );
      cdPosition2 = PositionValue(
        xAxis: ((size.width / 2) -
                (((size.width - w(wType, 156, 164, 172, 180)) / 4) / 2)) -
            (sV - ((size.height / 3) * 2)),
        yAxis: h(hType, 202, 218, 234, 250) - (sV - (size.height / 3)),
      );
    }

    if (sV <= size.height) {
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

    if (sV > size.height && sV <= size.height * 2) {
      if (sV - size.height <= 140) {
        bTPositionY = 50;
      } else if (sV - size.height > 140 && sV - size.height <= 280) {
        bTPositionY = 50 + ((sV - size.height) - 140) * 2;
        fTPositionY = 50 + 140 * 2;
      } else if (sV - size.height > 280 && sV - size.height <= 420) {
        bTPositionY = 330;
        fTPositionY = (50 + 140 * 2) - ((sV - size.height) - 280) * 2;
      } else if (sV - size.height > 420 && sV - size.height <= size.height) {
        fTPositionY = 50;
      }
    }

    if (sV > size.height * 2 && sV <= size.height * 3) {}

    // if (sV > size.height * 2 && sV <= size.height * 3) {
    //   if (sV - (size.height * 2) <= fraction) {
    //     opacityValue = 1;
    //     flashValue = 1;
    //   } else if (sV - (size.height * 2) > fraction &&
    //       sV - (size.height * 2) <= fraction * 2) {
    //     opacityValue = 0.95;
    //     flashValue = 0.85;
    //   } else if (sV - (size.height * 2) > fraction * 2 &&
    //       sV - (size.height * 2) <= fraction * 3) {
    //     opacityValue = 0.9;
    //     flashValue = 0.7;
    //   } else if (sV - (size.height * 2) > fraction * 3 &&
    //       sV - (size.height * 2) <= fraction * 4) {
    //     opacityValue = 0.85;
    //     flashValue = 0.55;
    //   } else if (sV - (size.height * 2) > fraction * 4 &&
    //       sV - (size.height * 2) <= fraction * 5) {
    //     opacityValue = 0.8;
    //     flashValue = 0.4;
    //   } else if (sV - (size.height * 2) > fraction * 5 &&
    //       sV - (size.height * 2) <= fraction * 6) {
    //     opacityValue = 0.75;
    //     flashValue = 0.25;
    //   } else if (sV - (size.height * 2) > fraction * 6 &&
    //       sV - (size.height * 2) <= fraction * 7) {
    //     opacityValue = 0.7;
    //     flashValue = 0.1;
    //   } else if (sV - (size.height * 2) > fraction * 7 &&
    //       sV - (size.height * 2) <= fraction * 8) {
    //     opacityValue = 0.65;
    //     flashValue = 0;
    //   } else if (sV - (size.height * 2) > fraction * 8 &&
    //       sV - (size.height * 2) <= fraction * 9) {
    //     opacityValue = 0.6;
    //     flashValue = 0;
    //   } else if (sV - (size.height * 2) > fraction * 9 &&
    //       sV - (size.height * 2) <= fraction * 10) {
    //     opacityValue = 0.55;
    //     flashValue = 0;
    //   } else if (sV - (size.height * 2) > fraction * 10 &&
    //       sV - (size.height * 2) <= fraction * 11) {
    //     opacityValue = 0.5;
    //     flashValue = 0;
    //   } else if (sV - (size.height * 2) > fraction * 11 &&
    //       sV - (size.height * 2) <= fraction * 12) {
    //     opacityValue = 0.45;
    //   } else if (sV - (size.height * 2) > fraction * 12 &&
    //       sV - (size.height * 2) <= fraction * 13) {
    //     opacityValue = 0.4;
    //   } else if (sV - (size.height * 2) > fraction * 13 &&
    //       sV - (size.height * 2) <= fraction * 14) {
    //     opacityValue = 0.35;
    //   } else if (sV - (size.height * 2) > fraction * 14 &&
    //       sV - (size.height * 2) <= fraction * 15) {
    //     opacityValue = 0.3;
    //   } else if (sV - (size.height * 2) > fraction * 15 &&
    //       sV - (size.height * 2) <= fraction * 16) {
    //     opacityValue = 0.25;
    //   } else if (sV - (size.height * 2) > fraction * 16 &&
    //       sV - (size.height * 2) <= fraction * 17) {
    //     opacityValue = 0.2;
    //   } else if (sV - (size.height * 2) > fraction * 17 &&
    //       sV - (size.height * 2) <= fraction * 18) {
    //     opacityValue = 0.15;
    //   } else if (sV - (size.height * 2) > fraction * 18 &&
    //       sV - (size.height * 2) <= fraction * 19) {
    //     opacityValue = 0.1;
    //   } else if (sV - (size.height * 2) > fraction * 19 &&
    //       sV - (size.height * 2) <= fraction * 20) {
    //     opacityValue = 0.05;
    //   } else if (sV - (size.height * 2) > fraction * 20 &&
    //       sV - (size.height * 2) <= fraction * 21) {
    //     opacityValue = 0;
    //   }
    // }

    setState(() {});
  }
}
