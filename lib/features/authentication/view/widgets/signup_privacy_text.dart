/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: signup_privacy_text
 */

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupPrivacyText extends StatelessWidget {
  const SignupPrivacyText({super.key});

  @override
  Widget build(BuildContext context) {
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
}
