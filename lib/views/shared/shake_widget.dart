import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:invitation_web/view_model.dart';

class ShakeWidget extends StatelessWidget {
  const ShakeWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => ShakeAnimation(child: child);
}

class ShakeAnimation extends StatelessWidget with GetItMixin {
  ShakeAnimation({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final ViewModel vM = get<ViewModel>();
    watchOnly((ViewModel x) => x.shakeTurns);

    return AnimatedRotation(
      turns: vM.shakeTurns,
      duration: const Duration(milliseconds: 150),
      child: child,
    );
  }
}
