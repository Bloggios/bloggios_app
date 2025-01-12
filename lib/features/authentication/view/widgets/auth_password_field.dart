/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: auth_password_field
 */

import 'package:bloggios_app/core/widgets/fields/input_decoration.dart';
import 'package:bloggios_app/features/authentication/utils/auth_validators.dart';
import 'package:flutter/material.dart';

class AuthPasswordField extends StatefulWidget {
  final TextEditingController textEditingController;
  const AuthPasswordField({super.key, required this.textEditingController});

  @override
  State<AuthPasswordField> createState() => _AuthPasswordFieldState();
}

class _AuthPasswordFieldState extends State<AuthPasswordField> {

  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = true;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      controller: widget.textEditingController,
      obscureText: _isObscure,
      validator: validatePassword,
      style: TextStyle(fontFamily: 'Nunito'),
      decoration: BloggiosInputDecoration(
        context,
        label: 'Password',
        hintText: 'Hello@1234',
        icon: Icons.lock_outline,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
          icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
          color: Colors.grey,
        ),
      ),
    );
  }
}
