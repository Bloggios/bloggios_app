/*
  Developer: Rohit Parihar
  Project: bloggios_mobile
  GitHub: github.com/rohit-zip
  File: oauth_social_buttons.dart
 */

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:icons_plus/icons_plus.dart';

class OauthSocialButtons extends StatelessWidget {

  const OauthSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {

    final GoogleSignIn googleSignIn = GoogleSignIn(signInOption: SignInOption.standard);

    return Container(
      constraints: BoxConstraints(minWidth: 330),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 10,
        children: [
          Flexible(
            flex: 1,
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.grey.shade400),
                ),
                onPressed: () {
                  //loginWithGoogle();
                },
                child: Row(
                  spacing: 4,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Brand(Brands.google, size: 24),
                    Text(
                      'Google',
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    )
                  ],
                )),
          ),
          Flexible(
            flex: 1,
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.grey.shade400),
                ),
                onPressed: () {
                  //_loginWithFacebook();
                },
                child: Row(
                  spacing: 4,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Brand(Brands.facebook, size: 24),
                    Text(
                      'Facebook',
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
