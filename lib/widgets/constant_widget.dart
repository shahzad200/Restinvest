import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investintrust/utils/colors.dart';
import 'package:investintrust/utils/constant.dart';

import 'custom_divider.dart';

class RestInvestTitle extends StatelessWidget {
  const RestInvestTitle({
    Key? key,
    this.text,
    this.textColor = Colors.black,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.isAsterisk = false,
    this.textAlign = TextAlign.left,
    this.margin = const EdgeInsets.only(left: 0),
  }) : super(key: key);
  final String? text;
  final Color textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextAlign? textAlign;

  final EdgeInsetsGeometry margin;
  final bool isAsterisk;

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        fontWeight: fontWeight,
        color: textColor,
        fontSize: fontSize,
        fontFamily: fontFamily,
      ),
      textAlign: textAlign!,
    );
  }
}

class CustomTextContainer extends StatelessWidget {
  const CustomTextContainer({
    required this.height,
    required this.text,
    required this.textAlign,
    required this.fontSize,
    Key? key,
  }) : super(key: key);
  final double height;
  final TextAlign textAlign;
  final fontSize;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: AppColor.blueColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 6),
            child: RestInvestTitle(
              textAlign: textAlign,
              text: text,
              textColor: AppColor.whiteColor,
              fontWeight: FontWeight.w900,
            ),
          )
        ],
      ),
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
  const Logo({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Align(
        child: Image.asset(
      Constants.logo,
      width: width,
      height: height,
    ));
  }
}

class Market extends StatelessWidget {
  const Market({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        child: Image.asset(
      Constants.market,
      width: 20,
      height: 20,
      color: AppColor.black,
    ));
  }
}

class Call extends StatelessWidget {
  const Call({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        child: Image.asset(
      Constants.call,
      width: 25,
      height: 25,
      color: AppColor.whiteColor,
    ));
  }
}

class Sms extends StatelessWidget {
  const Sms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        child: Image.asset(
      Constants.sms,
      width: 25,
      height: 25,
      color: AppColor.whiteColor,
    ));
  }
}

class Mail extends StatelessWidget {
  const Mail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        child: Image.asset(
      Constants.mail,
      width: 25,
      height: 25,
      color: AppColor.whiteColor,
    ));
  }
}

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        child: Image.asset(
      Constants.chat,
      width: 20,
      height: 20,
      color: AppColor.whiteColor,
    ));
  }
}

class Portofol extends StatelessWidget {
  const Portofol({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        child: Image.asset(
      Constants.portofol,
      width: 25,
      height: 25,
      color: AppColor.black,
    ));
  }
}

class FundManager extends StatelessWidget {
  const FundManager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        child: Image.asset(
      Constants.fundmanager,
      width: 25,
      height: 25,
      color: AppColor.black,
    ));
  }
}

class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        child: Image.asset(
      Constants.news,
      width: 25,
      height: 25,
      color: AppColor.black,
    ));
  }
}

class Product extends StatelessWidget {
  const Product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        child: Image.asset(
      Constants.product,
      width: 25,
      height: 25,
      color: AppColor.black,
    ));
  }
}

class PicFund extends StatelessWidget {
  const PicFund({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        child: Image.asset(
      Constants.picfund,
      width: 25,
      height: 25,
      color: AppColor.black,
    ));
  }
}

class Calender extends StatelessWidget {
  const Calender(
      {this.color = AppColor.blueColor,
      required this.height,
      required this.width,
      Key? key})
      : super(key: key);
  final Color color;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 4,
        top: 6,
      ),
      child: Image.asset(
        Constants.calender,
        color: color,
        width: width,
        height: height,
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Image.asset(
        Constants.home,
        color: AppColor.black,
        width: 20,
        height: 20,
      ),
    );
  }
}

class Portofolio extends StatelessWidget {
  const Portofolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Image.asset(
        Constants.portofolio,
        color: AppColor.black,
        width: 20,
        height: 20,
      ),
    );
  }
}

class Redemption extends StatelessWidget {
  const Redemption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Image.asset(
        Constants.redemption,
        color: AppColor.black,
        width: 20,
        height: 20,
      ),
    );
  }
}

