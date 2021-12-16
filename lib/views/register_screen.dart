import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:investintrust/utils/constant.dart';

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
            key: _.scaffoldKey,
            body: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
              child: Column(
                children: [
                  Logo(height: 200, width: 200),
                  const SizedBox(
                    height: 40,
                  ),
                 Form(key: _.formKey,child: Column(children: [ CustomFormField( onTextChange: (val) {
                   _.updateUserName(val);
                 },
                   hint: "Account No.",
                   fieldType: Constants.accountNo,
                   textAlign: TextAlign.center,
                 ),
                   const SizedBox(
                     height: 10,
                   ),
                   CustomFormField(onTextChange: (val) {
                     _.updateNumber(val);
                   },
                     hint: "CNIC - 85202-6761678-8",
                     fieldType: Constants.cnicNumber,

                     textAlign: TextAlign.center,
                   ),
                   const SizedBox(
                     height: 10,
                   ),
                   CustomFormField(onTextChange: (val){_.updateEmail(val);},
                     hint: "Register Email",
                     fieldType: Constants.emailField,
                     textAlign: TextAlign.center,
                   ),
                   const SizedBox(
                     height: 10,
                   ),
                   CustomFormField(onTextChange: (val){_.updatePassword(val);},
                     textInputType: TextInputType.number,
                     fieldType: Constants.phoneNumberField,
                     hint: "Register Cell Number",
                     textAlign: TextAlign.center,
                   ),],),),
                  const SizedBox(height: 20),
                  RestInvestButton(
                    text: "Submit",
                    buttonColor: AppColor.blueColor,
                    textColor: AppColor.whiteColor,
                    onPress: () {
                      if (_.formKey.currentState!.validate()) {
                        _.formKey.currentState!.save();

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
