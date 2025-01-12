/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: country_dropdown
 */

import 'dart:math';

import 'package:bloggios_app/core/constants/list_constants.dart';
import 'package:bloggios_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';

class CountryDropdown extends StatefulWidget {
  final ValueChanged<String> onItemSelected;

  const CountryDropdown({super.key, required this.onItemSelected});

  @override
  State<CountryDropdown> createState() => _CountryDropdownState();
}

class _CountryDropdownState extends State<CountryDropdown> {
  CountryPayload? selectedValue;

  void _showBottomModal(BuildContext context) {
    showModalBottomSheet(
      elevation: 4,
      enableDrag: true,
      showDragHandle: true,
      backgroundColor: AppPallete.whiteColor,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: ListConstants.countries.map((CountryPayload item) {
              return ListTile(
                title: Text(item.name),
                leading: Flag(item.flag),
                onTap: () {
                  setState(() {
                    selectedValue = item;
                  });
                  widget.onItemSelected(item.name);
                  context.pop();
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: BorderSide(color: Colors.grey.shade400)),
      onPressed: () => _showBottomModal(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          selectedValue == null
              ? Row(
                  children: [
                    Text(
                      'Select Country',
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 16,
                          color: Colors.black45),
                    ),
                  ],
                )
              : Row(
                  spacing: 10,
                  children: [
                    Flag(
                      selectedValue!.flag,
                      size: 24,
                    ),
                    Text(
                      selectedValue!.name,
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Nunito',
                          color: Colors.black87),
                    ),
                  ],
                ),
          Transform.rotate(
            angle: pi / 2,
            child: Icon(
              Icons.chevron_right,
              size: 24,
              color: AppPallete.accentColor,
            ),
          )
        ],
      ),
    );
  }
}
