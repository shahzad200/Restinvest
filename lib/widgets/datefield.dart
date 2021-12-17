import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:investintrust/utils/colors.dart';
import 'package:intl/intl.dart';
import 'package:investintrust/widgets/constant_widget.dart';

class DateFormFieldContainer extends StatefulWidget {
  const DateFormFieldContainer({
    required this.isRounded,
    this.color = AppColor.dimblack,
   required this.text,
    Key? key,
  }) : super(key: key);
  final bool isRounded;
  final String? text;
  final Color color;

  @override
  State<DateFormFieldContainer> createState() => _DateFormFieldContainerState();
}

class _DateFormFieldContainerState extends State<DateFormFieldContainer> {
  @override
  Widget build(BuildContext context) {
    return DateTimeFormField(
      initialValue: DateTime.now(),
      decoration: InputDecoration(
        fillColor: AppColor.whiteColor,
        hintStyle: TextStyle(color: AppColor.dimblack),
        errorStyle: TextStyle(color: Colors.redAccent),
        border: OutlineInputBorder(
          borderSide: BorderSide(
              width: widget.isRounded ? 1 : 0, color: AppColor.dimblack),
          borderRadius: BorderRadius.circular(
            widget.isRounded ? 8 : 0,
          ),
        ),
        contentPadding: EdgeInsets.all(10),
        hintText:widget. text!,
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
        suffix: Calender(
          color: AppColor.blueColor,
          height: 15,
          width: 15,
        ),
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
