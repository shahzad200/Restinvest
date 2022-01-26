import 'dart:ui';

import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:investintrust/routes/routes.dart';
import 'package:investintrust/utils/constants.dart';
import '../data/models/new_dig_user_reg_data_after_otp.dart';

import '../utils/constant.dart';
import '../widgets/datefield.dart';
import '../controller/account_opening_basic_information_screen_controller.dart';

import '../widgets/button.dart';

import '../utils/colors.dart';


import '../widgets/textformfiled.dart';

import '../widgets/constant_widget.dart';
import '../data/models/city_data.dart' as res;

class AccountOpenBasicInformationScreen extends StatelessWidget {
  const AccountOpenBasicInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                                // Row(
                                //   children: const [
                                //     RestInvestTitle(
                                //       text: " OTP VERIFY > ",
                                //       textAlign: TextAlign.start,
                                //       textColor: AppColor.dimblack,
                                //       fontWeight: FontWeight.w900,
                                //     ),
                                //     RestInvestTitle(
                                //       text: " BASIC INFORMATION > ",
                                //       textAlign: TextAlign.start,
                                //       textColor: AppColor.blueColor,
                                //       fontWeight: FontWeight.w900,
                                //     ),
                                //   ],
                                // ),
                                space,
                                const RestInvestTitle(
                                  text: "Title",
                                  textColor: AppColor.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 12,
                                ),
                                Container(
                                  // margin: EdgeInsets.all(10.0),
                                  padding:
                                  const EdgeInsets.only(left: 10.0, right: 5.0),
                                  height: 37,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: AppColor.whiteColor,
                                      border: Border.all(
                                          width: 1, color: AppColor.black)),
                                  child: Center(
                                    child: DropdownButton(
                                      isExpanded: true,
                                      underline: Container(
                                        color: AppColor.whiteColor,
                                      ),

                                      borderRadius: BorderRadius.circular(6),
                                      // value: _.dropdownvalue,
                                      hint: RestInvestTitle(
                                        textAlign: TextAlign.center,
                                        text: _.titleValue == null ||
                                            _.titleValue == ""
                                            ? "Title"
                                            : _.titleValue,
                                        textColor: _.titleValue == null ||
                                            _.titleValue == ""
                                            ? AppColor.dimblack : AppColor.black,
                                        fontSize: 12,
                                      ),
                                      icon: const Icon(Icons.keyboard_arrow_down,
                                          color: AppColor.blueColor, size: 25),
                                      items: _.isLoading || _.noInternet
                                          ? null
                                          : _.newDigUserRegDataAfterOTP!.response!
                                          .titleList!
                                          .map((TitleList titleItems) {
                                        return DropdownMenuItem<TitleList>(
                                            value: titleItems,
                                            child: Text(
                                                titleItems!.description ??
                                                    ''));
                                      }).toList(),
                                      onChanged: _.isLoading || _.noInternet
                                          ? null
                                          : (TitleList? value) {
                                        _.titleValue = value!.description!;
                                        _.titleCode = value!.code!;
                                        _.update();
                                      },
                                    ),
                                  ),
                                ),
                                space,
                                Row(                                  crossAxisAlignment: CrossAxisAlignment.end,

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
                                            controller: _.nameController,
                                            isRounded: true,
                                            hint: "Name",
                                            hintColor: AppColor.dimblack,
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
                                            controller: _.fNameController,
                                            isRounded: true,
                                            hint: "Father's/husband name",
                                            hintColor: AppColor.dimblack,
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
                                            controller: _.mNameController,
                                            isRounded: true,
                                            hint: "Mother Name",
                                            hintColor: AppColor.dimblack,
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
                                            controller: _.cNicController,
                                            isRounded: true,
                                          enable: false,
                                          inputFormator: [
                                            FilteringTextInputFormatter.digitsOnly,
                                            new LengthLimitingTextInputFormatter(13),
                                            new NumberFormatter()
                                          ],
                                            hint: "1111-111111111-1",
                                            hintColor: AppColor.dimblack,
                                            // textInputType: TextInputType.emailAddress,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                space,
                                Row(                                  crossAxisAlignment: CrossAxisAlignment.end,

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
                                            height: 37,
                                            child: DateFormFieldContainer(
                                              isRounded: false,
                                              isTrue: true,
                                              text: DateTime.now().day.toString()+'/'+DateTime.now().month.toString()+'/'+DateTime.now().year.toString(),
                                              mode: DateTimeFieldPickerMode.date,
                                              dateFormatTrue: true,
                                              initialValue: DateTime.now(),
                                              onDateSelected: (value) {
                                                _.cNicIssueDate = _.dateTime(value);
                                              },
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
                                        CrossAxisAlignment.end,
                                        children: [
                                          const RestInvestTitle(
                                            text:
                                            'CNIC/NICOP EXPIRY DATE* LIFETIME',
                                            textColor: AppColor.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w900,
                                          ),
                                          SizedBox(
                                            height: 37,
                                            child: DateFormFieldContainer(
                                              isRounded: false,
                                              text: DateTime.now().day.toString()+'/'+DateTime.now().month.toString()+'/'+DateTime.now().year.toString(),
                                              mode: DateTimeFieldPickerMode.date,
                                              dateFormatTrue: true,
                                              isTrue: true,
                                              initialValue: DateTime.now(),
                                              onDateSelected: (value) {
                                                _.cNicExpDate = _.dateTime(value);
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                space,
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
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
                                            height: 37,
                                            child: DateFormFieldContainer(
                                              isRounded: false,
                                              isTrue: true,
                                              text: DateTime.now().day.toString()+'/'+DateTime.now().month.toString()+'/'+DateTime.now().year.toString(),
                                              mode: DateTimeFieldPickerMode.date,
                                              dateFormatTrue: true,
                                              initialValue: DateTime.now(),
                                              onDateSelected: (value) {
                                                _.dObDate = _.dateTime(value);
                                              },
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
                                            height: 37,
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
                                                  textColor: _.martialValue == null ||
                                                      _.martialValue == ""
                                                      ? AppColor.dimblack : AppColor.black,
                                                    fontSize: 12,
                                                ),
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: AppColor.blueColor,
                                                    size: 25),
                                                items: _.isLoading || _.noInternet
                                                    ? null
                                                    : _
                                                    .newDigUserRegDataAfterOTP!
                                                    .response!
                                                    .maritalStatusList!
                                                    .map((MaritalStatusList
                                                maritalStatusList) {
                                                  return DropdownMenuItem<
                                                      MaritalStatusList>(
                                                      value:
                                                      maritalStatusList,
                                                      child: Text(
                                                          maritalStatusList!
                                                              .description ??
                                                              ''));
                                                }).toList(),
                                                onChanged: _.isLoading ||
                                                    _.noInternet
                                                    ? null
                                                    : (MaritalStatusList? value) {
                                                  _.martialValue =
                                                  value!.description!;
                                                  _.martialCode =
                                                  value!.code!;
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
                                            height: 37,
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
                                                  text: _.nationalityValue ==
                                                      null ||
                                                      _.nationalityValue == ""
                                                      ? "Nationality"
                                                      : _.nationalityValue,
                                                  textColor: _.nationalityValue == null ||
                                                      _.nationalityValue == ""
                                                      ? AppColor.dimblack : AppColor.black,
                                                  fontSize: 12,
                                                ),
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: AppColor.blueColor,
                                                    size: 25),
                                                items: _.isLoading || _.noInternet
                                                    ? null
                                                    : _.newDigUserRegDataAfterOTP!
                                                    .response!.nationalities!
                                                    .map((Nationalities
                                                nationality) {
                                                  return DropdownMenuItem<
                                                      Nationalities>(
                                                      value: nationality,
                                                      child: Text(nationality!
                                                          .countryName ??
                                                          ''));
                                                }).toList(),
                                                onChanged:
                                                _.isLoading || _.noInternet
                                                    ? null
                                                    : (Nationalities? value) {
                                                  _.nationalityValue =
                                                  value!.countryName!;
                                                  _.nationalityCode =
                                                  value!.countryCode!;
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
                                            height: 37,
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
                                                  text: _.residentStatusValue ==
                                                      null ||
                                                      _.residentStatusValue ==
                                                          ""
                                                      ? "Residential"
                                                      : _.residentStatusValue,
                                                  fontSize: 12,
                                                  textColor: _.residentStatusValue == null ||
                                                      _.residentStatusValue == ""
                                                      ? AppColor.dimblack : AppColor.black,
                                                ),
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: AppColor.blueColor,
                                                    size: 25),
                                                items: _.isLoading || _.noInternet
                                                    ? null
                                                    : _
                                                    .newDigUserRegDataAfterOTP!
                                                    .response!
                                                    .residentStatusList!
                                                    .map((ResidentStatusList
                                                residentStatusList) {
                                                  return DropdownMenuItem<
                                                      ResidentStatusList>(
                                                      value:
                                                      residentStatusList,
                                                      child: Text(
                                                          residentStatusList!
                                                              .description ??
                                                              ''));
                                                }).toList(),
                                                onChanged: _.isLoading ||
                                                    _.noInternet
                                                    ? null
                                                    : (ResidentStatusList? value) {
                                                  _.residentStatusValue =
                                                  value!.description!;
                                                  _.residentStatusCode =
                                                  value!.code!;
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
                                            height: 37,
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
                                                  textColor:_.religionValue == null ||
                                                      _.religionValue == ""
                                                      ? AppColor.dimblack : AppColor.black,
                                                  fontSize: 12,
                                                ),
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: AppColor.blueColor,
                                                    size: 25),
                                                items: _.isLoading || _.noInternet
                                                    ? null
                                                    : _.newDigUserRegDataAfterOTP!
                                                    .response!.religions!
                                                    .map((Religions religions) {
                                                  return DropdownMenuItem<
                                                      Religions>(
                                                      value: religions,
                                                      child: Text(religions!
                                                          .religionName ??
                                                          ''));
                                                }).toList(),
                                                onChanged: _.isLoading ||
                                                    _.noInternet
                                                    ? null
                                                    : (Religions? value) {
                                                  _.religionValue =
                                                  value!.religionName!;
                                                  _.religionCode =
                                                  value!.religionCode!;
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
                                            height: 37,
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
                                                  textColor:_.zaKatValue == null ||
                                                      _.zaKatValue == ""
                                                      ? AppColor.dimblack : AppColor.black,
                                                  fontSize: 12,
                                                ),
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: AppColor.blueColor,
                                                    size: 25),
                                                items: _.isLoading || _.noInternet
                                                    ? null
                                                    : _
                                                    .newDigUserRegDataAfterOTP!
                                                    .response!
                                                    .zakatExemptionList!
                                                    .map((ZakatExemptionList
                                                zakatExemptionList) {
                                                  return DropdownMenuItem<
                                                      ZakatExemptionList>(
                                                      value:
                                                      zakatExemptionList,
                                                      child: Text(
                                                          zakatExemptionList!
                                                              .description ??
                                                              ''));
                                                }).toList(),
                                                onChanged: _.isLoading ||
                                                    _.noInternet
                                                    ? null
                                                    : (ZakatExemptionList? value) {
                                                  _.zaKatValue =
                                                  value!.description!;
                                                  _.zaKatCode =
                                                  value!.code!;
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
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Constant.accType != 'I' ?  Expanded(
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
                                            height: 37,
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
                                                  textColor: AppColor.black,fontSize: 12,
                                                ),
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: AppColor.blueColor,
                                                    size: 25),
                                                items: _.isLoading || _.noInternet
                                                    ? null
                                                    : _
                                                    .newDigUserRegDataAfterOTP!
                                                    .response!
                                                    .retirementAgeList!
                                                    .map((RetirementAgeList
                                                retirementAgeList) {
                                                  return DropdownMenuItem<
                                                      RetirementAgeList>(
                                                      value:
                                                      retirementAgeList,
                                                      child: Text(
                                                          retirementAgeList!
                                                              .description ??
                                                              ''));
                                                }).toList(),
                                                onChanged: _.isLoading ||
                                                    _.noInternet
                                                    ? null
                                                    : (RetirementAgeList? value) {
                                                  _.retirementValue =
                                                  value!.description!;
                                                  _.retirementCode =
                                                  value!.code.toString()!;
                                                  _.update();
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ) : const SizedBox(),
                                    Constant.accType == 'I' ? const SizedBox(
                                      width: 6,
                                    ) : const SizedBox(),
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
                                          CustomTextFormField(
                                            controller: _.mobileController,
                                            fieldType: Constants.phoneNumberField,
                                            enable: false,
                                            isRounded: true,
                                            hint: "+92xxxxxxxxx",
                                            hintColor: AppColor.dimblack,

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
                                          CustomTextFormField(
                                            controller: _.phoneController,
                                            fieldType: Constants.phoneNumberField,
                                            isRounded: true,
                                            hint: "+92xxxxxxxxx",
                                            hintColor: AppColor.dimblack,
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
                                            controller: _.officePhoneController,
                                            isRounded: true,
                                            hint: "+92xxxxxxxxx",
                                            hintColor: AppColor.dimblack,
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
                                            controller: _.currentAddressController,
                                            isRounded: true,
                                            hint: "address",
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
                                            controller: _.mailingAddressController,
                                            isRounded: true,
                                            hint: "address",
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
                                            controller: _.eMailAddressController,
                                            isRounded: true,
                                            enable: false,
                                            hint: "abc@gmail.com",
                                            hintColor: AppColor.dimblack,
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
                                            height: 37,
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
                                                  text: _.mailingCountryValue ==
                                                      null ||
                                                      _.mailingCountryValue ==
                                                          ""
                                                      ? "Mailing Country"
                                                      : _.mailingCountryValue,
                                                  fontSize: 12,
                                                  textColor: _.mailingCountryValue ==
                                                      null ||
                                                      _.mailingCountryValue ==
                                                          ""
                                                      ? AppColor.dimblack :AppColor.black,
                                                ),
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: AppColor.blueColor,
                                                    size: 25),
                                                items: _.isLoading || _.noInternet
                                                    ? null
                                                    : _.newDigUserRegDataAfterOTP!
                                                    .response!.countries!
                                                    .map((Countries countries) {
                                                  return DropdownMenuItem<
                                                      Countries>(
                                                      value: countries,
                                                      child: Text(countries!
                                                          .countryName ??
                                                          ''));
                                                }).toList(),
                                                onChanged:
                                                _.isLoading || _.noInternet
                                                    ? null
                                                    : (Countries? value) {
                                                  _.mailingCountryValue =
                                                  value!.countryName!;
                                                  _.mailingCountryCode =
                                                  value!.countryCode!;
                                                  _.isMailingCity = true;
                                                  _.onCityData(
                                                      value.countryCode!);
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
                                            height: 37,
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
                                                    color:
                                                    AppColor.whiteColor,
                                                  ),

                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      10),
                                                  // value: _.dropdownvalue,
                                                  hint: Center(
                                                    child: RestInvestTitle(
                                                      text: _.mailingCityValue ==
                                                          null ||
                                                          _.mailingCityValue ==
                                                              ""
                                                          ? "Mailing City"
                                                          : _.mailingCityValue,
                                                      textColor:
                                                      AppColor.black,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  icon: const Icon(
                                                      Icons
                                                          .keyboard_arrow_down,
                                                      color:
                                                      AppColor.blueColor,
                                                      size: 25),
                                                  items: _.mailingCityData!
                                                      .response!
                                                      .map<
                                                      DropdownMenuItem<
                                                          res.Response>>(
                                                          (res.Response?
                                                      value) {
                                                        return DropdownMenuItem<
                                                            res.Response>(
                                                          value: value,
                                                          child: Text(
                                                              value!.cityName!),
                                                        );
                                                      }).toList(),
                                                  onChanged:
                                                      (res.Response? value) {
                                                    _.mailingCityValue =
                                                    value!.cityName!;
                                                    _.mailingCityCode =
                                                    value.cityCode!;
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
                                            height: 37,
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
                                                  text: _.currentCountryValue ==
                                                      null ||
                                                      _.currentCountryValue ==
                                                          ""
                                                      ? "Current Country"
                                                      : _.currentCountryValue,
                                                  textColor: _.currentCountryValue ==
                                                      null ||
                                                      _.currentCountryValue ==
                                                          "" ? AppColor.dimblack : AppColor.black,
                                                    fontSize: 12,
                                                ),
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: AppColor.blueColor,
                                                    size: 25),
                                                items: _.isLoading || _.noInternet
                                                    ? null
                                                    : _.newDigUserRegDataAfterOTP!
                                                    .response!.countries!
                                                    .map((Countries countries) {
                                                  return DropdownMenuItem<
                                                      Countries>(
                                                      value: countries,
                                                      child: Text(countries!
                                                          .countryName ??
                                                          ''));
                                                }).toList(),
                                                onChanged: _.isLoading ||
                                                    _.noInternet
                                                    ? null
                                                    : (Countries? value) {
                                                  _.currentCountryValue =
                                                  value!.countryName!;
                                                  _.currentCountryCode =
                                                  value!.countryCode!;
                                                  if (_.isMailingCity) {
                                                    _.isMailingCity = false;
                                                  }
                                                  _.onCityData(
                                                      value.countryCode!);
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
                                            height: 37,
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
                                                    color:
                                                    AppColor.whiteColor,
                                                  ),

                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      10),
                                                  // value: _.dropdownvalue,
                                                  hint: Center(
                                                    child: RestInvestTitle(
                                                      text: _.currentCityValue ==
                                                          null ||
                                                          _.currentCityValue ==
                                                              ""
                                                          ? "Current City"
                                                          : _.currentCityValue,
                                                      fontSize: 12,
                                                      textColor:
                                                      AppColor.black,
                                                    ),
                                                  ),
                                                  icon: const Icon(
                                                      Icons
                                                          .keyboard_arrow_down,
                                                      color:
                                                      AppColor.blueColor,
                                                      size: 25),
                                                  items: _.currentCityData!
                                                      .response!
                                                      .map<
                                                      DropdownMenuItem<
                                                          res.Response>>(
                                                          (res.Response?
                                                      value) {
                                                        return DropdownMenuItem<
                                                            res.Response>(
                                                          value: value,
                                                          child: Text(
                                                              value!.cityName!),
                                                        );
                                                      }).toList(),
                                                  onChanged:
                                                      (res.Response? value) {
                                                    _.currentCityValue =
                                                    value!.cityName!;
                                                    _.currentCityCode =
                                                    value.cityCode!;
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
                                            height: 37,
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
                                                  fontSize: 12,
                                                  textColor: _.bankNameValue ==
                                                      null ||
                                                      _.bankNameValue ==
                                                          "" ? AppColor.dimblack : AppColor.black,
                                                ),
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: AppColor.blueColor,
                                                    size: 25),
                                                items: _.isLoading || _.noInternet
                                                    ? null
                                                    : _.newDigUserRegDataAfterOTP!
                                                    .response!.banks!
                                                    .map((Banks banks) {
                                                  return DropdownMenuItem<
                                                      Banks>(
                                                      value: banks,
                                                      child: Text(banks!
                                                          .description ??
                                                          ''));
                                                }).toList(),
                                                onChanged:
                                                _.isLoading || _.noInternet
                                                    ? null
                                                    : (Banks? value) {
                                                  _.bankNameValue =
                                                  value!.description!;
                                                  _.bankNameCode =
                                                  value!.code!;
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
                                            height: 37,
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
                                                  textColor: _.bankCityValue ==
                                                      null ||
                                                      _.bankCityValue ==
                                                          "" ? AppColor.dimblack : AppColor.black,
                                                    fontSize: 12,
                                                ),
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: AppColor.blueColor,
                                                    size: 25),
                                                items: _.isLoading || _.noInternet
                                                    ? null
                                                    : _.newDigUserRegDataAfterOTP!
                                                    .response!.pakCities!
                                                    .map((PakCities pakCities) {
                                                  return DropdownMenuItem<
                                                      PakCities>(
                                                      value: pakCities,
                                                      child: Text(pakCities!
                                                          .cityName ??
                                                          ''));
                                                }).toList(),
                                                onChanged:
                                                _.isLoading || _.noInternet
                                                    ? null
                                                    : (PakCities? value) {
                                                  _.bankCityValue =
                                                  value!.cityName!;
                                                  _.bankCityCode =
                                                  value!.cityCode!;
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
                                            controller: _.bankBranchController,
                                            isRounded: true,
                                            hint: "", hintColor: AppColor.dimblack,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const RestInvestTitle(
                                      text: "IBAN NUMBER*",
                                      textColor: AppColor.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    CustomTextFormField(
                                      controller: _.iBanNumberController,
                                      isRounded: true,
                                      length: 24,
                                      hint: "ibn number", hintColor: AppColor.dimblack,
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
                                _.isLoading ?
                                  const SizedBox() : Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: _
                                      .newDigUserRegDataAfterOTP!
                                      .response!
                                      .dividendMandateList!
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
                                      _.dividendMandateGroupValue,
                                      value: data.code ?? '00',
                                      onChanged: (val) {
                                        _.dividendMandateGroupValue =
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
                                  text: "NAME OF KIN DETAILS",
                                  textColor: AppColor.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                ),
                                space,
                                CustomTextFormField(
                                  controller: _.kinNameController,
                                  isRounded: true,
                                  hint: "NAME",
                                  // textInputType: TextInputType.emailAddress,
                                ),
                                CustomTextFormField(
                                  controller: _.kiNcNicController,
                                  isRounded: true,
                                  hint: "CNIC/NICP",
                                  inputFormator: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(13),
                                    NumberFormatter()
                                  ],
                                  onChange: (va){
                                    // print(va);
                                    // print(_.cNicNumberController.text);
                                  },
                                ),
                                Container(
                                  // margin: EdgeInsets.all(10.0),
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 5.0),
                                  height: 37,
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

                                        text: _.kinRelationValue ==
                                            null ||
                                            _.kinRelationValue ==
                                                ""
                                            ? "Relationship"
                                            : _.kinRelationValue,
                                        fontSize: 12,
                                        textColor: _.kinRelationValue ==
                                            null ||
                                            _.kinRelationValue ==
                                                "" ? AppColor.dimblack : AppColor.black,
                                      ),
                                      icon: const Icon(
                                          Icons.keyboard_arrow_down,
                                          color: AppColor.blueColor,
                                          size: 25),
                                      items: _.isLoading || _.noInternet
                                          ? null
                                          : _
                                          .newDigUserRegDataAfterOTP!
                                          .response!
                                          .relationWithPrincipleList!
                                          .map((RelationWithPrincipleList
                                      residentStatusList) {
                                        return DropdownMenuItem<
                                            RelationWithPrincipleList>(
                                            value:
                                            residentStatusList,
                                            child: Text(
                                                residentStatusList!
                                                    .description ??
                                                    ''));
                                      }).toList(),
                                      onChanged: _.isLoading ||
                                          _.noInternet
                                          ? null
                                          : (RelationWithPrincipleList? value) {
                                        _.kinRelationValue =
                                        value!.description!;
                                        _.kinRelationCode =
                                        value!.code!;
                                        _.update();
                                      },
                                    ),
                                  ),
                                ),
                                CustomTextFormField(
                                  controller: _.kinMobileNumberController,
                                  isRounded: true,
                                  hint: "MOBILE",
                                  // textInputType: TextInputType.emailAddress,
                                ),
                                const RestInvestTitle(
                                  text: "*DISCLAIMER:",
                                  textColor: AppColor.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                ),
                                const SizedBox(height:5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height:25,
                                      width:25,
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
                                    const SizedBox(width: 5,),
                                    const Expanded(
                                      child: RestInvestTitle(
                                        text:
                                        "I accept that my investments is subject to market risks and a target return / dividend range orcapital protection cannot be guaranteed.I clearly understand, agree, acknowledge and accept that my investment is subject to market price fluctuations and other risks inherent in all such investments. The risks emanate from various factors which include, but are not limited to, market risks, government regulation risks, credit risks, liquidity risks, settlement risks, redemption risks, Shari’ah non-compliance risks, dividend distribution taxation risks, and changes in risks associated with trading volumes, liquidity and settlement systems in equity and debt markets. Past performance is not necessarily indicative of future results. Investment in mutual funds are not bank deposits and are neither issued by, insured by, obligation of, nor otherwise supported by SECP, any Government Agency, Trustee (except to the extent specifically stated in the constitutive documents) or any of the shareholders of National Investment Trust Limited or any of the Pre-IPO Investors or any other bank or financial institution. Returns offered by Funds / Plans can be positive and / or negative and may increase or decrease subject to capital market conditions and risk profile of the selected Fund / Plan. Hence, the value of investment may go below the invested amount. For further details, please refer to the detailed risk disclosures and disclaimers contained in the Offering Documents, Supplementary Offering Documents and the latest Fund Manager Report available on our website or by calling or writing to us.",
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
                                          // Get.toNamed(
                                              // AppRoute.accountOpenKycDetailScreen);
                                          _.onSaveDataAccountOpeningBasicInfo();
                                        },
                                        isRound: false),
                                  ],
                                ),
                                // CustomRoundButton(
                                //     height: 35,
                                //     text: "SAVE&NEXT",
                                //     onPress: () {
                                //       Get.toNamed(
                                //           AppRoute.accountOpenKycDetailScreen);
                                //       // _.onSaveDataAccountOpeningBasicInfo();
                                //     },
                                //     isRound: false),
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
                _.isLoading ?  const Center(
                  child: DialogBox(),
                ) : const SizedBox()
              ],
            ),
          ));
        });
  }
}

class NumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = new StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      print(text.length);
      if (nonZeroIndex <= 5) {
        print("non");
        print(nonZeroIndex);
        if (nonZeroIndex % 5 == 0 && nonZeroIndex != text.length) {
          buffer.write('-'); // Add double spaces.
        }
      } else {
        if (nonZeroIndex % 12 == 0 && nonZeroIndex != text.length) {
          buffer.write('-'); // Add double spaces.
        }
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: new TextSelection.collapsed(offset: string.length));
  }
}
