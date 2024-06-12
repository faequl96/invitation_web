import 'dart:ui';

import 'package:flutter/material.dart';

class SealInvitation extends StatelessWidget {
  const SealInvitation({super.key, required this.isSealOpened});

  final bool isSealOpened;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: Container(
          width: size.width,
          height: size.height,
          color: Colors.grey.shade800.withOpacity(0.3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                  child: Container(
                    height: size.height,
                    width: 48,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.3),
                          Colors.grey.shade200.withOpacity(0.2),
                          Colors.white.withOpacity(0.3),
                        ],
                        stops: const [0.4, 0.6, 1],
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 1000),
                        height: isSealOpened ? 72 : 12,
                        width: 48,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: isSealOpened
                                ? [
                                    Colors.grey.withOpacity(0.3),
                                    Colors.white.withOpacity(0.5),
                                    Colors.grey.withOpacity(0.3),
                                  ]
                                : [
                                    Colors.white.withOpacity(0.1),
                                    Colors.white.withOpacity(0.1),
                                    Colors.white.withOpacity(0.1),
                                  ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
