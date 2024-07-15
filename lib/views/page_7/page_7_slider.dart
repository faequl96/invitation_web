import 'package:flutter/material.dart';
import 'package:invitation_web/methods/methods.dart';
import 'package:invitation_web/view_model.dart';
import 'package:invitation_web/views/page_6/page_6.dart';

class Page7Slider extends StatelessWidget {
  const Page7Slider({super.key});

  @override
  Widget build(BuildContext context) {
    // final ViewModel vM = locator<ViewModel>();

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
      onPressed: () async {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          barrierColor: Colors.black54,
          // isDismissible: false,
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SizedBox(
                height: 560,
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 8,
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 230, 211, 164),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 230, 211, 164),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: RSVPsWidget(vM: vM),
                      ),
                    ),
                  ],
                ),
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
