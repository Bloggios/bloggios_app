/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: matrimony_onboarding_page
 */

import 'package:bloggios_app/core/constants/assets_constants.dart';
import 'package:bloggios_app/core/constants/list_constants.dart';
import 'package:bloggios_app/core/theme/app_pallete.dart';
import 'package:bloggios_app/core/widgets/animations/slide_in_animation.dart';
import 'package:bloggios_app/core/widgets/basic_text_field.dart';
import 'package:bloggios_app/core/widgets/country_dropdown.dart';
import 'package:bloggios_app/core/widgets/name_rules.dart';
import 'package:bloggios_app/core/widgets/prefix_icon_text_field.dart';
import 'package:bloggios_app/core/widgets/rules_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class MatrimonyOnboardingPage extends StatefulWidget {
  const MatrimonyOnboardingPage({super.key});

  @override
  State<MatrimonyOnboardingPage> createState() =>
      _MatrimonyOnboardingPageState();
}

class _MatrimonyOnboardingPageState extends State<MatrimonyOnboardingPage> {
  int selectedChip = 0;
  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  bool _isDateOfBirthShown = false;

  final List<String> chipLabels = [
    "Myself",
    "Son",
    "Daughter",
    "Brother",
    "Sister"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppPallete.whiteColor,
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _heading(),
              SizedBox(
                height: 40,
              ),
              _profileFor(),
              SizedBox(
                height: 20,
              ),
              _countrySection(),
              SizedBox(height: 20,),
              SlideInAnimation(
                  isShown: _isDateOfBirthShown,
                  child: _countrySection()
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        color: Colors.white,
        onPressed: context.pop,
        icon: Icon(
          Icons.arrow_back,
        ),
      ),
      centerTitle: false,
      title: Text(
        'Matrimony Profile',
        style: TextStyle(
          fontFamily: 'Nunito',
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      elevation: 4,
      backgroundColor: AppPallete.accentColor,
      shadowColor: Colors.black26,
    );
  }

  Widget _heading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Lottie.asset(AssetsConstants.matrimonyLottie,
              height: 160, frameRate: FrameRate.max),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: "Welcome to ",
            style: TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w600,
                fontSize: 26,
                color: Colors.black87),
            children: [
              TextSpan(
                  text: 'Bloggios',
                  style: TextStyle(
                      color: AppPallete.accentColor,
                      fontWeight: FontWeight.w800)),
              TextSpan(text: '\n'),
              TextSpan(text: "Matrimony")
            ],
          ),
        ),
      ],
    );
  }

  Widget _profileFor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        SizedBox(
          width: double.infinity,
          child: _questionText('For whom you are creating this profile ?'),
        ),
        Wrap(
          spacing: 7.0,
          children: List<Widget>.generate(
            chipLabels.length,
            (int index) {
              return ChoiceChip(
                shape: const StadiumBorder(),
                showCheckmark: false,
                checkmarkColor: AppPallete.whiteColor,
                label: Text(
                  chipLabels[index],
                  style: TextStyle(
                      color: selectedChip == index
                          ? AppPallete.whiteColor
                          : Colors.black87),
                ),
                selected: selectedChip == index,
                selectedColor: AppPallete.accentColor,
                onSelected: (bool selected) {
                  setState(() {
                    selectedChip = index;
                  });
                },
              );
            },
          ).toList(),
        ),
        AnimatedSwitcher(
          duration: Duration(milliseconds: 200),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return Transform.scale(
                  scaleY: animation.value,
                  alignment: Alignment.topCenter,
                  // Animate scaling along the Y-axis
                  child: child,
                );
              },
              child: child,
            );
          },
          child: selectedChip != 0
              ? Container(
                  key: ValueKey("visibleWidget"),
                  child: _userDetailsWidget(),
                )
              : SizedBox(key: ValueKey("hiddenWidget")), // Vacates space
        ),
      ],
    );
  }

  Widget _userDetailsWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20,
      children: [
        _questionText(
            'Please provide the details of your ${chipLabels[selectedChip]}'),
        BasicTextField(
            textEditingController: nameTextController, label: 'First Name'),
        BasicTextField(
          textEditingController: nameTextController,
          label: 'Last Name',
        ),
        NameRules(
          usecaseFor: chipLabels[selectedChip],
        ),
        PrefixIconTextField(
            textEditingController: emailTextController,
            label: 'Email',
            prefixIcon: Icons.email_outlined),
        RulesProvider(
          rulesList: ListConstants.getRelativeEmailRules(
            chipLabels[selectedChip],
          ),
        ),
      ],
    );
  }

  Widget _questionText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: Colors.black87,
      ),
    );
  }

  Widget _countrySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        _questionText(
            "Select your ${selectedChip == 0 ? "" : "${chipLabels[selectedChip]}'s "}Country"),
        CountryDropdown(
          onItemSelected: (value) {
            setState(() {
              _isDateOfBirthShown = true;
            });
          },
        )
      ],
    );
  }
}