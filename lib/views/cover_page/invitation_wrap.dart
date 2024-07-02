import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:invitation_web/view_model.dart';

class InvitationWrap extends StatelessWidget with GetItMixin {
  InvitationWrap({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewModel vM = get<ViewModel>();

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
                  color: Colors.grey.shade800.withOpacity(0.3),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
