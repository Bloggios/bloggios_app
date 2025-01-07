/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: otp_input
 */

import 'package:bloggios_app/core/theme/app_pallete.dart';
import 'package:bloggios_app/features/authentication/utils/get_user_auth_state.dart';
import 'package:bloggios_app/features/authentication/view/bloc/register_otp_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class OtpInput extends StatelessWidget {
  final TextEditingController registerOtpTextController;
  const OtpInput({super.key, required this.registerOtpTextController});

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = AppPallete.accentColor;
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(149, 149, 149, 0.4);

    final defaultPinTheme = PinTheme(
      width: 34,
      height: 47,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor, width: 1),
      ),
    );

    void onOtpCompleted(String value) {
      context.read<RegisterOtpBloc>().add(
        RegisterOtpAuthenticateOtp(
          otp: value,
          email: getUserAuthState(context).email,
          password: getUserAuthState(context).password,
          userId: getUserAuthState(context).userId,
        ),
      );
    }

    return Pinput(
      controller: registerOtpTextController,
      length: 6,
      onCompleted: onOtpCompleted,
      pinAnimationType: PinAnimationType.slide,
      hapticFeedbackType: HapticFeedbackType.lightImpact,
      keyboardType: TextInputType.number,
      defaultPinTheme: defaultPinTheme,
      cursor: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 9),
            width: 22,
            height: 1,
            color: focusedBorderColor,
          ),
        ],
      ),
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          border: Border.all(color: focusedBorderColor),
        ),
      ),
      submittedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          color: fillColor,
          borderRadius: BorderRadius.circular(19),
          border: Border.all(color: focusedBorderColor),
        ),
      ),
      errorPinTheme: defaultPinTheme.copyBorderWith(
        border: Border.all(color: Colors.redAccent),
      ),
    );
  }
}
