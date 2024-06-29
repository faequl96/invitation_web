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

    double paddingSide = vM.s.width / 2 - (s(vM.w, 104, 108, 116, 126) + 50);

    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Positioned(
          top: s(vM.h, 40, 48, 60, 76),
          child: Text(
            "Kami Yang Mengundang",
            style: TextStyle(
              fontFamily: "BrushScriptMT",
              fontSize: s(vM.w, 32, 34, 36, 38),
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 230, 211, 164),
            ),
          ),
        ),
        AnimatedPositioned(
          top: vM.animatedType == AnimatedType.T1 ||
                  vM.animatedType == AnimatedType.T2
              ? vM.s.height -
                  (s(vM.h, 240, 270, 310, 340) + s(vM.w, 126, 132, 140, 150))
              : vM.s.height - (s(vM.h, 260, 290, 310, 340) + 40),
          right: vM.animatedType == AnimatedType.T1
              ? vM.s.width / 2
              : vM.s.width / 2 + 50,
          duration: const Duration(milliseconds: 300),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: vM.sV > vM.s.height * 3 - 280 ? 1 : 0,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: vM.sV > vM.s.height * 3 - 280
                      ? s(vM.w, 104, 108, 116, 126)
                      : s(vM.w, 200, 206, 216, 226),
                  height: s(vM.w, 126, 132, 140, 150),
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
                                Color.fromARGB(0, 230, 211, 164),
                              ],
                              stops: [0.1, 0.3, 0.5, 0.7, 0.9],
                              transform: GradientRotation(-0.2),
                            ),
                          ),
                        ),
                  child: const Image(
                    image: AssetImage("assets/groom.png"),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                if (vM.animatedType == AnimatedType.T3) ...[
                  Positioned(
                    top: -19,
                    left: -13,
                    child: Image.asset(
                      "assets/frame_top_left.png",
                      width: s(vM.w, 52, 54, 58, 64),
                    ),
                  ),
                  Positioned(
                    bottom: -19,
                    right: -13,
                    child: Image.asset(
                      "assets/frame_bottom_right.png",
                      width: s(vM.w, 52, 54, 58, 64),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        AnimatedPositioned(
          bottom: vM.animatedType == AnimatedType.T1 ||
                  vM.animatedType == AnimatedType.T2
              ? s(vM.h, 240, 270, 310, 340)
              : s(vM.h, 350, 380, 420, 450),
          left: vM.animatedType == AnimatedType.T1
              ? vM.s.width / 2
              : vM.s.width / 2 + 50,
          duration: const Duration(milliseconds: 300),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: vM.sV > vM.s.height * 3 - 280 ? 1 : 0,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: vM.sV > vM.s.height * 3 - 280
                      ? s(vM.w, 104, 108, 116, 126)
                      : s(vM.w, 200, 206, 216, 226),
                  height: s(vM.w, 126, 132, 140, 150),
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
                                Color.fromARGB(0, 230, 211, 164),
                              ],
                              stops: [0.1, 0.3, 0.5, 0.7, 0.9],
                              transform: GradientRotation(-0.2),
                            ),
                          ),
                        ),
                  child: const Image(
                    image: AssetImage("assets/bride.png"),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                if (vM.animatedType == AnimatedType.T3) ...[
                  Positioned(
                    top: -19,
                    left: -13,
                    child: Image.asset(
                      "assets/frame_top_left.png",
                      width: s(vM.w, 52, 54, 58, 64),
                    ),
                  ),
                  Positioned(
                    bottom: -19,
                    right: -13,
                    child: Image.asset(
                      "assets/frame_bottom_right.png",
                      width: s(vM.w, 52, 54, 58, 64),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        AnimatedPositioned(
          bottom: s(vM.h, 348, 378, 418, 448),
          right: vM.animatedType == AnimatedType.T3
              ? vM.s.width / 2 - 40
              : vM.s.width / 2 + 50,
          duration: const Duration(milliseconds: 300),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: vM.animatedType == AnimatedType.T3 ? 1 : 0,
            child: SizedBox(
              width: vM.s.width -
                  (s(vM.w, 104, 108, 116, 126) + 10 + paddingSide + 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Rahma",
                    style: TextStyle(
                      fontFamily: "BrushScriptMT",
                      color: const Color.fromARGB(240, 255, 204, 192),
                      fontWeight: FontWeight.bold,
                      fontSize: s(vM.w, 46, 46.8, 48, 49.6),
                      height: 1,
                    ),
                  ),
                  SizedBox(height: s(vM.w, 1.6, 2.2, 3, 4)),
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
                      fontSize: s(vM.w, 18.4, 19.2, 20.4, 22),
                      height: 1,
                    ),
                  ),
                  SizedBox(height: s(vM.w, 10.6, 11.2, 12, 13)),
                  Text(
                    "Putri Tunggal dari",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: s(vM.w, 9.6, 10, 10.8, 12),
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 2),
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
                      fontSize: s(vM.w, 10.8, 11.2, 11.8, 12.6),
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
                      fontSize: s(vM.w, 10.8, 11.2, 11.8, 12.6),
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          top: vM.s.height - (s(vM.h, 260, 290, 310, 340) + 46),
          left: vM.animatedType == AnimatedType.T3
              ? vM.s.width / 2 - 40
              : vM.s.width / 2 + 50,
          duration: const Duration(milliseconds: 300),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: vM.animatedType == AnimatedType.T3 ? 1 : 0,
            child: SizedBox(
              width: vM.s.width -
                  (s(vM.w, 104, 108, 116, 126) + 10 + paddingSide + 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Faiq",
                    style: TextStyle(
                      fontFamily: "BrushScriptMT",
                      color: const Color.fromARGB(255, 230, 211, 164),
                      fontWeight: FontWeight.bold,
                      fontSize: s(vM.w, 46, 46.8, 48, 49.6),
                      height: 1,
                    ),
                  ),
                  SizedBox(height: s(vM.w, 1.6, 2.2, 3, 4)),
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
                      fontSize: s(vM.w, 18.4, 19.2, 20.4, 22),
                      height: 1,
                    ),
                  ),
                  SizedBox(height: s(vM.w, 10.6, 11.2, 12, 13)),
                  Text(
                    "Putra ke-empat dari",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: s(vM.w, 9.6, 10, 10.8, 12),
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 2),
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
                      fontSize: s(vM.w, 10.8, 11.2, 11.8, 12.6),
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
                      fontSize: s(vM.w, 10.8, 11.2, 11.8, 12.6),
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (vM.animatedType == AnimatedType.T3) ...[
          Container(
            height: s(vM.w, 104, 112, 120, 132),
            margin: EdgeInsets.only(
              left: s(vM.w, 30, 32, 34, 36),
              right: s(vM.w, 30, 32, 34, 36),
              bottom: 20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: const GradientBoxBorder(
                width: 2,
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
                  stops: [0.1, 0.4, 0.5, 0.6, 0.9],
                  transform: GradientRotation(-0.2),
                ),
              ),
            ),
          ),
          Container(
            height: s(vM.w, 76, 84, 92, 100),
            margin: EdgeInsets.only(
              left: s(vM.w, 24, 26, 28, 30),
              right: s(vM.w, 24, 26, 28, 30),
              bottom: 34,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: const GradientBoxBorder(
                width: 2,
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
                  stops: [0.1, 0.4, 0.5, 0.6, 0.9],
                  transform: GradientRotation(-0.2),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
