import 'package:flutter/material.dart';

class LightEffect extends StatelessWidget {
  const LightEffect({super.key, this.opacityValue = 0, required this.isRight});

  final double opacityValue;
  final bool isRight;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height,
      width: size.width / 2,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: isRight ? null : -2,
            left: isRight ? -2 : null,
            child: Container(
              height: size.height,
              width: size.width / 2,
              color: Colors.white.withOpacity(opacityValue),
            ),
          ),
        ],
      ),
    );
  }
}
