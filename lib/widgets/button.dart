import 'package:flutter/material.dart';
import 'package:investintrust/utils/colors.dart';

class RestInvestButton extends StatelessWidget {
  const RestInvestButton({
    Key? key,
    required this.text,
    required this.onPress,
    this.height = 48,
    this.width = double.infinity,
    this.textSize = 18.0,
    this.buttonColor = AppColor.blueColor,
    this.isSquare = false,
    this.textColor = AppColor.whiteColor,
  }) : super(key: key);
  final String text;

  final VoidCallback? onPress;
  final double textSize;
  final Color buttonColor;
  final Color textColor;

  final double width;
  final double height;
  final bool isSquare;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          onPrimary: textColor,
          textStyle: TextStyle(
            fontSize: textSize,
          ),
          minimumSize: Size(width, height),
          shape: RoundedRectangleBorder(
            borderRadius: isSquare
                ? BorderRadius.circular(0

                  )
                : BorderRadius.circular(30.0),
          ),
        ),
        child: Text(text));
  }
}

class CustomRoundButton extends StatelessWidget {
  const CustomRoundButton(
      {Key? key,
      this.color1 = true,
      this.color2 = false,
        this.isSquare,
      required this.text,
      required this.onPress,
      this.height = 48,
      this.width = double.infinity,
      this.textSize = 18.0,
      this.buttonColor = AppColor.blueColor,
      this.textColor = AppColor.whiteColor,
      this.borderColor = AppColor.blueColor})
      : super(key: key);
  final String text;
  final VoidCallback? onPress;
  final double textSize;
  final Color buttonColor;
  final Color textColor;
  final Color borderColor;
  final double width;
  final double height;
 final isSquare;

  final color1;
  final color2;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          onPrimary: textColor,
          textStyle: TextStyle(
            fontSize: textSize,
          ),
          minimumSize: Size(width, height),
          shape: RoundedRectangleBorder(
            borderRadius: isSquare
                ? BorderRadius.circular(10

            )
                : BorderRadius.circular(0.0),
          ),
        ),
        child: Text(text));
  }
}

class CustomRowButton extends StatelessWidget {
  const CustomRowButton(
      {Key? key,
      this.color1 = true,
      this.color2 = false,
      required this.text,
      required this.onPress,
      this.height = 35,
      this.width = double.infinity,
      this.textSize = 18.0,
      this.buttonColor = AppColor.blueColor,
      this.textColor = AppColor.whiteColor,
      this.borderColor = AppColor.blueColor})
      : super(key: key);
  final String text;
  final VoidCallback? onPress;
  final double textSize;
  final Color buttonColor;
  final Color textColor;
  final Color borderColor;
  final double width;
  final double height;

  final color1;
  final color2;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          onPrimary: textColor,
          textStyle: TextStyle(
            fontSize: textSize,
          ),
          minimumSize: Size(width, height),
          shape:  RoundedRectangleBorder(
              side:  BorderSide(color: AppColor.blueColor)),
        ),
        child: Text(text));
  }
}

class RoundColumnButton extends StatelessWidget {
  const RoundColumnButton(
      {Key? key,
      this.color1 = true,
      this.color2 = false,
      required this.onPress,
      required this.height,
      required this.width,
      this.textSize = 18.0,
      this.buttonColor = AppColor.blueColor,
      required this.icon,
      this.textColor = AppColor.whiteColor,
      this.borderColor = AppColor.blueColor})
      : super(key: key);

  final VoidCallback? onPress;
  final double textSize;
  final Color buttonColor;
  final Color textColor;
  final Color borderColor;
  final icon;
  final double width;
  final double height;

  final color1;
  final color2;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
        onPrimary: textColor,
        textStyle: TextStyle(
          fontSize: textSize,
        ),
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
            side: BorderSide(color: AppColor.dimblack, width: 0.2)),
      ),
      child: icon,
    );
  }
}
