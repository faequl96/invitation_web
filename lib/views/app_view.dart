import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:invitation_web/views/front_view.dart';
import 'package:invitation_web/views/page_2/page_2.dart';
import 'package:invitation_web/views/page_4/page_4.dart';
import 'package:invitation_web/views/page_5/page_5_slider.dart';
import 'package:invitation_web/views/page_6/page_6_slider.dart';
import 'package:invitation_web/views/page_7/page_7_slider.dart';
import 'package:invitation_web/views/super_view.dart';
import 'package:invitation_web/view_model.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        const SuperView(),
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            SliderView(),
            FrontView(),
          ],
        ),
      ],
    );
  }
}

class SliderView extends StatelessWidget with GetItMixin {
  SliderView({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewModel vM = locator<ViewModel>();

    watchOnly((ViewModel x) => x.additionalPage);

    return SizedBox(
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
          SizedBox(
            height: vM.s.height,
            width: double.maxFinite,
            child: const Page7Slider(),
          ),
          SizedBox(height: vM.s.height, width: double.maxFinite),
        ],
      ),
    );
  }
}
