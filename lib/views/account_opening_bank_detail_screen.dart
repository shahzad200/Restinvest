import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controller/account_opening_bank_detail_screen_controller.dart';


import '../utils/constant.dart';
import '../widgets/button.dart';

import '../utils/colors.dart';
import '../utils/lists.dart';

import '../widgets/textformfiled.dart';

import '../widgets/constant_widget.dart';

class AccountOpenBankDetailScreen extends StatelessWidget {
  const AccountOpenBankDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountOpenBankDetailScreenController>(
        init: AccountOpenBankDetailScreenController(),
        builder: (_) {
          var space = const SizedBox(
            height: 10,
          );
          return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  backgroundColor: AppColor.whiteColor,
                  title:const Padding(
                    padding:  EdgeInsets.only(right: 50),
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
                            height: 35,
                            text: "Account Opening Request",
                            textAlign: TextAlign.start,
                          ),
                          space,
                          SingleChildScrollView(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
                              children:   [
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
                                      textColor: AppColor.dimblack,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    RestInvestTitle(
                                      text: " BANK DETAILS > ",
                                      textAlign: TextAlign.start,
                                      textColor: AppColor.blueColor,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ],
                                ),

                                SizedBox(height: 10,),

                                SizedBox(height: 10,),

                              const  SizedBox(height: 10,),
                                const RestInvestTitle(
                                  text: "DIVIDEND MANDATE",
                                  textColor: AppColor.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                ),
                                const  SizedBox(height: 10,),
                        Row(children: [
                          Radio(value: 0, groupValue: _.charactor, onChanged: (int? val){
                            _.charactor=val!;
                            _.update();
                          }),
                          const RestInvestTitle(
                            text: "DIVIDEND MANDATE",
                            textColor: AppColor.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                          ),
                          Radio(value: 1, groupValue: _.charactor, onChanged: (int? val){
                            _.charactor=val!;
                            _.update();
                          })
                        ],)

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
