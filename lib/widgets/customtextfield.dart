//import 'dart:html';

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.labeltext,
    this.hinttext,
    this.prefixicon,
    this.suffixicon,
    this.controller,
    this.validator,
    this.onsave,
    this.inputType,
    this.maxlines = 1,
  });
  final TextInputType? inputType;
  final String? hinttext;
  final String labeltext;
  final Widget? prefixicon;
  final Widget? suffixicon;
  final int? maxlines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String?)? onsave;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onSaved: onsave,
      keyboardType: inputType,
      controller: controller,
      maxLines: maxlines,
      decoration: InputDecoration(
        prefixIcon: prefixicon,
        suffixIcon: suffixicon,
        border: const OutlineInputBorder(),
        hintText: hinttext,
        label: Text(labeltext),
      ),
    );
  }
}
