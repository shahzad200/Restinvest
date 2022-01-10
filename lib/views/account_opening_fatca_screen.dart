import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:investintrust/views/account_opening_risk_profile_screen.dart';
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
              title: Padding(
                padding:  EdgeInsets.only(right: Get.width/6),
                child: Logo(
                  height: 50,
                  width: 50,
                ),
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
                                        controller: _.titleController,
                                        textInputType: TextInputType.text,
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
                                        controller: _.cnicController,
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
                                              text: _.countryValue == null ||
                                                      _.countryValue == ""
                                                  ? "Account No."
                                                  : _.countryValue,
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
                                              _.countryValue = value!;
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
                                              text: _.stateValue == null ||
                                                      _.stateValue == ""
                                                  ? "Account No."
                                                  : _.stateValue,
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
                                              _.stateValue = value!;
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
                                              text: _.cityValue == null ||
                                                      _.cityValue == ""
                                                  ? "Account No."
                                                  : _.cityValue,
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
                                              _.cityValue = value!;
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
                                SizedBox(
                                  height:15,
                                  width: 15,
                                  child: Checkbox(
                                      checkColor: AppColor.whiteColor,
                                      fillColor: MaterialStateColor.resolveWith(
                                          (states) => AppColor.blueColor),
                                      value: _.termsConditions,
                                      onChanged: (bool? val) {
                                        _.termsConditions = val!;
                                        _.update();
                                      }),
                                ),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: const RestInvestTitle(
                                    text:
                                        "I hereby confirm that the information provided abpve is true,accurate and complete,I hereby,+indemnify and hold the harmful NITL against any and all losses action,claims,penalities,demagesor liabilities that may arise in case the above information is found to  be incorrect.I further agree and undertake to notify NITL within 30 day calender if there is changes ininformation provided above.",
                                    textColor: AppColor.black,
                                    textAlign: TextAlign.justify,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
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
                                              text: _.cityValue2 == null ||
                                                      _.cityValue2 == ""
                                                  ? "Account No."
                                                  : _.cityValue2,
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
                                              _.cityValue2 = value!;
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
                                  child: EmptyContainer(
                                      text: "TIN NUMBER:",
                                      hint: "${_.tinNumber}",
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
                            SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height:15,
                                  width: 15,
                                  child: Checkbox(
                                      checkColor: AppColor.whiteColor,
                                      fillColor: MaterialStateColor.resolveWith(
                                          (states) => AppColor.blueColor),
                                      value: _.isChecked,
                                      onChanged: (bool? val) {
                                        _.isChecked = val!;
                                        _.update();
                                      }),
                                ),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: const RestInvestTitle(
                                    text:
                                    "I accept that my investments is subject to market risks and a target return / dividend range or capital protection cannot be guaranteed.I clearly understand, agree, acknowledge and accept that my investment is subject to market price fluctuations and other risks inherent in all such investments. The risks emanate from various factors which include, but are not limited to, market risks, government regulation risks, credit risks, liquidity risks, settlement risks, redemption risks, Shari’ah non-compliance risks, dividend distribution taxation risks, and changes in risks associated with trading volumes, liquidity and settlement systems in equity and debt markets. Past performance is not necessarily indicative of future results. Investment in mutual funds are not bank deposits and are neither issued by, insured by, obligation of, nor otherwise supported by SECP, any Government Agency, Trustee (except to the extentspecifically stated in the constitutive documents) or any of the shareholders of NationalInvestment Trust Limited or any of the Pre-IPO Investors or any other bank or financialinstitution. Returns offered by Funds / Plans can be positive and / or negative and may increaseor decrease subject to capital market conditions and risk profile of the selected Fund / Plan.Hence, the value of investment may go below the invested amount. For further details, pleaserefer to the detailed risk disclosures and disclaimers contained in the Offering Documents,Supplementary Offering Documents and the latest Fund Manager Report available on ourwebsite or by calling or writing to us.",
                                    textColor: AppColor.black,
                                    textAlign: TextAlign.justify,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                            space,
                            CustomRoundButton(
                                height: 35,
                                text: "SAVE&NEXT",
                                onPress: () {
                                  // _.onSave();
                                  Get.to(AccountOpenRiskProfileScreen());
                                },
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
