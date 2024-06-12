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

  double scrollValue = 0;

  double moveValue = 0;
  double opacityValue = 1;
  double opacityMemory = 0;
  double flashValue = 1;

  PositionValue cdPosition1 = PositionValue(xAxis: 0, yAxis: 0);
  PositionValue cdPosition2 = PositionValue(xAxis: 0, yAxis: 0);

  double timeVerticalScrollValue = 50;

  bool isKeyOpened = false;
  bool isSealOpened = false;
  bool isOpenCompleted = false;

  String _toName = "";
  String _instance = "";

  @override
  void initState() {
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

      _initCountdownPosition();
    });

    _pageController.addListener(_scrollListener);

    _toName = Uri.base.queryParameters["to"] ?? "";
    _instance = Uri.base.queryParameters["instance"] ?? "";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        if (scrollValue < size.height * 2)
          Page1(
            scrollValue: scrollValue,
            hType: hType,
            wType: wType,
          ),
        Container(
          height: size.height,
          width: size.width,
          color: Colors.white.withOpacity(opacityValue),
        ),
        scrollValue > size.height + 110
            ? const SizedBox.shrink()
            : Positioned(
                right: -moveValue,
                child: LightEffect(opacityValue: opacityValue, isRight: true),
              ),
        scrollValue > size.height + 110
            ? const SizedBox.shrink()
            : Positioned(
                left: -moveValue,
                child: LightEffect(opacityValue: opacityValue, isRight: false),
              ),
        scrollValue > size.height + 110
            ? const SizedBox.shrink()
            : Positioned(
                right: -moveValue,
                child: RightBackground(
                  hType: hType,
                  wType: wType,
                  moveValue: moveValue,
                  flashValue: flashValue,
                ),
              ),
        scrollValue > size.height + 110
            ? const SizedBox.shrink()
            : Positioned(
                left: -moveValue,
                child: LeftBackground(
                  hType: hType,
                  wType: wType,
                  moveValue: moveValue,
                  flashValue: flashValue,
                ),
              ),
        scrollValue > size.height + 110
            ? const SizedBox.shrink()
            : Positioned(
                right: -moveValue,
                child: RightBackground(
                  hType: hType,
                  wType: wType,
                  isTransparent: true,
                ),
              ),
        Positioned(
          top: h(hType, 6, 12, 30, 60) - (scrollValue / 14),
          left: w(wType, 45, 48, 51, 54),
          child: TitleInvitation(wType: wType, flashValue: flashValue),
        ),
        Positioned(
          top: h(hType, 50, 56, 74, 104) - (scrollValue / 14),
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
        Positioned(
          left: (w(wType, 68, 72, 76, 80) +
              ((size.width - w(wType, 156, 164, 172, 180)) / 4)),
          bottom: 50,
          child: CountDown(
            hType: hType,
            wType: wType,
            unitTimeType: UnitTimeType.Hour,
            size: (size.width - w(wType, 156, 164, 172, 180)) / 4,
          ),
        ),
        Positioned(
          right: (w(wType, 68, 72, 76, 80) +
              ((size.width - w(wType, 156, 164, 172, 180)) / 4)),
          bottom: 50,
          child: CountDown(
            hType: hType,
            wType: wType,
            unitTimeType: UnitTimeType.Minute,
            size: (size.width - w(wType, 156, 164, 172, 180)) / 4,
          ),
        ),
        Positioned(
          right: w(wType, 48, 52, 56, 60),
          bottom: 50,
          child: CountDown(
            hType: hType,
            wType: wType,
            unitTimeType: UnitTimeType.Second,
            size: (size.width - w(wType, 156, 164, 172, 180)) / 4,
          ),
        ),
        Positioned(
          left: w(wType, 48, 52, 56, 60),
          bottom: 50,
          child: CountDown(
            hType: hType,
            wType: wType,
            unitTimeType: UnitTimeType.Day,
            size: (size.width - w(wType, 156, 164, 172, 180)) / 4,
          ),
        ),
        if (scrollValue == 0)
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
        if (scrollValue == 0)
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
            // AnimatedPositioned(
            //   duration: const Duration(milliseconds: 1000),
            //   top: isSealOpened ? -size.height : 0,
            //   child: SealInvitation(isSealOpened: isSealOpened),
            // ),
            // if (isOpenCompleted)
            if (scrollValue < 10)
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
    setState(() {});
  }

  _scrollListener() {
    final Size size = MediaQuery.of(context).size;

    final double dividedSize = size.height / size.width;

    scrollValue = _pageController.offset.ceil().toDouble();
    final double sV = scrollValue;
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

    final double fraction = size.height / 20;

    if (scrollValue <= size.height) {
      if (scrollValue <= fraction) {
        opacityValue = 1;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
        flashValue = 1;
      } else if (scrollValue > fraction && scrollValue <= fraction * 2) {
        opacityValue = 0.95;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
        flashValue = 0.85;
      } else if (scrollValue > fraction * 2 && scrollValue <= fraction * 3) {
        opacityValue = 0.9;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
        flashValue = 0.7;
      } else if (scrollValue > fraction * 3 && scrollValue <= fraction * 4) {
        opacityValue = 0.85;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
        flashValue = 0.55;
      } else if (scrollValue > fraction * 4 && scrollValue <= fraction * 5) {
        opacityValue = 0.8;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
        flashValue = 0.4;
      } else if (scrollValue > fraction * 5 && scrollValue <= fraction * 6) {
        opacityValue = 0.75;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
        flashValue = 0.25;
      } else if (scrollValue > fraction * 6 && scrollValue <= fraction * 7) {
        opacityValue = 0.7;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
        flashValue = 0.1;
      } else if (scrollValue > fraction * 7 && scrollValue <= fraction * 8) {
        opacityValue = 0.65;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
        flashValue = 0;
      } else if (scrollValue > fraction * 8 && scrollValue <= fraction * 9) {
        opacityValue = 0.6;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
        flashValue = 0;
      } else if (scrollValue > fraction * 9 && scrollValue <= fraction * 10) {
        opacityValue = 0.55;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
      } else if (scrollValue > fraction * 10 && scrollValue <= fraction * 11) {
        opacityValue = 0.5;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
      } else if (scrollValue > fraction * 11 && scrollValue <= fraction * 12) {
        opacityValue = 0.45;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
      } else if (scrollValue > fraction * 12 && scrollValue <= fraction * 13) {
        opacityValue = 0.4;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
      } else if (scrollValue > fraction * 13 && scrollValue <= fraction * 14) {
        opacityValue = 0.35;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
      } else if (scrollValue > fraction * 14 && scrollValue <= fraction * 15) {
        opacityValue = 0.3;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
      } else if (scrollValue > fraction * 15 && scrollValue <= fraction * 16) {
        opacityValue = 0.25;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
      } else if (scrollValue > fraction * 16 && scrollValue <= fraction * 17) {
        opacityValue = 0.2;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
      } else if (scrollValue > fraction * 17 && scrollValue <= fraction * 18) {
        opacityValue = 0.15;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
      } else if (scrollValue > fraction * 18 && scrollValue <= fraction * 19) {
        opacityValue = 0.1;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
      } else if (scrollValue > fraction * 19 && scrollValue <= fraction * 20) {
        opacityValue = 0.05;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
        flashValue = 0;
      } else if (scrollValue > fraction * 20 && scrollValue <= fraction * 21) {
        opacityValue = 0;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
        flashValue = 0;
      }

      if (opacityValue == opacityMemory) {
        if (sV.ceil() % 2 == 0) setState(() {});
      }
    }

    if (scrollValue == 0) setState(() {});
    if (scrollValue == size.height) setState(() {});

    if (scrollValue > size.height * 2) {
      if (scrollValue - (size.height * 2) <= fraction) {
        opacityValue = 1;
        flashValue = 1;
      } else if (scrollValue - (size.height * 2) > fraction &&
          scrollValue - (size.height * 2) <= fraction * 2) {
        opacityValue = 0.95;
        flashValue = 0.85;
      } else if (scrollValue - (size.height * 2) > fraction * 2 &&
          scrollValue - (size.height * 2) <= fraction * 3) {
        opacityValue = 0.9;
        flashValue = 0.7;
      } else if (scrollValue - (size.height * 2) > fraction * 3 &&
          scrollValue - (size.height * 2) <= fraction * 4) {
        opacityValue = 0.85;
        flashValue = 0.55;
      } else if (scrollValue - (size.height * 2) > fraction * 4 &&
          scrollValue - (size.height * 2) <= fraction * 5) {
        opacityValue = 0.8;
        flashValue = 0.4;
      } else if (scrollValue - (size.height * 2) > fraction * 5 &&
          scrollValue - (size.height * 2) <= fraction * 6) {
        opacityValue = 0.75;
        flashValue = 0.25;
      } else if (scrollValue - (size.height * 2) > fraction * 6 &&
          scrollValue - (size.height * 2) <= fraction * 7) {
        opacityValue = 0.7;
        flashValue = 0.1;
      } else if (scrollValue - (size.height * 2) > fraction * 7 &&
          scrollValue - (size.height * 2) <= fraction * 8) {
        opacityValue = 0.65;
        flashValue = 0;
      } else if (scrollValue - (size.height * 2) > fraction * 8 &&
          scrollValue - (size.height * 2) <= fraction * 9) {
        opacityValue = 0.6;
        flashValue = 0;
      } else if (scrollValue - (size.height * 2) > fraction * 9 &&
          scrollValue - (size.height * 2) <= fraction * 10) {
        opacityValue = 0.55;
        flashValue = 0;
      } else if (scrollValue - (size.height * 2) > fraction * 10 &&
          scrollValue - (size.height * 2) <= fraction * 11) {
        opacityValue = 0.5;
        flashValue = 0;
      } else if (scrollValue - (size.height * 2) > fraction * 11 &&
          scrollValue - (size.height * 2) <= fraction * 12) {
        opacityValue = 0.45;
      } else if (scrollValue - (size.height * 2) > fraction * 12 &&
          scrollValue - (size.height * 2) <= fraction * 13) {
        opacityValue = 0.4;
      } else if (scrollValue - (size.height * 2) > fraction * 13 &&
          scrollValue - (size.height * 2) <= fraction * 14) {
        opacityValue = 0.35;
      } else if (scrollValue - (size.height * 2) > fraction * 14 &&
          scrollValue - (size.height * 2) <= fraction * 15) {
        opacityValue = 0.3;
      } else if (scrollValue - (size.height * 2) > fraction * 15 &&
          scrollValue - (size.height * 2) <= fraction * 16) {
        opacityValue = 0.25;
      } else if (scrollValue - (size.height * 2) > fraction * 16 &&
          scrollValue - (size.height * 2) <= fraction * 17) {
        opacityValue = 0.2;
      } else if (scrollValue - (size.height * 2) > fraction * 17 &&
          scrollValue - (size.height * 2) <= fraction * 18) {
        opacityValue = 0.15;
      } else if (scrollValue - (size.height * 2) > fraction * 18 &&
          scrollValue - (size.height * 2) <= fraction * 19) {
        opacityValue = 0.1;
      } else if (scrollValue - (size.height * 2) > fraction * 19 &&
          scrollValue - (size.height * 2) <= fraction * 20) {
        opacityValue = 0.05;
      } else if (scrollValue - (size.height * 2) > fraction * 20 &&
          scrollValue - (size.height * 2) <= fraction * 21) {
        opacityValue = 0;
      }
    }
  }
}
