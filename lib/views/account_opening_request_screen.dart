import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:investintrust/controller/account_opening_request_screen_controller.dart';
import 'package:investintrust/utils/constant.dart';
import '../controller/tax_calculator_screen_controller.dart';
import '../utils/colors.dart';
import '../utils/lists.dart';
import '../widgets/button.dart';
import '../widgets/custom_divider.dart';
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
                padding: const EdgeInsets.only(right: 50),
                child: Logo(
                  height: 80,
                  width: 80,
                ),
              ),
              elevation: 0,
            ),
            key: _.scaffoldKey,
            body: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: [
                  Container(
                    // height: Get.height,
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 1, color: AppColor.blueColor)),
                    child: Column(children: [
                    const  CustomTextContainer(
                        fontSize: 16,
                        height: 40,
                        text: "Account Opening Request",
                        textAlign: TextAlign.start,
                      ),
                      space,
                      SingleChildScrollView(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
                          children:  [
                          const  RestInvestTitle(
                              text: " OTP> VERIFY",
                              textAlign: TextAlign.start,
                              textColor: AppColor.blueColor,
                              fontWeight: FontWeight.w900,
                            ),
                           const SizedBox(height: 10,),
                            const    RestInvestTitle(
                              text: "CNIC/NICOP NUMBER",
                              textAlign: TextAlign.start,
                              textColor: AppColor.black,
                              fontWeight: FontWeight.w900,
                            ),

                            CustomTextFormField(

                              hint: "Enter Your CNIC/NICOP Numbers",
                              fieldType: Constants.cnicNumber,

                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 10,),
                            const    RestInvestTitle(
                              text: "MOBILE NUMBER",
                              textAlign: TextAlign.start,
                              textColor: AppColor.black,
                              fontWeight: FontWeight.w900,
                            ),
                            CustomTextFormField(

                              hint: "+9234xxxxxxxx",
                              fieldType: Constants.phoneNumberField,

                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 10,),
                            const    RestInvestTitle(
                              text: "EMAIL ADDRESS",
                              textAlign: TextAlign.start,
                              textColor: AppColor.black,
                              fontWeight: FontWeight.w900,
                            ),
                            CustomTextFormField(

                              hint: "abc@gamil.com",
                              fieldType: Constants.emailField,

                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 10,),
                            const    RestInvestTitle(
                              text: "OWNERSHIP OF YOUR MOBILE NUMBER",
                              textAlign: TextAlign.start,
                              textColor: AppColor.black,
                              fontWeight: FontWeight.w900,
                            ),
                            Container(
                              // margin: EdgeInsets.all(10.0),
                              padding:
                              const EdgeInsets.only(left: 10.0, right: 5.0),
                              height: 35,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: AppColor.whiteColor,
                                  border: Border.all(
                                      width: 1, color: AppColor.black)),
                              child: Center(
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  underline: Container(
                                    color: AppColor.whiteColor,
                                  ),

                                  borderRadius: BorderRadius.circular(6),
                                  // value: _.dropdownvalue,
                                  // hint: RestInvestTitle(
                                  //   text:
                                  //   _.fundvalue == null || _.fundvalue == ""
                                  //       ? "NIUT"
                                  //       : _.fundvalue,
                                  //   textColor: AppColor.black,
                                  // ),
                                  icon: const Icon(Icons.keyboard_arrow_down,
                                      color: AppColor.blueColor, size: 35),
                                  items: transferFundItems
                                      .map((String? transferFundItems) {
                                    return DropdownMenuItem<String>(
                                        value: transferFundItems,
                                        child: Text(transferFundItems!));
                                  }).toList(),
                                  // onChanged: (String? value) {
                                  //   _.fundvalue = value!;
                                  //   _.update();
                                  // },
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
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
