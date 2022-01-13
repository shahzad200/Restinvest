import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:investintrust/data/models/new_dig_user_reg_data_after_otp.dart';
import 'package:investintrust/views/account_opening_risk_profile_screen.dart';
import 'package:investintrust/widgets/no_internet.dart';
import '../controller/account_opening_fatca_screen_controller.dart';

import '../widgets/button.dart';

import '../utils/colors.dart';
import '../utils/lists.dart';

import '../widgets/textformfiled.dart';

import '../widgets/constant_widget.dart';
import 'package:investintrust/data/models/state_data.dart' as state_res;
import 'package:investintrust/data/models/city_data.dart' as city_res;
class AccountOpenFatcaScreen extends StatelessWidget {
  const AccountOpenFatcaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                child: const Logo(
                  height: 50,
                  width: 50,
                ),
              ),
              elevation: 0,
            ),
            key: _.scaffoldKey,
            body: Stack(
              children:[ SingleChildScrollView(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: [
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
                                          hint: "Title",
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
                                          hint: "11111-1111111-1",
                                          textInputType: TextInputType.numberWithOptions(),
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
                                fontSize: 14,
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
                                                text: _.countryValue ==
                                                    null ||
                                                    _.countryValue == ""
                                                    ? "Country"
                                                    : _.countryValue,
                                                textColor: AppColor.black,
                                                fontSize: 12,
                                              ),
                                              icon: const Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: AppColor.blueColor,
                                                  size: 30),
                                              items: _.isLoading || _.noInternet
                                                  ? null
                                                  : _.controller.newDigUserRegDataAfterOTP!
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
                                                _.countryValue =
                                                value!.countryName!;
                                                _.countryCode =
                                                value!.countryCode!;


                                                _.onStateData(_.countryCode);
                                                _.onCityData(_.countryCode);
                                                _.update();
                                              },
                                            )
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
                                            child:  DropdownButton(
                                              isExpanded: true,
                                              underline: Container(
                                                color:
                                                AppColor.whiteColor,
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(
                                                  10),
                                              hint: RestInvestTitle(
                                                text:
                                                _.stateValue ==
                                                    null ||
                                                    _.stateValue ==
                                                        "" || _.stateData == null

                                                    ? "State"
                                                    : _.stateValue,
                                                textColor:
                                                AppColor.black,
                                                fontSize: 12,
                                              ),
                                              icon: const Icon(
                                                  Icons
                                                      .keyboard_arrow_down,
                                                  color:
                                                  AppColor.blueColor,
                                                  size: 30),

                                              items:
                                               _.stateList
                                                  .map<
                                                  DropdownMenuItem<
                                                      state_res.Response>>(
                                                      (state_res.Response?
                                                  value) {
                                                    return DropdownMenuItem<
                                                        state_res.Response>(
                                                      value: value,
                                                      child: Text(
                                                          value!.description!),
                                                    );
                                                  }).toList(),
                                              onChanged:
                                                  (state_res.Response? value) {
                                                _.stateValue =
                                                value!.description!;
                                                _.stateCode =
                                                value.code!;
                                                _.update();
                                                // _.onCitySectorData(value.cityCode!);
                                              },
                                            )
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
                                              child: _.cityData != null
                                                  ? DropdownButton(
                                                isExpanded: true,
                                                underline: Container(
                                                  color:
                                                  AppColor.whiteColor,
                                                ),

                                                borderRadius:
                                                BorderRadius.circular(
                                                    10),
                                                hint: RestInvestTitle(
                                                  text: _.birthCityValue ==
                                                      null ||
                                                      _.birthCityValue ==
                                                          ""
                                                      ? "City"
                                                      : _.birthCityValue,
                                                  textColor:
                                                  AppColor.black,
                                                  fontSize: 12,
                                                ),
                                                icon: const Icon(
                                                    Icons
                                                        .keyboard_arrow_down,
                                                    color:
                                                    AppColor.blueColor,
                                                    size: 30),
                                                items: _.cityList
                                                    .map<
                                                    DropdownMenuItem<
                                                        city_res.Response>>(
                                                        (city_res.Response?
                                                    value) {
                                                      return DropdownMenuItem<
                                                          city_res.Response>(
                                                        value: value,
                                                        child: Text(
                                                            value!.cityName!),
                                                      );
                                                    }).toList(),
                                                onChanged:
                                                    (city_res.Response? value) {
                                                  _.birthCityValue =
                                                  value!.cityName!;
                                                  _.birthCityCode =
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
                              const RestInvestTitle(
                                text:
                                    "COUNTRY OF TAX RESIDENCE\nOTHER THAN PAKISTAN:*",
                                textColor: AppColor.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w900,
                              ),
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: _.controller.newDigUserRegDataAfterOTP!
                                    .response!.taxResCountriesOtherThanPakList!
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
                                    _.taxResCountriesOtherThanPakGroupValue,
                                    value: data.code ?? '0',
                                    onChanged: (val) {
                                      _.taxResCountriesOtherThanPakGroupValue =
                                          data!.code ?? '0';
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
                                  fontWeight: FontWeight.w900,
                                  text: "",
                                  hint: "",
                                  textColor: AppColor.black,
                                  hintColor: AppColor.black),
                              space,
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount:_.controller.newDigUserRegDataAfterOTP!.response!.fatcaInfoList!.length,
                                  itemBuilder: (context, index) {
                                    bool? groupValue = _.controller.newDigUserRegDataAfterOTP!.
                                    response!.fatcaInfoList![index].answer;
                                    _.list[index]["answer"] = groupValue;
                                    return  Column(
                                      children: [
                                        SizedBox(
                                          width: Get.width,
                                          child: Text(_.controller.newDigUserRegDataAfterOTP!.
                                          response!.fatcaInfoList![index].questionDesc ?? '',
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Radio(
                                              value: true,
                                              groupValue: groupValue,
                                              onChanged: (bool? val) {
                                                _.controller.newDigUserRegDataAfterOTP!.
                                                response!.fatcaInfoList![index].answer = val;
                                                _.list[index]["answer"] = _.controller.newDigUserRegDataAfterOTP!.
                                                response!.fatcaInfoList![index].answer;
                                                _.list.forEach((element) {
                                                  print(element["answer"].toString());
                                                });
                                                print("sadaddsad$val");
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
                                                response!.fatcaInfoList![index].answer = val;
                                                _.list[index]["answer"] = _.controller.newDigUserRegDataAfterOTP!.
                                                response!.fatcaInfoList![index].answer;
                                                _.list.forEach((element) {
                                                  print(element["answer"].toString());
                                                });
                                                print("kjnlkn$val");
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
                              space,
                              const RestInvestTitle(
                                text: "*DISCLAIMER:",
                                textColor: AppColor.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w900,
                              ),
                              const SizedBox(height: 5,),
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


                                  const SizedBox(width: 10,),
                                  const Expanded(
                                    child: RestInvestTitle(
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
                                fontSize: 14,
                                fontWeight: FontWeight.w900,
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
                                          text: "COUNTRY OF TAX RESIDENCE:*",
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
                                          child: _.cityData != null
                                              ? DropdownButton(
                                            isExpanded: true,
                                            underline: Container(
                                              color:
                                              AppColor.whiteColor,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(
                                                10),
                                            hint: RestInvestTitle(
                                              text: _.cityValue ==
                                                  null ||
                                                  _.cityValue ==
                                                      ""
                                                  ? "City"
                                                  : _.cityValue,
                                              textColor:
                                              AppColor.black,
                                            ),
                                            icon: const Icon(
                                                Icons
                                                    .keyboard_arrow_down,
                                                color:
                                                AppColor.blueColor,
                                                size: 30),
                                            items: _.cityList
                                                .map<
                                                DropdownMenuItem<
                                                    city_res.Response>>(
                                                    (city_res.Response?
                                                value) {
                                                  return DropdownMenuItem<
                                                      city_res.Response>(
                                                    value: value,
                                                    child: Text(
                                                        value!.cityName!),
                                                  );
                                                }).toList(),
                                            onChanged:
                                                (city_res.Response? value) {
                                              print(value!.cityName);
                                              _.cityValue =
                                              value!.cityName!;
                                              _.cityCode =
                                              value.cityCode!;
                                              _.update();
                                              // _.onCitySectorData(value.cityCode!);
                                            },
                                          )
                                              : const SizedBox(),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                   Expanded(
                                    child: EmptyContainer(hintColor: AppColor.black,
                                        text: "TIN NUMBER:",
                                        hint: "${_.tinNumber}",
                                        textColor: AppColor.black,
                                        fontWeight: FontWeight.w900,
                                       ),
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
                                        value: _.disclaimerIsChecked,
                                        onChanged: (bool? val) {
                                          _.disclaimerIsChecked = val!;
                                          _.update();
                                        }),
                                  ),
                                  const SizedBox(width: 10,),
                                  const Expanded(
                                    child: RestInvestTitle(
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
                                    _.onSave(context);
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
                      onTryAgain: (){
                        Get.to(const AccountOpenRiskProfileScreen());
                      },
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
