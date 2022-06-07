
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:nit/utils/constants.dart';

import '../data/models/new_dig_user_reg_data_before_otp.dart';

import '../views/account_opening_basic_information_screen.dart';
import '../controller/account_opening_request_screen_controller.dart';
import '../utils/constant.dart';
import '../widgets/button.dart';

import '../utils/colors.dart';


import '../widgets/textformfiled.dart';

import '../widgets/constant_widget.dart';

class AccountOpenRequestScreen extends StatelessWidget {
  const AccountOpenRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountOpenRequestScreenController>(
        init: AccountOpenRequestScreenController(),
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
                                text: "Account Opening Request",
                                textAlign: TextAlign.start,
                              ),
                              space,
                              SingleChildScrollView(
                                padding: const EdgeInsets.only(left: 10, right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // const RestInvestTitle(
                                    //   text: " OTP> VERIFY",
                                    //   textAlign: TextAlign.start,
                                    //   textColor: AppColor.blueColor,
                                    //   fontWeight: FontWeight.w900,
                                    // ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const RestInvestTitle(
                                      text: "CNIC/NICOP NUMBER",
                                      textAlign: TextAlign.start,
                                      textColor: AppColor.black,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    CustomTextFormField(
                                      hint: "Enter Your CNIC/NICOP Numbers",
                                      controller: _.cNicNumberController,
                                      fieldType: Constants.cnicNumber,
                                      textInputType: TextInputType.number,


                                      inputFormator: [
                                        FilteringTextInputFormatter.digitsOnly,
                                         LengthLimitingTextInputFormatter(13),
                                        NumberFormatter()
                                      ],
                                      onChange: (val){
                                        print(_.cNicNumberController.text);

                                      },
                                      textAlign: TextAlign.start,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const RestInvestTitle(
                                      text: "MOBILE NUMBER",
                                      textAlign: TextAlign.start,
                                      textColor: AppColor.black,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    CustomTextFormField(
                                      hint: "Enter Mobile No.",
                                      controller: _.mobileNumberController,
                                      fieldType: Constants.phoneNumberField,
                                      textAlign: TextAlign.start,
                                      textInputType: TextInputType.number,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const RestInvestTitle(
                                      text: "EMAIL ADDRESS",
                                      textAlign: TextAlign.start,
                                      textColor: AppColor.black,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    CustomTextFormField(
                                      hint: "abc@gamil.softech",
                                      controller: _.emailController,
                                      fieldType: Constants.emailField,
                                      textAlign: TextAlign.start,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const RestInvestTitle(
                                      text: "OWNERSHIP OF YOUR MOBILE NUMBER",
                                      textAlign: TextAlign.start,
                                      textColor: AppColor.black,
                                      fontWeight: FontWeight.w900,
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
                                            text: _.mobileNumberOwner == null ||
                                                _.mobileNumberOwner == ""
                                                ? ""
                                                : _.mobileNumberOwner,
                                            textColor: AppColor.black,
                                            fontSize: 12,
                                          ),
                                          icon: const Icon(Icons.keyboard_arrow_down,
                                              color: AppColor.blueColor, size: 25),
                                          items: _.isLoading || _.noInternet ? null : _.newDigUserRegDataBeforeOTP!.response!.mobileRegisteredWithList!.map<DropdownMenuItem<MobileRegisteredWithList>>((MobileRegisteredWithList? value){
                                            return DropdownMenuItem<MobileRegisteredWithList>(
                                              value: value,
                                              child: Text(value!.description!),
                                            );
                                          }).toList(),
                                          onChanged: _.isLoading || _.noInternet ? null : (MobileRegisteredWithList? value) {
                                            _.mobileNumberOwner = value!.description!;
                                            _.mobileNumberOwnerCode = value!.code!;
                                            _.update();
                                          },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const RestInvestTitle(
                                      text: "Account Type:* ",
                                      textAlign: TextAlign.start,
                                      textColor: AppColor.black,
                                      fontWeight: FontWeight.w900,
                                    ),

                                    const SizedBox(height: 10,),
                                    _.isLoading || _.noInternet ? const SizedBox() :
                                    Column(
                                      children:
                                      _.newDigUserRegDataBeforeOTP!.response!.accountTypeList!.map((data) =>
                                          // Flexible(
                                          //   fit: FlexFit.loose,
                                          //   child:
                                            RadioListTile<String>(
                                              title: Text("${data.description}",
                                                style: const TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold
                                                ),

                                              ),
                                              groupValue: _.groupValue,
                                              value: data.code ?? 'I',
                                              // onChanged: (AccountTypeList data) {
                                              onChanged: (val) { _.handleRadioValueChange(data!.code ?? 'I');},
                                              activeColor: MaterialStateColor.resolveWith(
                                                      (states) => AppColor.blueColor),
                                              // setState(() {
                                              //   radioItem = data.name ;
                                              //   id = data.index;
                                              // });
                                              // },
                                            ),
                                          // )
                                      ).toList(),
                                      // List<Widget>.generate(
                                      //   _.newDigUserRegDataBeforeOTP!.response!.accountTypeList!.length,
                                      //       (int i) => Radio<int>(
                                      //         toggleable: true,
                                      //     value: i,
                                      //     groupValue: _.groupValue,
                                      //     onChanged: _.handleRadioValueChange(i),
                                      //         fillColor: MaterialStateColor.resolveWith(
                                      //                     (states) => AppColor.blueColor),
                                      //   ),
                                      // ),
                                      // [

                                      // Radio(
                                      //   value: 0,
                                      //   groupValue: _.character,
                                      //   onChanged: (int? val) {
                                      //     _.character = val!;
                                      //     _.update();
                                      //   },
                                      //   fillColor: MaterialStateColor.resolveWith(
                                      //           (states) => AppColor.blueColor),
                                      // ),
                                      // const RestInvestTitle(
                                      //   text: "MUTUAL FUND",
                                      //   textColor: AppColor.dimblack,
                                      //   fontSize: 12,
                                      //   fontWeight: FontWeight.w900,
                                      // ),
                                      // Radio(
                                      //   value: 1,
                                      //   groupValue: _.character,
                                      //   onChanged: (int? val) {
                                      //     _.character = val!;
                                      //     _.update();
                                      //   },
                                      //   fillColor: MaterialStateColor.resolveWith(
                                      //           (states) => AppColor.blueColor),
                                      // ),
                                      // const RestInvestTitle(
                                      //   text: "PENSION FUND",
                                      //   textColor: AppColor.dimblack,
                                      //   fontSize: 12,
                                      //   fontWeight: FontWeight.w900,
                                      // ),
                                      // Radio(
                                      //   value: 2,
                                      //   groupValue: _.character,
                                      //   onChanged: (int? val) {
                                      //     _.character = val!;
                                      //     _.update();
                                      //   },
                                      //   fillColor: MaterialStateColor.resolveWith(
                                      //           (states) => AppColor.blueColor),
                                      // ),
                                      // const RestInvestTitle(
                                      //   text: "BOTH",
                                      //   textColor: AppColor.dimblack,
                                      //   fontSize: 12,
                                      //   fontWeight: FontWeight.w900,
                                      // ),
                                      // ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomRoundButton(height: 35,
                                        isRound: false, text: "GET VERIFICATION CODE", onPress: () {
                                          _.onGenVerificationCodeForDigUser(context);
                                        }),
                                    // const SizedBox(
                                    //   height: 10,
                                    // ),
                                    CustomRoundButton(height: 35,
                                        isRound: false, text: "RESEND VERIFICATION CODE ", onPress: () {
                                          _.onGenVerificationCodeForDigUser(context);
                                        }),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const RestInvestTitle(
                                      text: "VERIFICATION CODE",
                                      textAlign: TextAlign.start,
                                      textColor: AppColor.black,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    CustomTextFormField(
                                      hint:
                                      "Please Enter your (OTP) Verification Code Received Via SMS or Email",
                                      controller: _.otpVerificationController,
                                      fieldType: Constants.pincode,
                                      textAlign: TextAlign.start,obscureText: true,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        CustomRoundButton(
                                            isRound: false,
                                            text: "BACK",
                                            width: 120,
                                            height: 40,
                                            buttonColor: AppColor.backBlueColor,
                                            textColor: AppColor.whiteColor,
                                            onPress: () {
                                              Get.back();
                                            }),
                                        CustomRoundButton(
                                            isRound: false,
                                            text: "NEXT",
                                            width: 120,
                                            height: 40,
                                            buttonColor: AppColor.blueColor,
                                            textColor: AppColor.whiteColor,
                                            onPress: () {
                                              _.onValidateVerificationCodeForDigUser();
                                              // Get.toNamed(AppRoute.accountopeningbasicinformation);
                                            }),
                                        const SizedBox(
                                         width: 20,
                                        ),
                                        const Text('1/8')
                                      ],
                                    ),
                                    // CustomRoundButton(height: 35,
                                    //     isRound: false, text: "Next", onPress: () {
                                    //       _.onValidateVerificationCodeForDigUser();
                                    //       // Get.toNamed(AppRoute.accountopeningbasicinformation);
                                    //     }),
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