class F2F extends StatelessWidget {
  const F2F({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Image.asset(
        Constants.f2f,
        color: AppColor.black,
        width: 20,
        height: 20,
      ),
    );
  }
}

class Report extends StatelessWidget {
  const Report({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Image.asset(
        Constants.report,
        color: AppColor.black,
        width: 20,
        height: 20,
      ),
    );
  }
}

class Branches extends StatelessWidget {
  const Branches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Image.asset(
        Constants.branches,
        color: AppColor.whiteColor,
        width: 20,
        height: 20,
      ),
    );
  }
}

class LogoNit extends StatelessWidget {
  const LogoNit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Constants.logonit,
      width: 60,
      height: 60,
    );
  }
}

class IcPurchases extends StatelessWidget {
  const IcPurchases({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Constants.icpurchases,
      color: AppColor.dimblack,
      width: 25,
      height: 25,
    );
  }
}

class IcFund extends StatelessWidget {
  const IcFund({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Constants.icfund,
      color: AppColor.dimblack,
      width: 25,
      height: 25,
    );
  }
}

class CheckBoxContainer extends StatefulWidget {
  CheckBoxContainer({
    required this.isChecked,
    Key? key,
  }) : super(key: key);
  bool isChecked;

  @override
  State<CheckBoxContainer> createState() => _CheckBoxContainerState();
}

class _CheckBoxContainerState extends State<CheckBoxContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.lightGreyColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
            width: 15,
            child: Checkbox(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              tristate: true,
              splashRadius: 10.0,
              checkColor: AppColor.whiteColor,
              activeColor: AppColor.blueColor,
              value: widget.isChecked,
              onChanged: (bool? value) {
                setState(() {
                  widget.isChecked = value!;
                });
              },
            ),
          ),
          Expanded(
            child: Column(
              children: [
                RichText(
                    text: const TextSpan(
                        text:
                            'I have read understood the guidlines as stated in the',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                        children: [
                      TextSpan(
                        text:
                            'offering Documents / truest Deed & Fund Manager Report of',
                      )
                    ])),
              ],
            ),
          ),
          // Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,children: [  const RestInvestTitle(
          //   text: "I have read understood the guidlines as stated in the",
          //   fontSize: 11,fontWeight: FontWeight.w900,
          // ),
          //   const HeadingText(
          //     text: "offering Documents / truest Deed & Fund Manager Report of",
          //     underlineColor: AppColor.blueColor,
          //     textColor: AppColor.blueColor,
          //     fontSize: 11,fontWeight: FontWeight.w900,
          //   ),
          //   const RestInvestTitle(
          //     text: "the fund and the risk involved.",
          //     fontSize: 11,fontWeight: FontWeight.w900,
          //   ),
          //   const   SizedBox(height: 10,),
          //   Row(children:const [
          //     RestInvestTitle(
          //       text: "I confirm acceptance of",
          //       fontSize: 11,fontWeight: FontWeight.w900,
          //     ),
          //     HeadingText(
          //       text: "Term & Conditions",
          //       underlineColor: AppColor.blueColor,
          //       textColor: AppColor.blueColor,
          //       fontSize: 11,fontWeight: FontWeight.w900,
          //     ),
          //     RestInvestTitle(
          //       text: "and all charges governing in",
          //       fontSize: 11,fontWeight: FontWeight.w900,
          //     )
          //   ],),
          //   const RestInvestTitle(
          //     text: "in this transaction.",
          //     fontSize: 11,fontWeight: FontWeight.w900,
          //   )
          // ],)
        ],
      ),
      height: 80,
    );
  }
}

class IcCatagory extends StatelessWidget {
  const IcCatagory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Constants.iccategory,
      color: AppColor.dimblack,
      width: 25,
      height: 25,
    );
  }
}

class Nav extends StatelessWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Image.asset(
        Constants.nav,
        color: AppColor.whiteColor,
        width: 20,
        height: 20,
      ),
    );
  }
}

class Learning extends StatelessWidget {
  const Learning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Image.asset(
        Constants.learning,
        color: AppColor.whiteColor,
        width: 20,
        height: 20,
      ),
    );
  }
}

