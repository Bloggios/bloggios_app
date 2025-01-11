/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: name_rules
 */

import 'package:flutter/material.dart';

class NameRules extends StatelessWidget {
  final String? usecaseFor;
  const NameRules({super.key, this.usecaseFor});

  @override
  Widget build(BuildContext context) {

    final List<String> nameNote = [
      "Your First Name is required and will be visible to all users on the Bloggios application.",
      "Adding a Last Name is optional, and you can control its visibility in the settings.",
      "If you're using the Matrimony feature, your First Name and Last Name must match your Government ID.",
      "In the Matrimony application, your Last Name will always be visible, regardless of your settings."
    ];

    final List<String> usecaseForNameNote = [
      "First Name of your $usecaseFor is required and will be visible to all users on the Bloggios Matrimony application.",
      "First Name and Last Name of your $usecaseFor must match with your ${usecaseFor}'s Government ID.",
      "Last Name of your $usecaseFor is always visible, regardless of their choice"
    ];

    List<String> getNameNote() {
      if (usecaseFor == null) {
        return nameNote;
      } else {
        return usecaseForNameNote;
      }
    }

    return Column(
      spacing: 7,
      children: [
        for (var item in getNameNote())
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
