import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:nit/routes/routes.dart';
import 'package:nit/views/account_opening_basic_information_screen.dart';

import '../utils/constant.dart';

import '../controller/register_controller.dart';

import '../utils/colors.dart';
import '../widgets/button.dart';
import '../widgets/constant_widget.dart';

import '../widgets/textformfiled.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterScreenController>(
        init: RegisterScreenController(),
        builder: (_) {
          return SafeArea(
              child: Scaffold(
            backgroundColor: AppColor.lightWhite,
            key: _.scaffoldKey,
            body: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
              child: Column(
                children: [
                  const LogoNit(height: 120, width: 120),
                  const SizedBox(
                    height: 40,
                  ),
                  Form(
                    key: _.formKey,
                    child: Column(
                      children: [
                        CustomFormField(
                          onTextChange: (val) {
                            _.updateAccountNo(val);
                          },
                          controller: _.accountNumberController,
                          textInputType:
                              const TextInputType.numberWithOptions(),
                          hint: "Account No.",
                          fieldType: Constants.accountNo,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomFormField(
                           // hintColor: AppColor.black,
                            hint: "Enter Your CNIC/NICOP Numbers",
                            onTextChange: (val) {
                              _.updateCnicNumber(val);
                            },
                            inputFormator: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(13),
                              NumberFormatter()
                            ],
                            controller: _.cnicController,
                            textInputType: const TextInputType.numberWithOptions(),

                            fieldType: Constants.cnicNumber,
                            textAlign: TextAlign.center

                        ),
                        // CustomFormField(
                        //
                        //     hint: "Enter Your CNIC/NICOP Numbers",
                        //     onTextChange: (val) {
                        //       _.updateCnicNumber(val);
                        //     },
                        //     inputFormator: [
                        //       FilteringTextInputFormatter.digitsOnly,
                        //       LengthLimitingTextInputFormatter(13),
                        //       NumberFormatter()
                        //     ],
                        //     controller: _.cnicController,
                        //     textInputType: const TextInputType.numberWithOptions(),
                        //
                        //     // fieldType: Constants.cnicNumber,
                        //     textAlign: TextAlign.center
                        //
                        // ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomFormField(
                          onTextChange: (val) {
                            _.updateEmail(val);
                            _.update();
                          },
                          controller: _.emailController,
                          textInputType: TextInputType.emailAddress,
                          hint: "Register Email",
                          fieldType: Constants.emailField,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomFormField(
                          onTextChange: (val) {
                            _.updateCellNumber(val);
                            _.update();
                          },
                          textInputType: TextInputType.number,
                          fieldType: Constants.phoneNumberField,
                          hint: "Register Cell Number",
                          textAlign: TextAlign.center,
                          controller: _.cellNumberController,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  RestInvestButton(

                      text: "Submit",
                      buttonColor: AppColor.blueColor,
                      textColor: AppColor.whiteColor,
                      onPress: () {
                        if (_.formKey.currentState!.validate()) {
                          _.formKey.currentState!.save();
                          _.onSubmitt(context);
                          _.accountNumberController.text = "";
                          _.cnicController.text = "";
                          _.emailController.text = "";
                          _.cellNumberController.text = "";
                        }
                        ;
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  RestInvestButton(

                      text: "Home",
                      buttonColor: AppColor.whiteColor,
                      textColor: AppColor.blueColor,
                      onPress: () {
                        Get.toNamed(AppRoute.homeRoute);


                      }),
                ],
              ),
            ),
          ));
        });
  }
}
