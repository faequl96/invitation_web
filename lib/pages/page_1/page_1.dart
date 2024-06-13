import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:invitation_web/methods/methods.dart';
import 'package:invitation_web/view_model.dart';

class Page1 extends StatelessWidget with GetItMixin {
  Page1({super.key});

  final DateTime _dateTime = DateTime(2024, 8, 10, 9);

  @override
  Widget build(BuildContext context) {
    final ViewModel vM = locator<ViewModel>();

    final DateFormat dateFormater = DateFormat("EEEE, dd MMMM yyyy", "id_ID");

    return Container(
      height: vM.s.height,
      width: vM.s.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/default_bg.png"),
        ),
      ),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Positioned(
            top: s(vM.h, 12, 18, 36, 66),
            child: const Text(
              "Pernikahan",
              style: TextStyle(
                fontFamily: "BrushScriptMT",
                fontSize: 70,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 230, 211, 164),
              ),
            ),
          ),
          Positioned(
            top: s(vM.h, 76, 82, 100, 130),
            child: const Text(
              "Dari",
              style: TextStyle(
                fontFamily: "BrushScriptMT",
                fontSize: 40,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 200,
            child: Container(
              width: vM.s.width - 60,
              height: vM.s.width - 60,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage("assets/unifying_frame.png"),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 400),
            bottom: s(vM.w, 374, 384, 390, 392),
            right: vM.sV > vM.s.height - 50 ? s(vM.w, 110, 120, 130, 140) : 40,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: vM.sV > vM.s.height - 50 ? 1 : 0,
              child: Text(
                "Rahma",
                style: TextStyle(
                  fontFamily: "BrushScriptMT",
                  fontSize: s(vM.w, 46, 48, 50, 52),
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 230, 211, 164),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: s(vM.w, 314, 324, 330, 332),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: vM.sV > vM.s.height - 1 ? 1 : 0,
              child: const Text(
                "&",
                style: TextStyle(
                  fontFamily: "BrushScriptMT",
                  fontSize: 56,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 230, 211, 164),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 400),
            bottom: s(vM.w, 274, 284, 290, 292),
            left: vM.sV > vM.s.height - 50 ? s(vM.w, 130, 140, 150, 160) : 40,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: vM.sV > vM.s.height - 50 ? 1 : 0,
              child: Text(
                "Faiq",
                style: TextStyle(
                  fontFamily: "BrushScriptMT",
                  fontSize: s(vM.w, 46, 48, 50, 52),
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 230, 211, 164),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 400),
            bottom: vM.sV > vM.s.height - 50 ? 120 : 50,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: vM.sV > vM.s.height - 50 ? 1 : 0,
              child: Text(
                dateFormater.format(_dateTime),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
