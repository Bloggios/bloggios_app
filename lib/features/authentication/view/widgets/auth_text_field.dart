/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: text_field
 */

import 'package:bloggios_app/features/authentication/utils/auth_input_decoration.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  const AuthTextField({super.key, required this.textEditingController, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofillHints: [AutofillHints.email],
      keyboardType: TextInputType.emailAddress,
      controller: textEditingController,
      textInputAction: TextInputAction.done,
      style: TextStyle(fontFamily: 'Nunito'),
      decoration: authInputDecoration(
        context,
        label: 'Email or Username',
        hintText: 'Enter email or username',
        icon: Icons.account_circle_outlined,
      ),
      validator: validator,
    );
  }
}
