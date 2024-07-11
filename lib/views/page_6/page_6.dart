import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:invitation_web/firestore.dart';
import 'package:invitation_web/view_model.dart';
import 'package:invitation_web/views/shared/get_size_render_box.dart';

class Page6 extends StatelessWidget with GetItMixin {
  Page6({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewModel vM = locator<ViewModel>();

    // watchOnly((ViewModel x) => x.page6SliderHeight);

    return Positioned(
      top: vM.sV > vM.s.height * 5 + (vM.page6SliderHeight + 20)
          ? vM.s.height -
              (vM.sV - (vM.s.height * 5 + (vM.page6SliderHeight + 20)))
          : vM.s.height,
      child: GetSizeRenderBox(
        onChange: (size) {
          vM.page6Height = size.height;
          vM.additionalPage = (vM.page6Height / vM.s.height).ceil();
        },
        child: Container(
          width: vM.s.width - 32,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 230, 211, 164),
            borderRadius: BorderRadius.circular(16),
          ),
          child: StreamBuilder(
            stream: DBCollection.rsvps.snapshots(),
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: snapshot.data!.docs.map((e) {
                    return Text(e.data()["remark"]);
                  }).toList(),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}
