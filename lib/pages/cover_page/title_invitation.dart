import 'package:flutter/material.dart';
import 'package:invitation_web/enum/enums.dart';
import 'package:invitation_web/methods/methods.dart';

class TitleInvitation extends StatelessWidget {
  const TitleInvitation({
    super.key,
    required this.wType,
    this.isBottomTitle,
    required this.flashValue,
  });

  final W wType;
  final bool? isBottomTitle;
  final double flashValue;

  @override
  Widget build(BuildContext context) {
    return isBottomTitle == true
        ? Opacity(
            opacity: flashValue,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "P",
                  style: TextStyle(
                    fontFamily: "Upakarti",
                    fontStyle: FontStyle.italic,
                    fontSize: w(wType, 51, 56, 61, 66),
                    color: const Color.fromARGB(255, 230, 211, 164),
                    height: 1.2,
                    letterSpacing: 1,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: w(wType, 16.2, 16.8, 17.4, 18)),
                    Text(
                      "ernikahan",
                      style: TextStyle(
                        fontFamily: "Upakarti",
                        fontStyle: FontStyle.italic,
                        fontSize: w(wType, 41, 46, 51, 56),
                        color: const Color.fromARGB(255, 230, 211, 164),
                        height: 1.2,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        : Opacity(
            opacity: flashValue,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "U",
                  style: TextStyle(
                    fontFamily: "Upakarti",
                    fontStyle: FontStyle.italic,
                    fontSize: w(wType, 61, 66, 71, 76),
                    color: const Color.fromARGB(255, 230, 211, 164),
                    height: 1.2,
                    letterSpacing: 1,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "ndangan",
                      style: TextStyle(
                        fontFamily: "Upakarti",
                        fontStyle: FontStyle.italic,
                        fontSize: w(wType, 41, 46, 51, 56),
                        color: const Color.fromARGB(255, 230, 211, 164),
                        height: 1.2,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(height: w(wType, 6, 6.6, 7.2, 7.8)),
                  ],
                ),
              ],
            ),
          );
  }
}
