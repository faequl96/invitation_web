import 'package:flutter/material.dart';
import 'package:invitation_web/methods/methods.dart';
import 'package:invitation_web/models/db_models/rsvp.dart';
import 'package:invitation_web/view_model.dart';
import 'package:invitation_web/views/page_6/dropdown_widget.dart';
import 'package:invitation_web/views/page_6/text_field_widget.dart';

class Page6Slider extends StatelessWidget {
  const Page6Slider({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewModel vM = locator<ViewModel>();

    return SizedBox(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Container(
              height: 24,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 230, 211, 164),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
            ),
            SizedBox(height: s(vM.h, 62, 68, 74, 80)),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 230, 211, 164),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  TextFieldWidget(
                    labelText: "Nama",
                    textEditingController: vM.nameController,
                  ),
                  const SizedBox(height: 12),
                  TextFieldWidget(
                    labelText: "Ucapan",
                    textEditingController: vM.remarkController,
                  ),
                  const SizedBox(height: 12),
                  DropDownWidget(
                    labelText: "Kehadiran",
                    textEditingController: vM.attendanceController,
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      int dateTime = DateTime.now().millisecondsSinceEpoch;

                      saveToDB(
                        vM,
                        RSVP(
                          name: vM.nameController.text,
                          remark: vM.remarkController.text,
                          attendance: vM.attendance,
                          dateTime: dateTime,
                        ),
                      );
                      // showModalBottomSheet(
                      //   backgroundColor: Colors.transparent,
                      //   barrierColor: Colors.black54,
                      //   isDismissible: false,
                      //   isScrollControlled: true,
                      //   context: context,
                      //   builder: (context) {
                      //     return Padding(
                      //       padding: EdgeInsets.only(
                      //         bottom: MediaQuery.of(context).viewInsets.bottom,
                      //       ),
                      //       child: SizedBox(
                      //         height: 480,
                      //         child: Column(
                      //           children: [
                      //             Container(
                      //               width: 80,
                      //               height: 8,
                      //               margin:
                      //                   const EdgeInsets.symmetric(vertical: 6),
                      //               decoration: BoxDecoration(
                      //                 color: Colors.white,
                      //                 borderRadius: BorderRadius.circular(4),
                      //               ),
                      //             ),
                      //             Expanded(
                      //               child: Container(
                      //                 decoration: BoxDecoration(
                      //                   color: Colors.white,
                      //                   borderRadius: BorderRadius.circular(10),
                      //                 ),
                      //                 clipBehavior: Clip.hardEdge,
                      //                 child: Column(
                      //                   children: [
                      //                     TextFieldWidget(
                      //                       labelText: "Nama",
                      //                       textEditingController:
                      //                           vM.nameController,
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     );
                      //   },
                      // );
                    },
                    child: const Text("test keyboard"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
