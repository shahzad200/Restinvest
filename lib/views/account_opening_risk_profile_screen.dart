import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controller/account_opening_risk_profile_screen_controller.dart';

import '../widgets/button.dart';

import '../utils/colors.dart';

import '../widgets/constant_widget.dart';

class AccountOpenRiskProfileScreen extends StatelessWidget {
  const AccountOpenRiskProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final width = Get.width;
    // final height = Get.height;
    return GetBuilder<AccountOpenRiskProfileScreenController>(
        init: AccountOpenRiskProfileScreenController(),
        builder: (_) {
          var space = const SizedBox(
            height: 10,
          );
          return SafeArea(
              child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: AppColor.whiteColor,
              title: const Logo(
                height: 50,
                width: 50,
              ),
              elevation: 0,
            ),
            key: _.scaffoldKey,
            body: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: [
                  space,
                  const RestInvestTitle(
                    text: " NITL DIGITAL ACCOUNT OPENING FORM ",
                    textAlign: TextAlign.start,
                    fontSize: 14,
                    textColor: AppColor.blueColor,
                    fontWeight: FontWeight.w900,
                  ),
                  Container(
                    // height: Get.height,
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 1, color: AppColor.blueColor)),
                    child: Column(children: [
                      const CustomTextContainer(
                        fontSize: 14,
                        height: 35,
                        text: "RISK PROFILE",
                        textAlign: TextAlign.start,
                      ),
                      space,
                      SingleChildScrollView(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                RestInvestTitle(
                                  text: " OTP VERIFY > ",
                                  fontSize: 8,
                                  textAlign: TextAlign.start,
                                  textColor: AppColor.dimblack,
                                  fontWeight: FontWeight.w900,
                                ),
                                RestInvestTitle(
                                  text: " BASIC INFORMATION > ",
                                  textAlign: TextAlign.start,
                                  fontSize: 8,
                                  textColor: AppColor.dimblack,
                                  fontWeight: FontWeight.w900,
                                ),
                                RestInvestTitle(
                                  text: " FATCA > ",
                                  textAlign: TextAlign.start,
                                  textColor: AppColor.dimblack,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                                RestInvestTitle(
                                  text: " RISK PROFILE > ",
                                  textAlign: TextAlign.start,
                                  textColor: AppColor.blueColor,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                              ],
                            ),
                            space,
                            const RestInvestTitle(
                              text: " RISK PROFILE FORM ",
                              textAlign: TextAlign.start,
                              textColor: AppColor.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                            ),
                            space,
                            space,
                            const RestInvestTitle(
                              text: "Age In Year:*",
                              textColor: AppColor.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Radio(
                                  value: 0,
                                  groupValue: _.charactor,
                                  onChanged: (int? val) {
                                    _.charactor = val!;
                                    _.update();
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColor.blueColor),
                                ),
                                const RestInvestTitle(
                                  text: "Below 40",
                                  textColor: AppColor.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                                Radio(
                                  value: 1,
                                  groupValue: _.charactor,
                                  onChanged: (int? val) {
                                    _.charactor = val!;
                                    _.update();
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColor.blueColor),
                                ),
                                const RestInvestTitle(
                                  text: "41-50",
                                  textColor: AppColor.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                                Radio(
                                  value: 2,
                                  groupValue: _.charactor,
                                  onChanged: (int? val) {
                                    _.charactor = val!;
                                    _.update();
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColor.blueColor),
                                ),
                                const RestInvestTitle(
                                  text: "51-60",
                                  textColor: AppColor.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: 3,
                                  groupValue: _.charactor,
                                  onChanged: (int? val) {
                                    _.charactor = val!;
                                    _.update();
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColor.blueColor),
                                ),
                                const RestInvestTitle(
                                  text: "Above 60",
                                  textColor: AppColor.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                              ],
                            ),
                            space,
                            const RestInvestTitle(
                              text: "Martial Status:*",
                              textColor: AppColor.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Radio(
                                  value: 0,
                                  groupValue: _.status,
                                  onChanged: (int? val) {
                                    _.status = val!;
                                    _.update();
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColor.blueColor),
                                ),
                                const RestInvestTitle(
                                  text: "Single",
                                  textColor: AppColor.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                                Radio(
                                  value: 1,
                                  groupValue: _.status,
                                  onChanged: (int? val) {
                                    _.status = val!;
                                    _.update();
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColor.blueColor),
                                ),
                                const RestInvestTitle(
                                  text: "Married",
                                  textColor: AppColor.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                                Radio(
                                  value: 2,
                                  groupValue: _.status,
                                  onChanged: (int? val) {
                                    _.status = val!;
                                    _.update();
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColor.blueColor),
                                ),
                                const RestInvestTitle(
                                  text: "Divorced / Widow",
                                  textColor: AppColor.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                              ],
                            ),

                            space,
                            const RestInvestTitle(
                              text: "No. Of Dependent:*",
                              textColor: AppColor.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Radio(
                                  value: 0,
                                  groupValue: _.dependent,
                                  onChanged: (int? val) {
                                    _.dependent = val!;
                                    _.update();
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColor.blueColor),
                                ),
                                const RestInvestTitle(
                                  text: "Zero",
                                  textColor: AppColor.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                                Radio(
                                  value: 1,
                                  groupValue: _.dependent,
                                  onChanged: (int? val) {
                                    _.dependent = val!;
                                    _.update();
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColor.blueColor),
                                ),
                                const RestInvestTitle(
                                  text: "Four",
                                  textColor: AppColor.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                                Radio(
                                  value: 2,
                                  groupValue: _.dependent,
                                  onChanged: (int? val) {
                                    _.dependent = val!;
                                    _.update();
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColor.blueColor),
                                ),
                                const RestInvestTitle(
                                  text: "Four Seven",
                                  textColor: AppColor.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: 3,
                                  groupValue: _.dependent,
                                  onChanged: (int? val) {
                                    _.dependent = val!;
                                    _.update();
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColor.blueColor),
                                ),
                                const RestInvestTitle(
                                  text: "Above Seven",
                                  textColor: AppColor.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                              ],
                            ),
                            space,
                            const RestInvestTitle(
                              text: "Occupation:*",
                              textColor: AppColor.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Radio(
                                  value: 0,
                                  groupValue: _.occupation,
                                  onChanged: (int? val) {
                                    _.occupation = val!;
                                    _.update();
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColor.blueColor),
                                ),
                                const RestInvestTitle(
                                  text: "Retired",
                                  textColor: AppColor.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                                Radio(
                                  value: 1,
                                  groupValue: _.occupation,
                                  onChanged: (int? val) {
                                    _.occupation = val!;
                                    _.update();
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColor.blueColor),
                                ),
                                const RestInvestTitle(
                                  text: "Student",
                                  textColor: AppColor.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                                Radio(
                                  value: 2,
                                  groupValue: _.occupation,
                                  onChanged: (int? val) {
                                    _.occupation = val!;
                                    _.update();
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColor.blueColor),
                                ),
                                const RestInvestTitle(
                                  text: "Salaried",
                                  textColor: AppColor.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: 3,
                                  groupValue: _.occupation,
                                  onChanged: (int? val) {
                                    _.occupation = val!;
                                    _.update();
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColor.blueColor),
                                ),
                                const RestInvestTitle(
                                  text: "Bussiness",
                                  textColor: AppColor.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                              ],
                            ),
                            space,
                            const RestInvestTitle(
                              text: "Qualification:*",
                              textColor: AppColor.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Radio(
                                  value: 0,
                                  groupValue: _.qualification,
                                  onChanged: (int? val) {
                                    _.qualification = val!;
                                    _.update();
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColor.blueColor),
                                ),
                                const RestInvestTitle(
                                  text: "Matriculation",
                                  textColor: AppColor.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                                Radio(
                                  value: 1,
                                  groupValue: _.qualification,
                                  onChanged: (int? val) {
                                    _.qualification = val!;
                                    _.update();
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColor.blueColor),
                                ),
                                const RestInvestTitle(
                                  text: "Intermediate",
                                  textColor: AppColor.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                              ],
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Radio(
                                  value: 3,
                                  groupValue: _.qualification,
                                  onChanged: (int? val) {
                                    _.qualification = val!;
                                    _.update();
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColor.blueColor),
                                ),
                                const RestInvestTitle(
                                  text: "Post Graduate",
                                  textColor: AppColor.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                                Radio(
                                  value: 4,
                                  groupValue: _.qualification,
                                  onChanged: (int? val) {
                                    _.qualification = val!;
                                    _.update();
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColor.blueColor),
                                ),
                                const RestInvestTitle(
                                  text: "Doctorate",
                                  textColor: AppColor.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: 2,
                                  groupValue: _.qualification,
                                  onChanged: (int? val) {
                                    _.qualification = val!;
                                    _.update();
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColor.blueColor),
                                ),
                                const RestInvestTitle(
                                  text: "Graduate",
                                  textColor: AppColor.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w900,
                                ),
                              ],
                            ),
                            space,
                            const RestInvestTitle(
                              text: "Your Investment Objective:*",
                              textColor: AppColor.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Radio(
                                  value: 0,
                                  groupValue: _.object,
                                  onChanged: (int? val) {
                                    _.object = val!;
                                    _.update();
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColor.blueColor),
                                ),
                                const RestInvestTitle(
                                  text: "Very High",
                                  textColor: AppColor.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                                Radio(
                                  value: 1,
                                  groupValue: _.object,
                                  onChanged: (int? val) {
                                    _.object = val!;
                                    _.update();
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColor.blueColor),
                                ),
                                const RestInvestTitle(
                                  text: "High",
                                  textColor: AppColor.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                                Radio(
                                  value: 3,
                                  groupValue: _.object,
                                  onChanged: (int? val) {
                                    _.object = val!;
                                    _.update();
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColor.blueColor),
                                ),
                                const RestInvestTitle(
                                  text: "Low",
                                  textColor: AppColor.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                              ],
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Radio(
                                  value: 4,
                                  groupValue: _.object,
                                  onChanged: (int? val) {
                                    _.object = val!;
                                    _.update();
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColor.blueColor),
                                ),
                                const RestInvestTitle(
                                  text: "Very Low",
                                  textColor: AppColor.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                                Radio(
                                  value: 2,
                                  groupValue: _.object,
                                  onChanged: (int? val) {
                                    _.object = val!;
                                    _.update();
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColor.blueColor),
                                ),
                                const RestInvestTitle(
                                  text: "Moderate",
                                  textColor: AppColor.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                              ],
                            ),
                            space,
                            const RestInvestTitle(
                              text: "Your Investment Horizon:*",
                              textColor: AppColor.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Radio(
                                  value: 0,
                                  groupValue: _.horzon,
                                  onChanged: (int? val) {
                                    _.horzon = val!;
                                    _.update();
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColor.blueColor),
                                ),
                                const RestInvestTitle(
                                  text: "Less than 1 year",
                                  textColor: AppColor.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                                Radio(
                                  value: 1,
                                  groupValue: _.horzon,
                                  onChanged: (int? val) {
                                    _.horzon = val!;
                                    _.update();
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColor.blueColor),
                                ),
                                const RestInvestTitle(
                                  text: "1 to 5 year",
                                  textColor: AppColor.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: 3,
                                  groupValue: _.horzon,
                                  onChanged: (int? val) {
                                    _.horzon = val!;
                                    _.update();
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColor.blueColor),
                                ),
                                const RestInvestTitle(
                                  text: "More than 10 year",
                                  textColor: AppColor.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                                Radio(
                                  value: 2,
                                  groupValue: _.horzon,
                                  onChanged: (int? val) {
                                    _.horzon = val!;
                                    _.update();
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColor.blueColor),
                                ),
                                const RestInvestTitle(
                                  text: "5 to 10 year",
                                  textColor: AppColor.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                              ],
                            ),
                            space,
                            const RestInvestTitle(
                              text:
                                  "Your Current Level of Investment  Knowledge:*",
                              textColor: AppColor.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Radio(
                                  value: 0,
                                  groupValue: _.knowledge,
                                  onChanged: (int? val) {
                                    _.knowledge = val!;
                                    _.update();
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColor.blueColor),
                                ),
                                const RestInvestTitle(
                                  text: "Little or no Knowledge",
                                  textColor: AppColor.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                                Radio(
                                  value: 1,
                                  groupValue: _.knowledge,
                                  onChanged: (int? val) {
                                    _.knowledge = val!;
                                    _.update();
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColor.blueColor),
                                ),
                                const RestInvestTitle(
                                  text: "Some Knowledge",
                                  textColor: AppColor.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: 3,
                                  groupValue: _.knowledge,
                                  onChanged: (int? val) {
                                    _.knowledge = val!;
                                    _.update();
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColor.blueColor),
                                ),
                                const RestInvestTitle(
                                  text:
                                      "Both Knowledge and Experienced in Investing",
                                  textColor: AppColor.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                              ],
                            ),
                            space,
                            const RestInvestTitle(
                              text:
                                  "Your Current Financial Position:In a year so,\nhow Secure do you feel financial will be?:*",
                              textColor: AppColor.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Radio(
                                  value: 0,
                                  groupValue: _.Currentposition,
                                  onChanged: (int? val) {
                                    _.Currentposition = val!;
                                    _.update();
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColor.blueColor),
                                ),
                                const RestInvestTitle(
                                  text: "Very Secure",
                                  textColor: AppColor.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                                Radio(
                                  value: 1,
                                  groupValue: _.Currentposition,
                                  onChanged: (int? val) {
                                    _.Currentposition = val!;
                                    _.update();
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColor.blueColor),
                                ),
                                const RestInvestTitle(
                                  text: "Somewhat Secure",
                                  textColor: AppColor.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: 2,
                                  groupValue: _.Currentposition,
                                  onChanged: (int? val) {
                                    _.Currentposition = val!;
                                    _.update();
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColor.blueColor),
                                ),
                                const RestInvestTitle(
                                  text: "Not Sure",
                                  textColor: AppColor.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                                Radio(
                                  value: 3,
                                  groupValue: _.Currentposition,
                                  onChanged: (int? val) {
                                    _.Currentposition = val!;
                                    _.update();
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColor.blueColor),
                                ),
                                const RestInvestTitle(
                                  text: "Likely Worse ",
                                  textColor: AppColor.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                              ],
                            ),
                            space,
                            Center(
                              child: CustomRoundButton(
                                  height: 35,
                                  width: 60,
                                  text: "CALCULATE",
                                  onPress: () {},
                                  isRound: false),
                            ),
                            space,
                            const RestInvestTitle(
                              text:
                                  "As Per your Risk Profile,We Suggest you to Select Stable Portfolio from the below table ",
                              fontSize: 10,
                              textAlign: TextAlign.start,
                              textColor: AppColor.black,
                              fontWeight: FontWeight.w900,
                            ),
                            space,

                            space,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Checkbox(
                                    checkColor: AppColor.whiteColor,
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => AppColor.blueColor),
                                    value: _.isChecked,
                                    onChanged: (bool? val) {
                                      _.isChecked = val!;
                                      _.update();
                                    }),
                                // const RestInvestTitle(
                                //   text:
                                //       "I accept that my investments is subject to market risks and a target return / dividend range or\ncapital protection cannot be guaranteed.I clearly understand, agree, acknowledge and accept\nthat my investment is subject to market price fluctuations and other risks inherent in all such\ninvestments. The risks emanate from various factors which include, but are not limited to,\nmarket risks, government regulation risks, credit risks, liquidity risks, settlement risks,\nredemption risks, Shari’ah non-compliance risks, dividend distribution taxation risks, and\nchanges in risks associated with trading volumes, liquidity and settlement systems in equity\nand debt markets. Past performance is not necessarily indicative of future results. Investment\nin mutual funds are not bank deposits and are neither issued by, insured by, obligation of, nor\notherwise supported by SECP, any Government Agency, Trustee (except to the extent\nspecifically stated in the constitutive documents) or any of the shareholders of National\nInvestment Trust Limited or any of the Pre-IPO Investors or any other bank or financial\ninstitution. Returns offered by Funds / Plans can be positive and / or negative and may increase\nor decrease subject to capital market conditions and risk profile of the selected Fund / Plan.\nHence, the value of investment may go below the invested amount. For further details, please\nrefer to the detailed risk disclosures and disclaimers contained in the Offering Documents,\nSupplementary Offering Documents and the latest Fund Manager Report available on our\nwebsite or by calling or writing to us.             ",
                                //   textColor: AppColor.black,
                                //   fontSize: 8,
                                //   fontWeight: FontWeight.w900,
                                // ),
                              ],
                            ),
                            space,
                            CustomRoundButton(
                                height: 35,
                                text: "SAVE&NEXT",
                                onPress: () {},
                                isRound: false),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ]),
                  )
                ],
              ),
            ),
          ));
        });
  }
}
