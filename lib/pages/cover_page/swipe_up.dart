import 'dart:async';

import 'package:flutter/material.dart';
import 'package:invitation_web/enum/enums.dart';
import 'package:invitation_web/methods/methods.dart';

class SwipeUp extends StatefulWidget {
  const SwipeUp({
    super.key,
    required this.hType,
    required this.wType,
    required this.isOpenCompleted,
  });

  final H hType;
  final W wType;
  final bool isOpenCompleted;

  @override
  State<SwipeUp> createState() => _SwipeUpState();
}

class _SwipeUpState extends State<SwipeUp> {
  late Timer _timer;

  double arrow1 = 0;
  double arrow2 = 0;

  bool isShowed = false;

  void periodic() {
    _timer = Timer.periodic(const Duration(milliseconds: 300), (timer) {
      if (timer.tick % 2 == 0) {
        arrow1 = w(widget.wType, 107, 110, 113, 116);
        arrow2 = w(widget.wType, 118, 122, 126, 130);
      } else {
        arrow1 = w(widget.wType, 17, 20, 23, 26);
        arrow2 = w(widget.wType, 28, 32, 36, 40);
        isShowed = !isShowed;
      }

      setState(() {});
    });
  }

  @override
  void initState() {
    arrow1 = w(widget.wType, 17, 20, 23, 26);
    arrow2 = w(widget.wType, 28, 32, 36, 40);
    periodic();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 120,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          isShowed
              ? AnimatedPositioned(
                  bottom: arrow1,
                  duration: const Duration(milliseconds: 1000),
                  child: Center(
                    child: RotatedBox(
                      quarterTurns: 270 ~/ 6,
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: const Color.fromARGB(240, 255, 198, 192),
                        size: w(widget.wType, 26, 28, 30, 32),
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          isShowed
              ? AnimatedPositioned(
                  bottom: arrow2,
                  duration: const Duration(milliseconds: 1000),
                  child: Center(
                    child: RotatedBox(
                      quarterTurns: 270 ~/ 6,
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: const Color.fromARGB(255, 230, 211, 164),
                        size: w(widget.wType, 26, 28, 30, 32),
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          Positioned(
            bottom: w(widget.wType, 9, 10, 11, 12),
            child: Text(
              "Geser ke atas",
              style: TextStyle(
                fontSize: w(widget.wType, 11, 12, 13, 14),
                color: const Color.fromARGB(255, 230, 211, 164),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
