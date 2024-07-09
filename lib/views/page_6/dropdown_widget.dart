import 'package:flutter/material.dart';
import 'package:invitation_web/view_model.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({
    super.key,
    required this.labelText,
    required this.textEditingController,
  });

  final String labelText;
  final TextEditingController textEditingController;

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  final dropDownItems = [true, false];

  @override
  Widget build(BuildContext context) {
    final ViewModel vM = locator<ViewModel>();

    return DropdownMenu<bool>(
      initialSelection: null,
      controller: widget.textEditingController,
      requestFocusOnTap: false,
      label: Text(widget.labelText),
      width: vM.s.width - 60,
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black12, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black12, width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black12, width: 1),
        ),
      ),
      onSelected: (bool? value) {
        if (value == true) {
          widget.textEditingController.text = "Hadir";
        } else {
          widget.textEditingController.text = "Tidak Hadir";
        }
      },
      dropdownMenuEntries: dropDownItems.map((bool value) {
        return DropdownMenuEntry<bool>(
          value: value,
          label: value ? "Hadir" : "Tidak Hadir",
        );
      }).toList(),
    );
  }
}
