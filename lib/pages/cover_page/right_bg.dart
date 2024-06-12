import 'package:flutter/material.dart';
import 'package:invitation_web/enum/enums.dart';
import 'package:invitation_web/methods/methods.dart';

class RightBackground extends StatelessWidget {
  const RightBackground({
    super.key,
    required this.hType,
    required this.wType,
    this.isTransparent,
    this.moveValue = 0,
    this.flashValue = 0,
  });

  final H hType;
  final W wType;
  final bool? isTransparent;
  final double moveValue;
  final double flashValue;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height,
      width: size.width / 2,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          isTransparent == true
              ? const SizedBox.shrink()
              : Positioned(
                  left: -0.2,
                  child: Image(
                    fit: BoxFit.cover,
                    height: size.height,
                    width: size.width / 2,
                    image: const AssetImage("assets/landing_bg_right.png"),
                  ),
                ),
          isTransparent == true
              ? const SizedBox.shrink()
              : Positioned(
                  left: -1,
                  bottom: h(hType, 76, 84, 92, 100),
                  child: Container(
                    height: h(hType, 112, 118, 124, 130),
                    width: size.width / 2 - w(wType, 34, 36, 38, 40),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(14),
                        bottomRight: Radius.circular(14),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                        colors: [
                          Color.fromARGB(210, 255, 198, 192),
                          Color.fromARGB(210, 230, 211, 164),
                        ],
                        stops: [0.3, 0.5],
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(
                        right: 8,
                        top: 8,
                        bottom: 8,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                        color: Color.fromARGB(255, 255, 250, 230),
                      ),
                    ),
                  ),
                ),
          isTransparent == true
              ? const SizedBox.shrink()
              : Positioned(
                  left: -2,
                  child: Container(
                    height: size.height,
                    width: size.width / 2,
                    decoration: moveValue > 1
                        ? BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.white.withOpacity(flashValue),
                                Colors.transparent,
                              ],
                            ),
                          )
                        : null,
                  ),
                ),
          isTransparent == true
              ? Positioned(
                  left: -w(wType, 24, 26, 28, 30),
                  bottom: h(hType, 298, 314, 330, 346),
                  child: Image(
                    width: h(hType, 116, 122, 128, 134),
                    fit: BoxFit.cover,
                    image: const AssetImage("assets/kelir_jawa_gold.png"),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
