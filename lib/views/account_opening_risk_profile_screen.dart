import 'dart:ui';

import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:investintrust/controller/account_opening_fatca_screen_controller.dart';
import 'package:investintrust/controller/account_opening_risk_profile_screen_controller.dart';
import 'package:investintrust/utils/constant.dart';
import '../widgets/datefield.dart';
import '../controller/account_opening_basic_information_screen_controller.dart';

import '../widgets/button.dart';

import '../utils/colors.dart';
import '../utils/lists.dart';

import '../widgets/textformfiled.dart';

import '../widgets/constant_widget.dart';

class AccountOpenRiskProfileScreen extends StatelessWidget {
  const AccountOpenRiskProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    final height = Get.height;
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
                  title: Logo(
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
                      Container(
                        // height: Get.height,
                        decoration: BoxDecoration(
                            border:
                            Border.all(width: 1, color: AppColor.blueColor)),
                        child: Column(children: [
                          const CustomTextContainer(
                            fontSize: 16,
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
                                Row(mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    RestInvestTitle(
                                      text: " OTP VERIFY > ",
                                      fontSize: 12,
                                      textAlign: TextAlign.start,
                                      textColor: AppColor.dimblack,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    RestInvestTitle(
                                      text: " BASIC INFORMATION > ",
                                      textAlign: TextAlign.start, fontSize: 12,
                                      textColor: AppColor.dimblack,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    RestInvestTitle(
                                      text: " FATCA > ",
                                      textAlign: TextAlign.start,
                                      textColor: AppColor.dimblack, fontSize: 12,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    RestInvestTitle(
                                      text: " RISK PROFILE > ",
                                      textAlign: TextAlign.start,
                                      textColor: AppColor.blueColor, fontSize: 12,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ],
                                ),
                                space,
                              const  RestInvestTitle(
                                  text: " RISK PROFILE FORM ",
                                  textAlign: TextAlign.start,
                                  textColor: AppColor.black, fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                ),


                                space,

                                space,
                                const RestInvestTitle(
                                  text:
                                  "AGE IN YEAR:*",
                                  textColor: AppColor.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                ),
                                Row(
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
                                      text: "BELOW 40",
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
                                      text: "ABOVE 60",
                                      textColor: AppColor.black,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w900,
                                    ),

                                  ],
                                ),
                                space,
                                const RestInvestTitle(
                                  text:
                                  "MARITAL STATUS:*",
                                  textColor: AppColor.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                ),
                                Row(
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
                                      text: "SINGLE",
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
                                      text: "MARRIED",
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
                                      text: "DIVORCED / WIDOW",
                                      textColor: AppColor.black,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w900,
                                    ),


                                  ],
                                ),
                                space,
                                const RestInvestTitle(
                                  text:
                                  "NO. OF DEPENDENT:*",
                                  textColor: AppColor.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                ),
                                Row(
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
                                      text: "ZERO",
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
                                      text: "FOUR",
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
                                      text: "FOUR SEVEN",
                                      textColor: AppColor.black,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w900,
                                    ),
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
                                      text: "ABOVE SEVEN",
                                      textColor: AppColor.black,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w900,
                                    ),

                                  ],
                                ),
                                space,
                                const RestInvestTitle(
                                  text:
                                  "OCCUPATION:*",
                                  textColor: AppColor.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                ),
                                Row(
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
                                      text: "RETIRED",
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
                                      text: "STUDENT",
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
                                      text: "SALARIED",
                                      textColor: AppColor.black,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w900,
                                    ),
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
                                      text: "BUSSINESS",
                                      textColor: AppColor.black,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w900,
                                    ),

                                  ],
                                ),
                                space,
                                const RestInvestTitle(
                                  text:
                                  "QUALIFICATION:*",
                                  textColor: AppColor.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                ),
                                Row(
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
                                      text: "MATRICULATION",
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
                                      text: "INTERMEDIATE",
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
                                      text: "BUSSINESS",
                                      textColor: AppColor.black,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w900,
                                    ),

                                  ],
                                ),
                               Row(children: [ Radio(
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
                                   text: "BUSSINESS",
                                   textColor: AppColor.black,
                                   fontSize: 8,
                                   fontWeight: FontWeight.w900,
                                 ), Radio(
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
                                   text: "BUSSINESS",
                                   textColor: AppColor.black,
                                   fontSize: 8,
                                   fontWeight: FontWeight.w900,
                                 ),],),




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
                                    const RestInvestTitle(
                                      text:
                                      "I accept that my investments is subject to market risks and a target return / dividend range or\ncapital protection cannot be guaranteed.I clearly understand, agree, acknowledge and accept\nthat my investment is subject to market price fluctuations and other risks inherent in all such\ninvestments. The risks emanate from various factors which include, but are not limited to,\nmarket risks, government regulation risks, credit risks, liquidity risks, settlement risks,\nredemption risks, Shari’ah non-compliance risks, dividend distribution taxation risks, and\nchanges in risks associated with trading volumes, liquidity and settlement systems in equity\nand debt markets. Past performance is not necessarily indicative of future results. Investment\nin mutual funds are not bank deposits and are neither issued by, insured by, obligation of, nor\notherwise supported by SECP, any Government Agency, Trustee (except to the extent\nspecifically stated in the constitutive documents) or any of the shareholders of National\nInvestment Trust Limited or any of the Pre-IPO Investors or any other bank or financial\ninstitution. Returns offered by Funds / Plans can be positive and / or negative and may increase\nor decrease subject to capital market conditions and risk profile of the selected Fund / Plan.\nHence, the value of investment may go below the invested amount. For further details, please\nrefer to the detailed risk disclosures and disclaimers contained in the Offering Documents,\nSupplementary Offering Documents and the latest Fund Manager Report available on our\nwebsite or by calling or writing to us.             ",
                                      textColor: AppColor.black,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w900,
                                    ),
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
