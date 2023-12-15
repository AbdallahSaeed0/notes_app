import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hint,
      this.maxlines = 1,
      this.onsaved,
      this.onchanged});

  final String hint;
  final int maxlines;
  final void Function(String?)? onsaved;
  final void Function(String)? onchanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onsaved,
      onChanged: onchanged,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      maxLines: maxlines,
      decoration: InputDecoration(
        hintText: hint,
        border: buildBorder(),
        enabledBorder: buildBorder(color: kPrimrey),
      ),
    );
  }
}

OutlineInputBorder buildBorder({color}) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color ?? Colors.white));
}
