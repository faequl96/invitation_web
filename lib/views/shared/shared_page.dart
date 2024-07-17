import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
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
              vM.sV <= (vM.s.height * 6) + 200) ...[
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
        ],
      ),
    );
  }
}
