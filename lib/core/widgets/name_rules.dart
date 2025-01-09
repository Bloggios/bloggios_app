/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: name_rules
 */

import 'package:flutter/material.dart';

class NameRules extends StatelessWidget {
  const NameRules({super.key});

  @override
  Widget build(BuildContext context) {

    final List<String> nameNote = [
      "Your First Name is required and will be visible to all users on the Bloggios application.",
      "Adding a Last Name is optional, and you can control its visibility in the settings.",
      "If you're using the Matrimony feature, your First Name and Last Name must match your Government ID.",
      "In the Matrimony application, your Last Name will always be visible, regardless of your settings."
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
