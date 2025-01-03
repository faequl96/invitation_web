import 'package:flutter/material.dart';
import 'package:invitation_web/methods/methods.dart';
import 'package:invitation_web/view_model.dart';
import 'package:watch_it/watch_it.dart';

class LeftBackground extends StatelessWidget with WatchItMixin {
  LeftBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewModel vM = di<ViewModel>();

    return SizedBox(
      height: vM.s.height,
      width: vM.s.width / 2,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: 0,
            child: Image(
              fit: BoxFit.cover,
              height: vM.s.height,
              width: vM.s.width / 2,
              image: const AssetImage("assets/landing_bg_left.png"),
            ),
          ),
          Positioned(
            right: 0,
            bottom: s(vM.h, 76, 84, 92, 100),
            child: Container(
              height: s(vM.h, 112, 118, 124, 130),
              width: vM.s.width / 2 - s(vM.w, 34, 36, 38, 40),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14),
                  bottomLeft: Radius.circular(14),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(210, 255, 198, 192),
                    Color.fromARGB(210, 230, 211, 164),
                  ],
                  stops: [0.3, 0.5],
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  left: 8,
                  top: 8,
                  bottom: 8,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                  color: Color.fromARGB(255, 255, 250, 230),
                ),
              ),
            ),
          ),
          Positioned(
            right: -0.2,
            child: Container(
              height: vM.s.height,
              width: vM.s.width / 2,
              decoration: vM.bgPositionX > 1
                  ? BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                          Colors.white.withValues(alpha: vM.flash),
                          Colors.transparent,
                        ],
                      ),
                    )
                  : null,
            ),
          ),
          Positioned(
            right: -s(vM.w, 24, 26, 28, 30),
            bottom: s(vM.h, 298, 314, 330, 346),
            child: Image(
              width: s(vM.h, 116, 122, 128, 134),
              fit: BoxFit.cover,
              image: const AssetImage("assets/kelir_jawa_rose_gold.png"),
            ),
          ),
        ],
      ),
    );
  }
}
