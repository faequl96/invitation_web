import 'package:flutter/material.dart';

class AnimatedBeatWidget extends StatefulWidget {
  const AnimatedBeatWidget({super.key, required this.child});
  final Widget child;

  @override
  State<AnimatedBeatWidget> createState() => _AnimatedBeatWidgetState();
}

class _AnimatedBeatWidgetState extends State<AnimatedBeatWidget>
    with TickerProviderStateMixin {
  late AnimationController motionController;
  late Animation motionAnimation;
  double size = 0;

  @override
  void initState() {
    super.initState();

    motionController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
      lowerBound: 0.8,
    );

    motionAnimation = CurvedAnimation(
      parent: motionController,
      curve: Curves.ease,
    );

    motionController.forward();
    motionController.addStatusListener((status) {
      setState(() {
        if (status == AnimationStatus.completed) {
          motionController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          motionController.forward();
        }
      });
    });

    motionController.addListener(() {
      setState(() {
        size = motionController.value;
      });
    });
  }

  @override
  void dispose() {
    motionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(scaleX: size, scaleY: size, child: widget.child);
  }
}
