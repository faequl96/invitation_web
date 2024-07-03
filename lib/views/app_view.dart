import 'package:flutter/material.dart';
import 'package:invitation_web/views/front_view.dart';
import 'package:invitation_web/views/page_2/page_2.dart';
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
                ],
              ),
            ),
            FrontView(),
            const Text(
              "tes1",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 230, 211, 164),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
