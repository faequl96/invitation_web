import 'package:flutter/material.dart';
import 'package:invitation_web/methods/methods.dart';
import 'package:invitation_web/view_model.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    required this.labelText,
    required this.textEditingController,
  });

  final String labelText;
  final TextEditingController textEditingController;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    final ViewModel vM = locator<ViewModel>();

    return TextField(
      controller: widget.textEditingController,
      style: TextStyle(fontSize: s(vM.w, 14, 14.4, 15, 15.8)),
      decoration: InputDecoration(
        labelText: widget.labelText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black12, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black12, width: 1),
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