class Complaint extends StatelessWidget {
  const Complaint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Image.asset(
        Constants.complaint,
        color: AppColor.black,
        width: 20,
        height: 20,
      ),
    );
  }
}

class Logout extends StatelessWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Image.asset(
        Constants.logout,
        color: AppColor.black,
        width: 25,
        height: 25,
      ),
    );
  }
}

class Purchase extends StatelessWidget {
  const Purchase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Image.asset(
        Constants.purchase,
        color: AppColor.black,
        width: 20,
        height: 20,
      ),
    );
  }
}

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Image.asset(
        Constants.calculator,
        color: AppColor.black,
        width: 25,
        height: 25,
      ),
    );
  }
}

class DailyNav extends StatelessWidget {
  const DailyNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Image.asset(
        Constants.dailynav,
        color: AppColor.black,
        width: 25,
        height: 25,
      ),
    );
  }
}

class DropDownContainerIcon extends StatelessWidget {
  const DropDownContainerIcon({
    required this.text1,
    required this.text,
    required this.textColor,
    required this.voidcallback,
    this.color = AppColor.dimblack,
    required this.fontsize,
    required this.fontWeight,
    Key? key,
  }) : super(key: key);
  final String text1;
  final Color textColor;
  final fontWeight;
  final Color color;
  final String? text;
  final voidcallback;
  final double fontsize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text!,
          style: TextStyle(color: AppColor.black, fontWeight: fontWeight),
        ),
        SizedBox(
          height: 35,
          child: DropDownContainer(
            text: text1,
            color: color,
            icon: const Icon(
              Icons.keyboard_arrow_down,
              size: 35,
              color: AppColor.blueColor,
            ),
            voidcallback: voidcallback,
            isSquare: true,
            height: 35,
          ),
        ),
      ],
    );
  }
}

class CustomCreditContainer extends StatelessWidget {
  const CustomCreditContainer({
    required this.investtext,
    required this.text1,
    required this.text2,
    required this.credittext,
    Key? key,
  }) : super(key: key);
  final String investtext;
  final String credittext;
  final String text2;
  final text1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: EmptyRowContainer(
          color: AppColor.blueColor,
          hintColor: AppColor.black,
          hint: text1,
          fontWeight: FontWeight.w900,
          text: investtext,
          fontsize: 12,
          textColor: AppColor.black,
        )),
        const SizedBox(
          width: 6,
        ),
        Expanded(
            child: EmptyRowContainer(
          color: AppColor.blueColor,
          hintColor: AppColor.black,
          hint: text2,
          text: credittext,
          fontWeight: FontWeight.w900,
          fontsize: 12,
          textColor: AppColor.black,
        ))
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
      this.icon,
      required this.containerColor,
      this.height = 70,
      required this.voidcallback,
      this.textColor = Colors.black})
      : super(key: key);
  final String text;

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
                  style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
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
                  style:
                      TextStyle(color: textColor, fontWeight: FontWeight.w900),
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
    required this.text,
    required this.voidcallback,
    required this.isSquare,
    this.color = AppColor.dimblack,
    this.textColor,
  }) : super(key: key);

  final double height;
  final bool isSquare;
  final VoidCallback voidcallback;
  final String text;
  final Color color;

  final textColor;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            border: Border.all(
              width: 1, color: AppColor.black,
              // color: textColor,
            ),
            borderRadius: isSquare
                ? BorderRadius.vertical(
                    top: Radius.circular(0),
                    bottom: Radius.circular(0),
                  )
                : BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 8, left: 6),
            child: Text(
              text,
              style: TextStyle(color: textColor),
              textAlign: TextAlign.start,
            ),
          ),
          height: 45,
        ),
      ),
    ]);
  }
}

class FromFundDropDownContainer extends StatefulWidget {
  const FromFundDropDownContainer({
    required this.nitText,
    required this.fundText,
    Key? key,
  }) : super(key: key);
  final String? nitText;
  final String? fundText;

  @override
  State<FromFundDropDownContainer> createState() =>
      _FromFundDropDownContainerState();
}

