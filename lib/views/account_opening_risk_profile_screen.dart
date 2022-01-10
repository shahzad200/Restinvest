import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:investintrust/widgets/no_internet.dart';

import '../controller/account_opening_risk_profile_screen_controller.dart';

import '../widgets/button.dart';

import '../utils/colors.dart';

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
                  title: const Logo(
                    height: 50,
                    width: 50,
                  ),
                  elevation: 0,
                ),
                key: _.scaffoldKey,
                body: Stack(
                    children:[ SingleChildScrollView(
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
                                          fontSize: 12,
                                          textAlign: TextAlign.start,
                                          textColor: AppColor.dimblack,
                                          fontWeight: FontWeight.w900,
                                        ),
                                        RestInvestTitle(
                                          text: " BASIC INFORMATION > ",
                                          textAlign: TextAlign.start,
                                          fontSize: 12,
                                          textColor: AppColor.dimblack,
                                          fontWeight: FontWeight.w900,
                                        ),
                                        RestInvestTitle(
                                          text: " FATCA > ",
                                          textAlign: TextAlign.start,
                                          textColor: AppColor.dimblack,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w900,
                                        ),
                                        Expanded(
                                          child: RestInvestTitle(
                                            text: "RISK PROFILE >",
                                            textAlign: TextAlign.start,
                                            textColor: AppColor.blueColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ],
                                    ),
                                    space,
                                    const RestInvestTitle(
                                      text: " RISK PROFILE FORM ",
                                      textAlign: TextAlign.start,
                                      textColor: AppColor.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    space,
                                    const RestInvestTitle(
                                      text: "Age In Year:*",
                                      textColor: AppColor.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    _.isLoading || _.noInternet ?
                                    const SizedBox()
                                        : Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: _
                                          .newDigUserRegDataRpqList!
                                          .response!
                                          .ageRpqList!
                                          .map(
                                            (data) => RadioListTile<int>(
                                          title: Text(
                                            "${data.desc}",
                                            style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight:
                                                FontWeight.bold),
                                          ),
                                          groupValue:
                                          _.ageGroupValue,
                                          value: data.code ?? 00,
                                          onChanged: (val) {
                                            _.ageGroupValue =
                                                data!.code ?? 00;
                                            _.ageScore = data!.score!;
                                            _.update();
                                            if(_.isCalculate){
                                              _.calculateRisk();
                                            }
                                          },
                                          activeColor: MaterialStateColor
                                              .resolveWith((states) =>
                                          AppColor.blueColor),
                                        ),
                                      )
                                          .toList(),
                                    ),
                                    space,
                                    const RestInvestTitle(
                                      text: "Martial Status:*",
                                      textColor: AppColor.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    _.isLoading || _.noInternet ?
                                    const SizedBox()
                                        : Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: _
                                          .newDigUserRegDataRpqList!
                                          .response!
                                          .maritalStatusRpqList!
                                          .map(
                                            (data) => RadioListTile<int>(
                                          title: Text(
                                            "${data.desc}",
                                            style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight:
                                                FontWeight.bold),
                                          ),
                                          groupValue:
                                          _.maritalStatusGroupValue,
                                          value: data.code ?? 00,
                                          onChanged: (val) {
                                            _.maritalStatusGroupValue =
                                                data!.code ?? 00;
                                            _.maritalStatusScore = data!.score!;
                                            _.update();
                                            if(_.isCalculate){
                                              _.calculateRisk();
                                            }
                                          },
                                          activeColor: MaterialStateColor
                                              .resolveWith((states) =>
                                          AppColor.blueColor),
                                        ),
                                      )
                                          .toList(),
                                    ),
                                    space,
                                    const RestInvestTitle(
                                      text: "No. Of Dependent:*",
                                      textColor: AppColor.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    _.isLoading || _.noInternet ?
                                    const SizedBox()
                                        : Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: _
                                          .newDigUserRegDataRpqList!
                                          .response!
                                          .noOfDependentsRpqList!
                                          .map(
                                            (data) => RadioListTile<int>(
                                          title: Text(
                                            "${data.desc}",
                                            style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight:
                                                FontWeight.bold),
                                          ),
                                          groupValue:
                                          _.noOfDependentsGroupValue,
                                          value: data.code ?? 00,
                                          onChanged: (val) {
                                            _.noOfDependentsGroupValue =
                                                data!.code ?? 00;
                                            _.noOfDependentsScore = data!.score!;
                                            _.update();
                                            if(_.isCalculate){
                                              _.calculateRisk();
                                            }
                                          },
                                          activeColor: MaterialStateColor
                                              .resolveWith((states) =>
                                          AppColor.blueColor),
                                        ),
                                      )
                                          .toList(),
                                    ),
                                    space,
                                    const RestInvestTitle(
                                      text: "Occupation:*",
                                      textColor: AppColor.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    _.isLoading || _.noInternet ?
                                    const SizedBox()
                                        : Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: _
                                          .newDigUserRegDataRpqList!
                                          .response!
                                          .occupationRpqList!
                                          .map(
                                            (data) => RadioListTile<int>(
                                          title: Text(
                                            "${data.desc}",
                                            style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight:
                                                FontWeight.bold),
                                          ),
                                          groupValue:
                                          _.occupationGroupValue,
                                          value: data.code ?? 00,
                                          onChanged: (val) {
                                            _.occupationGroupValue =
                                                data!.code ?? 00;
                                            _.occupationScore = data!.score!;
                                            _.update();
                                            if(_.isCalculate){
                                              _.calculateRisk();
                                            }
                                          },
                                          activeColor: MaterialStateColor
                                              .resolveWith((states) =>
                                          AppColor.blueColor),
                                        ),
                                      )
                                          .toList(),
                                    ),
                                    space,
                                    const RestInvestTitle(
                                      text: "Qualification:*",
                                      textColor: AppColor.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    _.isLoading || _.noInternet ?
                                    const SizedBox()
                                        : Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: _
                                          .newDigUserRegDataRpqList!
                                          .response!
                                          .qualificationRpqList!
                                          .map(
                                            (data) => RadioListTile<int>(
                                          title: Text(
                                            "${data.desc}",
                                            style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight:
                                                FontWeight.bold),
                                          ),
                                          groupValue:
                                          _.qualificationGroupValue,
                                          value: data.code ?? 00,
                                          onChanged: (val) {
                                            _.qualificationGroupValue =
                                                data!.code ?? 00;
                                            _.qualificationScore = data!.score!;
                                            _.update();
                                            if(_.isCalculate){
                                              _.calculateRisk();
                                            }
                                          },
                                          activeColor: MaterialStateColor
                                              .resolveWith((states) =>
                                          AppColor.blueColor),
                                        ),
                                      )
                                          .toList(),
                                    ),
                                    space,
                                    const RestInvestTitle(
                                      text: "Your Risk Appetite",
                                      textColor: AppColor.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    _.isLoading || _.noInternet ?
                                    const SizedBox()
                                        : Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: _
                                          .newDigUserRegDataRpqList!
                                          .response!
                                          .riskAppetiteRpqList!
                                          .map(
                                            (data) => RadioListTile<int>(
                                          title: Text(
                                            "${data.desc}",
                                            style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight:
                                                FontWeight.bold),
                                          ),
                                          groupValue:
                                          _.riskAppetiteGroupValue,
                                          value: data.code ?? 00,
                                          onChanged: (val) {
                                            _.riskAppetiteGroupValue =
                                                data!.code ?? 00;
                                            _.riskAppetiteScore = data!.score!;
                                            _.update();
                                            if(_.isCalculate){
                                              _.calculateRisk();
                                            }
                                          },
                                          activeColor: MaterialStateColor
                                              .resolveWith((states) =>
                                          AppColor.blueColor),
                                        ),
                                      )
                                          .toList(),
                                    ),
                                    space,
                                    const RestInvestTitle(
                                      text: "Your Investment Objective:*",
                                      textColor: AppColor.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    _.isLoading || _.noInternet ?
                                    const SizedBox()
                                        : Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: _
                                          .newDigUserRegDataRpqList!
                                          .response!
                                          .investObjRpqList!
                                          .map(
                                            (data) => RadioListTile<int>(
                                          title: Text(
                                            "${data.desc}",
                                            style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight:
                                                FontWeight.bold),
                                          ),
                                          groupValue:
                                          _.investObjGroupValue,
                                          value: data.code ?? 00,
                                          onChanged: (val) {
                                            _.investObjGroupValue =
                                                data!.code ?? 00;
                                            _.investObjScore = data!.score!;
                                            _.update();
                                            if(_.isCalculate){
                                              _.calculateRisk();
                                            }
                                          },
                                          activeColor: MaterialStateColor
                                              .resolveWith((states) =>
                                          AppColor.blueColor),
                                        ),
                                      )
                                          .toList(),
                                    ),
                                    space,
                                    const RestInvestTitle(
                                      text: "Your Investment Horizon:*",
                                      textColor: AppColor.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    _.isLoading || _.noInternet ?
                                    const SizedBox()
                                        : Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: _
                                          .newDigUserRegDataRpqList!
                                          .response!
                                          .investHorizonRpqList!
                                          .map(
                                            (data) => RadioListTile<int>(
                                          title: Text(
                                            "${data.desc}",
                                            style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight:
                                                FontWeight.bold),
                                          ),
                                          groupValue:
                                          _.investHorizonGroupValue,
                                          value: data.code ?? 00,
                                          onChanged: (val) {
                                            _.investHorizonGroupValue =
                                                data!.code ?? 00;
                                            _.investHorizonScore = data!.score!;
                                            _.update();
                                            if(_.isCalculate){
                                              _.calculateRisk();
                                            }
                                          },
                                          activeColor: MaterialStateColor
                                              .resolveWith((states) =>
                                          AppColor.blueColor),
                                        ),
                                      )
                                          .toList(),
                                    ),
                                    space,
                                    const RestInvestTitle(
                                      text:
                                      "Your Current Level of Investment  Knowledge:*",
                                      textColor: AppColor.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    _.isLoading || _.noInternet ?
                                    const SizedBox()
                                        : Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: _
                                          .newDigUserRegDataRpqList!
                                          .response!
                                          .investKnowledgeRpqList!
                                          .map(
                                            (data) => RadioListTile<int>(
                                          title: Text(
                                            "${data.desc}",
                                            style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight:
                                                FontWeight.bold),
                                          ),
                                          groupValue:
                                          _.investKnowledgeGroupValue,
                                          value: data.code ?? 00,
                                          onChanged: (val) {
                                            _.investKnowledgeGroupValue =
                                                data!.code ?? 00;
                                            _.investHorizonScore = data!.score!;
                                            _.update();
                                            if(_.isCalculate){
                                              _.calculateRisk();
                                            }
                                          },
                                          activeColor: MaterialStateColor
                                              .resolveWith((states) =>
                                          AppColor.blueColor),
                                        ),
                                      )
                                          .toList(),
                                    ),
                                    space,
                                    const RestInvestTitle(
                                      text:
                                      "Your Current Financial Position:In a year so,\nhow Secure do you feel financial will be?:*",
                                      textColor: AppColor.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    _.isLoading || _.noInternet ?
                                    const SizedBox()
                                        : Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: _
                                          .newDigUserRegDataRpqList!
                                          .response!
                                          .financialPositionRpqList!
                                          .map(
                                            (data) => RadioListTile<int>(
                                          title: Text(
                                            "${data.desc}",
                                            style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight:
                                                FontWeight.bold),
                                          ),
                                          groupValue:
                                          _.financialPositionGroupValue,
                                          value: data.code ?? 00,
                                          onChanged: (val) {
                                            _.financialPositionGroupValue =
                                                data!.code ?? 00;
                                            _.financialPositionScore = data!.score!;
                                            _.update();
                                            if(_.isCalculate){
                                              _.calculateRisk();
                                            }
                                          },
                                          activeColor: MaterialStateColor
                                              .resolveWith((states) =>
                                          AppColor.blueColor),
                                        ),
                                      )
                                          .toList(),
                                    ),
                                    space,
                                    Center(
                                      child: CustomRoundButton(
                                          height: 35,
                                          width: 60,
                                          text: "CALCULATE",
                                          onPress: () {
                                            _.calculateRisk();
                                          },
                                          isRound: false),
                                    ),
                                    space,
                                    _.isCalculate ?
                                    Text('Your Score is' + _.calculateValue.toString()) :
                                    const SizedBox(),
                                    const RestInvestTitle(
                                      text:
                                      "As Per your Risk Profile,We Suggest you to Select Stable Portfolio from the below table ",
                                      fontSize: 10,
                                      textAlign: TextAlign.start,
                                      textColor: AppColor.black,
                                      fontWeight: FontWeight.w900,
                                    ),
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
                                        Container(
                                          width: Get.width/1.5,
                                          child: const Text(
                                            "I accept that my investments is subject to market risks and a target return / dividend range or\ncapital protection cannot be guaranteed.I clearly understand, agree, acknowledge and accept\nthat my investment is subject to market price fluctuations and other risks inherent in all such\ninvestments. The risks emanate from various factors which include, but are not limited to,\nmarket risks, government regulation risks, credit risks, liquidity risks, settlement risks,\nredemption risks, Shari’ah non-compliance risks, dividend distribution taxation risks, and\nchanges in risks associated with trading volumes, liquidity and settlement systems in equity\nand debt markets. Past performance is not necessarily indicative of future results. Investment\nin mutual funds are not bank deposits and are neither issued by, insured by, obligation of, nor\notherwise supported by SECP, any Government Agency, Trustee (except to the extent\nspecifically stated in the constitutive documents) or any of the shareholders of National\nInvestment Trust Limited or any of the Pre-IPO Investors or any other bank or financial\ninstitution. Returns offered by Funds / Plans can be positive and / or negative and may increase\nor decrease subject to capital market conditions and risk profile of the selected Fund / Plan.\nHence, the value of investment may go below the invested amount. For further details, please\nrefer to the detailed risk disclosures and disclaimers contained in the Offering Documents,\nSupplementary Offering Documents and the latest Fund Manager Report available on our\nwebsite or by calling or writing to us.             ",
                                            // maxLines: 10,
                                          ),
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
                      _.isLoading
                          ? const Center(
                        child: DialogBox(),
                      )
                          : _.noInternet
                          ? Positioned(
                        bottom: 0,
                        child: Container(
                          height: 180,
                          width: Get.width,
                          color: Colors.white,
                          child: NoInternetWgt(
                            onTryAgain: _.onNewDigUserRegDataRpqList(),
                          ),
                        ),
                      )
                          : const SizedBox()
                    ]
                ),
              ));
        });
  }
}
