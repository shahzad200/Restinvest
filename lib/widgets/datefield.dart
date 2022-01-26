import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:investintrust/utils/colors.dart';
import 'package:intl/intl.dart';
import 'package:investintrust/widgets/constant_widget.dart';

// class DateFormFieldContainer extends StatefulWidget {
//   const DateFormFieldContainer({
//     required this.isRounded,
//     this.color = AppColor.dimblack,
//    required this.text,
//     Key? key,
//     this.fn,
//   }) : super(key: key);
//   final bool isRounded;
//   final String? text;
//   final Color color;
//   final Function(dynamic) fn;
//   @override
//   State<DateFormFieldContainer> createState() => _DateFormFieldContainerState();
// }
//
// class _DateFormFieldContainerState extends State<DateFormFieldContainer> {
//   @override
//   Widget build(BuildContext context) {
//     return DateTimeFormField(
//       initialValue: DateTime.now(),
//       decoration: InputDecoration(
//         fillColor: AppColor.whiteColor,
//         hintStyle: const TextStyle(color: AppColor.dimblack),
//         errorStyle: const TextStyle(color: Colors.redAccent),
//         border: OutlineInputBorder(
//           borderSide: BorderSide(
//               width: widget.isRounded ? 1 : 0, color: AppColor.dimblack),
//           borderRadius: BorderRadius.circular(
//             widget.isRounded ? 8 : 0,
//           ),
//         ),
//         contentPadding: const EdgeInsets.all(10),
//         hintText:widget. text!,
//       ),
//       dateFormat: DateFormat('dd/MM/yyyy'),
//       mode: DateTimeFieldPickerMode.date,
//       autovalidateMode: AutovalidateMode.always,
//       onDateSelected: (value){
//         fn(value);
//       },
//     );
//   }
// }
//
// class DateFieldContainer extends StatelessWidget {
//   const DateFieldContainer({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return DateTimeFormField(
//       initialValue: DateTime.now(),
//       decoration: const InputDecoration(
//         suffix: Calender(
//           color: AppColor.blueColor,
//           height: 15,
//           width: 15,
//         ),
//         fillColor: AppColor.whiteColor,
//         hintStyle: TextStyle(color: AppColor.dimblack),
//         errorStyle: TextStyle(color: Colors.redAccent),
//         border: OutlineInputBorder(
//             borderSide: BorderSide(color: AppColor.lightGreyColor)),
//         contentPadding: EdgeInsets.all(6),
//         hintText: "CNIC Expiry Date",
//       ),
//       dateFormat: DateFormat('dd/MM/yyyy'),
//       mode: DateTimeFieldPickerMode.date,
//       autovalidateMode: AutovalidateMode.always,
//     );
//   }
// }

class DateFormFieldContainer extends StatelessWidget {
  const DateFormFieldContainer(
      {Key? key,
        required  this.isRounded,

        required this.mode,
        required this.dateFormatTrue,
        required this.onDateSelected,
        this.initialValue,
        this.enable = true,
      required  this.isTrue,
        this.dateFormat,
        required this.text,})
      : super(key: key);
  final DateTimeFieldPickerMode mode;
  final bool dateFormatTrue;
  final Function(dynamic) onDateSelected;
  final dynamic dateFormat;
  final dynamic initialValue;
  final bool isRounded;
  final bool enable;
  final String text;
  final bool isTrue;

  @override
  Widget build(BuildContext context) {
    return DateTimeFormField(
      enabled: enable,
      decoration: InputDecoration(fillColor: AppColor.whiteColor,filled: true,alignLabelWithHint: false,
        hintStyle: const TextStyle(color: AppColor.dimblack,),
        errorStyle: const TextStyle(color: Colors.redAccent),

        border: OutlineInputBorder(
          borderSide: BorderSide(
              width: isRounded ? 0.1 : 0, color: AppColor.dimblack),
          borderRadius: BorderRadius.circular(
            isRounded ? 8 : 0,
          ),
        ),

        hintText: text,
        contentPadding: const EdgeInsets.all(8),
        suffixIcon: isTrue? (const Calender()):const SizedBox(),

      ),
      mode: DateTimeFieldPickerMode.date,
      // initialValue: initialValue,
      dateFormat: dateFormatTrue ? DateFormat('dd/MM/yyyy') : null,
      autovalidateMode: AutovalidateMode.always,

      onDateSelected: (DateTime value) {
        onDateSelected(value);
      },
    );
  }
}