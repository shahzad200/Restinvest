import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:investintrust/utils/colors.dart';

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
        contentPadding: EdgeInsets.all(15),
        hintText: "CNIC Expiry Date",
      ),
//                          dateFormat: DateFormat('dd/MM/yyyy'),
      mode: DateTimeFieldPickerMode.date,
      autovalidateMode: AutovalidateMode.always,
    );
  }
}
