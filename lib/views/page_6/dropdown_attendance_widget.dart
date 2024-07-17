import 'package:flutter/material.dart';
import 'package:invitation_web/methods/methods.dart';
import 'package:invitation_web/view_model.dart';

class DropDownAttendanceWidget extends StatefulWidget {
  const DropDownAttendanceWidget({
    super.key,
    required this.labelText,
    this.leadingIconMenuItem,
    required this.textEditingController,
  });

  final String labelText;
  final Widget? leadingIconMenuItem;
  final TextEditingController textEditingController;

  @override
  State<DropDownAttendanceWidget> createState() =>
      _DropDownAttendanceWidgetState();
}

class _DropDownAttendanceWidgetState extends State<DropDownAttendanceWidget> {
  @override
  Widget build(BuildContext context) {
    final ViewModel vM = locator<ViewModel>();

    return DropdownMenu<String>(
      initialSelection: "Hadir",
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
      width: vM.s.width - 68,
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
          Color.fromARGB(255, 255, 250, 230),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(vertical: 16),
        ),
      ),
      onSelected: (String? value) {},
      dropdownMenuEntries: vM.dropDownAttendanceItems.map((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}
