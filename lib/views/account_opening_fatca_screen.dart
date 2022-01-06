import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controller/account_opening_fatca_screen_controller.dart';

import '../widgets/button.dart';

import '../utils/colors.dart';
import '../utils/lists.dart';

import '../widgets/textformfiled.dart';

import '../widgets/constant_widget.dart';

class AccountOpenFatcaScreen extends StatelessWidget {
  const AccountOpenFatcaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    final height = Get.height;
    return GetBuilder<AccountOpenFatcaController>(
        init: AccountOpenFatcaController(),
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
                        fontSize: 16,
                        height: 35,
                        text: "FATCA",
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
                              children: const [
                                RestInvestTitle(
                                  text: " OTP VERIFY > ",
                                  textAlign: TextAlign.start,
                                  textColor: AppColor.dimblack,
                                  fontWeight: FontWeight.w900,
                                ),
                                RestInvestTitle(
                                  text: " BASIC INFORMATION > ",
                                  textAlign: TextAlign.start,
                                  textColor: AppColor.dimblack,
                                  fontWeight: FontWeight.w900,
                                ),
                                RestInvestTitle(
                                  text: " FATCA > ",
                                  textAlign: TextAlign.start,
                                  textColor: AppColor.blueColor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ],
                            ),
                            space,
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const RestInvestTitle(
                                        text: 'TITLE OF ACCOUNT:',
                                        textColor: AppColor.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w900,
                                      ),
                                      CustomTextFormField(
                                        isRounded: true,
                                        hint: "",
                                        hintColor: AppColor.black,
                                        // textInputType: TextInputType.emailAddress,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const RestInvestTitle(
                                        text: "CNIC / NICOP NUMBER",
                                        textColor: AppColor.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w900,
                                      ),
                                      CustomTextFormField(
                                        isRounded: true,
                                        hint: "",
                                        hintColor: AppColor.black,
                                        // textInputType: TextInputType.emailAddress,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            space,
                            const RestInvestTitle(
                              text: "PLACE OF BIRTH:",
                              textColor: AppColor.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                            ),
                            space,
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const RestInvestTitle(
                                        text: "COUNTRY:*",
                                        textColor: AppColor.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w900,
                                      ),
                                      Container(
                                        // margin: EdgeInsets.all(10.0),
                                        padding: const EdgeInsets.only(
                                            left: 10.0, right: 5.0),
                                        height: 35,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: AppColor.whiteColor,
                                            border: Border.all(
                                                width: 1,
                                                color: AppColor.black)),
                                        child: Center(
                                          child: DropdownButton(
                                            isExpanded: true,
                                            underline: Container(
                                              color: AppColor.whiteColor,
                                            ),

                                            borderRadius:
                                                BorderRadius.circular(6),
                                            // value: _.dropdownvalue,
                                            hint: RestInvestTitle(
                                              text: _.amountvalue == null ||
                                                      _.amountvalue == ""
                                                  ? "Account No."
                                                  : _.amountvalue,
                                              textColor: AppColor.black,
                                            ),
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down,
                                                color: AppColor.blueColor,
                                                size: 30),
                                            items: fromAccountItems.map(
                                                (String? fromAccountItems) {
                                              return DropdownMenuItem<String>(
                                                  value: fromAccountItems,
                                                  child:
                                                      Text(fromAccountItems!));
                                            }).toList(),
                                            onChanged: (String? value) {
                                              _.amountvalue = value!;
                                              _.update();
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const RestInvestTitle(
                                        text: "STATE:*",
                                        textColor: AppColor.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w900,
                                      ),
                                      Container(
                                        // margin: EdgeInsets.all(10.0),
                                        padding: const EdgeInsets.only(
                                            left: 10.0, right: 5.0),
                                        height: 35,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: AppColor.whiteColor,
                                            border: Border.all(
                                                width: 1,
                                                color: AppColor.black)),
                                        child: Center(
                                          child: DropdownButton(
                                            isExpanded: true,
                                            underline: Container(
                                              color: AppColor.whiteColor,
                                            ),

                                            borderRadius:
                                                BorderRadius.circular(6),
                                            // value: _.dropdownvalue,
                                            hint: RestInvestTitle(
                                              text: _.amountvalue == null ||
                                                      _.amountvalue == ""
                                                  ? "Account No."
                                                  : _.amountvalue,
                                              textColor: AppColor.black,
                                            ),
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down,
                                                color: AppColor.blueColor,
                                                size: 30),
                                            items: fromAccountItems.map(
                                                (String? fromAccountItems) {
                                              return DropdownMenuItem<String>(
                                                  value: fromAccountItems,
                                                  child:
                                                      Text(fromAccountItems!));
                                            }).toList(),
                                            onChanged: (String? value) {
                                              _.amountvalue = value!;
                                              _.update();
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            space,
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const RestInvestTitle(
                                        text: "CURRENT CITY:*",
                                        textColor: AppColor.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w900,
                                      ),
                                      Container(
                                        // margin: EdgeInsets.all(10.0),
                                        padding: const EdgeInsets.only(
                                            left: 10.0, right: 5.0),
                                        height: 35,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: AppColor.whiteColor,
                                            border: Border.all(
                                                width: 1,
                                                color: AppColor.black)),
                                        child: Center(
                                          child: DropdownButton(
                                            isExpanded: true,
                                            underline: Container(
                                              color: AppColor.whiteColor,
                                            ),

                                            borderRadius:
                                                BorderRadius.circular(6),
                                            // value: _.dropdownvalue,
                                            hint: RestInvestTitle(
                                              text: _.amountvalue == null ||
                                                      _.amountvalue == ""
                                                  ? "Account No."
                                                  : _.amountvalue,
                                              textColor: AppColor.black,
                                            ),
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down,
                                                color: AppColor.blueColor,
                                                size: 30),
                                            items: fromAccountItems.map(
                                                (String? fromAccountItems) {
                                              return DropdownMenuItem<String>(
                                                  value: fromAccountItems,
                                                  child:
                                                      Text(fromAccountItems!));
                                            }).toList(),
                                            onChanged: (String? value) {
                                              _.amountvalue = value!;
                                              _.update();
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            space,
                            const RestInvestTitle(
                              text:
                                  "COUNTRY OF TAX RESIDENCE\nOTHER THAN PAKISTAN:*",
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
                                  text: "NONE",
                                  textColor: AppColor.dimblack,
                                  fontSize: 12,
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
                                  text: "USA",
                                  textColor: AppColor.dimblack,
                                  fontSize: 12,
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
                                  text: "OTHERS",
                                  textColor: AppColor.dimblack,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                ),
                              ],
                            ),
                            const EmptyContainer(
                                fontWeight: FontWeight.w900,
                                text: "",
                                hint: "",
                                textColor: AppColor.black,
                                hintColor: AppColor.black),
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
                                const RestInvestTitle(
                                  text:
                                      "I hereby confirm that the information provided abpve is true,accurate and complete,I hereby,\n+indemnify and hold the harmful NITL against any and all losses action,claims,penalities,\ndemagesor liabilities that may arise in case the above information is found to  be incorrect.\nI further agree and undertake to notify NITL within 30 day calender if there is changes in\ninformation provided above.",
                                  textColor: AppColor.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                              ],
                            ),
                            space,
                            const RestInvestTitle(
                              text: "CRS FORM",
                              textColor: AppColor.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                            ),
                            space,
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const RestInvestTitle(
                                        text: "CURRENT CITY:*",
                                        textColor: AppColor.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w900,
                                      ),
                                      Container(
                                        // margin: EdgeInsets.all(10.0),
                                        padding: const EdgeInsets.only(
                                            left: 10.0, right: 5.0),
                                        height: 35,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: AppColor.whiteColor,
                                            border: Border.all(
                                                width: 1,
                                                color: AppColor.black)),
                                        child: Center(
                                          child: DropdownButton(
                                            isExpanded: true,
                                            underline: Container(
                                              color: AppColor.whiteColor,
                                            ),

                                            borderRadius:
                                                BorderRadius.circular(6),
                                            // value: _.dropdownvalue,
                                            hint: RestInvestTitle(
                                              text: _.amountvalue == null ||
                                                      _.amountvalue == ""
                                                  ? "Account No."
                                                  : _.amountvalue,
                                              textColor: AppColor.black,
                                            ),
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down,
                                                color: AppColor.blueColor,
                                                size: 30),
                                            items: fromAccountItems.map(
                                                (String? fromAccountItems) {
                                              return DropdownMenuItem<String>(
                                                  value: fromAccountItems,
                                                  child:
                                                      Text(fromAccountItems!));
                                            }).toList(),
                                            onChanged: (String? value) {
                                              _.amountvalue = value!;
                                              _.update();
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                const Expanded(
                                  child: EmptyContainer(
                                      text: "TIN NUMBER:",
                                      hint: "",
                                      textColor: AppColor.black,
                                      fontWeight: FontWeight.w900,
                                      hintColor: AppColor.black),
                                ),
                              ],
                            ),
                            space,
                            const RestInvestTitle(
                              text: "*DISCLAIMER:",
                              textColor: AppColor.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                            ),
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
