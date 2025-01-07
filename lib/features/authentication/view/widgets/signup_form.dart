/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: signup_form
 */

import 'package:bloggios_app/core/widgets/oauth_social_buttons.dart';
import 'package:bloggios_app/core/widgets/text_divider.dart';
import 'package:bloggios_app/features/authentication/utils/auth_validators.dart';
import 'package:bloggios_app/features/authentication/utils/signup_page_bloc_listener.dart';
import 'package:bloggios_app/features/authentication/view/bloc/user_auth_bloc.dart';
import 'package:bloggios_app/features/authentication/view/widgets/auth_button.dart';
import 'package:bloggios_app/features/authentication/view/widgets/auth_password_field.dart';
import 'package:bloggios_app/features/authentication/view/widgets/auth_text_field.dart';
import 'package:bloggios_app/features/authentication/view/widgets/form_header.dart';
import 'package:bloggios_app/features/authentication/view/widgets/signup_privacy_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _signUpFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  static const double _formSpacing = 20.0;
  static const double _formPadding = 16.0;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSignUp() {
    if (_signUpFormKey.currentState!.validate()) {
      context.read<UserAuthBloc>().add(
        UserAuthRegisterUser(
            email: _emailController.text,
            password: _passwordController.text),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocConsumer<UserAuthBloc, UserAuthState>(
        listener: signUpPageBlocListener,
        builder: (context, state) {
          final bool isLoading = state is UserAuthLoading;
          return Center(
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: _formPadding, vertical: 40),
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                children: [
                  const FormHeader(
                    title: 'Create Account',
                    description:
                    'Create your account to begin managing your preferences and enjoying everything we have to offer.',
                  ),
                  Form(
                    key: _signUpFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: _formSpacing),
                        AuthTextField(
                          textEditingController: _emailController,
                          validator: validateEmail,
                        ),
                        const SizedBox(height: _formSpacing),
                        AuthPasswordField(
                          textEditingController: _passwordController,
                        ),
                        const SizedBox(height: _formSpacing),
                        const SignupPrivacyText(),
                        const SizedBox(height: _formSpacing),
                        AuthButton(
                          text: 'Sign Up',
                          onPress: _onSignUp,
                          isLoading: isLoading,
                        ),
                        const SizedBox(height: _formSpacing),
                        const TextDivider(text: 'Or Sign Up with'),
                        const SizedBox(height: _formSpacing),
                        const OauthSocialButtons(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
