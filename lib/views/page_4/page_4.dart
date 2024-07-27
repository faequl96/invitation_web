import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:intl/intl.dart';
import 'package:invitation_web/methods/methods.dart';
import 'package:invitation_web/view_model.dart';
import 'package:url_launcher/url_launcher.dart';

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewModel vM = locator<ViewModel>();

    final DateTime dateTime = DateTime(2024, 8, 10, 9);
    final DateFormat dayDateFormater = DateFormat("EEEE", "id_ID");
    final DateFormat dateFormater = DateFormat("dd MMMM yyyy", "id_ID");

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
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: s(vM.w, 20, 22, 24, 26),
              vertical: s(vM.w, 16, 18, 20, 22),
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
              horizontal: s(vM.w, 14, 16, 18, 20),
              vertical: s(vM.w, 30, 32, 34, 36),
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
            height: vM.s.height,
            width: vM.s.width,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: s(vM.w, 36, 38, 40, 42),
              ),
              child: Column(
                children: [
                  SizedBox(height: s(vM.h, 82, 98, 114, 130)),
                  Text(
                    "Acara Pernikahan",
                    style: TextStyle(
                      fontFamily: "BrushScriptMT",
                      fontSize: s(vM.w, 36, 38, 40, 42),
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 230, 211, 164),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.date_range,
                          size: 32,
                          color: Color.fromARGB(255, 230, 211, 164),
                        ),
                        Text.rich(
                          TextSpan(children: [
                            TextSpan(
                              text: dayDateFormater.format(dateTime),
                              style: const TextStyle(
                                color: Color.fromARGB(255, 230, 211, 164),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: ", ${dateFormater.format(dateTime)}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                          style: TextStyle(
                            fontSize: s(vM.w, 20, 21, 22, 23),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 28),
                        const Text(
                          "Akad Nikah",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color.fromARGB(255, 230, 211, 164),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text.rich(
                          const TextSpan(children: [
                            TextSpan(
                              text: "Pukul ",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: "08.00",
                              style: TextStyle(
                                color: Color.fromARGB(255, 230, 211, 164),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: " WIB",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: " - ",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: "Pukul ",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: "10.00",
                              style: TextStyle(
                                color: Color.fromARGB(240, 255, 204, 192),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: " WIB",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: s(vM.w, 14.8, 15.2, 15.8, 16.6),
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "Resepsi",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color.fromARGB(255, 230, 211, 164),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text.rich(
                          const TextSpan(children: [
                            TextSpan(
                              text: "Pukul ",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: "11.00",
                              style: TextStyle(
                                color: Color.fromARGB(240, 255, 204, 192),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: " WIB",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: " - ",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: "Pukul ",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: "13.00",
                              style: TextStyle(
                                color: Color.fromARGB(255, 230, 211, 164),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: " WIB",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: s(vM.w, 14.8, 15.2, 15.8, 16.6),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Icon(
                    Icons.location_pin,
                    size: 32,
                    color: Color.fromARGB(255, 230, 211, 164),
                  ),
                  Text(
                    "Masjid Raya Bani Umar",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 230, 211, 164),
                      fontSize: s(vM.w, 15, 15.4, 16, 16.8),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Jl. Graha Raya Bintaro Kav. GK 4 No. 2-4, Pondok Aren, Tangerang Selatan",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: s(vM.w, 10, 10.2, 10.6, 11.2),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 230, 211, 164),
                    ),
                    onPressed: () async {
                      const String address =
                          "https://maps.app.goo.gl/HxrVUUvVMiV7Kva79";
                      await launchUrl(Uri.parse(address));
                    },
                    child: const Text(
                      "Buka Petunjuk Arah",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 140),
                ],
              ),
            ),
          ),
          Positioned(
            top: -8,
            left: -4,
            child: Image.asset(
              "assets/frame_top_left.png",
              width: s(vM.w, 150, 160, 170, 180),
            ),
          ),
        ],
      ),
    );
  }
}
