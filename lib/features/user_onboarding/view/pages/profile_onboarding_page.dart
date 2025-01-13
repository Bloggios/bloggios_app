/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: profile_onboarding_page
 */

import 'package:bloggios_app/core/router/routes.dart';
import 'package:bloggios_app/core/theme/app_pallete.dart';
import 'package:bloggios_app/core/utils/dimensions.dart';
import 'package:bloggios_app/core/widgets/buttons/loader_button.dart';
import 'package:bloggios_app/core/widgets/fields/basic_text_field.dart';
import 'package:bloggios_app/core/widgets/name_rules.dart';
import 'package:bloggios_app/features/user_onboarding/utils/add_profile_bloc_listener.dart';
import 'package:bloggios_app/features/user_onboarding/view/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileOnboardingPage extends StatefulWidget {
  const ProfileOnboardingPage({super.key});

  @override
  State<ProfileOnboardingPage> createState() => _ProfileOnboardingPageState();
}

class _ProfileOnboardingPageState extends State<ProfileOnboardingPage> {
  final _profileFormKey = GlobalKey<FormState>();
  final _firstNameEditingController = TextEditingController();
  final _lastNameEditingController = TextEditingController();

  @override
  void dispose() {
    _firstNameEditingController.dispose();
    _lastNameEditingController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (_profileFormKey.currentState!.validate()) {
      context.read<ProfileBloc>().add(
        ProfileAddProfile(
          _firstNameEditingController.text,
          _lastNameEditingController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: BlocConsumer<ProfileBloc, ProfileState>(
              listener: addProfileBlocListener,
              builder: (context, state) {
                final bool isLoading = state is ProfileLoading;
                return ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: Dimensions.availableHeight(context),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 50,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: 'Welcome to',
                              style: TextStyle(
                                fontSize: 34,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w700,
                                color: Colors.black87,
                              ),
                              children: [
                                TextSpan(text: '\n'),
                                TextSpan(
                                  text: 'Bloggios',
                                  style: TextStyle(
                                    color: AppPallete.accentColor,
                                    fontWeight: FontWeight.w800,
                                  ),
                                )
                              ]),
                        ),
                        Form(
                          key: _profileFormKey,
                          child: Column(
                            spacing: 20,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Let's give your profile a personality!\nWhat's your name?",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                  fontFamily: 'Nunito',
                                ),
                              ),
                              BasicTextField(
                                textEditingController: _firstNameEditingController,
                                label: 'First Name',
                                validator: (value) {
                                  if (value == null || value
                                      .trim()
                                      .isEmpty) {
                                    return 'Please Enter your name';
                                  }
                                  return null;
                                },
                              ),
                              BasicTextField(
                                textEditingController: _lastNameEditingController,
                                label: 'Last Name',
                              ),
                              NameRules()
                            ],
                          ),
                        ),
                        LoaderButton(
                          onPress: _onSubmit,
                          text: 'Confirm',
                          isLoading: isLoading,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ));
  }
}
