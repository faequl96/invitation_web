import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:flutter/material.dart';
import 'package:invitation_web/view_model.dart';

class Page3 extends StatelessWidget with GetItMixin {
  Page3({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewModel vM = get<ViewModel>();

    return Container(
      height: vM.s.height,
      width: vM.s.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/default_bg.png"),
        ),
      ),
      child: const Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [],
      ),
    );
  }
}
