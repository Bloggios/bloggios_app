/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: usecase_rules
 */

import 'package:flutter/material.dart';

class UsecaseRules extends StatelessWidget {
  const UsecaseRules({super.key});

  @override
  Widget build(BuildContext context) {

    final List<String> nameNote = [
      "You can modify your selection at any time through the preferences section in the application.",
      "You can skip the above selections if you wish to use only the Bloggios features such as blogs, messaging, Q&A, and more.",
      "ID proof may be required if you choose the matrimony feature to complete your profile later in the application.",
      "If you were referred by your community manager, you will have the option to select your community later in the application. To proceed, please continue with the Matrimony feature."
    ];

    return Column(
      spacing: 7,
      children: [
        for (var item in nameNote)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Icon(
                  Icons.circle,
                  size: 7,
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Text(
                  item,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          )
      ],
    );
  }
}
