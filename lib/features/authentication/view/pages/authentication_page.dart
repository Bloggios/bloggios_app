/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: authentication_page
 */

import 'package:bloggios_app/core/constants/assets_constants.dart';
import 'package:bloggios_app/core/constants/regex_constants.dart';
import 'package:bloggios_app/core/router/routes.dart';
import 'package:bloggios_app/core/theme/app_pallete.dart';
import 'package:bloggios_app/core/utils/dimensions.dart';
import 'package:bloggios_app/core/widgets/oauth_social_buttons.dart';
import 'package:bloggios_app/core/widgets/powered_by.dart';
import 'package:bloggios_app/core/widgets/text_divider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _emailController = TextEditingController();
  final _entryPointController = TextEditingController();
  final _passwordController = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();
  final _signUpFormKey = GlobalKey<FormState>();
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = true;
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!RegexConstants.emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validateEntrypoint(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email or Username is required';
    }
    if (value.contains('@') && !RegexConstants.emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (!RegexConstants.passwordRegex.hasMatch(value)) {
      return 'Password must be at least 8 characters long,\n'
          'contain at least one uppercase letter,\n'
          'one lowercase letter, one number,\n'
          'and one special character.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = Dimensions.screenHeight(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight > 600 ? getPreferredSizeHeight(context) : 120),
        child: Column(
          children: [
            if (screenHeight > 600) Container(
              padding: EdgeInsets.only(
                right: 20,
                left: 20,
                top: getTopElement(context),
                bottom: 40,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                ),
                image: DecorationImage(
                  image: AssetImage(
                    AssetsConstants.authenticationImage,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    AssetsConstants.bloggiosWhiteLogo,
                    height: 70,
                    width: 70,
                  ),
                  SizedBox(
                    height: 27,
                  ),
                  Text(
                    "Begin by creating or accessing your account",
                    style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Inter'),
                  ),
                  if (screenHeight > 800)
                    SizedBox(
                      height: 10,
                    ),
                  if (screenHeight > 800) Text(
                    "Sign up or log in to securely access your account and begin exploring the platform's features tailored to you",
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: screenHeight > 600 ? 0 : 20),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 7.0, vertical: 20),
                child: Container(
                  height: 54,
                  width: double.infinity,
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 228, 230, 232),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: TabBar(
                      controller: _tabController,
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: Colors.transparent,
                      automaticIndicatorColorAdjustment: true,
                      enableFeedback: true,
                      indicator: BoxDecoration(
                        color: AppPallete.accentColor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      splashBorderRadius: BorderRadius.circular(40),
                      labelStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                          color: Colors.white),
                      tabs: [
                        Tab(
                          text: 'Login',
                        ),
                        Tab(
                          text: 'Sign Up',
                        )
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: TabBarView(
                  controller: _tabController,
                  children: [_loginForm(), _signupForm()]),
            ),
          ],
        ),
      ),
    );
  }

  double getTopElement(BuildContext context) {
    final double screenWidth = Dimensions.screenWidth(context);
    if (screenWidth > 400) {
      return 70;
    } else {
      return MediaQuery.of(context).padding.top + 20;
    }
  }

  double getPreferredSizeHeight(BuildContext context) {
    final double screenWidth = Dimensions.screenWidth(context);
    final double screenHeight = Dimensions.screenHeight(context);
    if (screenWidth < 340 && screenHeight > 800) {
      return 424;
    } else if (screenWidth > 340 && screenHeight < 800) {
      return 340;
    } else if (screenWidth < 340 && screenHeight < 800) {
      return 370;
    } else {
      return 370;
    }
  }

  Widget _loginForm() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Form(
              key: _loginFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  _entrypointField(),
                  const SizedBox(height: 30),
                  _passwordField(),
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
                  _buildAuthButton(
                      'Login', () {}),
                  const SizedBox(height: 20),
                  const TextDivider(text: 'Or Login with'),
                  const SizedBox(height: 20),
                  OauthSocialButtons(),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            PoweredBy(),
          ],
        ),
      ),
    );
  }

  Widget _signupForm() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Form(
              key: _signUpFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  _emailField(),
                  const SizedBox(height: 30),
                  _passwordField(),
                  const SizedBox(height: 20),
                  _buildPrivacyText(),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildAuthButton(
                      'Sign Up', () {}),
                  const SizedBox(height: 20),
                  const TextDivider(text: 'Or Sign Up with'),
                  const SizedBox(height: 20),
                  OauthSocialButtons(),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            PoweredBy(),
          ],
        ),
      ),
    );
  }

  Widget _emailField() {
    return TextFormField(
      autofillHints: [AutofillHints.email],
      keyboardType: TextInputType.emailAddress,
      controller: _emailController,
      textInputAction: TextInputAction.done,
      decoration: _inputDecoration(
        context,
        label: 'Email',
        hintText: 'someone@bloggios.com',
        icon: Icons.mail_outline,
      ),
      validator: _validateEmail,
    );
  }

  Widget _entrypointField() {
    return TextFormField(
      autofillHints: [AutofillHints.email],
      keyboardType: TextInputType.emailAddress,
      controller: _entryPointController,
      textInputAction: TextInputAction.done,
      style: TextStyle(fontFamily: 'Nunito'),
      decoration: _inputDecoration(
        context,
        label: 'Email or Username',
        hintText: 'Enter email or username',
        icon: Icons.account_circle_outlined,
      ),
      validator: _validateEntrypoint,
    );
  }

  Widget _passwordField() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      controller: _passwordController,
      obscureText: _isObscure,
      validator: _validatePassword,
      style: TextStyle(fontFamily: 'Nunito'),
      decoration: _inputDecoration(
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

  Widget _buildAuthButton(String text, VoidCallback onClick) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppPallete.accentColor,
          minimumSize: const Size(double.infinity, 47),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          disabledBackgroundColor: AppPallete.accentColor.withOpacity(0.7)),
      onPressed: onClick,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Nunito',
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 1,
        ),
      ),
    );
  }

  Widget _buildPrivacyText() {
    return RichText(
      text: TextSpan(
          text:
              "By signing up, you confirm that you have read, understood, and agree to adhere to Bloggios ",
          style: TextStyle(color: Colors.grey, fontSize: 12),
          children: [
            TextSpan(
              text: "Terms of Service",
              style: TextStyle(
                  color: Colors.blue, decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
            TextSpan(text: " and "),
            TextSpan(
              text: "Privacy Policy",
              style: TextStyle(
                  color: Colors.blue, decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
            TextSpan(text: ", ensuring a secure and seamless experience")
          ]),
    );
  }

  InputDecoration _inputDecoration(
    BuildContext context, {
    required String label,
    required String hintText,
    required IconData icon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      errorStyle: const TextStyle(color: Colors.redAccent),
      prefixIcon: Icon(
        icon,
        color: Colors.grey,
      ),
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
        borderSide: const BorderSide(color: AppPallete.accentColor, width: 2.0),
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
      suffixIcon: suffixIcon,
    );
  }
}
