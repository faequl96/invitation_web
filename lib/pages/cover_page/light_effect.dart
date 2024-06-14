import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:invitation_web/view_model.dart';

class LightEffect extends StatelessWidget with GetItMixin {
  LightEffect({super.key, required this.isRight});

  final bool isRight;

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
            right: isRight ? null : -2,
            left: isRight ? -2 : null,
            child: Container(
              height: vM.s.height,
              width: vM.s.width / 2,
              color: Colors.white.withOpacity(vM.opacity),
            ),
          ),
        ],
      ),
    );
  }
}
