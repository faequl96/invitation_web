import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:invitation_web/methods/methods.dart';
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
      textStyle: TextStyle(fontSize: s(vM.w, 14, 14.4, 15, 15.8)),
      label: Text(
        widget.labelText,
        style: TextStyle(
          fontSize: s(vM.w, 14, 14.4, 15, 15.8),
          color: Colors.grey.shade700,
        ),
      ),
      width: vM.s.width - 60,
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black26, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black26, width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black26, width: 1),
        ),
      ),
      menuStyle: MenuStyle(
        backgroundColor: const WidgetStatePropertyAll(
          Color.fromARGB(255, 230, 211, 164),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(vertical: 16),
        ),
      ),
      onSelected: (bool? value) {
        if (value == true) {
          widget.textEditingController.text = "Hadir";
          vM.attendance = true;
        } else {
          widget.textEditingController.text = "Tidak Hadir";
          vM.attendance = false;
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
