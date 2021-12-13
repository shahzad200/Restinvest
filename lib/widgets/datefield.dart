import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:investintrust/utils/colors.dart';
import 'package:intl/intl.dart';
import 'package:investintrust/widgets/constant_widget.dart';

class DateFormFieldContainer extends StatelessWidget {
  const DateFormFieldContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DateTimeFormField(
      initialValue: DateTime.now(),
      decoration: const InputDecoration(
        fillColor: AppColor.whiteColor,
        hintStyle: TextStyle(color: AppColor.dimblack),
        errorStyle: TextStyle(color: Colors.redAccent),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.lightGreyColor)),
        contentPadding: EdgeInsets.all(10),
        hintText: "CNIC Expiry Date",
      ),
      dateFormat: DateFormat('dd/MM/yyyy'),
      mode: DateTimeFieldPickerMode.date,
      autovalidateMode: AutovalidateMode.always,
    );
  }
}

class DateFieldContainer extends StatelessWidget {
  const DateFieldContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DateTimeFormField(
      initialValue: DateTime.now(),
      decoration: const InputDecoration(
        suffix: const Calender(),
        fillColor: AppColor.whiteColor,
        hintStyle: TextStyle(color: AppColor.dimblack),
        errorStyle: TextStyle(color: Colors.redAccent),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.lightGreyColor)),
        contentPadding: EdgeInsets.all(6),
        hintText: "CNIC Expiry Date",
      ),
      dateFormat: DateFormat('dd/MM/yyyy'),
      mode: DateTimeFieldPickerMode.date,
      autovalidateMode: AutovalidateMode.always,
    );
  }
}
