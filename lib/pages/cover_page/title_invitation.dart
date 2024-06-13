import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:invitation_web/methods/methods.dart';
import 'package:invitation_web/view_model.dart';

class TitleInvitation extends StatelessWidget with GetItMixin {
  TitleInvitation({super.key, this.isBottomTitle = false});

  final bool isBottomTitle;

  @override
  Widget build(BuildContext context) {
    final ViewModel vM = get<ViewModel>();

    return isBottomTitle == true
        ? Opacity(
            opacity: vM.flash,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "P",
                  style: TextStyle(
                    fontFamily: "Upakarti",
                    fontStyle: FontStyle.italic,
                    fontSize: s(vM.w, 51, 56, 61, 66),
                    color: const Color.fromARGB(255, 230, 211, 164),
                    height: 1.2,
                    letterSpacing: 1,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: s(vM.w, 16.2, 16.8, 17.4, 18)),
                    Text(
                      "ernikahan",
                      style: TextStyle(
                        fontFamily: "Upakarti",
                        fontStyle: FontStyle.italic,
                        fontSize: s(vM.w, 41, 46, 51, 56),
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
            opacity: vM.flash,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "U",
                  style: TextStyle(
                    fontFamily: "Upakarti",
                    fontStyle: FontStyle.italic,
                    fontSize: s(vM.w, 61, 66, 71, 76),
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
                        fontSize: s(vM.w, 41, 46, 51, 56),
                        color: const Color.fromARGB(255, 230, 211, 164),
                        height: 1.2,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(height: s(vM.w, 6, 6.6, 7.2, 7.8)),
                  ],
                ),
              ],
            ),
          );
  }
}
