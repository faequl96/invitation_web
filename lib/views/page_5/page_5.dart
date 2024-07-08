import 'package:flutter/material.dart';
import 'package:invitation_web/methods/methods.dart';
import 'package:invitation_web/view_model.dart';

class Page5 extends StatelessWidget {
  const Page5({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewModel vM = locator<ViewModel>();

    return Container(
      height: vM.s.height,
      width: vM.s.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/default_bg.png"),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: s(vM.h, 72, 88, 104, 120)),
          Image.asset(
            "assets/gift.png",
            width: vM.s.width / 3,
          ),
          const SizedBox(height: 8),
          Text(
            "Kado Pernikahan",
            style: TextStyle(
              fontFamily: "BrushScriptMT",
              fontSize: s(vM.w, 36, 38, 40, 42),
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 230, 211, 164),
            ),
          ),
        ],
      ),
    );
  }
}
