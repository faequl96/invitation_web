import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:invitation_web/view_model.dart';
import 'package:invitation_web/views/shared/rsvps.dart';

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
        height: (vM.s.height - 436) + (vM.s.height - vM.page6SliderHeight),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 230, 211, 164),
          borderRadius: BorderRadius.circular(16),
        ),
        child: const GetRSVPsWidget(),
      ),
    );
  }
}
