import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:invitation_web/view_model.dart';
import 'package:watch_it/watch_it.dart';

class InvitationWrap extends StatelessWidget with WatchItMixin {
  InvitationWrap({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewModel vM = di<ViewModel>();

    return SizedBox(
      height: vM.s.height,
      width: vM.s.width / 2,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                child: Container(
                  height: vM.s.height,
                  width: vM.s.width / 2,
                  color: Colors.grey.shade800.withValues(alpha: 0.3),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
