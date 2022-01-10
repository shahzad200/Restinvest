import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../routes/routes.dart';
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
                            _.updateUserName(val);
                          },
                          controller: _.accNumberController,
                          textInputType: TextInputType.numberWithOptions(),
                          hint: "Account No.",
                          fieldType: Constants.accountNo,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomFormField(
                          onTextChange: (val) {
                            _.updateNumber(val);
                          },
                          controller: _.cnicController,
                          textInputType: TextInputType.numberWithOptions(),
                          hint: "CNIC - 85202-6761678-8",
                          fieldType: Constants.cnicNumber,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomFormField(
                          onTextChange: (val) {
                            _.updateEmail(val);
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
                            _.updatePassword(val);
                          },
                          textInputType: TextInputType.number,
                          fieldType: Constants.phoneNumberField,
                          hint: "Register Cell Number",
                          textAlign: TextAlign.center,
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
                      }

                      // Fluttertoast.showToast(
                      //     msg: "Please fill all fields",
                      //     toastLength: Toast.LENGTH_SHORT,
                      //     gravity: ToastGravity.BOTTOM,
                      //     timeInSecForIosWeb: 1,
                      //     backgroundColor: Colors.black,
                      //     textColor: Colors.white,
                      //     fontSize: 16.0);
                    },
                  ),
                ],
              ),
            ),
          ));
        });
  }
}
