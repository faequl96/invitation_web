import 'package:flutter/material.dart';
import 'package:invitation_web/enum/enums.dart';
import 'package:invitation_web/methods/methods.dart';
import 'package:invitation_web/pages/cover_page/countdown.dart';
import 'package:invitation_web/pages/cover_page/swipe_up.dart';
import 'package:invitation_web/pages/page_2/page_2.dart';
import 'package:invitation_web/pages/super_view.dart';
import 'package:invitation_web/view_model.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final ViewModel vM = locator<ViewModel>();

      vM.toName = Uri.base.queryParameters["to"] ?? "";
      vM.instance = Uri.base.queryParameters["instance"] ?? "";

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
        SuperView(onChange: () => setState(() {})),
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
            if (vM.sV < 1) const Positioned(bottom: 0, child: SwipeUp()),
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
