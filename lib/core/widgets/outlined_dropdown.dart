/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: outlined_dropdown
 */

import 'package:flutter/material.dart';

class OutlinedDropdown extends StatefulWidget {
  final List<String> items;
  final String hintText;
  final ValueChanged<String> onItemSelected;

  const OutlinedDropdown({
    super.key,
    required this.items,
    required this.hintText,
    required this.onItemSelected,
  });

  @override
  State<OutlinedDropdown> createState() => _OutlinedDropdownState();
}

class _OutlinedDropdownState extends State<OutlinedDropdown> {
  String? selectedValue;

  void _showBottomModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: widget.items.map((String item) {
              return ListTile(
                title: Text(item),
                onTap: () {
                  setState(() {
                    selectedValue = item;
                  });
                  widget.onItemSelected(item);
                  Navigator.pop(context); // Close the modal
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
      onPressed: () => _showBottomModal(context),
      child: Text(
        selectedValue == null ? widget.hintText : "Selected: $selectedValue",
      ),
    );
  }
}
