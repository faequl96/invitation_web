import 'package:flutter/material.dart';
import 'package:invitation_web/methods/methods.dart';
import 'package:invitation_web/view_model.dart';

class DropDownAvatarWidget extends StatefulWidget {
  const DropDownAvatarWidget({
    super.key,
    required this.labelText,
    this.hintText,
    required this.textEditingController,
  });

  final String labelText;
  final String? hintText;
  final TextEditingController textEditingController;

  @override
  State<DropDownAvatarWidget> createState() => _DropDownAvatarWidgetState();
}

class _DropDownAvatarWidgetState extends State<DropDownAvatarWidget> {
  @override
  Widget build(BuildContext context) {
    final ViewModel vM = locator<ViewModel>();

    return DropdownMenu<String>(
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
      hintText: widget.hintText,
      selectedTrailingIcon: SizedBox(
        height: 24,
        width: 24,
        child: Image(
          image: AssetImage(
            "assets/avatars/${vM.avatarController.text.isEmpty ? "avatars" : vM.avatarController.text}.png",
          ),
          fit: BoxFit.fitWidth,
        ),
      ),
      trailingIcon: SizedBox(
        height: 24,
        width: 24,
        child: Image(
          image: AssetImage(
            "assets/avatars/${vM.avatarController.text.isEmpty ? "avatars" : vM.avatarController.text}.png",
          ),
          fit: BoxFit.fitWidth,
        ),
      ),
      width: vM.s.width - 60,
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.always,
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
        maximumSize: WidgetStatePropertyAll(Size(vM.s.width - 60, 240)),
      ),
      onSelected: (String? value) {
        setState(() {});
      },
      dropdownMenuEntries: vM.dropDownAvatarItems.map((String value) {
        return DropdownMenuEntry<String>(
          value: value,
          label: value,
          leadingIcon: Image(
            image: AssetImage("assets/avatars/$value.png"),
            height: 28,
            width: 28,
            fit: BoxFit.fitHeight,
          ),
        );
      }).toList(),
    );
  }
}
