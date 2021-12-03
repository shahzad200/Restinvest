import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:investintrust/utils/dialog_list.dart';
import 'package:investintrust/widgets/datefield.dart';
import '../controller/user_screen_controller.dart';

import '../utils/colors.dart';

import '../widgets/button.dart';
import '../widgets/constant_widget.dart';

import '../widgets/textformfiled.dart';

class UserrScreen extends StatelessWidget {
  const UserrScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserrScreenController>(
        init: UserrScreenController(),
        builder: (_) {
          return SafeArea(
              child: Scaffold(
            key: _.scaffoldKey,
            body: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
              child: Column(
                children: [
                  RoundContainer(
                    isSquare: false,
                    voidcallback: () {
                      _.displayDialog(context, titleItems);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomFormField(
                    hint: "Full Name",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomFormField(
                    hint: "Name of Father/Husband",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomFormField(
                    hint: "CNIC - 85202-6761678-8",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Expanded(
                        child: DateFormFieldContainer(),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: DateFormFieldContainer(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomFormField(
                    hint: "Passport N0.",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: RoundContainer(
                        isSquare: false,
                        voidcallback: () {
                          _.displayDialog(context, incomeItems);
                        },
                      )),
                      const SizedBox(
                        width: 4,
                      ),
                      Expanded(
                          child: InkWell(
                        onTap: () {},
                        child: RoundContainer(
                          isSquare: false,
                          voidcallback: () {
                            _.displayDialog(context, occupationItems);
                          },
                        ),
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomFormField(
                    hint: "NTN",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomFormField(
                    hint: "Address",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RoundContainer(
                    isSquare: false,
                    voidcallback: () {
                      _.displayDialog(context, bracketItems);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RestInvestButton(
                    text: "Submit",
                    buttonColor: AppColor.blueColor,
                    textColor: AppColor.whiteColor,
                    onPress: () {
                      Fluttertoast.showToast(
                          msg: "Please fill all fields",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    },
                  ),
                ],
              ),
            ),
          ));
        });
  }
}
