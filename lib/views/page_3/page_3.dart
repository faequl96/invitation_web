import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:flutter/material.dart';
import 'package:invitation_web/enum/enums.dart';
import 'package:invitation_web/methods/methods.dart';
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
      child: Page3Content(),
    );
  }
}

class Page3Content extends StatefulWidget with GetItStatefulWidgetMixin {
  Page3Content({super.key});

  @override
  State<Page3Content> createState() => _Page3ContentState();
}

class _Page3ContentState extends State<Page3Content> with GetItStateMixin {
  @override
  Widget build(BuildContext context) {
    final ViewModel vM = locator<ViewModel>();

    watchOnly((ViewModel x) => x.animatedType);

    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        AnimatedPositioned(
          bottom: vM.animatedType == AnimatedType.T1 ||
                  vM.animatedType == AnimatedType.T2
              ? s(vM.h, 250, 280, 310, 340)
              : s(vM.h, 150, 180, 210, 240),
          right: vM.animatedType == AnimatedType.T1
              ? vM.s.width / 2
              : vM.s.width / 2 + 50,
          duration: const Duration(milliseconds: 300),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: vM.sV > vM.s.height * 3 - 280 ? 1 : 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: vM.sV > vM.s.height * 3 - 280
                  ? s(vM.w, 90, 100, 110, 120)
                  : s(vM.w, 200, 210, 220, 230),
              child: const Image(
                image: AssetImage("assets/groom.png"),
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          bottom: vM.animatedType == AnimatedType.T1 ||
                  vM.animatedType == AnimatedType.T2
              ? s(vM.h, 250, 280, 310, 340)
              : s(vM.h, 350, 380, 410, 440),
          left: vM.animatedType == AnimatedType.T1
              ? vM.s.width / 2
              : vM.s.width / 2 + 50,
          duration: const Duration(milliseconds: 300),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: vM.sV > vM.s.height * 3 - 280 ? 1 : 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: vM.sV > vM.s.height * 3 - 280
                  ? s(vM.w, 90, 100, 110, 120)
                  : s(vM.w, 200, 210, 220, 230),
              child: const Image(
                image: AssetImage("assets/bride.png"),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
