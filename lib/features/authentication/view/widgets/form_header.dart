/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: form_header
 */

import 'package:bloggios_app/core/constants/assets_constants.dart';
import 'package:bloggios_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class FormHeader extends StatelessWidget {
  final String title;
  final String description;

  const FormHeader({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          AssetsConstants.bloggiosLogo,
          height: 70,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontFamily: 'Nunito',
            color: AppPallete.accentColor,
            fontSize: 34,
          ),
        ),
        Text(
          description,
          style: TextStyle(
            fontFamily: 'Nunito',
            color: Colors.grey,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
