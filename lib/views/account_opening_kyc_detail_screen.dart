import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:investintrust/routes/routes.dart';


import '../controller/account_opening_kyc_detail_screen_controller.dart';

import '../widgets/button.dart';

import '../utils/colors.dart';

import '../widgets/textformfiled.dart';

import '../widgets/constant_widget.dart';
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
                body: Stack(
                    children: [
                SingleChildScrollView(
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
                                              text: 'NAME OF EMPLOYER BUSINESS:',
                                              textColor: AppColor.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w900,
                                            ),
                                            CustomTextFormField(
                                              controller: _.employerController,
                                              isRounded: true,
                                              hint: '',
                                              hintColor: AppColor.black,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 0.0),
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
                                                hint: "",
                                                hintColor: AppColor.black,
                                              ),
                                            ],
                                          ),
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
                                              text: "PROFESSION:",
                                              textColor: AppColor.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w900,
                                            ),
                                            CustomTextFormField(
                                              controller: _.professionController,
                                              isRounded: true,
                                              hint: "",
                                              hintColor: AppColor.black,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  _.occupationGroupValue ==  '013'
                                     ? Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      space,
                                      const RestInvestTitle(
                                        text: "GEOGRAPHIES INVOLVED:",
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
                                    ],
                                  ) : const SizedBox(),
                                  space,
                                  const RestInvestTitle(
                                    text: "PREFERRED MODE OF TRANSACTION:*",
                                    textColor: AppColor.black,
                                    fontSize: 12,
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
                                    fontSize: 12,
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
                                  // const EmptyContainer(
                                  //   hint: "",
                                  //   textColor: AppColor.black,
                                  //   fontWeight: FontWeight.w900,
                                  //   hintColor: AppColor.black,
                                  //   text: "",
                                  // ),
                                  space,
                                  CustomTextFormField(
                                    controller: _.expTurnoverAmountController,
                                    isRounded: true,
                                    hint: "Enter Amount",
                                    textInputType: TextInputType.number,
                                    hintColor: AppColor.dimblack,
                                    inputFormator: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      NumberForm()
                                    ],
                                  ),
                                  space,
                                  const RestInvestTitle(
                                    text: "EXPECTED INVESTMENT AMOUNT:*",
                                    textColor: AppColor.black,
                                    fontSize: 12,
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
                                    fontSize: 12,
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
                                    fontSize: 12,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  space,

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
                                      SizedBox(
                                        height: 25,
                                        width: 25,
                                        child: Checkbox(
                                            checkColor: AppColor.whiteColor,
                                            fillColor: MaterialStateColor.resolveWith(
                                                    (states) => AppColor.blueColor),
                                            value: _.isChecked,
                                            onChanged: (bool? val) {
                                              _.isChecked = val!;
                                              _.update();
                                            }
                                            ),
                                      ),
                                      const SizedBox(width: 5,),
                                      const Expanded(
                                        child: RestInvestTitle(
                                          text:
                                          "I hereby confirm that I have read and understood the instructions mentioned herein which apply to National Investment Trust Limited (NIT) and its funds National Investment (Unit) Trust Fund, NIT Government Bond Fund, NIT Income Fund, NIT Social Impact Fund, NIT Islamic Equity Fund, NIT Islamic Money Market Fund, NIT Money Market Fund, NIT Islamic Income Fund, NIT Asset Allocation Fund, NIT Pension Fund, NIT Islamic Pension Fund and any other fund(s) offered by NIT from time to time, for compliance of Customer Due Diligence (CDD) and Know Your Client (KYC) procedures for transaction in Funds units issued by NIT. I agree to abide by the terms, conditions, rules, regulations and other statutory requirements applicable to NIT and respective Funds. I hereby declare that the particulars given herein are true, correct and complete to the best of my/ our knowledge and belief; the relevant documents submitted along with this application are genuine. I hereby undertake to promptly inform NIT of any changes to the information provided herein and agree and accept that NIT is not liable or responsible for any losses, costs, damages arising out of any actions undertaken or activities performed by NIT on the basis of the information provided by me and also due to my not intimating/delay in intimating such changes. I hereby authorize NIT to disclose, share, remit in any form, mode or manner, all/any of the information provided by me relating to the respective Funds in which I may transact/have transacted including all changes, updates to such information as and when provided by me if such required to be submitted under the laws. I hereby agree to provide any additional information/Documentation that may be required by the NIT, in connection with this Application Form. I further confirm to have read the Trust Deed and Offering Documents of the Fund I wish to invest in and I hereby bind ourselves and agree to the contents of the same.",
                                          textColor: AppColor.black,
                                          textAlign: TextAlign.justify,
                                          fontSize: 8,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
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
                                          buttonColor: AppColor.backBlueColor,
                                          isRound: false),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      CustomRoundButton(
                                          height: 35,
                                          width: 50,
                                          text: "SAVE&NEXT",
                                          onPress: () {
                                            _.onSaveDataKycDetail();
                                            // Get.toNamed(AppRoute.accountOpenFatcaScreen);
                                          },
                                          isRound: false),
                                      const SizedBox(width: 20,),
                                      const Text('3/8')
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
          _.isLoading ?  const Center(
          child: DialogBox(),
          ) : const SizedBox()
          ])
              ));
        });
  }
}
