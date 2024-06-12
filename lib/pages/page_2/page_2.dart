import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:invitation_web/enum/enums.dart';
import 'package:invitation_web/methods/methods.dart';
import 'package:invitation_web/pages/cover_page/countdown.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key, required this.hType, required this.wType});

  final H hType;
  final W wType;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/default_bg.png"),
        ),
      ),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: w(wType, 20, 22, 24, 26),
              vertical: w(wType, 16, 18, 20, 22),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: const GradientBoxBorder(
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
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(0, 230, 211, 164),
                  Color.fromARGB(14, 230, 211, 164),
                  Color.fromARGB(20, 230, 211, 164),
                  Color.fromARGB(14, 230, 211, 164),
                  Color.fromARGB(0, 230, 211, 164),
                ],
                stops: [0.1, 0.4, 0.5, 0.6, 0.9],
                transform: GradientRotation(-0.2),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: w(wType, 14, 16, 18, 20),
              vertical: w(wType, 30, 32, 34, 36),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: const GradientBoxBorder(
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
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(0, 230, 211, 164),
                  Color.fromARGB(14, 230, 211, 164),
                  Color.fromARGB(20, 230, 211, 164),
                  Color.fromARGB(14, 230, 211, 164),
                  Color.fromARGB(0, 230, 211, 164),
                ],
                stops: [0.1, 0.4, 0.5, 0.6, 0.9],
                transform: GradientRotation(-0.2),
              ),
            ),
          ),
          SizedBox(
            height: size.height,
            width: size.width,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: w(wType, 36, 38, 40, 42),
              ),
              child: Column(
                children: [
                  SizedBox(height: h(hType, 72, 88, 104, 120)),
                  Image.asset(
                    "assets/bismillah.png",
                    width: w(wType, 120, 132, 144, 156),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    '"Dan di antara tanda-tanda (kebesaran)-Nya adalah Dia menciptakan pasangan-pasangan untukmu dari jenismu sendiri, agar kamu cenderung dan merasa tenteram kepadanya".',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    '(Ar-Ruum Ayat 21)',
                    style: TextStyle(
                      color: Color.fromARGB(255, 230, 211, 164),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 28),
                  const Text(
                    "Assalamu'alaikum Wr. Wb.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 230, 211, 164),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Dengan memohon rahmat dan ridho Allah Subhanahu Wa Ta'ala. Kami mengundang Bapak/Ibu/Saudara/I, untuk menghadiri resepsi pernikahan kami.",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: (w(wType, 62, 66, 70, 74) +
                ((size.width - w(wType, 140, 148, 156, 164)) / 4)),
            bottom: 48,
            child: CountDown(
              hType: hType,
              wType: wType,
              unitTimeType: UnitTimeType.Hour,
              size: (size.width - w(wType, 140, 148, 156, 164)) / 4,
            ),
          ),
          Positioned(
            right: (w(wType, 62, 66, 70, 74) +
                ((size.width - w(wType, 140, 148, 156, 164)) / 4)),
            bottom: 48,
            child: CountDown(
              hType: hType,
              wType: wType,
              unitTimeType: UnitTimeType.Minute,
              size: (size.width - w(wType, 140, 148, 156, 164)) / 4,
            ),
          ),
          Positioned(
            right: w(wType, 46, 50, 54, 58),
            bottom: 48,
            child: CountDown(
              hType: hType,
              wType: wType,
              unitTimeType: UnitTimeType.Second,
              size: (size.width - w(wType, 140, 148, 156, 164)) / 4,
            ),
          ),
          Positioned(
            left: w(wType, 46, 50, 54, 58),
            bottom: 48,
            child: CountDown(
              hType: hType,
              wType: wType,
              unitTimeType: UnitTimeType.Day,
              size: (size.width - w(wType, 140, 148, 156, 164)) / 4,
            ),
          ),
          Positioned(
            top: -8,
            left: -4,
            child: Image.asset(
              "assets/frame_top_left.png",
              width: w(wType, 150, 160, 170, 180),
            ),
          ),
          // Positioned(
          //   bottom: -4,
          //   right: -4,
          //   child: Image.asset(
          //     "assets/frame_bottom_right.png",
          //     width: w(wType, 120, 130, 140, 150),
          //   ),
          // ),
        ],
      ),
    );
  }
}
