import 'package:flutter/material.dart';
import 'package:investintrust/utils/colors.dart';


class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6.0),
      color: AppColor.black.withOpacity(0.10),
      height: 1,
    );
  }
}
