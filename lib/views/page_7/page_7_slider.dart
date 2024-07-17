import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:invitation_web/methods/methods.dart';
import 'package:invitation_web/view_model.dart';
import 'package:invitation_web/views/shared/rsvps.dart';
import 'package:url_launcher/url_launcher.dart';

class Page7Slider extends StatelessWidget {
  const Page7Slider({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewModel vM = locator<ViewModel>();

    return SizedBox(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Column(
          children: [
            const Spacer(),
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color.fromARGB(255, 230, 211, 164),
                    Color.fromARGB(125, 230, 211, 164),
                  ],
                  stops: [0.5, 1],
                ),
              ),
              child: const SizedBox(height: 46, child: ShowRSVPDetailButton()),
            ),
            const SizedBox(height: 24),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: vM.s.width - 32,
                  height: 376 - (70 + s(vM.w, 28, 30, 32, 34)),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
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
                        stops: [0.1, 0.3, 0.5, 0.7, 0.9],
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Merupakan suatu kehormatan dan kebahagiaan bagi kami apabila Bapak/Ibu/Saudara/i berkenan hadir dan memberikan doa restu. Atas kehadiran dan doa restunya, kami mengucapkan terima kasih.",
                        style: TextStyle(
                          fontSize: s(vM.w, 14, 15, 16, 17),
                          color: const Color.fromARGB(255, 230, 211, 164),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        "Rahma & Faiq",
                        style: TextStyle(
                          fontFamily: "BrushScriptMT",
                          fontSize: s(vM.w, 36, 38, 40, 42),
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 230, 211, 164),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: -23,
                  left: -16,
                  child: Image.asset(
                    "assets/frame_top_left.png",
                    width: s(vM.w, 102, 104, 108, 114),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Made with",
                    style: TextStyle(
                      fontSize: s(vM.w, 13, 13.4, 14, 14.8),
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 230, 211, 164),
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.favorite,
                    color: Color.fromARGB(238, 255, 96, 60),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "by Faiq",
                    style: TextStyle(
                      fontSize: s(vM.w, 13, 13.4, 14, 14.8),
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 230, 211, 164),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () async {
                const String address = "https://www.instagram.com/faequl77/";
                await launchUrl(Uri.parse(address));
              },
              child: Image.asset(
                "assets/instagram.png",
                width: s(vM.w, 28, 30, 32, 34),
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class ShowRSVPDetailButton extends StatelessWidget {
  const ShowRSVPDetailButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewModel vM = locator<ViewModel>();

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 32),
      ),
      onPressed: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          barrierColor: Colors.black54,
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                height: 560,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/default_bg.png"),
                    colorFilter: ColorFilter.mode(
                      Color.fromARGB(255, 230, 211, 164),
                      BlendMode.overlay,
                    ),
                  ),
                ),
                child: RSVPsModalContent(vM: vM),
              ),
            );
          },
        );
      },
      child: Text(
        "Selengkapnya",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: s(vM.w, 14, 14.4, 15, 15.8),
        ),
      ),
    );
  }
}

class RSVPsModalContent extends StatelessWidget {
  const RSVPsModalContent({super.key, required this.vM});

  final ViewModel vM;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            const SizedBox(width: 16),
            const Expanded(
              child: Text(
                "RSVP & Ucapan",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 230, 211, 164),
                ),
              ),
            ),
            Container(
              width: 50,
              height: 8,
              margin: const EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 230, 211, 164),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 230, 211, 164),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(Icons.close_rounded),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
        const SizedBox(height: 10),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 230, 211, 164),
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior: Clip.hardEdge,
            child: const GetRSVPsWidget(isModalContent: true),
          ),
        ),
      ],
    );
  }
}