class _FromFundDropDownContainerState extends State<FromFundDropDownContainer> {
  String fundTitle = "";

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      RestInvestTitle(
        text: widget.fundText!,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      const SizedBox(
        height: 30,
      ),
      InkWell(
        onTap: () {
          setState(() {
            fundTitle = widget.nitText!;
            Navigator.pop(context);
          });
        },
        child: RestInvestTitle(
          text: widget.nitText!,
          fontSize: 18,
        ),
      ),
    ]);
  }
}

class DropDownContainer extends StatelessWidget {
  const DropDownContainer({
    Key? key,
    this.height = 70,
    this.text,
    required this.voidcallback,
    required this.isSquare,
    this.color = AppColor.dimblack,
    required this.icon,
  }) : super(key: key);

  final double height;
  final Color color;
  final text;
  final isSquare;
  final voidcallback;
  final icon;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Expanded(
        child: Material(
          child: InkWell(
            onTap: voidcallback,
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                border: Border.all(
                  width: 1,
                  color: color,
                ),
                borderRadius: isSquare
                    ? BorderRadius.vertical(
                        top: Radius.circular(0),
                        bottom: Radius.circular(0),
                      )
                    : BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(text),
                  ),
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
  EmptyRowContainer({
    required this.hint,
    required this.textColor,
    required this.fontsize,
    this.color = AppColor.dimblack,
    this.fontWeight,
    required this.hintColor,
    this.text,
    Key? key,
  }) : super(key: key);
  final String hint;
  final fontWeight;
  final double fontsize;
  final Color color;
  final Color textColor;

  final hintColor;
  final text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
              color: textColor, fontSize: fontsize, fontWeight: fontWeight),
        ),
        SizedBox(
          height: 35,
          child: RoundContainer(
            color: color,
            text: hint,
            isSquare: true,
            voidcallback: () {},
            textColor: hintColor,
          ),
        ),
        const SizedBox(
          width: 6,
        ),
      ],
    );
  }
}

class EmptyContainer extends StatelessWidget {
  const EmptyContainer({
    required this.hint,
    required this.textColor,
    required this.hintColor,
    this.text,
    Key? key,
  }) : super(key: key);
  final hint;
  final Color textColor;
  final hintColor;
  final text;

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
            text: hint,
            isSquare: true,
            voidcallback: () {},
            textColor: hintColor,
          ),
        ),
        const SizedBox(
          width: 6,
        ),
      ],
    );
  }
}

class DropDownAccountValueButton extends StatefulWidget {
  const DropDownAccountValueButton({
    required this.accountText,
    required this.hintText,
    required this.titleText,
    Key? key,
  }) : super(key: key);
  final String? accountText;
  final String? hintText;
  final String? titleText;

  @override
  State<DropDownAccountValueButton> createState() =>
      _DropDownAccountValueButtonState();
}

class _DropDownAccountValueButtonState
    extends State<DropDownAccountValueButton> {
  String account = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RestInvestTitle(
          text: widget.accountText!,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(
          height: 30,
        ),
        InkWell(
          onTap: () {
            setState(() {
              account = widget.hintText!;
              Navigator.pop(context);
            });
          },
          child: RestInvestTitle(
            text: widget.hintText!,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            setState(() {
              account = widget.titleText!;
              Navigator.pop(context);
            });
          },
          child: RestInvestTitle(
            text: widget.titleText!,
            fontSize: 16,
          ),
        )
      ],
    );
  }
}

class AccountDropDownContainer extends StatefulWidget {
  const AccountDropDownContainer({
    required this.titleText,
    required this.hintText,
    Key? key,
  }) : super(key: key);
  final String? titleText;
  final String? hintText;

  @override
  State<AccountDropDownContainer> createState() =>
      _AccountDropDownContainerState();
}

class _AccountDropDownContainerState extends State<AccountDropDownContainer> {
  String amount = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              amount = widget.titleText!;
              Navigator.pop(context);
            });
          },
          child: RestInvestTitle(
            text: widget.titleText!,
          ),
        ),
        const SizedBox(height: 15),
        const CustomDivider(),
        const SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: () {
            setState(() {
              amount = widget.hintText!;
              Navigator.pop(context);
            });
          },
          child: RestInvestTitle(
            text: widget.hintText!,
          ),
        ),
        const SizedBox(height: 15),
        const CustomDivider(),
      ],
    );
  }
}

