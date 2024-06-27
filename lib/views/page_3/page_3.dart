import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
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

    double paddingSide = vM.s.width / 2 - (s(vM.w, 96, 106, 116, 126) + 50);

    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        AnimatedPositioned(
          bottom: vM.animatedType == AnimatedType.T1 ||
                  vM.animatedType == AnimatedType.T2
              ? s(vM.h, 250, 280, 310, 340)
              : s(vM.h, 140, 170, 200, 230),
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
                  ? s(vM.w, 96, 106, 116, 126)
                  : s(vM.w, 196, 206, 216, 226),
              padding: vM.animatedType == AnimatedType.T1 ||
                      vM.animatedType == AnimatedType.T2
                  ? const EdgeInsets.all(0)
                  : const EdgeInsets.all(3),
              decoration: vM.animatedType == AnimatedType.T1 ||
                      vM.animatedType == AnimatedType.T2
                  ? null
                  : const BoxDecoration(
                      border: GradientBoxBorder(
                        width: 2,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(0, 230, 211, 164),
                            Color.fromARGB(255, 255, 198, 192),
                            Color.fromARGB(255, 230, 211, 164),
                            Color.fromARGB(255, 255, 198, 192),
                            Color.fromARGB(255, 230, 211, 164),
                          ],
                          stops: [0.1, 0.4, 0.5, 0.6, 0.9],
                          transform: GradientRotation(-0.2),
                        ),
                      ),
                    ),
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
              : s(vM.h, 360, 390, 420, 450),
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
                  ? s(vM.w, 96, 106, 116, 126)
                  : s(vM.w, 196, 206, 216, 226),
              padding: vM.animatedType == AnimatedType.T1 ||
                      vM.animatedType == AnimatedType.T2
                  ? const EdgeInsets.all(0)
                  : const EdgeInsets.all(3),
              decoration: vM.animatedType == AnimatedType.T1 ||
                      vM.animatedType == AnimatedType.T2
                  ? null
                  : const BoxDecoration(
                      border: GradientBoxBorder(
                        width: 2,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(0, 230, 211, 164),
                            Color.fromARGB(255, 255, 198, 192),
                            Color.fromARGB(255, 230, 211, 164),
                            Color.fromARGB(255, 255, 198, 192),
                            Color.fromARGB(255, 230, 211, 164),
                          ],
                          stops: [0.1, 0.4, 0.5, 0.6, 0.9],
                          transform: GradientRotation(-0.2),
                        ),
                      ),
                    ),
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
                  (s(vM.w, 96, 106, 116, 126) + 10 + paddingSide * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Rahma",
                    style: TextStyle(
                      fontFamily: "BrushScriptMT",
                      color: const Color.fromARGB(240, 255, 204, 192),
                      fontWeight: FontWeight.bold,
                      fontSize: s(vM.w, 44, 46, 48, 50),
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text.rich(
                    const TextSpan(children: [
                      TextSpan(
                        text: "Nur Istiqomah",
                        style: TextStyle(
                          color: Color.fromARGB(240, 255, 204, 192),
                        ),
                      ),
                      TextSpan(
                        text: ", M.Biomed",
                        style: TextStyle(color: Colors.white),
                      ),
                    ]),
                    style: TextStyle(
                      fontFamily: "BrushScriptMT",
                      fontWeight: FontWeight.bold,
                      fontSize: s(vM.w, 17, 19, 21, 23),
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
                  (s(vM.w, 96, 106, 116, 126) + 10 + paddingSide * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Putri Tunggal dari",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: s(vM.w, 9, 10, 11, 12),
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text.rich(
                    const TextSpan(children: [
                      TextSpan(
                        text: "Bapak ",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextSpan(
                        text: "Bagyo Trisno Ngulandoro",
                        style: TextStyle(
                          color: Color.fromARGB(255, 230, 211, 164),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ", S.T",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                    style: TextStyle(
                      fontSize: s(vM.w, 10, 11, 12, 13),
                      height: 1.2,
                    ),
                  ),
                  Text.rich(
                    const TextSpan(children: [
                      TextSpan(
                        text: "& ",
                        style: TextStyle(
                          color: Color.fromARGB(255, 230, 211, 164),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: "Ibu ",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextSpan(
                        text: "Peni Lestari",
                        style: TextStyle(
                          color: Color.fromARGB(240, 255, 204, 192),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ", S.E",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                    style: TextStyle(
                      fontSize: s(vM.w, 10, 11, 12, 13),
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          bottom: s(vM.h, 224, 254, 284, 314),
          left: vM.animatedType == AnimatedType.T3
              ? vM.s.width / 2 - 40
              : vM.s.width / 2 + 50,
          duration: const Duration(milliseconds: 300),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: vM.animatedType == AnimatedType.T3 ? 1 : 0,
            child: SizedBox(
              width: vM.s.width -
                  (s(vM.w, 96, 106, 116, 126) + 10 + paddingSide * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Faiq",
                    style: TextStyle(
                      fontFamily: "BrushScriptMT",
                      color: const Color.fromARGB(255, 230, 211, 164),
                      fontWeight: FontWeight.bold,
                      fontSize: s(vM.w, 44, 46, 48, 50),
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text.rich(
                    const TextSpan(children: [
                      TextSpan(
                        text: "Ulul Fahmi",
                        style: TextStyle(
                          color: Color.fromARGB(255, 230, 211, 164),
                        ),
                      ),
                      TextSpan(
                        text: ", S.Pd",
                        style: TextStyle(color: Colors.white),
                      ),
                    ]),
                    style: TextStyle(
                      fontFamily: "BrushScriptMT",
                      fontWeight: FontWeight.bold,
                      fontSize: s(vM.w, 17, 19, 21, 23),
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
                  (s(vM.w, 96, 106, 116, 126) + 10 + paddingSide * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Putra ke-empat dari",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: s(vM.w, 9, 10, 11, 12),
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text.rich(
                    const TextSpan(children: [
                      TextSpan(
                        text: "Bapak ",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextSpan(
                        text: "Syamsuddin",
                        style: TextStyle(
                          color: Color.fromARGB(255, 230, 211, 164),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ", S.Pd",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                    style: TextStyle(
                      fontSize: s(vM.w, 10, 11, 12, 13),
                      height: 1.2,
                    ),
                  ),
                  Text.rich(
                    const TextSpan(children: [
                      TextSpan(
                        text: "& ",
                        style: TextStyle(
                          color: Color.fromARGB(255, 230, 211, 164),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: "Ibu ",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextSpan(
                        text: "Sa'idah",
                        style: TextStyle(
                          color: Color.fromARGB(240, 255, 204, 192),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                    style: TextStyle(
                      fontSize: s(vM.w, 10, 11, 12, 13),
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
