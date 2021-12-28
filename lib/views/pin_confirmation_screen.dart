import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investintrust/controller/pin_confirmation_screen_controller.dart';
import '../controller/password_controller.dart';
import '../utils/constant.dart';

import '../utils/colors.dart';
import '../widgets/button.dart';
import '../widgets/constant_widget.dart';

import '../widgets/textformfiled.dart';

class PinConfirmationScreen extends StatelessWidget {
  const PinConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PinConfirmationController>(
        init: PinConfirmationController(),
        builder: (_) {
          return SafeArea(
              child: Scaffold(
                key: _.scaffoldKey,
                body: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
                  child: Column(
                    children: [
                      Logo(
                        height: 120,
                        width: 120,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const RestInvestTitle(
                          text:
                          "Enter your account number and pin to complete\nregistration.",
                          textAlign: TextAlign.center,fontWeight: FontWeight.bold,
                          textColor: AppColor.black),
                      const SizedBox(
                        height: 10,
                      ),
                      Form(
                        key: _.formKey,
                        child: Column(
                          children: [
                            CustomFormField(  controller: _.accountNoController,
                              fieldType: Constants.accountNo,
                              onTextChange: (val) {
                                _.updateAccountNumber(val);
                              },
                              hint: "Account No ",
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomFormField(
                              hint: "Security Code",
                              controller: _.securityCodeController,
                              textInputType: TextInputType.number,
                              fieldType: Constants.securitycode,
                              onTextChange: (val) {
                                _.updateSecurityCode(val);
                              },
                              textAlign: TextAlign.center,
                            ),

                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RestInvestButton(
                          text: "Register",
                          buttonColor: AppColor.blueColor,
                          textColor: AppColor.whiteColor,
                          onPress: () {
                            if (_.formKey.currentState!.validate()) {
                              _.formKey.currentState!.save();

                            }
                          }),
                      const SizedBox(
                        height: 20,
                      ),

                    const  RestInvestTitle(text: "I want to register again",textColor: AppColor.blueColor,fontSize: 18,fontWeight: FontWeight.bold,)
                    ],
                  ),
                ),
              ));
        });
  }
}
