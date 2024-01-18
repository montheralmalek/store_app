//import 'dart:html';

import 'package:flutter/material.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({
    super.key,
    required this.hinttext,
    required this.labeltext,
    this.prefixicon,
    this.controller,
    this.validator,
    this.onsave,
  });
  final String hinttext;
  final String labeltext;
  final Widget? prefixicon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String?)? onsave;

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool _obscuretext = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      onSaved: widget.onsave,
      controller: widget.controller,
      obscureText: _obscuretext,
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        border: const OutlineInputBorder(),
        hintText: widget.hinttext,
        label: Text(widget.labeltext),
        prefixIcon: widget.prefixicon,
        suffixIcon: IconButton(
          icon: Icon(_obscuretext ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              _obscuretext = !_obscuretext;
            });
          },
        ),
      ),
    );
  }
}
