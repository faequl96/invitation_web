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

    double paddingSide = vM.s.width / 2 - (s(vM.w, 90, 100, 110, 120) + 60);

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
              : vM.s.width / 2 + 60,
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
              : vM.s.width / 2 + 60,
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
        AnimatedPositioned(
          bottom: s(vM.h, 414, 444, 474, 504),
          right: vM.animatedType == AnimatedType.T3
              ? vM.s.width / 2 - 44
              : vM.s.width / 2 + 60,
          duration: const Duration(milliseconds: 300),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: vM.animatedType == AnimatedType.T3 ? 1 : 0,
            child: SizedBox(
              width: vM.s.width -
                  (s(vM.w, 90, 100, 110, 120) + 16 + paddingSide * 2),
              child: Text(
                "Rahma Nur Istiqomah",
                style: TextStyle(
                  fontFamily: "BrushScriptMT",
                  color: const Color.fromARGB(240, 255, 204, 192),
                  fontWeight: FontWeight.bold,
                  fontSize: s(vM.w, 38, 40, 42, 44),
                  height: 0.94,
                ),
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          bottom: s(vM.h, 384, 414, 444, 474),
          right: vM.animatedType == AnimatedType.T3
              ? vM.s.width / 2 - 44
              : vM.s.width / 2 + 60,
          duration: const Duration(milliseconds: 300),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: vM.animatedType == AnimatedType.T3 ? 1 : 0,
            child: SizedBox(
              width: vM.s.width -
                  (s(vM.w, 90, 100, 110, 120) + 16 + paddingSide * 2),
              child: Text(
                "Putri Tunggal dari",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: s(vM.w, 12, 13, 14, 15),
                  height: 1.2,
                ),
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          bottom: s(vM.h, 350, 380, 410, 440),
          right: vM.animatedType == AnimatedType.T3
              ? vM.s.width / 2 - 44
              : vM.s.width / 2 + 60,
          duration: const Duration(milliseconds: 300),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: vM.animatedType == AnimatedType.T3 ? 1 : 0,
            child: SizedBox(
              width: vM.s.width -
                  (s(vM.w, 90, 100, 110, 120) + 16 + paddingSide * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bapak Bagyo Trisno Ngulandoro",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 230, 211, 164),
                      fontWeight: FontWeight.bold,
                      fontSize: s(vM.w, 12, 13, 14, 15),
                      height: 1.2,
                    ),
                  ),
                  Text.rich(
                    const TextSpan(
                        text: "& ",
                        style: TextStyle(color: Colors.white),
                        children: [
                          TextSpan(
                            text: "Ibu Peni Lestari",
                            style: TextStyle(
                              color: Color.fromARGB(240, 255, 204, 192),
                            ),
                          )
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
          bottom: s(vM.h, 214, 244, 274, 304),
          left: vM.animatedType == AnimatedType.T3
              ? vM.s.width / 2 - 44
              : vM.s.width / 2 + 60,
          duration: const Duration(milliseconds: 300),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: vM.animatedType == AnimatedType.T3 ? 1 : 0,
            child: SizedBox(
              width: vM.s.width -
                  (s(vM.w, 90, 100, 110, 120) + 16 + paddingSide * 2),
              child: Text(
                "Faiq Ulul Fahmi",
                style: TextStyle(
                  fontFamily: "BrushScriptMT",
                  color: const Color.fromARGB(255, 230, 211, 164),
                  fontWeight: FontWeight.bold,
                  fontSize: s(vM.w, 38, 40, 42, 44),
                  height: 0.94,
                ),
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          bottom: s(vM.h, 184, 214, 244, 274),
          left: vM.animatedType == AnimatedType.T3
              ? vM.s.width / 2 - 44
              : vM.s.width / 2 + 60,
          duration: const Duration(milliseconds: 300),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: vM.animatedType == AnimatedType.T3 ? 1 : 0,
            child: SizedBox(
              width: vM.s.width -
                  (s(vM.w, 90, 100, 110, 120) + 16 + paddingSide * 2),
              child: Text(
                "Putra ke-empat dari",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: s(vM.w, 12, 13, 14, 15),
                  height: 1.2,
                ),
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          bottom: s(vM.h, 150, 180, 210, 240),
          left: vM.animatedType == AnimatedType.T3
              ? vM.s.width / 2 - 44
              : vM.s.width / 2 + 60,
          duration: const Duration(milliseconds: 300),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: vM.animatedType == AnimatedType.T3 ? 1 : 0,
            child: SizedBox(
              width: vM.s.width -
                  (s(vM.w, 90, 100, 110, 120) + 16 + paddingSide * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bapak Syamsuddin",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 230, 211, 164),
                      fontWeight: FontWeight.bold,
                      fontSize: s(vM.w, 12, 13, 14, 15),
                      height: 1.2,
                    ),
                  ),
                  Text.rich(
                    const TextSpan(
                        text: "& ",
                        style: TextStyle(color: Colors.white),
                        children: [
                          TextSpan(
                            text: "Ibu Sa'idah",
                            style: TextStyle(
                              color: Color.fromARGB(240, 255, 204, 192),
                            ),
                          )
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
