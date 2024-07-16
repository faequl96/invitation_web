import 'package:flutter/material.dart';
import 'package:invitation_web/methods/methods.dart';
import 'package:invitation_web/view_model.dart';
import 'package:url_launcher/url_launcher.dart';

class LastPage extends StatelessWidget {
  const LastPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewModel vM = locator<ViewModel>();

    return Column(
      children: [
        const Spacer(),
        GestureDetector(
          onTap: () async {
            const String address = "https://www.instagram.com/faequl77/";
            await launchUrl(Uri.parse(address));
          },
          child: Image.asset(
            "assets/instagram.png",
            width: s(vM.w, 28, 30, 32, 34),
          ),
        ),
        const SizedBox(height: 56),
      ],
    );
  }
}
