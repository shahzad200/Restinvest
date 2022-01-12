import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controller/account_opening_preview_screen_controller.dart';

import '../widgets/button.dart';

import '../utils/colors.dart';

import '../widgets/constant_widget.dart';

class AccountOpenPreviewScreen extends StatelessWidget {
  const AccountOpenPreviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final width = Get.width;
    // final height = Get.height;
    return GetBuilder<AccountOpenPreviewScreenController>(
        init: AccountOpenPreviewScreenController(),
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
                        text: "PREVIEW",
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
                            //       text: " OTP VERIFY> ",
                            //       textAlign: TextAlign.start,
                            //       textColor: AppColor.dimblack,
                            //       fontSize: 8,
                            //       fontWeight: FontWeight.w900,
                            //     ),
                            //     RestInvestTitle(
                            //       text: " BASIC INFORMATION> ",
                            //       textAlign: TextAlign.start,
                            //       textColor: AppColor.dimblack,
                            //       fontSize: 8,
                            //       fontWeight: FontWeight.w900,
                            //     ),
                            //     RestInvestTitle(
                            //       text: "KYC DETAIL> ",
                            //       textAlign: TextAlign.start,
                            //       textColor: AppColor.dimblack,
                            //       fontSize: 8,
                            //       fontWeight: FontWeight.w900,
                            //     ),
                            //     RestInvestTitle(
                            //       text: " FATCA> ",
                            //       textAlign: TextAlign.start,
                            //       textColor: AppColor.dimblack,
                            //       fontWeight: FontWeight.w900,
                            //       fontSize: 8,
                            //     ),
                            //     RestInvestTitle(
                            //       text: "UPLOAD DOCUMENTS> ",
                            //       textAlign: TextAlign.start,
                            //       textColor: AppColor.dimblack,
                            //       fontWeight: FontWeight.w900,
                            //       fontSize: 8,
                            //     ),
                            //     RestInvestTitle(
                            //       text: " PREVIEW> ",
                            //       textAlign: TextAlign.start,
                            //       textColor: AppColor.blueColor,
                            //       fontSize: 8,
                            //       fontWeight: FontWeight.w900,
                            //     ),
                            //   ],
                            // ),
                            space,
                            const RestInvestTitle(
                              text: "1: Upload Image ",
                              textAlign: TextAlign.start,
                              textColor: AppColor.blueColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                            ),
                            space,
                            const RestInvestTitle(
                              text: "2: Upload Image ",
                              textAlign: TextAlign.start,
                              textColor: AppColor.blueColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                            ),
                            space,
                            const RestInvestTitle(
                              text: "3: Upload Image ",
                              textAlign: TextAlign.start,
                              textColor: AppColor.blueColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                            ),
                            space,
                            const RestInvestTitle(
                              text: "4: Upload Image ",
                              textAlign: TextAlign.start,
                              textColor: AppColor.blueColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                            ),
                            space,
                            const RestInvestTitle(
                              text: "5: Upload Image ",
                              textAlign: TextAlign.start,
                              textColor: AppColor.blueColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                            ),
                            space,
                            space,
                            space,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomRoundButton(
                                    height: 35,
                                    width: 80,
                                    text: "BACK",
                                    buttonColor: AppColor.dimBlue,
                                    onPress: () {},
                                    isRound: false),
                                const SizedBox(
                                  width: 10,
                                ),
                                CustomRoundButton(
                                    height: 35,
                                    width: 80,
                                    text: "Submit",
                                    onPress: () {},
                                    isRound: false),
                              ],
                            ),
                            space,
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
