import 'package:flutter/material.dart';
import 'package:invitation_web/views/front_view.dart';
import 'package:invitation_web/views/page_2/page_2.dart';
import 'package:invitation_web/views/page_4/page_4.dart';
import 'package:invitation_web/views/page_5/page_5_slider.dart';
import 'package:invitation_web/views/page_6/page_6_slider.dart';
import 'package:invitation_web/views/super_view.dart';
import 'package:invitation_web/view_model.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewModel vM = locator<ViewModel>();

    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        const SuperView(),
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
                  const Page4(),
                  SizedBox(
                    height: vM.s.height,
                    width: double.maxFinite,
                    child: const Page5Slider(),
                  ),
                  SizedBox(
                    height: vM.s.height,
                    width: double.maxFinite,
                    child: const Page6Slider(),
                  ),
                ],
              ),
            ),
            FrontView(),
          ],
        ),
      ],
    );
  }
}
