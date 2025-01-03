import 'package:flutter/material.dart';
import 'package:invitation_web/methods/methods.dart';
import 'package:invitation_web/view_model.dart';
import 'package:watch_it/watch_it.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    required this.labelText,
    this.hintText,
    required this.textEditingController,
  });

  final String labelText;
  final String? hintText;
  final TextEditingController textEditingController;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    final ViewModel vM = di<ViewModel>();

    return TextField(
      controller: widget.textEditingController,
      style: TextStyle(fontSize: s(vM.w, 14, 14.4, 15, 15.8)),
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(
          fontSize: s(vM.w, 14, 14.4, 15, 15.8),
          color: Colors.grey.shade700,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: s(vM.w, 14, 14.4, 15, 15.8),
          color: Colors.grey.shade700,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black26, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black26, width: 1),
        ),
        suffixIcon: widget.textEditingController.text.isNotEmpty
            ? MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    widget.textEditingController.clear();
                    setState(() {});
                  },
                  child: const Icon(Icons.close_rounded),
                ),
              )
            : null,
      ),
      onChanged: (value) {},
    );
  }
}