class NavDropDownContainer extends StatefulWidget {
  const NavDropDownContainer({
    required this.selectText,
    required this.nitText,
    required this.nitiifText,
    required this.niutText,
    required this.nitgbfText,
    required this.nitifText,
    required this.nitmmfText,
    required this.nitsefText,
    required this.nitemofText,
    required this.nitpfText,
    required this.nitipfText,
    required this.nitpfsefText,
    required this.nitpfmsfText,
    required this.nitpfdsText,
    required this.nitpfcsText,
    required this.nitipfesText,
    required this.nitipfmsfText,
    required this.nitipfdsfText,
    required this.nitaaafText,
    required this.nitpgtText,
    required this.nitimmfText,
    Key? key,
  }) : super(key: key);
  final String? selectText;
  final String? nitText;
  final String? nitiifText;
  final String? niutText;
  final String? nitgbfText;
  final String? nitifText;
  final String? nitmmfText;
  final String? nitsefText;
  final String? nitemofText;
  final String? nitpfText;
  final String? nitipfText;
  final String? nitpfsefText;
  final String? nitpfmsfText;
  final String? nitpfdsText;
  final String? nitpfcsText;
  final String? nitipfesText;
  final String? nitipfmsfText;
  final String? nitipfdsfText;
  final String? nitaaafText;
  final String? nitpgtText;
  final String? nitimmfText;

  @override
  State<NavDropDownContainer> createState() => _NavDropDownContainerState();
}

class _NavDropDownContainerState extends State<NavDropDownContainer> {
  String select = "";
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                select = widget.selectText!;

