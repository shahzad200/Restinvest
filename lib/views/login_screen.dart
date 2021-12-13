import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
              child: Scaffold(
            backgroundColor: AppColor.whiteColor,
            key: _.scaffoldKey,
            body: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
              child: Column(
                children: [
                  Logo(
                    height: 200,
                    width: 200,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomFormField(
                    hint: "User name",
                    textAlign: TextAlign.center,
                    validations: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter  Email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomFormField(
                    hint: "Password",
                    textAlign: TextAlign.center,
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
                          textColor: AppColor.dimblack,
                          fontSize: 16)),
                  const SizedBox(
                    height: 20,
                  ),
                  RestInvestButton(
                    text: "Login",
                    buttonColor: AppColor.blueColor,
                    textColor: AppColor.whiteColor,
                    onPress: () {
                      Get.toNamed(AppRoute.redemptionRoute);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const HeadingText(
                    text: "TERM & CONDITION",
                    textAlign: TextAlign.center,
                    underlineColor: AppColor.blueColor,
                    textColor: AppColor.darkblue,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const RestInvestTitle(
                      text: "Still don't have an account?",
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
                        Get.toNamed(AppRoute.userrRoute);
                      },
                      child: const RestInvestTitle(
                          text: "New User",
                          textAlign: TextAlign.center,
                          textColor: AppColor.dimBlue)),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      RestInvestTitle(
                        text: "Powered by",
                        textAlign: TextAlign.center,
                        textColor: AppColor.blueColor,
                        fontSize: 12,
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
