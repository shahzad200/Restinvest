import 'dart:ui';

import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:investintrust/widgets/datefield.dart';
import '../controller/account_opening_basic_information_screen_controller.dart';


import '../widgets/button.dart';

import '../utils/colors.dart';
import '../utils/lists.dart';

import '../widgets/textformfiled.dart';

import '../widgets/constant_widget.dart';

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
                  title: const Padding(
                    padding: EdgeInsets.only(right: 50),
                    child: Logo(
                      height: 60,
                      width: 60,
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
                            text: "Basic Information",
                            textAlign: TextAlign.start,
                          ),
                          space,
                          SingleChildScrollView(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
                              children:  [
                               Row(children:const [
                                   RestInvestTitle(
                                   text: " OTP VERIFY > ",
                                   textAlign: TextAlign.start,
                                   textColor: AppColor.dimblack,
                                   fontWeight: FontWeight.w900,
                                 ),
                                   RestInvestTitle(
                                   text: " BASIC INFORMATION > ",
                                   textAlign: TextAlign.start,
                                   textColor: AppColor.blueColor,
                                   fontWeight: FontWeight.w900,
                                 ),
                               ],),
                                const SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const RestInvestTitle(
                                              text: 'NAME(as per CNIC)*',
                                              textColor: AppColor.black,fontSize: 12,fontWeight: FontWeight.w900,),
                                          CustomTextFormField(
                                            isRounded: true,
                                            hint: "Full Name",
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
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const RestInvestTitle(
                                              text: "FATHER / HUSBAND'S NAME*",
                                              textColor: AppColor.black,fontSize: 12,fontWeight: FontWeight.w900,),
                                          CustomTextFormField(
                                            isRounded: true,
                                            hint: "Full Name",
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
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const RestInvestTitle(
                                              text: "MOTHER MAIDEN'S NAME*",
                                              textColor: AppColor.black,fontSize: 12,fontWeight: FontWeight.w900,),
                                          CustomTextFormField(
                                            isRounded: true,
                                            hint: "Full Name",
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
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const RestInvestTitle(
                                              text: "CNIC / NICOP NUMBER*",
                                              textColor: AppColor.black,fontSize: 12,fontWeight: FontWeight.w900,),
                                          CustomTextFormField(
                                            isRounded: true,
                                            hint: "Full Name",
                                            // textInputType: TextInputType.emailAddress,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const RestInvestTitle(
                                              text: 'CNIC/NICOP ISSUE DATE*',
                                              textColor: AppColor.black,fontSize: 12,fontWeight: FontWeight.w900,),
                                          SizedBox(
                                            height: 35,
                                            child: DateFormFieldContainer(isRounded:false,isTrue:true,
                                              text: '',
                                              mode: DateTimeFieldPickerMode.date,
                                              dateFormatTrue: true,
                                              initialValue: DateTime.now(),
                                              onDateSelected: (value){

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
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const RestInvestTitle(
                                              text: 'CNIC/NICOP EXPIRY DATE* LIFETIME',
                                              textColor: AppColor.black,fontSize: 12,fontWeight: FontWeight.w900,),
                                          SizedBox(
                                            height: 35,
                                            child: DateFormFieldContainer(isRounded:false,
                                              text: '',
                                              mode: DateTimeFieldPickerMode.date,
                                              dateFormatTrue: true,isTrue:true,
                                              initialValue: DateTime.now(),
                                              onDateSelected: (value){

                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const RestInvestTitle(
                                            text: 'DATE OF BIRTH*',
                                            textColor: AppColor.black,fontSize: 12,fontWeight: FontWeight.w900,),
                                          SizedBox(
                                            height: 35,
                                            child: DateFormFieldContainer(isRounded:false,isTrue:true,
                                              text: '',
                                              mode: DateTimeFieldPickerMode.date,
                                              dateFormatTrue: true,
                                              initialValue: DateTime.now(),
                                              onDateSelected: (value){

                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    // DropDownContainer(text: "MARITAL STATUS*",fontSize: 12,voidcallback:(){},isSquare:false,icon: Icon(Icons.home),),
                                  ],
                                ),
                                const SizedBox(height: 10,),
                                Row(
                                  children: [

                                     SizedBox(
                                      width: 6,
                                    ),

                                  ],
                                ),
                                const SizedBox(height: 10,),
                                Row(
                                  children: [

                                    SizedBox(
                                      width: 6,
                                    ),

                                  ],
                                ),


                                const SizedBox(
                                  height: 10,
                                ),
                        Row(
                          children: [
                            // DropDownContainer(voidcallback: (){},text: "RETIREMENT AGE ( VPS Account )",fontSize: 12,isSquare: false,icon: Icon(Icons.home),),
                          const  SizedBox(
                              width: 6,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                 const  RestInvestTitle(
                                    text: "MOBILE NUMBER*",
                                    textColor: AppColor.black,fontSize: 12,fontWeight: FontWeight.w900,),
                                  CustomTextFormField(
                                    isRounded: true,
                                    hint: "",
                                    // textInputType: TextInputType.emailAddress,
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                                const SizedBox(height: 10,),
                                const    RestInvestTitle(
                                  text: "EMAIL ADDRESS*",

                                  textAlign: TextAlign.start,
                                  textColor: AppColor.black,
                                  fontWeight: FontWeight.w900,fontSize: 12,
                                ),

                                CustomTextFormField(
                                  isRounded: true,
                                  hint: "",
                                  // textInputType: TextInputType.emailAddress,
                                ),
                                const SizedBox(height: 10,),
                                Row(
                                  children: [  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const  RestInvestTitle(
                                          text: "CURRENT ADDRESS*",
                                          textColor: AppColor.black,fontSize: 12,fontWeight: FontWeight.w900,),
                                        CustomTextFormField(
                                          isRounded: true,
                                          hint: "",
                                          // textInputType: TextInputType.emailAddress,
                                        ),

                                      ],
                                    ),
                                  ),
                                    // const  DropDownContainer(text: "RETIREMENT AGE ( VPS Account )",fontSize: 12,),
                                    const  SizedBox(
                                      width: 6,
                                    ),
                                       // DropDownContainer(text: "CURRENT COUNTRY*",fontSize: 12,isSquare: false,icon: Icon(Icons.home),voidcallback: (){},),

                                  ],
                                ),
                                const SizedBox(height: 10,),
                                Row(
                                  children: [  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const  RestInvestTitle(
                                          text: "MAILING ADDRESS*",
                                          textColor: AppColor.black,fontSize: 12,fontWeight: FontWeight.w900,),
                                        CustomTextFormField(
                                          isRounded: true,
                                          hint: "",
                                          // textInputType: TextInputType.emailAddress,
                                        ),

                                      ],
                                    ),
                                  ),
                                    // const  DropDownContainer(text: "RETIREMENT AGE ( VPS Account )",fontSize: 12,),
                                    const  SizedBox(
                                      width: 6,
                                    ),
                                      // DropDownContainer(text: "MAILING COUNTRY*",fontSize: 12,isSquare: false,icon: Icon(Icons.home),voidcallback: (){},),

                                  ],
                                ),



                                const  SizedBox(height: 10,),


                                CustomRoundButton(text: "SAVE&NEXT", onPress: (){},isRound:false),
                                const SizedBox(height: 10,),

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
