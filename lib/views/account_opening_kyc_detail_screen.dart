import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controller/account_opening_kyc_detail_screen_controller.dart';

import '../widgets/button.dart';

import '../utils/colors.dart';

import '../widgets/textformfiled.dart';

import '../widgets/constant_widget.dart';

class AccountOpenKycDetailScreen extends StatelessWidget {
  const AccountOpenKycDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    final height = Get.height;
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
              title: const Logo(
                height: 50,
                width: 50,
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
                              Row(
                                children: const [
                                  RestInvestTitle(
                                    text: " OTP VERIFY > ",
                                    textAlign: TextAlign.start,
                                    fontSize: 8,
                                    textColor: AppColor.dimblack,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  RestInvestTitle(
                                    text: " BASIC INFORMATION > ",
                                    textAlign: TextAlign.start,
                                    textColor: AppColor.dimblack,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  RestInvestTitle(
                                    text: " KYC DETAIL > ",
                                    textAlign: TextAlign.start,
                                    textColor: AppColor.blueColor,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  RestInvestTitle(
                                    text: " FATCA > ",
                                    textAlign: TextAlign.start,
                                    textColor: AppColor.dimblack,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ],
                              ),
                              space,
                              const RestInvestTitle(
                                text: " OCCUPTION / PROFESSION:*",
                                textAlign: TextAlign.start,
                                textColor: AppColor.black,
                                fontWeight: FontWeight.w900,
                              ),
                              Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceEvenly,
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
                                    text: "PRIVATE SERVICES",
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
                                    text: "GOVERNMENT SERVICES",
                                    textColor: AppColor.black,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ],
                              ),
                              Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceEvenly,
                                children: [
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
                                    text: "RETIRED",
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
                                    text: "BUSSINESS / SELF-EMPLOYED",
                                    textColor: AppColor.black,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ],
                              ),
                              Row(
                                // mainAxisAlignment:
                                    // MainAxisAlignment.spaceEvenly,
                                children: [
                                  Radio(
                                    value: 4,
                                    groupValue: _.charactor,
                                    onChanged: (int? val) {
                                      _.charactor = val!;
                                      _.update();
                                    },
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => AppColor.blueColor),
                                  ),
                                  const RestInvestTitle(
                                    text: "ENEMPLOYED",
                                    textColor: AppColor.black,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  Radio(
                                    value: 5,
                                    groupValue: _.charactor,
                                    onChanged: (int? val) {
                                      _.charactor = val!;
                                      _.update();
                                    },
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => AppColor.blueColor),
                                  ),
                                  const RestInvestTitle(
                                    text: "HOUSE WIFE",
                                    textColor: AppColor.black,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: 6,
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
                                    textColor: AppColor.black,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ],
                              ),
                              space,
                              const RestInvestTitle(
                                text: " SOURCE (S) OF INCOME:*",
                                textAlign: TextAlign.start,
                                textColor: AppColor.black,
                                fontWeight: FontWeight.w900,
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Radio(
                                    value: 0,
                                    groupValue: _.income,
                                    onChanged: (int? val) {
                                      _.income = val!;
                                      _.update();
                                    },
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => AppColor.blueColor),
                                  ),
                                  const RestInvestTitle(
                                    text: "SALARIED PERSON",
                                    textColor: AppColor.black,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  Radio(
                                    value: 1,
                                    groupValue: _.income,
                                    onChanged: (int? val) {
                                      _.income = val!;
                                      _.update();
                                    },
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => AppColor.blueColor),
                                  ),
                                  const RestInvestTitle(
                                    text: "BUSINESSMEN",
                                    textColor: AppColor.black,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ],
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Radio(
                                    value: 2,
                                    groupValue: _.income,
                                    onChanged: (int? val) {
                                      _.income = val!;
                                      _.update();
                                    },
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => AppColor.blueColor),
                                  ),
                                  const RestInvestTitle(
                                    text: "Saving Investment",
                                    textColor: AppColor.black,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  Radio(
                                    value: 3,
                                    groupValue: _.income,
                                    onChanged: (int? val) {
                                      _.income = val!;
                                      _.update();
                                    },
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => AppColor.blueColor),
                                  ),
                                  const RestInvestTitle(
                                    text: "Inheritance",
                                    textColor: AppColor.black,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),

                                ],
                              ),

                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Radio(
                                    value: 5,
                                    groupValue: _.income,
                                    onChanged: (int? val) {
                                      _.income = val!;
                                      _.update();
                                    },
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => AppColor.blueColor),
                                  ),
                                  const RestInvestTitle(
                                    text: "Home Remittance",
                                    textColor: AppColor.black,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  Radio(
                                    value: 6,
                                    groupValue: _.income,
                                    onChanged: (int? val) {
                                      _.income = val!;
                                      _.update();
                                    },
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => AppColor.blueColor),
                                  ),
                                  const RestInvestTitle(
                                    text: "Landlord/Agriculturist",
                                    textColor: AppColor.black,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),

                                ],
                              ),
                              Row(children: [ Radio(
                                value: 4,
                                groupValue: _.income,
                                onChanged: (int? val) {
                                  _.income = val!;
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
                                ), Radio(
                                  value: 7,
                                  groupValue: _.income,
                                  onChanged: (int? val) {
                                    _.income = val!;
                                    _.update();
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                          (states) => AppColor.blueColor),
                                ),
                                const RestInvestTitle(
                                  text: "OTHERS",
                                  textColor: AppColor.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),],),
                              space,
                              const RestInvestTitle(
                                text: " SOURCE (S) OF INCOME:*",
                                textAlign: TextAlign.start,
                                textColor: AppColor.black,
                                fontWeight: FontWeight.w900,
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Radio(
                                    value: 0,
                                    groupValue: _.source,
                                    onChanged: (int? val) {
                                      _.source = val!;
                                      _.update();
                                    },
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => AppColor.blueColor),
                                  ),
                                  const RestInvestTitle(
                                    text: "SALARIED PERSON",
                                    textColor: AppColor.black,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  Radio(
                                    value: 1,
                                    groupValue: _.source,
                                    onChanged: (int? val) {
                                      _.source = val!;
                                      _.update();
                                    },
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => AppColor.blueColor),
                                  ),
                                  const RestInvestTitle(
                                    text: "BUSINESSMEN",
                                    textColor: AppColor.black,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ],
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Radio(
                                    value: 2,
                                    groupValue: _.source,
                                    onChanged: (int? val) {
                                      _.source = val!;
                                      _.update();
                                    },
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => AppColor.blueColor),
                                  ),
                                  const RestInvestTitle(
                                    text: "Saving Investment",
                                    textColor: AppColor.black,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  Radio(
                                    value: 3,
                                    groupValue: _.source,
                                    onChanged: (int? val) {
                                      _.source = val!;
                                      _.update();
                                    },
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => AppColor.blueColor),
                                  ),
                                  const RestInvestTitle(
                                    text: "Inheritance",
                                    textColor: AppColor.black,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),

                                ],
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Radio(
                                    value: 5,
                                    groupValue: _.source,
                                    onChanged: (int? val) {
                                      _.source = val!;
                                      _.update();
                                    },
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => AppColor.blueColor),
                                  ),
                                  const RestInvestTitle(
                                    text: "Home Remittance",
                                    textColor: AppColor.black,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  Radio(
                                    value: 6,
                                    groupValue: _.source,
                                    onChanged: (int? val) {
                                      _.source = val!;
                                      _.update();
                                    },
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => AppColor.blueColor),
                                  ),
                                  const RestInvestTitle(
                                    text: "Landlord/Agriculturist",
                                    textColor: AppColor.black,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: 7,
                                    groupValue: _.source,
                                    onChanged: (int? val) {
                                      _.source = val!;
                                      _.update();
                                    },
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => AppColor.blueColor),
                                  ),
                                  const RestInvestTitle(
                                    text: "OTHERS",
                                    textColor: AppColor.black,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  Radio(
                                    value: 4,
                                    groupValue: _.source,
                                    onChanged: (int? val) {
                                      _.source = val!;
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
                                          text: 'NAME OF EMPLOYED?BUSSINESS:',
                                          textColor: AppColor.black,
                                          fontSize: 10,
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
                                          text: "DESIGNATION:",
                                          textColor: AppColor.black,
                                          fontSize: 10,
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
                                          text: "PROFESSION:",
                                          textColor: AppColor.black,
                                          fontSize: 10,
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
                                          text: "INTERNATIONAL:",
                                          textColor: AppColor.black,
                                          fontSize: 10,
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
                                          text: "INTERNATIONAL:",
                                          textColor: AppColor.black,
                                          fontSize: 10,
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
                                text: "PREFERRED MODE OF TRANSACTION:*",
                                textColor: AppColor.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w900,
                              ),
                              Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                children: [
                                  Radio(
                                    value: 0,
                                    groupValue: _.transaction,
                                    onChanged: (int? val) {
                                      _.transaction = val!;
                                      _.update();
                                    },
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => AppColor.blueColor),
                                  ),
                                  const RestInvestTitle(
                                    text: "ONLINE",
                                    textColor: AppColor.black,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  Radio(
                                    value: 1,
                                    groupValue: _.transaction,
                                    onChanged: (int? val) {
                                      _.transaction = val!;
                                      _.update();
                                    },
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => AppColor.blueColor),
                                  ),
                                  const RestInvestTitle(
                                    text: "PHYSICAL",
                                    textColor: AppColor.black,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  Radio(
                                    value: 2,
                                    groupValue: _.transaction,
                                    onChanged: (int? val) {
                                      _.transaction = val!;
                                      _.update();
                                    },
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => AppColor.blueColor),
                                  ),
                                  const RestInvestTitle(
                                    text: "BOTH",
                                    textColor: AppColor.black,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ],
                              ),
                              space,
                              space,
                              const RestInvestTitle(
                                text:
                                    "EXPECTED TURNOVER IN ACCOUNT IN \nRUPEES:*",
                                textColor: AppColor.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w900,
                              ),
                              Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                children: [
                                  Radio(
                                    value: 0,
                                    groupValue: _.rupees,
                                    onChanged: (int? val) {
                                      _.rupees = val!;
                                      _.update();
                                    },
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => AppColor.blueColor),
                                  ),
                                  const RestInvestTitle(
                                    text: "MONTHLY",
                                    textColor: AppColor.black,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  Radio(
                                    value: 1,
                                    groupValue: _.rupees,
                                    onChanged: (int? val) {
                                      _.rupees = val!;
                                      _.update();
                                    },
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => AppColor.blueColor),
                                  ),
                                  const RestInvestTitle(
                                    text: "ANNUALLY",
                                    textColor: AppColor.black,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ],
                              ),
                              const EmptyContainer(
                                hint: "",
                                textColor: AppColor.black,
                                fontWeight: FontWeight.w900,
                                hintColor: AppColor.black,
                                text: "",
                              ),
                              space,
                              space,
                              const RestInvestTitle(
                                text: "EXPECTED INVESTMENT AMMOUNT:*",
                                textColor: AppColor.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w900,
                              ),
                              Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                children: [
                                  Radio(
                                    value: 0,
                                    groupValue: _.mode,
                                    onChanged: (int? val) {
                                      _.mode = val!;
                                      _.update();
                                    },
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => AppColor.blueColor),
                                  ),
                                  const RestInvestTitle(
                                    text: "Up-to RS.1M",
                                    textColor: AppColor.black,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  Radio(
                                    value: 1,
                                    groupValue: _.mode,
                                    onChanged: (int? val) {
                                      _.mode = val!;
                                      _.update();
                                    },
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => AppColor.blueColor),
                                  ),
                                  const RestInvestTitle(
                                    text: "Up-to RS.1M to Rs. 2.5M",
                                    textColor: AppColor.black,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ],
                              ),
                              Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                children: [
                                  Radio(
                                    value: 2,
                                    groupValue: _.mode,
                                    onChanged: (int? val) {
                                      _.mode = val!;
                                      _.update();
                                    },
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => AppColor.blueColor),
                                  ),
                                  const RestInvestTitle(
                                    text: "Upto RS.2.5M to Rs.5M",
                                    textColor: AppColor.black,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  Radio(
                                    value: 3,
                                    groupValue: _.mode,
                                    onChanged: (int? val) {
                                      _.mode = val!;
                                      _.update();
                                    },
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => AppColor.blueColor),
                                  ),
                                  const RestInvestTitle(
                                    text: "Upto RS.5M to Rs.10M",
                                    textColor: AppColor.black,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: 4,
                                    groupValue: _.mode,
                                    onChanged: (int? val) {
                                      _.mode = val!;
                                      _.update();
                                    },
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => AppColor.blueColor),
                                  ),
                                  const RestInvestTitle(
                                    text: "Above Rs.10M",
                                    textColor: AppColor.black,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ],
                              ),
                              space,
                              space,
                              const RestInvestTitle(
                                text: "ANNUAL INCOME:*",
                                textColor: AppColor.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w900,
                              ),
                              Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                children: [
                                  Radio(
                                    value: 0,
                                    groupValue: _.modetransaction,
                                    onChanged: (int? val) {
                                      _.modetransaction = val!;
                                      _.update();
                                    },
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => AppColor.blueColor),
                                  ),
                                  const RestInvestTitle(
                                    text: "Up-to RS.1M",
                                    textColor: AppColor.black,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  Radio(
                                    value: 1,
                                    groupValue: _.modetransaction,
                                    onChanged: (int? val) {
                                      _.modetransaction = val!;
                                      _.update();
                                    },
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => AppColor.blueColor),
                                  ),
                                  const RestInvestTitle(
                                    text: "Up-to RS.1M to Rs.3M",
                                    textColor: AppColor.black,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ],
                              ),
                              Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                children: [
                                  Radio(
                                    value: 2,
                                    groupValue: _.modetransaction,
                                    onChanged: (int? val) {
                                      _.modetransaction = val!;
                                      _.update();
                                    },
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => AppColor.blueColor),
                                  ),
                                  const RestInvestTitle(
                                    text: "Up-to RS.3M to Rs.6M",
                                    textColor: AppColor.black,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  Radio(
                                    value: 3,
                                    groupValue: _.modetransaction,
                                    onChanged: (int? val) {
                                      _.modetransaction = val!;
                                      _.update();
                                    },
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => AppColor.blueColor),
                                  ),
                                  const RestInvestTitle(
                                    text: "Up-to RS.6M to Rs.12M",
                                    textColor: AppColor.black,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: 4,
                                    groupValue: _.modetransaction,
                                    onChanged: (int? val) {
                                      _.modetransaction = val!;
                                      _.update();
                                    },
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => AppColor.blueColor),
                                  ),
                                  const RestInvestTitle(
                                    text: "Above Rs.12M",
                                    textColor: AppColor.black,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ],
                              ),
                              space,
                              const RestInvestTitle(
                                text: "PEP DECLARATION DETAIL*",
                                textColor: AppColor.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w900,
                              ),
                              space,
                              space,
                              space,
                              space,
                              space,
                              space,
                              space,
                              space,
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomRoundButton(
                                      height: 35,
                                      width: 50,
                                      text: "BACK",
                                      onPress: () {},
                                      buttonColor: AppColor.dimBlue,
                                      isRound: false),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  CustomRoundButton(
                                      height: 35,
                                      width: 50,
                                      text: "SAVE&NEXT",
                                      onPress: () {},
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
