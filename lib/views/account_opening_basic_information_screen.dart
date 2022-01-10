import 'dart:ui';

import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:investintrust/data/models/new_dig_user_reg_data_after_otp.dart';
import 'package:investintrust/routes/routes.dart';
import 'package:investintrust/utils/constant.dart';
import '../widgets/datefield.dart';
import '../controller/account_opening_basic_information_screen_controller.dart';

import '../widgets/button.dart';

import '../utils/colors.dart';
import '../utils/lists.dart';

import '../widgets/textformfiled.dart';

import '../widgets/constant_widget.dart';
import '../data/models/city_data.dart' as res;
class AccountOpenBasicInformationScreen extends StatelessWidget {
  const AccountOpenBasicInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    final height = Get.height;
    return GetBuilder<AccountOpenBasicInformationScreenController>(
        init: AccountOpenBasicInformationScreenController(),
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
                            fontSize: 16,
                            height: 35,
                            text: "Basic Information",
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
                                      textColor: AppColor.blueColor,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ],
                                ),
                                space,
                                const RestInvestTitle(
                                  text: "Title",
                                  textColor: AppColor.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 12,
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
                                        textAlign: TextAlign.center,
                                        text: _.titleValue == null || _.titleValue == ""
                                            ? "Title"
                                            : _.titleValue,
                                        textColor: AppColor.black,
                                      ),
                                      icon: const Icon(
                                          Icons.keyboard_arrow_down,
                                          color: AppColor.blueColor,
                                          size: 30),
                                      items:_.isLoading || _.noInternet ? null: _.newDigUserRegDataAfterOTP!.response!.titleList!.map((TitleList titleItems) {
                                        return DropdownMenuItem<TitleList>(
                                            value: titleItems,
                                            child: Text(titleItems!.description ?? ''));
                                      }).toList(),
                                      onChanged: _.isLoading || _.noInternet ? null :(TitleList? value) {
                                        _.titleValue = value!.description!;
                                        _.titleCode = value!.code!;
                                        _.update();
                                      },
                                    ),
                                  ),
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
                                            text: 'NAME(as per CNIC)*',
                                            textColor: AppColor.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w900,
                                          ),
                                          CustomTextFormField(
                                            isRounded: true,
                                            hint: "Full Name",
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
                                            text: "FATHER / HUSBAND'S NAME*",
                                            textColor: AppColor.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w900,
                                          ),
                                          CustomTextFormField(
                                            isRounded: true,
                                            hint: "Full Name",
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
                                            text: "MOTHER MAIDEN'S NAME*",
                                            textColor: AppColor.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w900,
                                          ),
                                          CustomTextFormField(
                                            isRounded: true,
                                            hint: "Full Name",
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
                                            text: "CNIC / NICOP NUMBER*",
                                            textColor: AppColor.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w900,
                                          ),
                                          CustomTextFormField(
                                            isRounded: true,
                                            hint: "Full Name",
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
                                            text: 'CNIC/NICOP ISSUE DATE*',
                                            textColor: AppColor.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w900,
                                          ),
                                          SizedBox(
                                            height: 35,
                                            child: DateFormFieldContainer(
                                              isRounded: false,
                                              isTrue: true,
                                              text: '',
                                              mode: DateTimeFieldPickerMode.date,
                                              dateFormatTrue: true,
                                              initialValue: DateTime.now(),
                                              onDateSelected: (value) {},
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
                                            text:
                                            'CNIC/NICOP EXPIRY DATE* LIFETIME',
                                            textColor: AppColor.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w900,
                                          ),
                                          SizedBox(
                                            height: 35,
                                            child: DateFormFieldContainer(
                                              isRounded: false,
                                              text: '',
                                              mode: DateTimeFieldPickerMode.date,
                                              dateFormatTrue: true,
                                              isTrue: true,
                                              initialValue: DateTime.now(),
                                              onDateSelected: (value) {},
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
                                            text: 'DATE OF BIRTH*',
                                            textColor: AppColor.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w900,
                                          ),
                                          SizedBox(
                                            height: 35,
                                            child: DateFormFieldContainer(
                                              isRounded: false,
                                              isTrue: true,
                                              text: '',
                                              mode: DateTimeFieldPickerMode.date,
                                              dateFormatTrue: true,
                                              initialValue: DateTime.now(),
                                              onDateSelected: (value) {},
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
                                            text: "MARITAL STATUS*",
                                            textColor: AppColor.black,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 12,
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
                                                  text: _.martialValue == null ||
                                                      _.martialValue == ""
                                                      ? "Status"
                                                      : _.martialValue,
                                                  textColor: AppColor.black,
                                                ),
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: AppColor.blueColor,
                                                    size: 30),
                                                items:_.isLoading || _.noInternet ? null: _.newDigUserRegDataAfterOTP!.response!.maritalStatusList!.map((MaritalStatusList maritalStatusList) {
                                                  return DropdownMenuItem<MaritalStatusList>(
                                                      value: maritalStatusList,
                                                      child: Text(maritalStatusList!.description ?? ''));
                                                }).toList(),
                                                onChanged: _.isLoading || _.noInternet ? null :(MaritalStatusList? value) {
                                                  _.martialValue = value!.description!;
                                                  _.martialCode = value!.code!;
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
                                            text: "NATIONALITY*",
                                            textColor: AppColor.black,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 12,
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
                                                  text: _.nationalityValue == null ||
                                                      _.nationalityValue == ""
                                                      ? "Nationality"
                                                      : _.nationalityValue,
                                                  textColor: AppColor.black,
                                                ),
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: AppColor.blueColor,
                                                    size: 30),
                                                items:_.isLoading || _.noInternet ? null: _.newDigUserRegDataAfterOTP!.response!.nationalities!.map((Nationalities nationality) {
                                                  return DropdownMenuItem<Nationalities>(
                                                      value: nationality,
                                                      child: Text(nationality!.countryName ?? ''));
                                                }).toList(),
                                                onChanged: _.isLoading || _.noInternet ? null :(Nationalities? value) {
                                                  _.nationalityValue = value!.countryName!;
                                                  _.nationalityCode = value!.countryCode!;
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
                                            text: "RESIDENTIAL STATUS*",
                                            textColor: AppColor.black,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 12,
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
                                                  text: _.residentStatusValue == null ||
                                                      _.residentStatusValue == ""
                                                      ? "Residential"
                                                      : _.residentStatusValue,
                                                  textColor: AppColor.black,
                                                ),
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: AppColor.blueColor,
                                                    size: 35),
                                                items:_.isLoading || _.noInternet ? null: _.newDigUserRegDataAfterOTP!.response!.residentStatusList!.map((ResidentStatusList residentStatusList) {
                                                  return DropdownMenuItem<ResidentStatusList>(
                                                      value: residentStatusList,
                                                      child: Text(residentStatusList!.description ?? ''));
                                                }).toList(),
                                                onChanged: _.isLoading || _.noInternet ? null :(ResidentStatusList? value) {
                                                  _.residentStatusValue = value!.description!;
                                                  _.nationalityCode = value!.code!;
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
                                            text: "RELIGION*",
                                            textColor: AppColor.black,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 12,
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
                                                  text: _.religionValue == null ||
                                                      _.religionValue == ""
                                                      ? "Religion"
                                                      : _.religionValue,
                                                  textColor: AppColor.black,
                                                ),
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: AppColor.blueColor,
                                                    size: 30),
                                                items:_.isLoading || _.noInternet ? null: _.newDigUserRegDataAfterOTP!.response!.religions!.map((Religions religions) {
                                                  return DropdownMenuItem<Religions>(
                                                      value: religions,
                                                      child: Text(religions!.religionName ?? ''));
                                                }).toList(),
                                                onChanged: _.isLoading || _.noInternet ? null :(Religions? value) {
                                                  _.religionValue = value!.religionName!;
                                                  _.religionCode = value!.religionCode!;
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
                                            text: "ZAKAT EXEMPTION*",
                                            textColor: AppColor.black,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 12,
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
                                                  text: _.zaKatValue == null ||
                                                      _.zaKatValue == ""
                                                      ? "Zakat Ex"
                                                      : _.zaKatValue,
                                                  textColor: AppColor.black,
                                                ),
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: AppColor.blueColor,
                                                    size: 35),
                                                items:_.isLoading || _.noInternet ? null: _.newDigUserRegDataAfterOTP!.response!.zakatExemptionList!.map((ZakatExemptionList zakatExemptionList) {
                                                  return DropdownMenuItem<ZakatExemptionList>(
                                                      value: zakatExemptionList,
                                                      child: Text(zakatExemptionList!.description ?? ''));
                                                }).toList(),
                                                onChanged: _.isLoading || _.noInternet ? null :(ZakatExemptionList? value) {
                                                  _.zaKatValue = value!.description!;
                                                  _.zaKatCode = value!.code.toString()!;
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
                                            text:
                                            "RETIREMENT AGE (VPS Account Only)",
                                            textColor: AppColor.black,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 11,
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
                                                  text: _.retirementValue == null ||
                                                      _.retirementValue == ""
                                                      ? "Retirement Age"
                                                      : _.retirementValue,
                                                  textColor: AppColor.black,
                                                ),
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: AppColor.blueColor,
                                                    size: 30),
                                                items:_.isLoading || _.noInternet ? null: _.newDigUserRegDataAfterOTP!.response!.retirementAgeList!.map((RetirementAgeList retirementAgeList) {
                                                  return DropdownMenuItem<RetirementAgeList>(
                                                      value: retirementAgeList,
                                                      child: Text(retirementAgeList!.description ?? ''));
                                                }).toList(),
                                                onChanged: _.isLoading || _.noInternet ? null :(RetirementAgeList? value) {
                                                  _.retirementValue = value!.description!;
                                                  _.retirementCode = value!.code.toString()!;
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
                                            text: "MOBILE NUMBER*",
                                            textColor: AppColor.black,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 12,
                                          ),
                                          CustomTextFormField(fieldType: Constants.phoneNumberField,
                                            isRounded: true,
                                            hint: "+92xxxxxxxxx",hintColor: AppColor.black,
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
                                            text: "PHONE NUMBER*",
                                            textColor: AppColor.black,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 12,
                                          ),
                                          CustomTextFormField(fieldType: Constants.phoneNumberField,
                                            isRounded: true,
                                            hint: "+92xxxxxxxxx",hintColor: AppColor.black,
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
                                            text: "OFFICE PHONE NUMBER*",
                                            textAlign: TextAlign.start,
                                            textColor: AppColor.black,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 12,
                                          ),
                                          CustomTextFormField(
                                            isRounded: true,
                                            hint: "+92xxxxxxxxx",hintColor: AppColor.black,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          const RestInvestTitle(
                                            text: "CURRENT ADDRESS*",
                                            textColor: AppColor.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w900,
                                          ),
                                          CustomTextFormField(
                                            isRounded: true,
                                            hint: "",
                                            // textInputType: TextInputType.emailAddress,
                                          ),
                                        ],
                                      ),
                                    ),
                                    // const SizedBox(
                                    //   width: 6,
                                    // ),
                                    // Expanded(
                                    //   child: Column(
                                    //     crossAxisAlignment:
                                    //         CrossAxisAlignment.start,
                                    //     children: [
                                    //       const RestInvestTitle(
                                    //         text: "EMAIL ADDRESS*",
                                    //         textColor: AppColor.black,
                                    //         fontWeight: FontWeight.w900,
                                    //         fontSize: 12,
                                    //       ),
                                    //       CustomTextFormField(
                                    //         isRounded: true,
                                    //         hint: "+92xxxxxxxxx",hintColor: AppColor.black,
                                    //         // textInputType: TextInputType.emailAddress,
                                    //       ),
                                    //       // Container(
                                    //       //   // margin: EdgeInsets.all(10.0),
                                    //       //   padding: const EdgeInsets.only(
                                    //       //       left: 10.0, right: 5.0),
                                    //       //   height: 35,
                                    //       //   alignment: Alignment.center,
                                    //       //   decoration: BoxDecoration(
                                    //       //       color: AppColor.whiteColor,
                                    //       //       border: Border.all(
                                    //       //           width: 1,
                                    //       //           color: AppColor.black)),
                                    //       //   child: Center(
                                    //       //     child: DropdownButton(
                                    //       //       isExpanded: true,
                                    //       //       underline: Container(
                                    //       //         color: AppColor.whiteColor,
                                    //       //       ),
                                    //       //
                                    //       //       borderRadius:
                                    //       //           BorderRadius.circular(6),
                                    //       //       // value: _.dropdownvalue,
                                    //       //       hint: RestInvestTitle(
                                    //       //         text: _.amountvalue == null ||
                                    //       //                 _.amountvalue == ""
                                    //       //             ? "Account No."
                                    //       //             : _.amountvalue,
                                    //       //         textColor: AppColor.black,
                                    //       //       ),
                                    //       //       icon: const Icon(
                                    //       //           Icons.keyboard_arrow_down,
                                    //       //           color: AppColor.blueColor,
                                    //       //           size: 30),
                                    //       //       items: fromAccountItems.map(
                                    //       //           (String? fromAccountItems) {
                                    //       //         return DropdownMenuItem<String>(
                                    //       //             value: fromAccountItems,
                                    //       //             child:
                                    //       //                 Text(fromAccountItems!));
                                    //       //       }).toList(),
                                    //       //       onChanged: (String? value) {
                                    //       //         _.amountvalue = value!;
                                    //       //         _.update();
                                    //       //       },
                                    //       //     ),
                                    //       //   ),
                                    //       // ),
                                    //     ],
                                    //   ),
                                    // ),
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
                                            text: "MAILING ADDRESS*",
                                            textColor: AppColor.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w900,
                                          ),
                                          CustomTextFormField(
                                            isRounded: true,
                                            hint: "",
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
                                            text: "EMAIL ADDRESS*",
                                            textColor: AppColor.black,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 12,
                                          ),
                                          CustomTextFormField(
                                            isRounded: true,
                                            hint: "ali.tahir@softech.com.pk",hintColor: AppColor.black,
                                            // textInputType: TextInputType.emailAddress,
                                          ),
                                          // Container(
                                          //   // margin: EdgeInsets.all(10.0),
                                          //   padding: const EdgeInsets.only(
                                          //       left: 10.0, right: 5.0),
                                          //   height: 35,
                                          //   alignment: Alignment.center,
                                          //   decoration: BoxDecoration(
                                          //       color: AppColor.whiteColor,
                                          //       border: Border.all(
                                          //           width: 1,
                                          //           color: AppColor.black)),
                                          //   child: Center(
                                          //     child: DropdownButton(
                                          //       isExpanded: true,
                                          //       underline: Container(
                                          //         color: AppColor.whiteColor,
                                          //       ),
                                          //
                                          //       borderRadius:
                                          //           BorderRadius.circular(6),
                                          //       // value: _.dropdownvalue,
                                          //       hint: RestInvestTitle(
                                          //         text: _.amountvalue == null ||
                                          //                 _.amountvalue == ""
                                          //             ? "Account No."
                                          //             : _.amountvalue,
                                          //         textColor: AppColor.black,
                                          //       ),
                                          //       icon: const Icon(
                                          //           Icons.keyboard_arrow_down,
                                          //           color: AppColor.blueColor,
                                          //           size: 30),
                                          //       items: fromAccountItems.map(
                                          //           (String? fromAccountItems) {
                                          //         return DropdownMenuItem<String>(
                                          //             value: fromAccountItems,
                                          //             child:
                                          //                 Text(fromAccountItems!));
                                          //       }).toList(),
                                          //       onChanged: (String? value) {
                                          //         _.amountvalue = value!;
                                          //         _.update();
                                          //       },
                                          //     ),
                                          //   ),
                                          // ),
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
                                            text: "MAILING COUNTRY*",
                                            textColor: AppColor.black,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 12,
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
                                                  text: _.mailingCountryValue == null ||
                                                      _.mailingCountryValue == ""
                                                      ? "Mailing Country"
                                                      : _.mailingCountryValue,
                                                  textColor: AppColor.black,
                                                ),
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: AppColor.blueColor,
                                                    size: 30),
                                                items:_.isLoading || _.noInternet ? null: _.newDigUserRegDataAfterOTP!.response!.countries!.map((Countries countries) {
                                                  return DropdownMenuItem<Countries>(
                                                      value: countries,
                                                      child: Text(countries!.countryName ?? ''));
                                                }).toList(),
                                                onChanged: _.isLoading || _.noInternet ? null :(Countries? value) {
                                                  _.mailingCountryValue = value!.countryName!;
                                                  _.mailingCountryCode = value!.countryCode!;
                                                  _.isMailingCity = true;
                                                  _.onCityData(value.countryCode!);
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
                                            text: "MAILING CITY*",
                                            textColor: AppColor.black,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 12,
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
                                                child: _.mailingCityData != null
                                                    ? DropdownButton(
                                                  isExpanded: true,
                                                  // alignment: Alignment.center,
                                                  // icon: const Visibility(
                                                  //   visible: false,
                                                  //   child: Icon(Icons.arrow_downward),
                                                  // ),
                                                  // iconSize: 0,
                                                  underline: Container(
                                                    // alignment: Alignment.center,
                                                    color: AppColor.whiteColor,
                                                  ),

                                                  borderRadius: BorderRadius.circular(10),
                                                  // value: _.dropdownvalue,
                                                  hint: Center(
                                                    child: RestInvestTitle(
                                                      text: _.mailingCityValue == null ||
                                                          _.mailingCityValue == ""
                                                          ? "Mailing City"
                                                          : _.mailingCityValue,
                                                      textColor: AppColor.black,
                                                    ),
                                                  ),
                                                  icon: const Icon(
                                                      Icons.keyboard_arrow_down,
                                                      color: AppColor.blueColor,
                                                      size: 30),
                                                  items: _.mailingCityData!.response!
                                                      .map<DropdownMenuItem<res.Response>>(
                                                          (res.Response? value) {
                                                        return DropdownMenuItem<res.Response>(
                                                          value: value,
                                                          child: Text(value!.cityName!),
                                                        );
                                                      }).toList(),
                                                  onChanged: (res.Response? value) {
                                                    _.mailingCityValue = value!.cityName!;
                                                    _.mailingCityCode = value.cityCode!;
                                                    _.update();
                                                    // _.onCitySectorData(value.cityCode!);
                                                  },
                                                )
                                                    : const SizedBox()),
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
                                            text: "CURRENT COUNTRY*",
                                            textColor: AppColor.black,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 12,
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
                                                  text: _.currentCountryValue == null ||
                                                      _.currentCountryValue == ""
                                                      ? "Current Country"
                                                      : _.currentCountryValue,
                                                  textColor: AppColor.black,
                                                ),
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: AppColor.blueColor,
                                                    size: 30),
                                                items:_.isLoading || _.noInternet ? null: _.newDigUserRegDataAfterOTP!.response!.countries!.map((Countries countries) {
                                                  return DropdownMenuItem<Countries>(
                                                      value: countries,
                                                      child: Text(countries!.countryName ?? ''));
                                                }).toList(),
                                                onChanged: _.isLoading || _.noInternet ? null :(Countries? value) {
                                                  _.currentCountryValue = value!.countryName!;
                                                  _.currentCountryCode = value!.countryCode!;
                                                  if(_.isMailingCity) {
                                                    _.isMailingCity = false;
                                                  }
                                                  _.onCityData(value.countryCode!);
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
                                            text: "CURRENT CITY*",
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
                                                child: _.currentCityData != null
                                                    ? DropdownButton(
                                                  isExpanded: true,
                                                  // alignment: Alignment.center,
                                                  // icon: const Visibility(
                                                  //   visible: false,
                                                  //   child: Icon(Icons.arrow_downward),
                                                  // ),
                                                  // iconSize: 0,
                                                  underline: Container(
                                                    // alignment: Alignment.center,
                                                    color: AppColor.whiteColor,
                                                  ),

                                                  borderRadius: BorderRadius.circular(10),
                                                  // value: _.dropdownvalue,
                                                  hint: Center(
                                                    child: RestInvestTitle(
                                                      text: _.currentCityValue == null ||
                                                          _.currentCityValue == ""
                                                          ? "Current City"
                                                          : _.currentCityValue,
                                                      textColor: AppColor.black,
                                                    ),
                                                  ),
                                                  icon: const Icon(
                                                      Icons.keyboard_arrow_down,
                                                      color: AppColor.blueColor,
                                                      size: 30),
                                                  items: _.currentCityData!.response!
                                                      .map<DropdownMenuItem<res.Response>>(
                                                          (res.Response? value) {
                                                        return DropdownMenuItem<res.Response>(
                                                          value: value,
                                                          child: Text(value!.cityName!),
                                                        );
                                                      }).toList(),
                                                  onChanged: (res.Response? value) {
                                                    _.currentCityValue = value!.cityName!;
                                                    _.currentCityCode = value.cityCode!;
                                                    _.update();
                                                    // _.onCitySectorData(value.cityCode!);
                                                  },
                                                )
                                                    : const SizedBox()),
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
                                            text: "BANK NAME*",
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
                                                  text: _.bankNameValue == null ||
                                                      _.bankNameValue == ""
                                                      ? "Bank"
                                                      : _.bankNameValue,
                                                  textColor: AppColor.black,
                                                ),
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: AppColor.blueColor,
                                                    size: 30),
                                                items:_.isLoading || _.noInternet ? null: _.newDigUserRegDataAfterOTP!.response!.banks!.map((Banks banks) {
                                                  return DropdownMenuItem<Banks>(
                                                      value: banks,
                                                      child: Text(banks!.description ?? ''));
                                                }).toList(),
                                                onChanged: _.isLoading || _.noInternet ? null :(Banks? value) {
                                                  _.bankNameValue = value!.description!;
                                                  _.bankNameCode = value!.code!;
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
                                            text: "BANK CITY*",
                                            textColor: AppColor.black,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 12,
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
                                                  text: _.bankCityValue == null ||
                                                      _.bankCityValue == ""
                                                      ? "Bank City"
                                                      : _.bankCityValue,
                                                  textColor: AppColor.black,
                                                ),
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: AppColor.blueColor,
                                                    size: 30),
                                                items:_.isLoading || _.noInternet ? null: _.newDigUserRegDataAfterOTP!.response!.pakCities!.map((PakCities pakCities) {
                                                  return DropdownMenuItem<PakCities>(
                                                      value: pakCities,
                                                      child: Text(pakCities!.cityName ?? ''));
                                                }).toList(),
                                                onChanged: _.isLoading || _.noInternet ? null :(PakCities? value) {
                                                  _.bankCityValue = value!.cityName!;
                                                  _.bankCityCode = value!.cityCode!;
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
                                            text: "BRANCH NAME*",
                                            textColor: AppColor.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w900,
                                          ),
                                          CustomTextFormField(
                                            isRounded: true,
                                            hint: "",hintColor: AppColor.black,
                                            // textInputType: TextInputType.emailAddress,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                space,
                                // Row(
                                //   children: [
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const RestInvestTitle(
                                      text: "IBAN NUMBER*",
                                      textColor: AppColor.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    CustomTextFormField(
                                      isRounded: true,
                                      hint: "",hintColor: AppColor.black,
                                      // textInputType: TextInputType.emailAddress,
                                    ),
                                  ],
                                ),
                                //   ],
                                // ),

                                space,
                                const RestInvestTitle(
                                  text: "DIVIDEND MANDATE:*",
                                  textColor: AppColor.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                ),
                                Row(
                                  children: [
                                    Radio(
                                      value: '0',
                                      groupValue: _.groupValue,
                                      onChanged: (String? val) {
                                        _.groupValue = val!;
                                        _.update();
                                      },
                                      fillColor: MaterialStateColor.resolveWith(
                                              (states) => AppColor.blueColor),
                                    ),
                                    const RestInvestTitle(
                                      text: "RE-INVEST",
                                      textColor: AppColor.dimblack,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    Radio(
                                      value: '1',
                                      groupValue: _.groupValue,
                                      onChanged: (String? val) {
                                        _.groupValue = val!;
                                        _.update();
                                      },
                                      fillColor: MaterialStateColor.resolveWith(
                                              (states) => AppColor.blueColor),
                                    ),
                                    const RestInvestTitle(
                                      text: "CASH",
                                      textColor: AppColor.dimblack,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900,
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
                                      "I accept that my investments is subject \nto market risks and a target return / dividend \nrange orcapital protection cannot be guaranteed.\nI clearly understand, agree, acknowledge and \naccept that my investment is subject \nto market price fluctuations and \nother risks inherent in all such\ninvestments. The risks emanate from \nvarious factors which include, but \nare not limited to, market risks, \ngovernment regulation risks, credit \nrisks, liquidity risks, settlement risks, \nredemption risks, Shari’ah non-compliance \nrisks, dividend distribution taxation \nrisks, and changes in risks associated \nwith trading volumes, liquidity and settlement \nsystems in equity and debt markets. \nPast performance is not necessarily indicative \nof future results. Investment\nin mutual funds are not bank deposits and are \nneither issued by, insured by, obligation of, nor\notherwise supported by SECP, any \nGovernment Agency, Trustee (except to the extent\nspecifically stated in the constitutive documents) \nor any of the shareholders of National\nInvestment Trust Limited or any of the Pre-IPO \nInvestors or any other bank or financial\ninstitution. Returns offered by Funds / \nPlans can be positive and / or negative and \nmay increase\nor decrease subject to capital \nmarket conditions and risk profile \nof the selected Fund / Plan.\nHence, the value of investment \nmay go below the invested amount. \nFor further details, please\nrefer to the detailed risk disclosures \nand disclaimers contained \nin the Offering Documents,\nSupplementary Offering Documents and the \nlatest Fund Manager Report available on our\nwebsite or by calling or writing to us.             ",
                                      textColor: AppColor.black,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ],
                                ),
                                space,
                                CustomRoundButton(height: 35,
                                    text: "SAVE&NEXT",
                                    onPress: () {

                                  Get.toNamed(AppRoute.accountOpenKycDetailScreen);
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
