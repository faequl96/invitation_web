import 'dart:ui';

import 'package:flutter/material.dart';

class InvitationSeal extends StatelessWidget {
  const InvitationSeal({super.key, required this.isSealOpened});

  final bool isSealOpened;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: Container(
          height: size.height,
          width: 48,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white.withValues(alpha: 0.15),
                Colors.grey.shade200.withValues(alpha: 0.1),
                Colors.white.withValues(alpha: 0.15),
              ],
              stops: const [0.4, 0.6, 1],
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeInCubic,
              height: isSealOpened ? 72 : 12,
              width: 48,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: isSealOpened
                      ? [
                          Colors.grey.withValues(alpha: 0.2),
                          Colors.white.withValues(alpha: 0.4),
                          Colors.grey.withValues(alpha: 0.2),
                        ]
                      : [
                          Colors.white.withValues(alpha: 0.1),
                          Colors.white.withValues(alpha: 0.1),
                          Colors.white.withValues(alpha: 0.1),
                        ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
