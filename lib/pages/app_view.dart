import 'package:flutter/material.dart';
import 'package:invitation_web/pages/front_view.dart';
import 'package:invitation_web/pages/page_2/page_2.dart';
import 'package:invitation_web/pages/super_view.dart';
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
