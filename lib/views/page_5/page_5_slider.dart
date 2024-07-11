import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invitation_web/methods/methods.dart';
import 'package:invitation_web/view_model.dart';
import 'package:invitation_web/views/shared/animated_beat_widget.dart';

class Page5Slider extends StatelessWidget {
  const Page5Slider({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewModel vM = locator<ViewModel>();

    return SizedBox(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: vM.s.width / 3 + s(vM.h, 102, 118, 134, 150) + 80),
            Expanded(
              child: Container(
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 230, 211, 164),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/bank_bri.png",
                            width: vM.s.width / 3,
                          ),
                          Text(
                            "151101011130505",
                            style: TextStyle(
                              fontSize: s(vM.w, 28, 30, 32, 34),
                              fontWeight: FontWeight.w600,
                              // color: const Color.fromARGB(255, 212, 183, 111),
                            ),
                          ),
                          const Text(
                            "a.n Rahma Nur Istiqomah",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    AnimatedBeatWidget(
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                          ),
                          onPressed: () {
                            Clipboard.setData(
                              const ClipboardData(text: "151101011130505"),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Berhasil menyalin nomor rekening",
                                  textAlign: TextAlign.center,
                                ),
                                duration: Duration(milliseconds: 1000),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.copy,
                                size: s(vM.w, 24.6, 25.2, 25.8, 26.4),
                                color: Colors.black,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "Salin Nomor Rekening",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: s(vM.w, 14, 14.4, 15, 15.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 36),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
