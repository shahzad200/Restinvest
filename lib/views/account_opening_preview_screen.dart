import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:investintrust/utils/constants.dart';
import '../controller/account_opening_preview_screen_controller.dart';

import '../widgets/button.dart';

import '../utils/colors.dart';

import '../widgets/constant_widget.dart';

class AccountOpenPreviewScreen extends StatelessWidget {
  const AccountOpenPreviewScreen({Key? key}
  ) : super(key: key);

   // Uint8List? cNicFront;
   // Uint8List? cNicBack;
   // Uint8List? sourceIncome;
   // Uint8List? sigPage;
   // Uint8List? zktPaper;
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
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    space,
                                    InkWell(
                                      onTap: (){
                                        _.sigPage = false;
                                        _.zaKat = false;
                                        _.cNicFront = true;
                                        _.cNicBack = false;
                                        _.srcIncome = false;
                                        _.update();
                                      },
                                      child: const RestInvestTitle(
                                        text: "1: Cnic Front",
                                        textAlign: TextAlign.start,
                                        textColor: AppColor.blueColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    space,
                                    InkWell(
                                      onTap: (){
                                        _.sigPage = false;
                                        _.zaKat = false;
                                        _.cNicFront = false;
                                        _.cNicBack = true;
                                        _.srcIncome = false;
                                        _.update();
                                      },
                                      child: const RestInvestTitle(
                                        text: "2: Cnic Back",
                                        textAlign: TextAlign.start,
                                        textColor: AppColor.blueColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    space,
                                    InkWell(
                                      onTap: (){
                                        _.sigPage = false;
                                        _.zaKat = false;
                                        _.cNicFront = false;
                                        _.cNicBack = false;
                                        _.srcIncome = true;
                                        _.update();
                                      },
                                      child: const RestInvestTitle(
                                        text: "3: Source of Income",
                                        textAlign: TextAlign.start,
                                        textColor: AppColor.blueColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    space,
                                    InkWell(
                                      onTap: (){
                                        _.sigPage = true;
                                        _.zaKat = false;
                                        _.cNicFront = false;
                                        _.cNicBack = false;
                                        _.srcIncome = false;
                                        _.update();
                                      },
                                      child: const RestInvestTitle(
                                        text: "4: Signature",
                                        textAlign: TextAlign.start,
                                        textColor: AppColor.blueColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    Constant.zakValue == 'YES' ? space : const SizedBox(),
                                    Constant.zakValue == 'YES' ? InkWell(
                                      onTap: (){
                                        _.zaKat = true;
                                        _.cNicFront = false;
                                        _.cNicBack = false;
                                        _.srcIncome = false;
                                        _.sigPage = false;
                                        _.update();
                                      },
                                      child:  const RestInvestTitle(
                                        text: "5: Zakat Paper",
                                        textAlign: TextAlign.start,
                                        textColor: AppColor.blueColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    )
                                    :const SizedBox(),
                                  ],
                                ),
                                Expanded(
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        height: 100,
                                        width: 200,
                                        child:
                                        Image.memory(
                                            _.cNicFront ? _.con.cnicFront!.readAsBytesSync()
                                        : _.cNicBack ? _.con.cnicBack!.readAsBytesSync()
                                        : _.srcIncome ? _.con.srcIncome!.readAsBytesSync()
                                        : _.sigPage ? _.con.plainImage!.readAsBytesSync()
                                        : _.zaKat ? _.con.zaKatImage!.readAsBytesSync()
                                                : _.con.cnicFront!.readAsBytesSync()
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            space,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomRoundButton(
                                    height: 35,
                                    width: 80,
                                    text: "BACK",
                                    buttonColor: AppColor.backBlueColor,
                                    onPress: () {
                                      Get.back();
                                    },
                                    isRound: false),
                                const SizedBox(
                                  width: 10,
                                ),
                                CustomRoundButton(
                                    height: 35,
                                    width: 80,
                                    text: "Submit",
                                    onPress: () {
                                      _.onSubmit();
                                    },
                                    isRound: false),
                              ],
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
