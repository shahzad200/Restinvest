import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controller/account_opening_document_upload_screen_controller.dart';

import '../widgets/button.dart';

import '../utils/colors.dart';

import '../widgets/constant_widget.dart';

class AccountOpenDocumentUploadScreen extends StatelessWidget {
  const AccountOpenDocumentUploadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    final height = Get.height;
    return GetBuilder<AccountOpenDocumentUploadScreenController>(
        init: AccountOpenDocumentUploadScreenController(),
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
                        fontSize: 16,
                        height: 35,
                        text: "DOCUMENTS UPLOAD",
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
                            //       fontSize: 10,
                            //       fontWeight: FontWeight.w900,
                            //     ),
                            //     RestInvestTitle(
                            //       text: " BASIC INFORMATION > ",
                            //       textAlign: TextAlign.start,
                            //       textColor: AppColor.dimblack,
                            //       fontSize: 10,
                            //       fontWeight: FontWeight.w900,
                            //     ),
                            //     RestInvestTitle(
                            //       text: "KYC DETAIL > ",
                            //       textAlign: TextAlign.start,
                            //       textColor: AppColor.dimblack,
                            //       fontSize: 10,
                            //       fontWeight: FontWeight.w900,
                            //     ),
                            //     RestInvestTitle(
                            //       text: " FATCA > ",
                            //       textAlign: TextAlign.start,
                            //       textColor: AppColor.dimblack,
                            //       fontWeight: FontWeight.w900,
                            //       fontSize: 10,
                            //     ),
                            //     RestInvestTitle(
                            //       text: "UPLOAD DOCUMENTS > ",
                            //       textAlign: TextAlign.start,
                            //       textColor: AppColor.blueColor,
                            //       fontWeight: FontWeight.w900,
                            //       fontSize: 10,
                            //     ),
                            //   ],
                            // ),
                            space,
                            const RestInvestTitle(
                              text: "CNIC/NICOP FRONT:*",
                              textAlign: TextAlign.start,
                              textColor: AppColor.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 12,
                            ),
                            Container(
                              height: 35,
                              // height: Get.height,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomRoundButton(
                                      height: 25,
                                      width: 40,
                                      text: "+ Choose",
                                      buttonColor: AppColor.whiteColor,
                                      textColor: AppColor.black,
                                      onPress: () {},
                                      isRound: false),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: AppColor.greyColor.withOpacity(0.5),
                                  border: Border.all(
                                      width: 1, color: AppColor.black)),
                            ),
                            Container(
                              height: 35,
                              // height: Get.height,
                              decoration: BoxDecoration(
                                  color: AppColor.whiteColor,
                                  border: Border.all(
                                      width: 1, color: AppColor.black)),
                            ),
                            const RestInvestTitle(
                              text:
                                  "Allowed Type:(gif,jpg,jpeg,png,pdf,doc,docx)/,Max file size: 5MB,No of files\nallowed:1",
                              textAlign: TextAlign.start,
                              textColor: AppColor.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 10,
                            ),
                            space,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const RestInvestTitle(
                                  text: "upload image",
                                  textAlign: TextAlign.start,
                                  textColor: AppColor.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 10,
                                ),
                                CustomRoundButton(
                                    height: 35,
                                    width: 50,
                                    text: "Remove",
                                    onPress: () {},
                                    isRound: false),
                              ],
                            ),
                            space,
                            const RestInvestTitle(
                              text: "CNIC/NICOP BACK:*",
                              textAlign: TextAlign.start,
                              textColor: AppColor.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 12,
                            ),
                            Container(
                              height: 35,
                              // height: Get.height,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomRoundButton(
                                      height: 25,
                                      width: 40,
                                      text: "+ Choose",
                                      buttonColor: AppColor.whiteColor,
                                      textColor: AppColor.black,
                                      onPress: () {},
                                      isRound: false),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: AppColor.greyColor.withOpacity(0.5),
                                  border: Border.all(
                                      width: 1, color: AppColor.black)),
                            ),
                            Container(
                              height: 35,
                              // height: Get.height,
                              decoration: BoxDecoration(
                                  color: AppColor.whiteColor,
                                  border: Border.all(
                                      width: 1, color: AppColor.black)),
                            ),
                            const RestInvestTitle(
                              text:
                                  "Allowed Type:(gif,jpg,jpeg,png,pdf,doc,docx)/,Max file size: 5MB,No of files\nallowed:1",
                              textAlign: TextAlign.start,
                              textColor: AppColor.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 10,
                            ),
                            space,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const RestInvestTitle(
                                  text: "upload image",
                                  textAlign: TextAlign.start,
                                  textColor: AppColor.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 10,
                                ),
                                CustomRoundButton(
                                    height: 35,
                                    width: 50,
                                    text: "Remove",
                                    onPress: () {},
                                    isRound: false),
                              ],
                            ),
                            space,
                            const RestInvestTitle(
                              text: "PROOF OF INCOME/SOURCE OF INCOME:*",
                              textAlign: TextAlign.start,
                              textColor: AppColor.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 12,
                            ),
                            Container(
                              height: 35,
                              // height: Get.height,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomRoundButton(
                                      height: 25,
                                      width: 40,
                                      text: "+ Choose",
                                      buttonColor: AppColor.whiteColor,
                                      textColor: AppColor.black,
                                      onPress: () {},
                                      isRound: false),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: AppColor.greyColor.withOpacity(0.5),
                                  border: Border.all(
                                      width: 1, color: AppColor.black)),
                            ),
                            Container(
                              height: 35,
                              // height: Get.height,
                              decoration: BoxDecoration(
                                  color: AppColor.whiteColor,
                                  border: Border.all(
                                      width: 1, color: AppColor.black)),
                            ),
                            const RestInvestTitle(
                              text:
                                  "Allowed Type:(gif,jpg,jpeg,png,pdf,doc,docx)/,Max file size: 5MB,No of files\nallowed:1",
                              textAlign: TextAlign.start,
                              textColor: AppColor.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 10,
                            ),
                            space,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const RestInvestTitle(
                                  text: "upload image",
                                  textAlign: TextAlign.start,
                                  textColor: AppColor.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 10,
                                ),
                                CustomRoundButton(
                                    height: 35,
                                    width: 50,
                                    text: "Remove",
                                    onPress: () {},
                                    isRound: false),
                              ],
                            ),
                            space,
                            const RestInvestTitle(
                              text: "SIGNATURE:*(Plain Paper)",
                              textAlign: TextAlign.start,
                              textColor: AppColor.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 12,
                            ),
                            Container(
                              height: 35,
                              // height: Get.height,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomRoundButton(
                                      height: 25,
                                      width: 40,
                                      text: "+ Choose",
                                      buttonColor: AppColor.whiteColor,
                                      textColor: AppColor.black,
                                      onPress: () {},
                                      isRound: false),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: AppColor.greyColor.withOpacity(0.5),
                                  border: Border.all(
                                      width: 1, color: AppColor.black)),
                            ),
                            Container(
                              height: 35,
                              // height: Get.height,
                              decoration: BoxDecoration(
                                  color: AppColor.whiteColor,
                                  border: Border.all(
                                      width: 1, color: AppColor.black)),
                            ),
                            const RestInvestTitle(
                              text:
                                  "Allowed Type:(gif,jpg,jpeg,png,pdf,doc,docx)/,Max file size: 5MB,No of files\nallowed:1",
                              textAlign: TextAlign.start,
                              textColor: AppColor.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 10,
                            ),
                            space,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const RestInvestTitle(
                                  text: "upload image",
                                  textAlign: TextAlign.start,
                                  textColor: AppColor.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 10,
                                ),
                                CustomRoundButton(
                                    height: 35,
                                    width: 50,
                                    text: "Remove",
                                    onPress: () {},
                                    isRound: false),
                              ],
                            ),
                            space,
                            const RestInvestTitle(
                              text: "OTHER:",
                              textAlign: TextAlign.start,
                              textColor: AppColor.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 12,
                            ),
                            Container(
                              height: 35,
                              // height: Get.height,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomRoundButton(
                                      height: 25,
                                      width: 40,
                                      text: "+ Choose",
                                      buttonColor: AppColor.whiteColor,
                                      textColor: AppColor.black,
                                      onPress: () {},
                                      isRound: false),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: AppColor.greyColor.withOpacity(0.5),
                                  border: Border.all(
                                      width: 1, color: AppColor.black)),
                            ),
                            Container(
                              height: 35,
                              // height: Get.height,
                              decoration: BoxDecoration(
                                  color: AppColor.whiteColor,
                                  border: Border.all(
                                      width: 1, color: AppColor.black)),
                            ),
                            const RestInvestTitle(
                              text:
                                  "Allowed Type:(gif,jpg,jpeg,png,pdf,doc,docx)/,Max file size: 5MB,No of files\nallowed:1",
                              textAlign: TextAlign.start,
                              textColor: AppColor.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 10,
                            ),
                            space,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const RestInvestTitle(
                                  text: "upload image",
                                  textAlign: TextAlign.start,
                                  textColor: AppColor.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 10,
                                ),
                                CustomRoundButton(
                                    height: 35,
                                    width: 50,
                                    text: "Remove",
                                    onPress: () {},
                                    isRound: false),
                              ],
                            ),
                            space,
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
                                 SizedBox(width: 5,),
                                 Expanded(
                                   child: RestInvestTitle(
                                    text:
                                        "Invester are fully informed and understand thatinvestment in units of Mutual Funds/CIS are not bank deposit,not guaranteed and not issued by any person.shareholders of AMCs are not responsible for any loose of investor resulting from the operation of any CIS launched/to be launched by the AMC unless otherwise mentioned",
                                    textColor: AppColor.black,
                                    fontSize: 8,
                                    textAlign: TextAlign.justify,
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
                                    text: "Back",
                                    buttonColor: AppColor.dimBlue,
                                    onPress: () {},
                                    isRound: false),
                                SizedBox(
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
                            space
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
