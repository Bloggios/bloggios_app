/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: authentication_page
 */

import 'package:bloggios_app/core/theme/app_pallete.dart';
import 'package:bloggios_app/core/widgets/bloggios_copyright.dart';
import 'package:bloggios_app/features/authentication/view/widgets/login_form.dart';
import 'package:bloggios_app/features/authentication/view/widgets/signup_form.dart';
import 'package:flutter/material.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        child: BottomAppBar(
          color: AppPallete.accentColor,
          elevation: 10,
          height: 110,
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                constraints: const BoxConstraints(maxWidth: 400),
                height: 54,
                width: double.infinity,
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppPallete.whiteColor,
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
                  ],
                ),
              ),
              BloggiosCopyright(color: Colors.white),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          SafeArea(
            child: TabBarView(
              controller: _tabController,
              children: [
                LoginForm(),
                SignupForm(),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
