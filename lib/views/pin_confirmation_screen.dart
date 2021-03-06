import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/pin_confirmation_screen_controller.dart';

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
                      const Logo(
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
                            CustomFormField(
                              onTextChange: (val) {
                                _.updateUserName(val);
                              },
                              controller: _.accNumberController,
                              textInputType: const TextInputType.numberWithOptions(),
                              hint: "Account No.",
                              fieldType: Constants.accountNo,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomFormField(
                              hint: "Security Code",
                              controller: _.pinCodeController,
                              // textInputType: TextInputType.number,
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
        _.onSubmitt(context);
      }
    } ),
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
