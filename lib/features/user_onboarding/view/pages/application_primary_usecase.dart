/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: application_primary_usecase
 */

import 'package:bloggios_app/core/constants/assets_constants.dart';
import 'package:bloggios_app/core/router/routes.dart';
import 'package:bloggios_app/core/theme/app_pallete.dart';
import 'package:bloggios_app/core/utils/dimensions.dart';
import 'package:bloggios_app/core/utils/init_snackbar.dart';
import 'package:bloggios_app/core/widgets/usecase_rules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ApplicationPrimaryUsecase extends StatefulWidget {
  const ApplicationPrimaryUsecase({super.key});

  @override
  State<ApplicationPrimaryUsecase> createState() =>
      _ApplicationPrimaryUsecaseState();
}

class _ApplicationPrimaryUsecaseState extends State<ApplicationPrimaryUsecase> {
  int _selectedIndex = -1;
  final List<SelectableButton> buttons = [
    SelectableButton(svgPath: 'assets/vectors/couples.svg', label: 'Matrimony'),
    SelectableButton(svgPath: 'assets/vectors/dating.svg', label: 'Dating'),
  ];

  @override
  Widget build(BuildContext context) {

    void onButtonPress() {
      if (_selectedIndex == 0) {
        context.push(Routes.matrimonyOnboardingPage.path);
      } else {
        initSnackBar(context, 'Feature is still under development');
      }
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: Dimensions.availableHeight(context),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 70,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        AssetsConstants.bloggiosLogo,
                        height: 60,
                        width: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          'Bloggios',
                          style: TextStyle(
                            color: AppPallete.accentColor,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Nunito',
                            fontSize: 44,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 20,
                    children: [
                      RichText(
                          text: TextSpan(
                              text: 'I want to use ',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Nunito',
                                color: Colors.black87,
                                fontWeight: FontWeight.w600,
                              ),
                              children: [
                            TextSpan(
                                text: 'Bloggios',
                                style: TextStyle(
                                    color: AppPallete.accentColor,
                                    fontWeight: FontWeight.w800)),
                            TextSpan(text: ' for ')
                          ])),
                      _selectableButton(),
                      UsecaseRules()
                    ],
                  ),
                  ElevatedButton(
                    onPressed: onButtonPress,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppPallete.accentColor,
                      minimumSize: const Size(double.infinity, 47),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      disabledBackgroundColor:
                          AppPallete.accentColor.withOpacity(0.7),
                    ),
                    child: Text(
                      getButtonText(),
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Nunito',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _selectableButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        buttons.length,
        (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                if (_selectedIndex == index) {
                  _selectedIndex = -1;
                } else {
                  _selectedIndex = index;
                }
              });
            },
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: _selectedIndex == index
                          ? AppPallete.accentColor
                          : Colors.grey.shade400,
                      width: 4.0,
                    ),
                  ),
                  child: buttons[index].svgPath != null
                      ? Column(
                          children: [
                            SvgPicture.asset(
                              buttons[index].svgPath!,
                              color: _selectedIndex == index
                                  ? AppPallete.accentColor
                                  : Colors.grey,
                              height: 40.0,
                              width: 40.0,
                            )
                          ],
                        )
                      : Column(
                          children: [
                            Image.asset(
                              buttons[index].imagePath!,
                              width: 30.0,
                              height: 30.0,
                            ),
                          ],
                        ),
                ),
                Text(
                  buttons[index].label,
                  style: TextStyle(
                      color: _selectedIndex == index
                          ? AppPallete.accentColor
                          : Colors.grey,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Nunito',
                      fontSize: 16),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  String getButtonText() {
    if (_selectedIndex == -1) {
      return 'Skip to Home';
    } else if (_selectedIndex == 0) {
      return 'Continue with Matrimony';
    } else {
      return 'Continue with Dating';
    }
  }
}

class SelectableButton {
  final String? imagePath;
  final String? svgPath;
  final String label;

  SelectableButton({this.imagePath, this.svgPath, required this.label})
      : assert(imagePath != null || svgPath != null,
            "Provide either iconData or svgPath");
}
