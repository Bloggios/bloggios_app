/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: login_form
 */

import 'package:bloggios_app/core/widgets/oauth_social_buttons.dart';
import 'package:bloggios_app/core/widgets/text_divider.dart';
import 'package:bloggios_app/features/authentication/utils/auth_validators.dart';
import 'package:bloggios_app/features/authentication/view/widgets/auth_button.dart';
import 'package:bloggios_app/features/authentication/view/widgets/auth_password_field.dart';
import 'package:bloggios_app/features/authentication/view/widgets/auth_text_field.dart';
import 'package:bloggios_app/features/authentication/view/widgets/form_header.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final _loginFormKey = GlobalKey<FormState>();
  final _entryPointController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
        child: Column(
          spacing: 20,
          children: [
            FormHeader(
              title: 'Welcome Back',
              description:
                  'Sign in to continue exploring, managing your preferences, and enjoying a tailored experience.',
            ),
            Form(
              key: _loginFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  AuthTextField(
                    textEditingController: _entryPointController,
                    validator: validateEntrypoint,
                  ),
                  const SizedBox(height: 30),
                  AuthPasswordField(
                    textEditingController: _passwordController,
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Implement forgot password functionality
                      },
                      child: const Text('Forgot Password?'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  AuthButton(
                    text: 'Login',
                    onPress: () {
                      if (_loginFormKey.currentState!.validate()) {
                        print('pressed');
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  const TextDivider(text: 'Or Login with'),
                  const SizedBox(height: 20),
                  OauthSocialButtons(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
