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

    double paddingSide = vM.s.width / 2 - (s(vM.w, 100, 110, 120, 130) + 50);

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
                  ? s(vM.w, 100, 110, 120, 130)
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
                  ? s(vM.w, 100, 110, 120, 130)
                  : s(vM.w, 200, 210, 220, 230),
              child: const Image(
                image: AssetImage("assets/bride.png"),
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          bottom: s(vM.h, 414, 454, 484, 514),
          right: vM.animatedType == AnimatedType.T3
              ? vM.s.width / 2 - 40
              : vM.s.width / 2 + 50,
          duration: const Duration(milliseconds: 300),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: vM.animatedType == AnimatedType.T3 ? 1 : 0,
            child: SizedBox(
              width: vM.s.width -
                  (s(vM.w, 100, 110, 120, 130) + 10 + paddingSide * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Rahma",
                    style: TextStyle(
                      fontFamily: "BrushScriptMT",
                      color: const Color.fromARGB(240, 255, 204, 192),
                      fontWeight: FontWeight.bold,
                      fontSize: s(vM.w, 38, 40, 42, 44),
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "Nur Istiqomah, M.Si.",
                    style: TextStyle(
                      fontFamily: "BrushScriptMT",
                      color: const Color.fromARGB(240, 255, 204, 192),
                      fontWeight: FontWeight.bold,
                      fontSize: s(vM.w, 22, 24, 26, 28),
                      height: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          bottom: s(vM.h, 360, 390, 420, 450),
          right: vM.animatedType == AnimatedType.T3
              ? vM.s.width / 2 - 40
              : vM.s.width / 2 + 50,
          duration: const Duration(milliseconds: 300),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: vM.animatedType == AnimatedType.T3 ? 1 : 0,
            child: SizedBox(
              width: vM.s.width -
                  (s(vM.w, 100, 110, 120, 130) + 10 + paddingSide * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Putri Tunggal dari",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: s(vM.w, 11, 12, 13, 14),
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text.rich(
                    const TextSpan(children: [
                      TextSpan(
                        text: "B. ",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextSpan(
                        text: "Bagyo Trisno Ngulandoro",
                        style: TextStyle(
                          color: Color.fromARGB(255, 230, 211, 164),
                        ),
                      ),
                      TextSpan(
                        text: ", S.T.",
                        style: TextStyle(color: Colors.white),
                      ),
                    ]),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: s(vM.w, 12, 13, 14, 15),
                      height: 1.2,
                    ),
                  ),
                  Text.rich(
                    const TextSpan(children: [
                      TextSpan(
                        text: "& ",
                        style: TextStyle(
                          color: Color.fromARGB(255, 230, 211, 164),
                        ),
                      ),
                      TextSpan(
                        text: "I. ",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextSpan(
                        text: "Peni Lestari",
                        style: TextStyle(
                          color: Color.fromARGB(240, 255, 204, 192),
                        ),
                      ),
                      TextSpan(
                        text: ", S.E.",
                        style: TextStyle(color: Colors.white),
                      ),
                    ]),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: s(vM.w, 12, 13, 14, 15),
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          bottom: s(vM.h, 224, 254, 284, 414),
          left: vM.animatedType == AnimatedType.T3
              ? vM.s.width / 2 - 40
              : vM.s.width / 2 + 50,
          duration: const Duration(milliseconds: 300),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: vM.animatedType == AnimatedType.T3 ? 1 : 0,
            child: SizedBox(
              width: vM.s.width -
                  (s(vM.w, 100, 110, 120, 130) + 10 + paddingSide * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Faiq",
                    style: TextStyle(
                      fontFamily: "BrushScriptMT",
                      color: const Color.fromARGB(255, 230, 211, 164),
                      fontWeight: FontWeight.bold,
                      fontSize: s(vM.w, 38, 40, 42, 44),
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "Ulul Fahmi, S.Pd.",
                    style: TextStyle(
                      fontFamily: "BrushScriptMT",
                      color: const Color.fromARGB(255, 230, 211, 164),
                      fontWeight: FontWeight.bold,
                      fontSize: s(vM.w, 22, 24, 26, 28),
                      height: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          bottom: s(vM.h, 156, 186, 216, 246),
          left: vM.animatedType == AnimatedType.T3
              ? vM.s.width / 2 - 40
              : vM.s.width / 2 + 50,
          duration: const Duration(milliseconds: 300),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: vM.animatedType == AnimatedType.T3 ? 1 : 0,
            child: SizedBox(
              width: vM.s.width -
                  (s(vM.w, 100, 110, 120, 130) + 10 + paddingSide * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Putri ke-empat dari",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: s(vM.w, 11, 12, 13, 14),
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text.rich(
                    const TextSpan(children: [
                      TextSpan(
                        text: "B. ",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextSpan(
                        text: "Syamsuddin",
                        style: TextStyle(
                          color: Color.fromARGB(255, 230, 211, 164),
                        ),
                      ),
                      TextSpan(
                        text: ", S.Pd.",
                        style: TextStyle(color: Colors.white),
                      ),
                    ]),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: s(vM.w, 12, 13, 14, 15),
                      height: 1.2,
                    ),
                  ),
                  Text.rich(
                    const TextSpan(children: [
                      TextSpan(
                        text: "& ",
                        style: TextStyle(
                          color: Color.fromARGB(255, 230, 211, 164),
                        ),
                      ),
                      TextSpan(
                        text: "I. ",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextSpan(
                        text: "Sa'idah",
                        style: TextStyle(
                          color: Color.fromARGB(240, 255, 204, 192),
                        ),
                      ),
                    ]),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: s(vM.w, 12, 13, 14, 15),
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
