import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/password_controller.dart';
import '../utils/constant.dart';

import '../utils/colors.dart';
import '../widgets/button.dart';
import '../widgets/constant_widget.dart';

import '../widgets/textformfiled.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PasswordScreenController>(
        init: PasswordScreenController(),
        builder: (_) {
          return SafeArea(
              child: Scaffold(
            key: _.scaffoldKey,
            body: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
              child: Column(
                children: [
                  Logo(
                    height: 200,
                    width: 200,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const RestInvestTitle(
                      text:
                          "Enter your User ID and CNIC and press Sumbit button.",
                      textAlign: TextAlign.center,
                      textColor: AppColor.black),
                  const SizedBox(
                    height: 10,
                  ),
                  Form(
                    key: _.formKey,
                    child: Column(
                      children: [
                        CustomFormField(  controller: _.userIdController,
                          fieldType: Constants.userId,
                          onTextChange: (val) {
                            _.updateUserId(val);
                          },
                          hint: "User ID",
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomFormField(
                          hint: "CNIC - 85202-6761678-8",
                          controller: _.cNicController,

                          fieldType: Constants.cnicNumber,
                          onTextChange: (val) {
                            _.updateCNICNumber(val);
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
                      text: "Submit",
                      buttonColor: AppColor.blueColor,
                      textColor: AppColor.whiteColor,
                      onPress: () {
                        if (_.formKey.currentState!.validate()) {
                          _.formKey.currentState!.save();
                           (_.onSubmit());
                        }
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ));
        });
  }
}
