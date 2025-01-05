/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: signup_form
 */

import 'package:bloggios_app/core/widgets/oauth_social_buttons.dart';
import 'package:bloggios_app/core/widgets/text_divider.dart';
import 'package:bloggios_app/features/authentication/utils/auth_validators.dart';
import 'package:bloggios_app/features/authentication/view/widgets/auth_button.dart';
import 'package:bloggios_app/features/authentication/view/widgets/auth_password_field.dart';
import 'package:bloggios_app/features/authentication/view/widgets/auth_text_field.dart';
import 'package:bloggios_app/features/authentication/view/widgets/form_header.dart';
import 'package:bloggios_app/features/authentication/view/widgets/signup_privacy_text.dart';
import 'package:flutter/material.dart';

class SignupForm extends StatelessWidget {
  final _signUpFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
        child: Column(
          children: [
            FormHeader(
              title: 'Create Account',
              description:
                  'Create your account to begin managing your preferences and enjoying everything we have to offer.',
            ),
            Form(
              key: _signUpFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  AuthTextField(
                    textEditingController: _emailController,
                    validator: validateEmail,
                  ),
                  const SizedBox(height: 30),
                  AuthPasswordField(
                    textEditingController: _passwordController,
                  ),
                  const SizedBox(height: 20),
                  SignupPrivacyText(),
                  const SizedBox(
                    height: 20,
                  ),
                  AuthButton(
                    text: 'Sign Up',
                    onPress: () {
                      if (_signUpFormKey.currentState!.validate()) {
                        print('pressed');
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  const TextDivider(text: 'Or Sign Up with'),
                  const SizedBox(height: 20),
                  OauthSocialButtons(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
