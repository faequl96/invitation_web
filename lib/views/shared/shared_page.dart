import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:invitation_web/methods/methods.dart';
import 'package:invitation_web/view_model.dart';

class SharedPage extends StatelessWidget with GetItMixin {
  SharedPage({super.key});

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (vM.sV < vM.s.height * 6 - s(vM.h, 262, 278, 294, 310)) ...[
            SizedBox(height: s(vM.h, 42, 48, 54, 60)),
            Image.asset("assets/gift.png", width: vM.s.width / 3),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Doa restu Anda merupakan karunia yang sangat berarti bagi kami. Dan jika memberi adalah ungkapan tanda kasih Anda, Anda dapat memberi kado secara cashless.",
                style: TextStyle(
                  fontSize: s(vM.w, 12.8, 13.2, 13.8, 14.6),
                  color: const Color.fromARGB(255, 230, 211, 164),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
          if (vM.sV > vM.s.height * 6 - s(vM.h, 262, 278, 294, 310) &&
              vM.sV <= vM.s.height * 7) ...[
            SizedBox(height: s(vM.h, 22, 26, 30, 34)),
            Text(
              "RSVP dan Ucapan",
              style: TextStyle(
                fontFamily: "BrushScriptMT",
                fontSize: s(vM.w, 36, 38, 40, 42),
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 230, 211, 164),
              ),
            ),
          ],
          if (vM.sV > vM.s.height * 7) ...[
            SizedBox(height: s(vM.h, 42, 46, 52, 60)),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: vM.s.width - 32,
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
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        "Merupakan suatu kehormatan dan kebahagiaan bagi kami apabila Bapak/Ibu/Saudara/i berkenan hadir dan memberikan doa restu. Atas kehadiran dan doa restunya, kami mengucapkan terima kasih.",
                        style: TextStyle(
                          fontSize: s(vM.w, 14, 15, 16, 17),
                          color: const Color.fromARGB(255, 230, 211, 164),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
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
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
            const SizedBox(height: 10),
            SizedBox(height: s(vM.w, 28, 30, 32, 34)),
            const SizedBox(height: 56),
          ],
        ],
      ),
    );
  }
}