                Navigator.pop(context);
              });
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.selectText!,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Radio(
                    value: 1,
                    groupValue: _value,
                    onChanged: (int? value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ),
                ]),
          ),
          const CustomDivider(),
          InkWell(
            onTap: () {
              setState(() {
                select = widget.nitText!;
                Navigator.pop(context);
              });
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.nitText!,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Radio(
                    value: 2,
                    groupValue: _value,
                    onChanged: (int? value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ),
                ]),
          ),
          const CustomDivider(),
          InkWell(
            onTap: () {
              setState(() {
                select = widget.nitiifText!;
                Navigator.pop(context);
              });
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.nitiifText!,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Radio(
                    value: 3,
                    groupValue: _value,
                    onChanged: (int? value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ),
                ]),
          ),
          const CustomDivider(),
          InkWell(
            onTap: () {
              setState(() {
                select = widget.niutText!;
                Navigator.pop(context);
              });
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.niutText!,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Radio(
                    value: 4,
                    groupValue: _value,
                    onChanged: (int? value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ),
                ]),
          ),
          const CustomDivider(),
          InkWell(
            onTap: () {
              setState(() {
                select = widget.nitgbfText!;
                Navigator.pop(context);
              });
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.nitgbfText!,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Radio(
                    value: 5,
                    groupValue: _value,
                    onChanged: (int? value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ),
                ]),
          ),
          const CustomDivider(),
          InkWell(
            onTap: () {
              setState(() {
                select = widget.nitifText!;
                Navigator.pop(context);
              });
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.nitifText!,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Radio(
                    value: 6,
                    groupValue: _value,
                    onChanged: (int? value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ),
                ]),
          ),
          const CustomDivider(),
          InkWell(
            onTap: () {
              setState(() {
                select = widget.nitmmfText!;
                Navigator.pop(context);
              });
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.nitmmfText!,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Radio(
                    value: 7,
                    groupValue: _value,
                    onChanged: (int? value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ),
                ]),
          ),
          const CustomDivider(),
          InkWell(
            onTap: () {
              setState(() {
                select = widget.nitsefText!;
                Navigator.pop(context);
              });
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.nitsefText!,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Radio(
                    value: 8,
                    groupValue: _value,
                    onChanged: (int? value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ),
                ]),
          ),
          const CustomDivider(),
          InkWell(
            onTap: () {
              setState(() {
                select = widget.nitemofText!;
                Navigator.pop(context);
              });
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.nitemofText!,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Radio(
                    value: 9,
                    groupValue: _value,
                    onChanged: (int? value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ),
                ]),
          ),
          const CustomDivider(),
          InkWell(
            onTap: () {
              setState(() {
                select = widget.nitpfText!;
                Navigator.pop(context);
              });
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.nitpfText!,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Radio(
                    value: 10,
                    groupValue: _value,
                    onChanged: (int? value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ),
                ]),
          ),
          const CustomDivider(),
          InkWell(
            onTap: () {
              setState(() {
                select = widget.nitipfText!;
                Navigator.pop(context);
              });
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.nitipfText!,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Radio(
                    value: 11,
                    groupValue: _value,
                    onChanged: (int? value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ),
                ]),
          ),
          const CustomDivider(),
          InkWell(
            onTap: () {
              setState(() {
                select = widget.nitpfsefText!;
                Navigator.pop(context);
              });
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.nitpfsefText!,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Radio(
                    value: 12,
                    groupValue: _value,
                    onChanged: (int? value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ),
                ]),
          ),
          const CustomDivider(),
          InkWell(
            onTap: () {
              setState(() {
                select = widget.nitpfmsfText!;
                Navigator.pop(context);
              });
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.nitpfmsfText!,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Radio(
                    value: 13,
                    groupValue: _value,
                    onChanged: (int? value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ),
                ]),
          ),
          const CustomDivider(),
          InkWell(
            onTap: () {
              setState(() {
                select = widget.nitpfdsText!;
                Navigator.pop(context);
              });
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.nitpfdsText!,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Radio(
                    value: 14,
                    groupValue: _value,
                    onChanged: (int? value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ),
                ]),
          ),
          const CustomDivider(),
          InkWell(
            onTap: () {
              setState(() {
                select = widget.nitpfcsText!;
                Navigator.pop(context);
              });
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.nitpfcsText!,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Radio(
                    value: 15,
                    groupValue: _value,
                    onChanged: (int? value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ),
                ]),
          ),
          const CustomDivider(),
          InkWell(
            onTap: () {
              setState(() {
                select = widget.nitipfmsfText!;
                Navigator.pop(context);
              });
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.nitipfmsfText!,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Radio(
                    value: 16,
                    groupValue: _value,
                    onChanged: (int? value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ),
                ]),
          ),
          const CustomDivider(),
          InkWell(
            onTap: () {
              setState(() {
                select = widget.nitipfdsfText!;
                Navigator.pop(context);
              });
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.nitipfdsfText!,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Radio(
                    value: 17,
                    groupValue: _value,
                    onChanged: (int? value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ),
                ]),
          ),
          const CustomDivider(),
          InkWell(
            onTap: () {
              setState(() {
                select = widget.nitaaafText!;
                Navigator.pop(context);
              });
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.nitaaafText!,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Radio(
                    value: 18,
                    groupValue: _value,
                    onChanged: (int? value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ),
                ]),
          ),
          const CustomDivider(),
          InkWell(
            onTap: () {
              setState(() {
                select = widget.nitpgtText!;
                Navigator.pop(context);
              });
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.nitpgtText!,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Radio(
                    value: 19,
                    groupValue: _value,
                    onChanged: (int? value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ),
                ]),
          ),
          const CustomDivider(),
          InkWell(
            onTap: () {
              setState(() {
                select = widget.nitimmfText!;
                Navigator.pop(context);
              });
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.nitimmfText!,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Radio(
                    value: 20,
                    groupValue: _value,
                    onChanged: (int? value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}

class FundTransferDroDownContainer extends StatefulWidget {
  const FundTransferDroDownContainer({
    required this.niutText,
    required this.nitgbText,
    required this.nitifText,
    required this.nitmmfText,
    required this.nitiifText,
    required this.nitaafText,
    required this.nitimmffText,
    Key? key,
  }) : super(key: key);

  final String? niutText;
  final String? nitgbText;
  final String? nitifText;
  final String? nitmmfText;
  final String? nitiifText;
  final String? nitaafText;
  final String? nitimmffText;

  @override
  State<FundTransferDroDownContainer> createState() =>
      _FundTransferDroDownContainerState();
}

class _FundTransferDroDownContainerState
    extends State<FundTransferDroDownContainer> {
  String fundTransfer = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              fundTransfer = widget.niutText!;
              Navigator.pop(context);
            });
          },
          child: RestInvestTitle(
            text: widget.niutText!,
          ),
        ),
        const SizedBox(height: 15),
        const CustomDivider(),
        const SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: () {
            setState(() {
              fundTransfer = widget.nitgbText!;
              Navigator.pop(context);
            });
          },
          child: RestInvestTitle(
            text: widget.nitgbText!,
          ),
        ),
        const SizedBox(height: 15),
        const CustomDivider(),
        const SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: () {
            setState(() {
              fundTransfer = widget.nitifText!;
              Navigator.pop(context);
            });
          },
          child: RestInvestTitle(
            text: widget.nitifText!,
          ),
        ),
        const SizedBox(height: 15),
        const CustomDivider(),
        const SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: () {
            setState(() {
              fundTransfer = widget.nitmmfText!;
              Navigator.pop(context);
            });
          },
          child: RestInvestTitle(
            text: widget.nitmmfText!,
          ),
        ),
        const SizedBox(height: 15),
        const CustomDivider(),
        const SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: () {
            setState(() {
              fundTransfer = widget.nitiifText!;
              Navigator.pop(context);
            });
          },
          child: RestInvestTitle(
            text: widget.nitiifText!,
          ),
        ),
        const SizedBox(height: 15),
        const CustomDivider(),
        const SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: () {
            setState(() {
              fundTransfer = widget.nitaafText!;
              Navigator.pop(context);
            });
          },
          child: RestInvestTitle(
            text: widget.nitaafText!,
          ),
        ),
        const SizedBox(height: 15),
        const CustomDivider(),
        const SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: () {
            setState(() {
              fundTransfer = widget.nitimmffText!;
              Navigator.pop(context);
            });
          },
          child: RestInvestTitle(
            text: widget.nitimmffText!,
          ),
        ),
      ],
    );
  }
}

