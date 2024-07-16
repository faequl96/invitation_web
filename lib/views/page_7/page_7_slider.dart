import 'package:flutter/material.dart';
import 'package:invitation_web/methods/methods.dart';
import 'package:invitation_web/view_model.dart';
import 'package:invitation_web/views/shared/rsvps.dart';

class Page7Slider extends StatelessWidget {
  const Page7Slider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                    Color.fromARGB(155, 230, 211, 164),
                  ],
                  stops: [0.6, 0.8],
                ),
              ),
              child: const SizedBox(height: 46, child: ShowRSVPDetailButton()),
            ),
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
