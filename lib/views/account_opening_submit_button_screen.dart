import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controller/account_opening_submit_button_screen_controller.dart';

import '../widgets/button.dart';

import '../utils/colors.dart';

import '../widgets/constant_widget.dart';

class AccountOpenSubmitButtonScreen extends StatelessWidget {
  const AccountOpenSubmitButtonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    final height = Get.height;
    return GetBuilder<AccountOpenSubmitButtonScreenController>(
        init: AccountOpenSubmitButtonScreenController(),
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
                        fontSize: 14,
                        height: 35,
                        text: "SUBMIT",
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
                                  fontSize: 8,
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
                                  text: "KYC DETAIL > ",
                                  textAlign: TextAlign.start,
                                  textColor: AppColor.dimblack,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                                RestInvestTitle(
                                  text: " FATCA > ",
                                  textAlign: TextAlign.start,
                                  textColor: AppColor.dimblack,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 8,
                                ),
                                RestInvestTitle(
                                  text: "UPLOAD DOCUMENTS > ",
                                  textAlign: TextAlign.start,
                                  textColor: AppColor.dimblack,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 8,
                                ),
                                RestInvestTitle(
                                  text: " PREVIEW ",
                                  textAlign: TextAlign.start,
                                  textColor: AppColor.dimblack,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                              ],
                            ),
                            const RestInvestTitle(
                              text: " SUBMIT ",
                              textAlign: TextAlign.start,
                              textColor: AppColor.blueColor,
                              fontSize: 8,
                              fontWeight: FontWeight.w900,
                            ),
                            space,
                            const RestInvestTitle(
                              text: " DEAR CUSTOMER, ",
                              textAlign: TextAlign.start,
                              textColor: AppColor.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                            ),
                            space,
                            const RestInvestTitle(
                              text:
                                  "Thank you for choosing National Investment Trusted Limited to Serve your financial needs.Your Account Opening application has been Submitted Successfully.If you have any queries,please contact our customer services department viva email at care@nit.com.pk or cell on our toll free number 0800-00648 ",
                              textAlign: TextAlign.start,
                              textColor: AppColor.dimblack,
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                            ),
                            space,
                            space,
                            const RestInvestTitle(
                              text:
                                  "DISCLAIMER: All NIT investment Limited Online Users are Strictly advised not to disclose any confidential information such as Email Address,Registered Mobile Number,Online Portal ID/Password/TPIN,through any means.Any such correspondence via email ,phone & social media etc.can result in deceptive practise.",
                              textColor: AppColor.dimblack,
                              fontSize: 12,
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.w900,
                            ),
                            space,
                            Center(
                              child: CustomRoundButton(
                                  height: 35,
                                  width: 80,
                                  text: "OK",
                                  onPress: () {},
                                  isRound: false),
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
          ));
        });
  }
}
