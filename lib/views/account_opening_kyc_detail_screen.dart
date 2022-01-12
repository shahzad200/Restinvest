import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:investintrust/routes/routes.dart';

import '../controller/account_opening_kyc_detail_screen_controller.dart';

import '../widgets/button.dart';

import '../utils/colors.dart';

import '../widgets/textformfiled.dart';

import '../widgets/constant_widget.dart';
import 'account_opening_risk_profile_screen.dart';

class AccountOpenKycDetailScreen extends StatelessWidget {
  const AccountOpenKycDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountOpenKycDetailScreenController>(
        init: AccountOpenKycDetailScreenController(),
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
                    padding:  EdgeInsets.only(right:Get.width/6),
                    child: const Logo(
                      height: 50,
                      width: 50,
                    ),
                  ),
                  elevation: 0,
                ),
                key: _.scaffoldKey,
                body: SingleChildScrollView(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
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
                              text: "KYC DEATIL",
                              textAlign: TextAlign.start,
                            ),
                            space,
                            SingleChildScrollView(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const RestInvestTitle(
                                    text: " OCCUPTION / PROFESSION:*",
                                    textAlign: TextAlign.start,
                                    textColor: AppColor.black,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  _.controller.newDigUserRegDataAfterOTP!.response!
                                      .occupations ==
                                      null
                                      ? const SizedBox()
                                      : Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: _
                                        .controller
                                        .newDigUserRegDataAfterOTP!
                                        .response!
                                        .occupations!
                                        .map(
                                          (data) => RadioListTile<String>(
                                        title: Text(
                                          "${data.occupoationName}",
                                          style: const TextStyle(
                                              fontSize: 10,
                                              fontWeight:
                                              FontWeight.bold),
                                        ),
                                        groupValue:
                                        _.occupationGroupValue,
                                        value:
                                        data.occupoationCode ?? '00',
                                        onChanged: (val) {
                                          _.occupationGroupValue =
                                              data!.occupoationCode ??
                                                  '00';
                                          _.update();
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
                                    text: " SOURCE (S) OF INCOME:*",
                                    textAlign: TextAlign.start,
                                    textColor: AppColor.black,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  _.controller.newDigUserRegDataAfterOTP!.response!
                                      .incomeSources ==
                                      null
                                      ? const SizedBox()
                                      : Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: _
                                        .controller
                                        .newDigUserRegDataAfterOTP!
                                        .response!
                                        .incomeSources!
                                        .map(
                                          (data) => RadioListTile<String>(
                                        title: Text(
                                          "${data.incomeSourceName}",
                                          style: const TextStyle(
                                              fontSize: 10,
                                              fontWeight:
                                              FontWeight.bold),
                                        ),
                                        groupValue: _.inComeGroupValue,
                                        value: data.incomeSourceId ?? '00',
                                        onChanged: (val) {
                                          _.inComeGroupValue =
                                              data!.incomeSourceId ?? '00';
                                          _.update();
                                        },
                                        activeColor: MaterialStateColor
                                            .resolveWith((states) =>
                                        AppColor.blueColor),
                                      ),
                                    )
                                        .toList(),
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
                                              text: 'NAME OF EMPLOYER?BUSINESS:',
                                              textColor: AppColor.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w900,
                                            ),
                                            CustomTextFormField(
                                              controller: _.employerController,
                                              isRounded: true,
                                              hint: "Softech Systems",
                                              hintColor: AppColor.black,
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
                                              text: "DESIGNATION:",
                                              textColor: AppColor.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w900,
                                            ),
                                            CustomTextFormField(
                                              controller: _.designationController,
                                              isRounded: true,
                                              hint: "Sr. Analyst and TL ACS",
                                              hintColor: AppColor.black,
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
                                              text: 'NATURE OF BUSINESS:',
                                              textColor: AppColor.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w900,
                                            ),
                                            CustomTextFormField(
                                              controller: _.natureOfBusinessController,
                                              isRounded: true,
                                              hint: "Software Development",
                                              hintColor: AppColor.black,
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
                                              text: "PROFESSION:",
                                              textColor: AppColor.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w900,
                                            ),
                                            CustomTextFormField(
                                              controller: _.professionController,
                                              isRounded: true,
                                              hint: "IT",
                                              hintColor: AppColor.black,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  space,
                                  const RestInvestTitle(
                                    text: "GEOGRAPHIES INVOLVED:",
                                    textColor: AppColor.black,
                                    fontSize: 10,
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
                                              text: 'DOMESTIC:',
                                              textColor: AppColor.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w900,
                                            ),
                                            CustomTextFormField(
                                              controller: _.geoDomesticController,
                                              isRounded: true,
                                              hint: "",
                                              hintColor: AppColor.black,
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
                                              text: "INTERNATIONAL:",
                                              textColor: AppColor.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w900,
                                            ),
                                            CustomTextFormField(
                                              controller: _.geoInternationalController,
                                              isRounded: true,
                                              hint: "",
                                              hintColor: AppColor.black,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  space,
                                  const RestInvestTitle(
                                    text: "TYPE OF COUNTER PARTIES:",
                                    textColor: AppColor.black,
                                    fontSize: 10,
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
                                              text: 'DOMESTIC:',
                                              textColor: AppColor.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w900,
                                            ),
                                            CustomTextFormField(
                                              controller: _.counterDomesticController,
                                              isRounded: true,
                                              hint: "",
                                              hintColor: AppColor.black,
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
                                              text: "INTERNATIONAL:",
                                              textColor: AppColor.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w900,
                                            ),
                                            CustomTextFormField(
                                              controller: _.counterInternationalController,
                                              isRounded: true,
                                              hint: "",
                                              hintColor: AppColor.black,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  space,
                                  const RestInvestTitle(
                                    text: "PREFERRED MODE OF TRANSACTION:*",
                                    textColor: AppColor.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  _.controller.newDigUserRegDataAfterOTP!.response!
                                      .transModeList ==
                                      null
                                      ? const SizedBox()
                                      : Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: _
                                        .controller
                                        .newDigUserRegDataAfterOTP!
                                        .response!
                                        .transModeList!
                                        .map(
                                          (data) => RadioListTile<String>(
                                        title: Text(
                                          "${data.description}",
                                          style: const TextStyle(
                                              fontSize: 10,
                                              fontWeight:
                                              FontWeight.bold),
                                        ),
                                        groupValue:
                                        _.transactionGroupValue,
                                        value: data.code ?? '00',
                                        onChanged: (val) {
                                          _.transactionGroupValue =
                                              data!.code ?? '00';
                                          _.update();
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
                                    "EXPECTED TURNOVER IN ACCOUNT IN \nRUPEES:*",
                                    textColor: AppColor.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  _.controller.newDigUserRegDataAfterOTP!.response!
                                      .expectedTurnoverInAccTypeList ==
                                      null
                                      ? const SizedBox()
                                      : Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: _
                                        .controller
                                        .newDigUserRegDataAfterOTP!
                                        .response!
                                        .expectedTurnoverInAccTypeList!
                                        .map(
                                          (data) => RadioListTile<String>(
                                        title: Text(
                                          "${data.description}",
                                          style: const TextStyle(
                                              fontSize: 10,
                                              fontWeight:
                                              FontWeight.bold),
                                        ),
                                        groupValue: _.turnoverGroupValue,
                                        value: data.code ?? '00',
                                        onChanged: (val) {
                                          _.turnoverGroupValue =
                                              data!.code ?? '00';
                                          _.update();
                                        },
                                        activeColor: MaterialStateColor
                                            .resolveWith((states) =>
                                        AppColor.blueColor),
                                      ),
                                    )
                                        .toList(),
                                  ),
                                  const EmptyContainer(
                                    hint: "",
                                    textColor: AppColor.black,
                                    fontWeight: FontWeight.w900,
                                    hintColor: AppColor.black,
                                    text: "",
                                  ),
                                  space,
                                  const RestInvestTitle(
                                    text: "EXPECTED INVESTMENT AMMOUNT:*",
                                    textColor: AppColor.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  _.controller.newDigUserRegDataAfterOTP!.response!
                                      .expInvestAmountBrackets ==
                                      null
                                      ? const SizedBox()
                                      : Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: _
                                        .controller
                                        .newDigUserRegDataAfterOTP!
                                        .response!
                                        .expInvestAmountBrackets!
                                        .map(
                                          (data) => RadioListTile<String>(
                                        title: Text(
                                          "${data.description}",
                                          style: const TextStyle(
                                              fontSize: 10,
                                              fontWeight:
                                              FontWeight.bold),
                                        ),
                                        groupValue:
                                        _.expectedIncomeGroupValue,
                                        value: data.code ?? '00',
                                        onChanged: (val) {
                                          _.expectedIncomeGroupValue =
                                              data!.code ?? '00';
                                          _.update();
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
                                    text: "ANNUAL INCOME:*",
                                    textColor: AppColor.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  _.controller.newDigUserRegDataAfterOTP!.response!
                                      .annualIncomeBrackets ==
                                      null
                                      ? const SizedBox()
                                      : Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: _
                                        .controller
                                        .newDigUserRegDataAfterOTP!
                                        .response!
                                        .annualIncomeBrackets!
                                        .map(
                                          (data) => RadioListTile<String>(
                                        title: Text(
                                          "${data.description}",
                                          style: const TextStyle(
                                              fontSize: 10,
                                              fontWeight:
                                              FontWeight.bold),
                                        ),
                                        groupValue:
                                        _.annualIncomeGroupValue,
                                        value: data.code ?? '00',
                                        onChanged: (val) {
                                          _.annualIncomeGroupValue =
                                              data!.code ?? '00';
                                          _.update();
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
                                    text: "PEP DECLARATION DETAIL*",
                                    textColor: AppColor.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w900,
                                  ),

                                  ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount:_.controller.newDigUserRegDataAfterOTP!.response!.pepsInfoList!.length,
                                      itemBuilder: (context, index) {
                                        bool? groupValue = _.controller.newDigUserRegDataAfterOTP!.
                                        response!.pepsInfoList![index].answer;
                                        return  Column(
                                          children: [
                                            SizedBox(
                                              width: Get.width,
                                              child: Text(_.controller.newDigUserRegDataAfterOTP!.
                                              response!.pepsInfoList![index].questionDesc ?? '',
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Radio(
                                                  value: true,
                                                  groupValue: groupValue,
                                                  onChanged: (bool? val) {
                                                    _.controller.newDigUserRegDataAfterOTP!.
                                                    response!.pepsInfoList![index].answer = val;
                                                    _.update();
                                                  },
                                                  fillColor: MaterialStateColor.resolveWith(
                                                          (states) => AppColor.blueColor),
                                                ),
                                                const RestInvestTitle(
                                                  text: "YES",
                                                  textColor: AppColor.dimblack,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                                Radio(
                                                  value: false,
                                                  groupValue: groupValue,
                                                  onChanged: (bool? val) {
                                                    _.controller.newDigUserRegDataAfterOTP!.
                                                    response!.pepsInfoList![index].answer = val;
                                                    _.update();
                                                  },
                                                  fillColor: MaterialStateColor.resolveWith(
                                                          (states) => AppColor.blueColor),
                                                ),
                                                const RestInvestTitle(
                                                  text: "NO",
                                                  textColor: AppColor.dimblack,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      }),
                                  const RestInvestTitle(
                                    text: "*DISCLAIMER:",
                                    textColor: AppColor.black,
                                    fontSize: 10,
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
                                    ],
                                  ),
                                  space,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomRoundButton(
                                          height: 35,
                                          width: 50,
                                          text: "BACK",
                                          onPress: () {
                                            Get.back();
                                          },
                                          buttonColor: AppColor.dimBlue,
                                          isRound: false),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      CustomRoundButton(
                                          height: 35,
                                          width: 50,
                                          text: "SAVE&NEXT",
                                          onPress: () {
                                            Get.toNamed(AppRoute.accountOpenFatcaScreen);
                                          },
                                          isRound: false),
                                    ],
                                  ),
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
                ),
              ));
        });
  }
}
