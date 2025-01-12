/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: bloggios_text_field
 */

import 'package:bloggios_app/core/widgets/fields/input_decoration.dart';
import 'package:flutter/material.dart';

class PrefixIconTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final String label;
  final String hintText;
  final IconData prefixIcon;
  final Iterable<String>? autoFillHints;

  const PrefixIconTextField({
    super.key,
    required this.textEditingController,
    this.validator,
    required this.label,
    this.hintText = "",
    required this.prefixIcon,
    this.autoFillHints,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofillHints: autoFillHints,
      keyboardType: TextInputType.emailAddress,
      controller: textEditingController,
      textInputAction: TextInputAction.done,
      style: TextStyle(fontFamily: 'Nunito'),
      decoration: BloggiosInputDecoration(
        context,
        label: label,
        hintText: hintText,
        icon: prefixIcon,
      ),
      validator: validator,
    );
  }
}
