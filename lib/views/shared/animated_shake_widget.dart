import 'package:flutter/material.dart';
import 'package:invitation_web/view_model.dart';
import 'package:watch_it/watch_it.dart';

class AnimatedShakeWidget extends WatchingWidget {
  const AnimatedShakeWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final ViewModel vM = di<ViewModel>();
    watchPropertyValue((ViewModel x) => x.shakeTurns);

    return AnimatedRotation(
      turns: vM.shakeTurns,
      duration: const Duration(milliseconds: 150),
      child: child,
    );
  }
}
