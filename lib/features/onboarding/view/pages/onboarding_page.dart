/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: onboarding_page
 */

import 'package:bloggios_app/core/constants/assets_constants.dart';
import 'package:bloggios_app/core/theme/app_pallete.dart';
import 'package:bloggios_app/core/utils/dimensions.dart';
import 'package:bloggios_app/core/widgets/powered_by.dart';
import 'package:bloggios_app/features/onboarding/view/widgets/get_started_button.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  static const String title = 'BLOGGIOS';
  static const String description =
      'Redefining how you connect, explore, and bond with personalized features for relationships and beyond.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: Dimensions.availableHeight(context),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 500,
                  child: Padding(
                    padding: const EdgeInsets.all(28),
                    child: Image.asset(
                      AssetsConstants.bloggiosFeature,
                      width: 280,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 52,
                          fontWeight: FontWeight.w800,
                          color: AppPallete.accentColor,
                          fontFamily: 'Nunito',
                        ),
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 340),
                      child: Text(
                        description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Column(
                        spacing: 10,
                        children: [
                          GetStartedButton(),
                          PoweredBy(),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
