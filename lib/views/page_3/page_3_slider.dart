import 'package:flutter/material.dart';
import 'package:invitation_web/methods/methods.dart';
import 'package:invitation_web/view_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:watch_it/watch_it.dart';

class Page3Slider extends StatelessWidget {
  const Page3Slider({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewModel vM = di<ViewModel>();

    return Column(
      children: [
        SizedBox(height: s(vM.h, 132, 132, 146, 164)),
        Expanded(
          child: GestureDetector(
            onTap: () async {
              const String address =
                  "https://www.instagram.com/rahmaistiqomah?igsh=N3cyd3ZzN2VmbG94";
              await launchUrl(Uri.parse(address));
            },
            child: Container(
              width: double.maxFinite,
              color: Colors.transparent,
            ),
          ),
        ),
        SizedBox(height: s(vM.h, 36, 36, 42, 48)),
        Expanded(
          child: GestureDetector(
            onTap: () async {
              const String address =
                  "https://www.instagram.com/faequl77?igsh=cm12ZzZxOWNpZGRr";
              await launchUrl(Uri.parse(address));
            },
            child: Container(
              width: double.maxFinite,
              color: Colors.transparent,
            ),
          ),
        ),
        SizedBox(height: s(vM.h, 140, 168, 186, 204)),
      ],
    );
  }
}
