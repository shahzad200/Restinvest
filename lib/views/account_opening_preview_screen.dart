
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nit/utils/constants.dart';
import 'package:nit/widgets/no_internet.dart';
import '../controller/account_opening_preview_screen_controller.dart';

import '../widgets/button.dart';

import '../utils/colors.dart';

import '../widgets/constant_widget.dart';

class AccountOpenPreviewScreen extends StatelessWidget {
  int i = 1;
   AccountOpenPreviewScreen({Key? key}
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
            body: Stack(children: [
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
                                        _.mobileReg = false;
                                        _.nominee = false;
                                        _.update();
                                      },
                                      child:  RestInvestTitle(
                                        text: "1: CNIC Front",
                                        textAlign: TextAlign.start,
                                        textColor: AppColor.blueColor,
                                        fontSize: 12,
                                        fontWeight: _.cNicFront == true ?
                                        FontWeight.w900 : FontWeight.w500,
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
                                        _.mobileReg = false;
                                        _.nominee = false;
                                        _.update();
                                      },
                                      child:  RestInvestTitle(
                                        text: "2: CNIC Back",
                                        textAlign: TextAlign.start,
                                        textColor: AppColor.blueColor,
                                        fontSize: 12,
                                        fontWeight: _.cNicBack == true ?
                                        FontWeight.w900 : FontWeight.w500,
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
                                        _.mobileReg = false;
                                        _.nominee = false;
                                        _.update();
                                      },
                                      child: RestInvestTitle(
                                        text: "3: Source of Income",
                                        textAlign: TextAlign.start,
                                        textColor: AppColor.blueColor,
                                        fontSize: 12,
                                        fontWeight: _.srcIncome == true ?
                                        FontWeight.w900 : FontWeight.w500,
                                      ),
                                    ),
                                    space,
                                    InkWell(
                                      onTap: (){
                                        _.sigPage = false;
                                        _.zaKat = false;
                                        _.cNicFront = false;
                                        _.cNicBack = false;
                                        _.srcIncome = false;
                                        _.nominee = true;
                                        _.mobileReg = false;
                                        _.update();
                                      },
                                      child: RestInvestTitle(
                                        text: "4: Nominee CNIC",
                                        textAlign: TextAlign.start,
                                        textColor: AppColor.blueColor,
                                        fontSize: 12,
                                        fontWeight: _.nominee == true ?
                                        FontWeight.w900 : FontWeight.w500,
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
                                        _.mobileReg = false;
                                        _.nominee = false;
                                        _.update();
                                      },
                                      child: RestInvestTitle(
                                        text: "5: Signature",
                                        textAlign: TextAlign.start,
                                        textColor: AppColor.blueColor,
                                        fontSize: 12,
                                        fontWeight: _.sigPage == true ?
                                        FontWeight.w900 : FontWeight.w500,
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
                                        _.mobileReg = false;
                                        _.nominee = false;
                                        _.update();
                                      },
                                      child:   RestInvestTitle(
                                        text: "6: Zakat Paper",
                                        textAlign: TextAlign.start,
                                        textColor: AppColor.blueColor,
                                        fontSize: 12,
                                        fontWeight: _.zaKat == true ?
                                        FontWeight.w900 : FontWeight.w500,
                                      ),
                                    )
                                    :const SizedBox(),
                                    Constant.mobileReg != '4' ? space : const SizedBox(),
                                    Constant.mobileReg != '4' ? InkWell(
                                      onTap: (){
                                        _.zaKat = false;
                                        _.cNicFront = false;
                                        _.cNicBack = false;
                                        _.srcIncome = false;
                                        _.sigPage = false;
                                        _.mobileReg = true;
                                        _.nominee = false;
                                        _.update();
                                      },
                                      child:   RestInvestTitle(
                                        text: Constant.zakValue == 'YES' ? "7: Mobile Doc"
                                        : "6: Mobile Doc",
                                        textAlign: TextAlign.start,
                                        textColor: AppColor.blueColor,
                                        fontSize: 12,
                                        fontWeight: _.mobileReg == true ?
                                        FontWeight.w900 : FontWeight.w500,
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
                                            _.cNicFront ? _.con.cNicF!
                                        : _.cNicBack ? _.con.cNicB!
                                        : _.srcIncome ? _.con.srcIn!
                                        : _.nominee ? _.con.nomineeDoc!
                                        : _.sigPage ? _.con.planImg!
                                        : _.zaKat ? _.con.zaKat!
                                        : _.mobileReg ? _.con.mobile!
                                                :_.con.cNicF!
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
                                      if(_.isLoading == false) {
                                        _.onSubmit();
                                      }
                                    },
                                    isRound: false),
                                const SizedBox(width: 20,),
                                const Text('7/8')
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
                      _.noInternet = false;
                      _.update();
                    },
                  ),
                ),
              )
                  : const SizedBox()
            ]),
          ));
        });
  }
}
