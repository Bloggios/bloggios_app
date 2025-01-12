/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: date_picker
 */

import 'package:bloggios_app/core/theme/app_pallete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  final String hintText;
  final DateTime? initialDate;
  final DateTime? minimumDate;
  final DateTime? maximumDate;
  final ValueChanged<DateTime> onDateSelected;

  const DatePicker({
    super.key,
    required this.hintText,
    required this.onDateSelected,
    this.initialDate,
    this.minimumDate,
    this.maximumDate,
  });

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? _selectedDate;

  Future<void> _showDatePicker(BuildContext context) async {
    DateTime now = DateTime.now();
    DateTime tempPickedDate = _selectedDate ?? widget.initialDate ?? now;

    DateTime? pickedDate = await showModalBottomSheet<DateTime>(
      backgroundColor: AppPallete.whiteColor,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          padding: EdgeInsets.only(
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.pop(tempPickedDate);
                      },
                      child: const Text(
                        "Done",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: CupertinoDatePicker(
                  backgroundColor: AppPallete.whiteColor,
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: tempPickedDate.isBefore(widget.minimumDate ?? DateTime(2000))
                      ? (widget.minimumDate ?? DateTime(2000))
                      : tempPickedDate.isAfter(widget.maximumDate ?? DateTime(2100))
                      ? (widget.maximumDate ?? DateTime(2100))
                      : tempPickedDate,
                  minimumDate: widget.minimumDate ?? DateTime(2000),
                  maximumDate: widget.maximumDate ?? DateTime(2100),
                  onDateTimeChanged: (DateTime newDate) {
                    tempPickedDate = newDate;
                  },
                ),
              ),
            ],
          ),
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
      widget.onDateSelected(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        side: BorderSide(color: Colors.grey.shade400),
      ),
      onPressed: () => _showDatePicker(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _selectedDate == null
                ? widget.hintText
                : DateFormat('MMMM d, yyyy').format(_selectedDate!),
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Nunito',
              color: Colors.black87,
            ),
          ),
          const Icon(
            Icons.calendar_today,
            size: 24,
            color: AppPallete.accentColor,
          ),
        ],
      ),
    );
  }
}
