/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: user_onboarding_text_field
 */

import 'package:bloggios_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class BasicTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final String? label;
  final TextInputType keyboardType;
  final int? maxLines;
  final String? hintText;

  const BasicTextField({
    super.key,
    required this.textEditingController,
    this.validator,
    this.label,
    this.keyboardType = TextInputType.text,
    this.maxLines,
    this.hintText
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofillHints: [
        AutofillHints.name,
        AutofillHints.namePrefix,
        AutofillHints.givenName,
        AutofillHints.nickname
      ],
      validator: validator,
      keyboardType: keyboardType,
      maxLines: maxLines,
      controller: textEditingController,
      textInputAction: TextInputAction.done,
      style: TextStyle(fontFamily: 'Nunito'),
      decoration: InputDecoration(
        errorStyle: const TextStyle(color: Colors.redAccent),
        labelText: label,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black38),
        labelStyle: const TextStyle(color: Colors.grey),
        floatingLabelStyle: MaterialStateTextStyle.resolveWith((states) {
          if (states.contains(MaterialState.error)) {
            return const TextStyle(
                color: Colors.redAccent, fontWeight: FontWeight.bold);
          }
          if (states.contains(MaterialState.focused)) {
            return TextStyle(
                color: AppPallete.accentColor, fontWeight: FontWeight.bold);
          }
          return const TextStyle(color: Colors.grey);
        }),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide:
              const BorderSide(color: AppPallete.accentColor, width: 2.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.redAccent, width: 2.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.redAccent, width: 2.0),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      ),
    );
  }
}
