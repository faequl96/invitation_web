import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:invitation_web/view_model.dart';
import 'package:invitation_web/views/shared/rsvps_widget.dart';

class Page6 extends StatelessWidget with GetItMixin {
  Page6({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewModel vM = locator<ViewModel>();

    return Positioned(
      top: vM.sV > vM.s.height * 5 + (vM.page6SliderHeight + 20)
          ? vM.s.height -
              (vM.sV - (vM.s.height * 5 + (vM.page6SliderHeight + 20)))
          : vM.s.height,
      child: Container(
        width: vM.s.width - 32,
        height: (vM.s.height - 456) + (vM.s.height - vM.page6SliderHeight),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 250, 230),
          borderRadius: BorderRadius.circular(16),
          border: const GradientBoxBorder(
            width: 4,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 230, 211, 164),
                Color.fromARGB(255, 255, 198, 192),
                Color.fromARGB(255, 230, 211, 164),
                Color.fromARGB(255, 255, 198, 192),
                Color.fromARGB(255, 230, 211, 164),
              ],
              stops: [0.1, 0.3, 0.5, 0.7, 0.9],
            ),
          ),
        ),
        child: const GetRSVPsWidget(),
      ),
    );
  }
}
