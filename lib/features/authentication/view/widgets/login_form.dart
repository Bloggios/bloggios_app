/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: login_form
 */

import 'package:bloggios_app/core/constants/application_constants.dart';
import 'package:bloggios_app/core/widgets/oauth_social_buttons.dart';
import 'package:bloggios_app/core/widgets/text_divider.dart';
import 'package:bloggios_app/features/authentication/utils/auth_validators.dart';
import 'package:bloggios_app/features/authentication/utils/login_page_bloc_listener.dart';
import 'package:bloggios_app/features/authentication/view/bloc/auth_bloc.dart';
import 'package:bloggios_app/features/authentication/view/widgets/auth_button.dart';
import 'package:bloggios_app/features/authentication/view/widgets/auth_password_field.dart';
import 'package:bloggios_app/features/authentication/view/widgets/auth_text_field.dart';
import 'package:bloggios_app/features/authentication/view/widgets/form_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _loginFormKey = GlobalKey<FormState>();
  final _entryPointController = TextEditingController();
  final _passwordController = TextEditingController();
  static const double _formSpacing = 20.0;
  static const double _buttonSpacing = 10.0;

  @override
  void dispose() {
    _entryPointController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLogin() {
    if (_loginFormKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
            AuthAuthenticateUser(
              email: _entryPointController.text,
              password: _passwordController.text,
            ),
          );
    }
  }

  void _onForgotPassword() {
    print('Forgot Password button pressed');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: loginPageBlocListener,
        builder: (context, state) {
          final bool isLoading = state is AuthLoading;
          return Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              constraints:
                  BoxConstraints(maxWidth: ApplicationConstants.maxWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const FormHeader(
                    title: 'Welcome Back',
                    description:
                        'Sign in to continue exploring, managing your preferences, and enjoying a tailored experience.',
                  ),
                  Form(
                    key: _loginFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: _formSpacing),
                        AuthTextField(
                          textEditingController: _entryPointController,
                          validator: validateEntrypoint,
                        ),
                        const SizedBox(height: _formSpacing + 10),
                        AuthPasswordField(
                          textEditingController: _passwordController,
                        ),
                        const SizedBox(height: _buttonSpacing),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: _onForgotPassword,
                            child: const Text('Forgot Password?'),
                          ),
                        ),
                        const SizedBox(height: _buttonSpacing),
                        AuthButton(
                            text: 'Login',
                            onPress: _onLogin,
                            isLoading: isLoading),
                        const SizedBox(height: _formSpacing),
                        const TextDivider(text: 'Or Login with'),
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
