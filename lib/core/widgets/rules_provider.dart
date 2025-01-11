/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: rules_provider
 */

import 'package:flutter/material.dart';

class RulesProvider extends StatelessWidget {
  final List<String> rulesList;
  const RulesProvider({super.key, required this.rulesList});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 7,
      children: [
        for (var item in rulesList)
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
