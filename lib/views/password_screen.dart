import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investintrust/controller/password_controller.dart';

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
                    height: 8,
                  ),
<<<<<<< HEAD
                  CustomFormField(onTextChange: (val){
                    _.updateUserName(val);
                  },
=======
                  CustomFormField(
                    controller: _.userIdController,
>>>>>>> 15508a7b74805021b6d6fe3a3bebb1f0aeaf468e
                    hint: "User ID",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomFormField(
                    controller: _.cNicController,
                    hint: "CNIC - 85202-6761678-8",
                    onTextChange: (val){
                      _.updateUserName(val);
                    },
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RestInvestButton(
                    text: "Submit",
                    buttonColor: AppColor.blueColor,
                    textColor: AppColor.whiteColor,
                    onPress: () {
                      _.onSubmit();
                    },
                  ),
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
