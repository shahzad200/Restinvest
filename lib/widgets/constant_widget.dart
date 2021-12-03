import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investintrust/utils/colors.dart';
import 'package:investintrust/utils/constant.dart';

class RestInvestTitle extends StatelessWidget {
  const RestInvestTitle({
    Key? key,
    required this.text,
    this.textColor = Colors.black,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.isAsterisk = false,
    this.textAlign = TextAlign.left,
    this.margin = const EdgeInsets.only(left: 0),
  }) : super(key: key);
  final String text;
  final Color textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextAlign textAlign;

  final EdgeInsetsGeometry margin;
  final bool isAsterisk;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        child: isAsterisk
            ? Row(
                children: [
                  getx(),
                  const Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              )
            : getx());
  }

  Widget getx() {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        color: textColor,
        fontSize: fontSize,
        fontFamily: fontFamily,
      ),
      textAlign: textAlign,
    );
  }
}

class ReportsInkWellButton extends StatelessWidget {
  const ReportsInkWellButton({
    required this.text,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final text;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: RestInvestTitle(
        text: text,
        textColor: AppColor.black,
        textAlign: TextAlign.start,
        fontSize: 18,
      ),
    );
  }
}

class HeadingText extends StatelessWidget {
  const HeadingText({
    Key? key,
    required this.text,
    this.textColor = Colors.black,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    required this.underlineColor,
    this.textAlign = TextAlign.left,
    this.margin = const EdgeInsets.only(left: 0),
  }) : super(key: key);
  final String text;
  final Color textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextAlign textAlign;
  final EdgeInsetsGeometry margin;
  final underlineColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          decoration: TextDecoration.underline,
          fontWeight: fontWeight,
          color: textColor,
          fontSize: fontSize,
          fontFamily: fontFamily,
          decorationColor: AppColor.blueColor),
      textAlign: textAlign,
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Image.asset(
          Constants.logo,
          width: 300,
          height: 100,
        ));
  }
}

class DropDownContainerIcon extends StatelessWidget {
  const DropDownContainerIcon({
    required this.text,
    required this.textColor,
    Key? key,
  }) : super(key: key);
  final text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RestInvestTitle(
          text: text,
          textColor: textColor,
        ),
        SizedBox(
          height: 35,
          child: DropDownContainer(
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: AppColor.blueColor,
            ),
            voidcallback: () {},
            isSquare: true,
            height: 35,
          ),
        ),
      ],
    );
  }
}

class IconButtonText extends StatelessWidget {
  IconButtonText({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);
  final String? text;
  final icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        RestInvestTitle(
          text: text!,
          textColor: AppColor.whiteColor,
        ),
      ],
    );
  }
}

class ContainerBox extends StatelessWidget {
  const ContainerBox(
      {Key? key,
      required this.text,
      this.fontSize = 20.0,
      required this.containerColor,
      this.height = 70,
      required this.voidcallback,
      this.icon,
      this.textColor = Colors.black})
      : super(key: key);
  final String text;
  final double fontSize;
  final icon;
  final Color textColor;
  final Color containerColor;
  final double height;
  final voidcallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: containerColor,
      ),
      child: Material(
        child: InkWell(
          onTap: voidcallback,
          child: Container(
            width: Get.width,
            height: Get.height / 5.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                Text(
                  text,
                  style: TextStyle(color: textColor),
                ),
              ],
            ),
          ),
        ),
        color: Colors.transparent,
      ),
    );
  }
}

class RowContainerBox extends StatelessWidget {
  const RowContainerBox(
      {Key? key,
      required this.text,
      this.fontSize = 20.0,
      required this.containerColor,
      this.height = 40,
      required this.voidcallback,
      this.icon,
      this.textColor = Colors.black})
      : super(key: key);
  final String text;
  final double fontSize;
  final icon;
  final Color textColor;
  final Color containerColor;
  final double height;
  final voidcallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: containerColor,
      ),
      child: Material(
        child: InkWell(
          onTap: voidcallback,
          child: Container(
            width: Get.width,
            height: Get.height / 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                Text(
                  text,
                  style: TextStyle(color: textColor),
                ),
              ],
            ),
          ),
        ),
        color: Colors.transparent,
      ),
    );
  }
}

class RoundContainer extends StatelessWidget {
  const RoundContainer({
    Key? key,
    this.height = 70,
    required this.voidcallback,
    required this.isSquare,
  }) : super(key: key);

  final double height;
  final isSquare;
  final voidcallback;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: Material(
          child: InkWell(
            onTap: voidcallback,
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                border: Border.all(
                  width: 0.5,
                  color: AppColor.dimblack,
                ),
                borderRadius: isSquare
                    ? BorderRadius.vertical(
                        top: Radius.circular(0),
                        bottom: Radius.circular(0),
                      )
                    : BorderRadius.circular(8),
              ),
              child: Center(),
              height: 45,
            ),
          ),
          color: Colors.transparent,
        ),
      ),
    ]);
  }
}

class DropDownContainer extends StatelessWidget {
  const DropDownContainer({
    Key? key,
    this.height = 70,
    required this.voidcallback,
    required this.isSquare,
    required this.icon,
  }) : super(key: key);

  final double height;
  final isSquare;
  final voidcallback;
  final icon;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: Material(
          child: InkWell(
            onTap: voidcallback,
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                border: Border.all(
                  width: 0.5,
                  color: AppColor.dimblack,
                ),
                borderRadius: isSquare
                    ? BorderRadius.vertical(
                        top: Radius.circular(0),
                        bottom: Radius.circular(0),
                      )
                    : BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: icon,
                  )
                ],
              ),
              height: 45,
            ),
          ),
          color: Colors.transparent,
        ),
      ),
    ]);
  }
}

class ContainerCheckBoxText extends StatefulWidget {
  ContainerCheckBoxText({
    required this.isChecked,
    Key? key,
  }) : super(key: key);
  bool isChecked = false;

  @override
  State<ContainerCheckBoxText> createState() => _ContainerCheckBoxTextState();
}

class _ContainerCheckBoxTextState extends State<ContainerCheckBoxText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.lightGreyColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            checkColor: AppColor.whiteColor,
            activeColor: AppColor.blueColor,
            value: widget.isChecked,
            onChanged: (bool? value) {
              setState(() {
                widget.isChecked = value!;
              });
            },
          ),
          const RestInvestTitle(
            text: "I confirm acceptance of",
            fontSize: 11,
          ),
          const HeadingText(
            text: "Term & Conditions",
            underlineColor: AppColor.blueColor,
            textColor: AppColor.blueColor,
            fontSize: 10,
          ),
          const RestInvestTitle(
            text: "and all charges governing in",
            fontSize: 11,
          ),
        ],
      ),
      height: 50,
    );
  }
}

class EmptyRowContainer extends StatelessWidget {
  const EmptyRowContainer({
    required this.text,
    required this.textColor,
    Key? key,
  }) : super(key: key);
  final text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RestInvestTitle(
          text: text,
          textColor: textColor,
        ),
        SizedBox(
          height: 35,
          child: RoundContainer(
            isSquare: true,
            voidcallback: () {},
          ),
        ),
        const SizedBox(
          width: 6,
        ),
      ],
    );
  }
}
