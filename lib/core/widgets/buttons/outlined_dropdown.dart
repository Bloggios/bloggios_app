/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: outlined_dropdown
 */

import 'dart:math';

import 'package:bloggios_app/core/theme/app_pallete.dart';
import 'package:bloggios_app/core/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OutlinedDropdown extends StatefulWidget {
  final List<String> items;
  final String hintText;
  final ValueChanged<String> onItemSelected;
  final IconData? suffixIcon;
  final bool suffixIconShown;
  final bool isDisabled;

  const OutlinedDropdown({
    super.key,
    required this.items,
    required this.hintText,
    required this.onItemSelected,
    this.suffixIcon,
    this.suffixIconShown = true,
    this.isDisabled = false
  });

  @override
  State<OutlinedDropdown> createState() => _OutlinedDropdownState();
}

class _OutlinedDropdownState extends State<OutlinedDropdown> {
  String? selectedValue;

  void _showBottomModal(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      showDragHandle: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          constraints: BoxConstraints(
              maxHeight: Dimensions.availableHeight(context) * 0.6),
          padding: EdgeInsets.all(16),
          child: ListView(
            shrinkWrap: true,
            children: widget.items.map((String item) {
              return ListTile(
                title: Text(
                  item,
                  style: TextStyle(fontFamily: 'Nunito', fontSize: 16),
                ),
                onTap: () {
                  setState(() {
                    selectedValue = item;
                  });
                  widget.onItemSelected(item);
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
      onPressed: widget.isDisabled ? null : () => _showBottomModal(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            selectedValue == null ? widget.hintText : selectedValue!,
            style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 16,
              color: selectedValue == null ? Colors.black45 : Colors.black87,
            ),
          ),
          _getSuffixIcon()
        ],
      ),
    );
  }

  Widget _getSuffixIcon() {
    if (widget.suffixIconShown) {
      return widget.suffixIcon != null
          ? Icon(
        Icons.chevron_right,
        size: 24,
        color: AppPallete.accentColor,
      )
          : Transform.rotate(
        angle: pi / 2,
        child: Icon(
          Icons.chevron_right,
          size: 24,
          color: AppPallete.accentColor,
        ),
      );
    }
    return SizedBox.shrink();
  }
}