class DropDownSelectValueContainer extends StatefulWidget {
  DropDownSelectValueContainer({
    required this.fundText,
    required this.niText,
    required this.nitText,
    required this.nitfText,
    required this.niefText,
    required this.nimmText,
    required this.nifiText,
    required this.niaaText,
    required this.nitmfText,
    this.onTap,
    this.fontSize,
    Key? key,
    required this.space,
  }) : super(key: key);
  final String? fundText;
  final String? nitText;
  final String? nitfText;
  final String? niefText;
  final String? nimmText;
  final String? nifiText;
  final String? niaaText;
  final String? nitmfText;

  final String? niText;
  final onTap;
  final fontSize;

  final SizedBox space;

  @override
  State<DropDownSelectValueContainer> createState() =>
      _DropDownSelectValueContainerState();
}

class _DropDownSelectValueContainerState
    extends State<DropDownSelectValueContainer> {
  String fundName = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {},
            child: RestInvestTitle(
              text: widget.fundText!,
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              setState(() {
                fundName = widget.niText!;
                Navigator.pop(context);
              });
            },
            child: RestInvestTitle(
              text: widget.niText!,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              setState(() {
                fundName = widget.nitText!;
                Navigator.pop(context);
              });
            },
            child: RestInvestTitle(
              text: widget.nitText!,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              setState(() {
                fundName = widget.nitfText!;
                Navigator.pop(context);
              });
            },
            child: RestInvestTitle(
              text: widget.nitfText!,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              setState(() {
                fundName = widget.niefText!;
                Navigator.pop(context);
              });
            },
            child: RestInvestTitle(
              text: widget.niefText!,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              setState(() {
                fundName = widget.nimmText!;
                Navigator.pop(context);
              });
            },
            child: RestInvestTitle(
              text: widget.nimmText!,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              setState(() {
                fundName = widget.nifiText!;
                Navigator.pop(context);
              });
            },
            child: RestInvestTitle(
              text: widget.nifiText!,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              setState(() {
                fundName = widget.niaaText!;
                Navigator.pop(context);
              });
            },
            child: RestInvestTitle(
              text: widget.niaaText!,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              setState(() {
                fundName = widget.nitmfText!;
                Navigator.pop(context);
              });
            },
            child: RestInvestTitle(
              text: widget.nitmfText!,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}

class PaymentDropDownContainer extends StatefulWidget {
  PaymentDropDownContainer({
    required this.payText,
    required this.chequeText,
    required this.ibfText,
    required this.onlineText,
    Key? key,
  }) : super(key: key);
  final String? payText;
  final String? chequeText;
  final String? ibfText;
  final String? onlineText;

  @override
  State<PaymentDropDownContainer> createState() =>
      _PaymentDropDownContainerState();
}

class _PaymentDropDownContainerState extends State<PaymentDropDownContainer> {
  String payment = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RestInvestTitle(
          text: widget.payText!,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        const SizedBox(
          height: 30,
        ),
        InkWell(
          onTap: () {
            setState(() {
              payment = widget.chequeText!;
              Navigator.pop(context);
            });
          },
          child: RestInvestTitle(
            text: widget.chequeText!,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        InkWell(
          onTap: () {
            setState(() {
              payment = widget.ibfText!;
              Navigator.pop(context);
            });
          },
          child: RestInvestTitle(
            text: widget.ibfText!,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        InkWell(
          onTap: () {
            setState(() {
              payment = widget.onlineText!;
              Navigator.pop(context);
            });
          },
          child: RestInvestTitle(
            text: widget.onlineText!,
            fontSize: 18,
          ),
        )
      ],
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      isExpanded: true,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class CustomFundList extends StatelessWidget {
  const CustomFundList({
    required this.fundText,
    required this.dateText,
    required this.saleText,
    required this.purchaseText,
    required this.fontWeight,
    this.textSize = 12,
    Key? key,
  }) : super(key: key);
  final String fundText;
  final String dateText;
  final String saleText;
  final String purchaseText;
  final double textSize;
  final fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 8,
        right: 8,
      ),
      alignment: Alignment.center,
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: const {
          0: FlexColumnWidth(1.5),
          1: FlexColumnWidth(.8),
        },
        border: TableBorder.all(),
        children: [
          TableRow(children: [
            SizedBox(
              height: 35,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: RestInvestTitle(
                  margin: const EdgeInsets.only(top: 10),
                  textAlign: TextAlign.center,
                  text: fundText,
                  fontSize: textSize,
                  fontWeight: fontWeight,
                  textColor: AppColor.black,
                ),
              ),
            ),
            RestInvestTitle(
                margin: const EdgeInsets.only(top: 10),
                textAlign: TextAlign.center,
                text: dateText,
                fontSize: textSize,
                textColor: AppColor.black,
                fontWeight: fontWeight),
            RestInvestTitle(
                margin: const EdgeInsets.only(top: 10),
                textAlign: TextAlign.center,
                text: saleText,
                fontSize: textSize,
                textColor: AppColor.black,
                fontWeight: fontWeight),
            RestInvestTitle(
                margin: const EdgeInsets.only(top: 10),
                textAlign: TextAlign.center,
                text: purchaseText,
                fontSize: textSize,
                textColor: AppColor.black,
                fontWeight: fontWeight),
          ]),
          // TableRow(
          //     children: List.generate(3, (index) {
          //   return Text("data");

          // }))
        ],
      ),
    );
  }
}

class DialogBox extends StatelessWidget {
  const DialogBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // title: const Text('AlertDialog Title'),
      content: Row(
        children: const [
          CircularProgressIndicator(),
          SizedBox(
            width: 20,
          ),
          Text(
            "Please wait....",
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }
}


Future<void> customDialogPin (context){
  return showGeneralDialog(
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 700),
    context: context,
    pageBuilder: (_, __, ___) {
      return const DialogPinCode();
    },
    // transitionBuilder: (_, anim, __, child) {
    //   return SlideTransition(
    //     position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
    //     child: child,
    //   );
    // },
  );

}


class DialogPinCode extends StatelessWidget {
  const DialogPinCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // title: const Text('AlertDialog Title'),
      content: SizedBox(
        height: 140,
        width: Get.width / 1.2,
        child: Column(
          children: [
            Center(
                child: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 15.0),
                      child: Text(
                        "Invest In Trust",
                        style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Text(
                        "Pin Code sent to your email address successfully",
                        maxLines: 3,
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: const Text(
                    "OK",
                    style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
