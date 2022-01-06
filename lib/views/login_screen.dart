import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../utils/constant.dart';


import '../controller/login_screen_controller.dart';
import '../routes/routes.dart';
import '../utils/colors.dart';
import '../widgets/button.dart';
import '../widgets/constant_widget.dart';

import '../widgets/textformfiled.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginScreenController>(
        init: LoginScreenController(),
        builder: (_) {
          return SafeArea(
              child: Scaffold(backgroundColor: AppColor.lightWhite,

            key: _.scaffoldKey,
            body: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
              child: Column(
                children: [
                  const LogoNit(height: 120,width: 120,

                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: _.formKey,
                    child: Column(
                      children: [
                        CustomFormField(
                          controller: _.userNameController,
                          hint: "User name",
                          // textAlign: TextAlign.center,
                          fieldType: Constants.username,
                          onTextChange: (val) {
                            _.updateUserName(val);
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomFormField(
                          obscureText: true,
                          controller: _.passwordController,
                          fieldType: Constants.passwordField,
                          hint: "Password",
                          textAlign: TextAlign.center,
                          onTextChange: (val) {
                            _.updatePassword(val);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                      onTap: () {
                        Get.toNamed(AppRoute.passwordRoute);
                      },
                      child: const RestInvestTitle(
                          text: "Don't remember your password?",
                          textAlign: TextAlign.center,
                          textColor: AppColor.dimblack,fontWeight: FontWeight.w900,
                          )),
                  const SizedBox(
                    height: 20,
                  ),
                   RestInvestButton(
                      text: "Login",
                      buttonColor: AppColor.blueColor,
                      textColor: AppColor.whiteColor,
                      onPress: () {
                        _.onLoginPress(context);
                        // if (_.formKey.currentState!.validate()) {
                        //   _.formKey.currentState!.save();
                        //   (_.onLoginPress());
                        // }
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  const HeadingText(
                    text: "TERM & CONDITION",fontWeight: FontWeight.w900,
                    textAlign: TextAlign.center,
                    underlineColor: AppColor.blueColor,
                    textColor: AppColor.darkblue,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const RestInvestTitle(
                      text: "Still don't have an account?",fontWeight: FontWeight.w900,
                      textAlign: TextAlign.center,
                      textColor: AppColor.darkblue),
                  const SizedBox(height: 20),
                  RestInvestButton(
                    text: "Register now!",
                    buttonColor: AppColor.whiteColor,
                    textColor: AppColor.blueColor,
                    onPress: () {
                      Get.toNamed(AppRoute.registerRoute);
                    },
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                      onTap: () {
                        Get.toNamed(AppRoute.taxcalculatorRoute);
                      },
                      child: const RestInvestTitle(
                          text: "Tax Calculator",fontWeight: FontWeight.w900,
                          textAlign: TextAlign.center,
                          textColor: AppColor.blueColor)),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                      onTap: () {
                        Get.toNamed(AppRoute.dailynavRoute);
                      },
                      child: const RestInvestTitle(
                          text: "Daily Nav",fontWeight: FontWeight.w900,
                          textAlign: TextAlign.center,
                          textColor: AppColor.blueColor)),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                      onTap: () {
                        Get.toNamed(AppRoute.accountopeningrequest);
                      },
                      child: const RestInvestTitle(
                          text: "Form",
                          textAlign: TextAlign.center,
                          textColor: AppColor.blueColor)),
                  InkWell(
                      onTap: () {
                        Get.toNamed(AppRoute.accountopeningbankdetail);
                      },
                      child: const RestInvestTitle(
                          text: "Form2",
                          textAlign: TextAlign.center,
                          textColor: AppColor.blueColor)),
                  InkWell(
                      onTap: () {
                        Get.toNamed(AppRoute.accountopeningbasicinformation);
                      },
                      child: const RestInvestTitle(
                          text: "Form3",
                          textAlign: TextAlign.center,
                          textColor: AppColor.blueColor)),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                      onTap: () {
                        Get.toNamed(AppRoute.userRoute);
                      },
                      child: const RestInvestTitle(
                          text: "New User",fontWeight: FontWeight.w900,
                          textAlign: TextAlign.center,
                          textColor: AppColor.blueColor)),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      RestInvestTitle(
                        text: "Powered by",
                        textAlign: TextAlign.center,
                        textColor: AppColor.blueColor,fontWeight: FontWeight.w800,
                        fontSize: 14,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      HeadingText(
                        text: "SOFTECH SYSTEM",
                        textAlign: TextAlign.center,
                        underlineColor: AppColor.blueColor,
                        textColor: AppColor.blueColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 14,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ));
        });
  }
}
