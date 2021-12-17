import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:get/get.dart';
import 'package:investintrust/controller/generate_code_screen.dart';
import '../utils/constant.dart';

import '../widgets/datefield.dart';

import '../utils/colors.dart';

import '../widgets/button.dart';

import '../widgets/textformfiled.dart';

class GenerateCodeScreen extends StatelessWidget {
  const GenerateCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GenerateCodeScreenController>(
        init: GenerateCodeScreenController(),
        builder: (_) {
          return SafeArea(
              child: Scaffold(
            key: _.scaffoldKey,
            body: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
              child: Form(
                key: _.formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(height: 50,
                            // alignment: Alignment.center,
                            // width: Get.width,
                            // margin: EdgeInsets.all(10.0),
                            // padding: const EdgeInsets.only(left: 10.0, right: 5.0),

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.whiteColor,
                                border: Border.all(
                                    width: 0.5, color: AppColor.dimblack)),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Expanded(
                          child: Container(height: 50,
                            // alignment: Alignment.center,
                            // width: Get.width,
                            // margin: EdgeInsets.all(10.0),
                            // padding: const EdgeInsets.only(left: 10.0, right: 5.0),

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.whiteColor,
                                border: Border.all(
                                    width: 0.5, color: AppColor.dimblack)),
                          ),
                        ),
                      ],
                    ),



                    const SizedBox(
                      height: 10,
                    ),
                  Row(children: [
                    Expanded(
                      child: CustomFormField(
                        onTextChange: (val) {},
                        hint: "Other City",
                        fieldType: Constants.accountNo,
                        textAlign: TextAlign.center,
                      ),
                    ),
                   const SizedBox(width: 6,),
                    Expanded(
                      child: Container(height: 50,
                        // alignment: Alignment.center,
                        // width: Get.width,
                        // margin: EdgeInsets.all(10.0),
                        // padding: const EdgeInsets.only(left: 10.0, right: 5.0),

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.whiteColor,
                            border: Border.all(
                                width: 0.5, color: AppColor.dimblack)),
                      ),
                    ),
                  ],),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(height: 50,
                      // alignment: Alignment.center,
                       width: Get.width,
                      // margin: EdgeInsets.all(10.0),
                      // padding: const EdgeInsets.only(left: 10.0, right: 5.0),

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.whiteColor,
                          border: Border.all(
                              width: 0.5, color: AppColor.dimblack)),
                    ),


                    const SizedBox(
                      height: 10,
                    ),




                    CustomFormField(
                      onTextChange: (val) {},
                      hint: "Phone",
                      fieldType: Constants.phoneNumberField,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomFormField(
                      onTextChange: (val) {},
                      hint: "Cell",
                      textAlign: TextAlign.center,
                      fieldType: Constants.phoneNumberField,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomFormField(
                      onTextChange: (val) {},
                      hint: "Fax",
                      textAlign: TextAlign.center,
                      fieldType: Constants.phoneNumberField,
                    ),
                   const SizedBox(height: 10,),
                    CustomFormField(
                      onTextChange: (val) {},
                      hint: "Email",
                      textAlign: TextAlign.center,
                      fieldType: Constants.emailField,
                    ),
                    const SizedBox(height: 10,),

                  const  DateFormFieldContainer(isRounded:true,text:"Date Of Birth"),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(height: 50,
                            // alignment: Alignment.center,
                            // width: Get.width,
                            // margin: EdgeInsets.all(10.0),
                            // padding: const EdgeInsets.only(left: 10.0, right: 5.0),

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.whiteColor,
                                border: Border.all(
                                    width: 0.5, color: AppColor.dimblack)),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Expanded(
                          child: Container(height: 50,
                            // alignment: Alignment.center,
                            // width: Get.width,
                            // margin: EdgeInsets.all(10.0),
                            // padding: const EdgeInsets.only(left: 10.0, right: 5.0),

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.whiteColor,
                                border: Border.all(
                                    width: 0.5, color: AppColor.dimblack)),
                          ),
                        ),
                      ],
                    ),



                    const SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Expanded(
                        child: CustomFormField(
                          onTextChange: (val) {},
                          hint: "Pin Code",
                          fieldType: Constants.accountNo,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(width: 6,),
                      Expanded(
                        child: Container(height: 50,
                          // alignment: Alignment.center,
                          // width: Get.width,
                          // margin: EdgeInsets.all(10.0),
                          // padding: const EdgeInsets.only(left: 10.0, right: 5.0),

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.whiteColor,
                              border: Border.all(
                                  width: 0.5, color: AppColor.dimblack)),
                        ),
                      ),
                    ],),
                    const SizedBox(
                      height: 10,
                    ),
                    RestInvestButton(isSquare: true,
                      text: "Generate Pin Code",
                      buttonColor: AppColor.blueColor,
                      textColor: AppColor.whiteColor,
                      onPress: () {
                        if (_.formKey.currentState!.validate()) {
                          _.formKey.currentState!.save();
                        }

                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RestInvestButton(isSquare: true,
                      text: "Submit",
                      buttonColor: AppColor.blueColor,
                      textColor: AppColor.whiteColor,
                      onPress: () {
                        if (_.formKey.currentState!.validate()) {
                          _.formKey.currentState!.save();
                        }

                      },
                    ),
                  ],
                ),
              ),
            ),
          ));
        });
  }
}
