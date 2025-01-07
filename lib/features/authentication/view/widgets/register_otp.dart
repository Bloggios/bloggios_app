/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: register_otp
 */

import 'package:bloggios_app/core/constants/assets_constants.dart';
import 'package:bloggios_app/core/theme/app_pallete.dart';
import 'package:bloggios_app/features/authentication/utils/get_user_auth_state.dart';
import 'package:bloggios_app/features/authentication/utils/register_otp_bloc_listener.dart';
import 'package:bloggios_app/features/authentication/view/bloc/register_otp_bloc.dart';
import 'package:bloggios_app/features/authentication/view/widgets/otp_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:quickalert/quickalert.dart';

class RegisterOtp extends StatelessWidget {
  const RegisterOtp({super.key});

  @override
  Widget build(BuildContext context) {
    final registerOtpTextController = TextEditingController();

    void onButtonPress() {
      if (registerOtpTextController.text.length == 6) {
        context.read<RegisterOtpBloc>().add(
              RegisterOtpAuthenticateOtp(
                otp: registerOtpTextController.text.trim(),
                email: getUserAuthState(context).email,
                password: getUserAuthState(context).password,
                userId: getUserAuthState(context).userId,
              ),
            );
      } else {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: 'Incorrect OTP',
          text:
              'Please enter the OTP sent to your mail. OTP consist of 6 digit number',
          confirmBtnColor: AppPallete.accentColor,
        );
      }
    }

    return SingleChildScrollView(
      child: IntrinsicHeight(
        child: Column(
          children: [
            BlocConsumer<RegisterOtpBloc, RegisterOtpState>(
              listener: registerOtpBlocListener,
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        AssetsConstants.otpShieldLottie,
                        height: 200,
                        width: double.infinity,
                        repeat: false,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'One Time Password\n(OTP)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 27,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 28),
                        child: Text(
                          'We have sent the code to your email address',
                          textAlign: TextAlign.center,
                          softWrap: true,
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade600,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            getUserAuthState(context).email,
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey.shade700,
                              letterSpacing: 1,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              context.pop();
                            },
                            iconSize: 14,
                            constraints:
                                BoxConstraints(maxHeight: 44, maxWidth: 44),
                            color: Colors.white,
                            style: IconButton.styleFrom(
                              backgroundColor: AppPallete.accentColor,
                              animationDuration: Duration(milliseconds: 200),
                            ),
                            icon: Icon(Icons.edit_rounded),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      OtpInput(
                        registerOtpTextController: registerOtpTextController,
                      ),
                      SizedBox(height: 40),
                      Text(
                        "Didn't receive the code?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade800,
                          letterSpacing: 1,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Resend Code',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: AppPallete.accentColor,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 10.0, left: 10.0, bottom: 30),
                        child: ElevatedButton(
                          onPressed: onButtonPress,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppPallete.accentColor,
                            minimumSize: Size(double.infinity, 50),
                            // Full width button
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Text(
                            'Continue',
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
