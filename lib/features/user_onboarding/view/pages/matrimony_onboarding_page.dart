/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: matrimony_onboarding_page
 */

import 'package:bloggios_app/core/constants/assets_constants.dart';
import 'package:bloggios_app/core/constants/list_constants.dart';
import 'package:bloggios_app/core/theme/app_pallete.dart';
import 'package:bloggios_app/core/utils/init_snackbar.dart';
import 'package:bloggios_app/core/widgets/buttons/country_dropdown.dart';
import 'package:bloggios_app/core/widgets/buttons/outlined_dropdown.dart';
import 'package:bloggios_app/core/widgets/fields/basic_text_field.dart';
import 'package:bloggios_app/core/widgets/fields/date_picker.dart';
import 'package:bloggios_app/core/widgets/fields/prefix_icon_text_field.dart';
import 'package:bloggios_app/core/widgets/name_rules.dart';
import 'package:bloggios_app/core/widgets/rules_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  bool _isHeightShown = false;
  bool _isCasteShown = false;
  bool _isDisabilityShown = false;
  bool _isDoshShown = false;
  bool _isFewWordsShown = false;
  int? _selectedPhysicalChip;
  final ScrollController _scrollController = ScrollController();
  final _fewWordsTextController = TextEditingController();

  final List<String> chipLabels = [
    "Myself",
    "Son",
    "Daughter",
    "Brother",
    "Sister",
    "For Exploring"
  ];

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppPallete.whiteColor,
      appBar: _appBar(context),
      bottomNavigationBar: BottomAppBar(
        child: _submitButton(),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
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
              _getProfileDetailsWidget(),
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
                padding: EdgeInsets.all(10),
                shape: const StadiumBorder(),
                showCheckmark: false,
                checkmarkColor: AppPallete.whiteColor,
                backgroundColor: AppPallete.whiteColor,
                label: Text(
                  chipLabels[index],
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    color: selectedChip == index
                        ? AppPallete.whiteColor
                        : Colors.black87,
                  ),
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
          child: selectedChip != 0 && selectedChip != chipLabels.length - 1
              ? Container(
                  key: ValueKey("visibleWidget"),
                  child: _userDetailsWidget(),
                )
              : SizedBox(
                  key: ValueKey("hiddenWidget"),
                ), // Vacates space
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

  Widget _getProfileDetailsWidget() {
    if (selectedChip != chipLabels.length - 1) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          _countrySection(),
          SizedBox(
            height: 20,
          ),
          if (_isDateOfBirthShown) _dateOfBirth(),
          SizedBox(
            height: 20,
          ),
          if (_isHeightShown) _heightSection(),
          SizedBox(
            height: 20,
          ),
          if (_isCasteShown) _casteSection(),
          SizedBox(
            height: 20,
          ),
          if (_isDisabilityShown) _disabilityStatus(),
          SizedBox(
            height: 20,
          ),
          if (_isDoshShown) _doshSection(),
          SizedBox(
            height: 20,
          ),
          if (_isFewWordsShown) _fewWordsSection(),
        ],
      );
    } else {
      return SizedBox.shrink();
    }
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
            setState(
              () {
                _isDateOfBirthShown = true;
                _scrollToBottom();
              },
            );
          },
        )
      ],
    );
  }

  Widget _dateOfBirth() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        _questionText(
            "Select your ${selectedChip == 0 ? "" : "${chipLabels[selectedChip]}'s "}Date of Birth"),
        DatePicker(
          hintText: 'Date of Birth',
          initialDate: DateTime.now(),
          minimumDate: DateTime(1970),
          maximumDate: DateTime(2004),
          onDateSelected: (value) {
            setState(() {
              _isHeightShown = true;
              _scrollToBottom();
            });
          },
        )
      ],
    );
  }

  Widget _heightSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        _questionText(
            "Select your ${selectedChip == 0 ? "" : "${chipLabels[selectedChip]}'s "}Height"),
        OutlinedDropdown(
          hintText: 'Height (in ft)',
          items: ListConstants.height,
          onItemSelected: (value) {
            setState(
              () {
                _isCasteShown = true;
                _scrollToBottom();
              },
            );
          },
        )
      ],
    );
  }

  Widget _casteSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Divider(),
        _questionText("Religion"),
        Column(
          spacing: 10,
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                minimumSize: Size(double.infinity, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: BorderSide(color: Colors.grey.shade400),
              ),
              onPressed: () {
                initSnackBar(context,
                    'Bloggios currently supports matrimonial services exclusively for the Hindu community.');
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Hindu',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            OutlinedDropdown(
              items: ListConstants.castes,
              hintText: "Select Caste",
              onItemSelected: (value) {
                setState(
                  () {
                    _isDisabilityShown = true;
                    _scrollToBottom();
                  },
                );
              },
            ),
          ],
        )
      ],
    );
  }

  Widget _disabilityStatus() {
    final List<String> disabilityChips = ListConstants.disabilityStatus;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        SizedBox(
          width: double.infinity,
          child: _questionText(selectedChip == 0
              ? "Do you have any disability ?"
              : "Do your ${chipLabels[selectedChip]} have any disability ?"),
        ),
        Wrap(
          spacing: 7.0,
          children: List<Widget>.generate(
            disabilityChips.length,
            (int index) {
              return ChoiceChip(
                padding: EdgeInsets.all(10),
                shape: const StadiumBorder(),
                showCheckmark: false,
                backgroundColor: AppPallete.whiteColor,
                label: Text(
                  disabilityChips[index],
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    color: _selectedPhysicalChip == index
                        ? AppPallete.whiteColor
                        : Colors.black87,
                  ),
                ),
                selected: _selectedPhysicalChip == index,
                selectedColor: AppPallete.accentColor,
                onSelected: (bool selected) {
                  setState(() {
                    _selectedPhysicalChip = index;
                    _isDoshShown = true;
                    _scrollToBottom();
                  });
                },
              );
            },
          ).toList(),
        ),
      ],
    );
  }

  Widget _doshSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        _questionText(selectedChip == 0
            ? "Do you have any Dosh ?"
            : "Do your ${chipLabels[selectedChip]} have any Dosh ?"),
        OutlinedDropdown(
          hintText: 'Select Dosh',
          items: ListConstants.doshType,
          onItemSelected: (value) {
            setState(
              () {
                _isFewWordsShown = true;
                _scrollToBottom();
              },
            );
          },
        )
      ],
    );
  }

  Widget _fewWordsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        _questionText(selectedChip == 0
            ? "Few words about you"
            : "Few words about your ${chipLabels[selectedChip]}"),
        BasicTextField(
          textEditingController: _fewWordsTextController,
          hintText: selectedChip == 0
              ? "Describe about yourself in few words"
              : "Describe about your ${chipLabels[selectedChip]} in few words",
          maxLines: 4,
          keyboardType: TextInputType.multiline,
        )
      ],
    );
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed: () => HapticFeedback.lightImpact(),
      style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 47),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: AppPallete.accentColor),
      child: Text(
        'Submit',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Nunito',
          fontSize: 16,
          letterSpacing: 1,
        ),
      ),
    );
  }
}
