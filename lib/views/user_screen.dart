import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:investintrust/routes/routes.dart';
import '../utils/constant.dart';

import '../utils/lists.dart';
import '../widgets/datefield.dart';
import '../controller/user_screen_controller.dart';

import '../utils/colors.dart';

import '../widgets/button.dart';
import '../widgets/constant_widget.dart';

import '../widgets/textformfiled.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserScreenController>(
        init: UserScreenController(),
        builder: (_) {
          return SafeArea(
              child: Scaffold(
            key: _.scaffoldKey,
            body: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
              child: Form(key: _.formKey,
                child: Column(
                  children: [
                    Container(
                      // alignment: Alignment.center,
                      width: Get.width,
                      // margin: EdgeInsets.all(10.0),
                      // padding: const EdgeInsets.only(left: 10.0, right: 5.0),

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.whiteColor,
                          border:
                              Border.all(width: 0.5, color: AppColor.dimblack)),
                      child: DropdownButton(
                        // alignment: Alignment.center,
                        isExpanded: true,
                        icon: const Visibility(
                          visible: false,
                          child: Icon(Icons.arrow_downward),
                        ),
                        iconSize: 0,
                        underline: Container(
                          color: AppColor.whiteColor,
                        ),

                        borderRadius: BorderRadius.circular(10),
                        // value: _.dropdownvalue,
                        hint: Center(
                          child: RestInvestTitle(
                            textAlign: TextAlign.center,
                            text: _.titlevalue == null || _.titlevalue == ""
                                ? "Title"
                                : _.titlevalue,
                            textColor: AppColor.black,
                          ),
                        ),

                        items: titleItems.map((String? titleItems) {
                          return DropdownMenuItem<String>(
                              value: titleItems, child: Text(titleItems!));
                        }).toList(),
                        onChanged: (String? value) {
                          _.titlevalue = value!;
                          _.update();
                        },
                      ),
                    ),
                    // RoundContainer(
                    //   isSquare: false,
                    //   voidcallback: () {
                    //     _.displayDialog(context, titleItems);
                    //   },
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomFormField(onTextChange: (val){_.updateUserName(val);},
                      hint: "Full Name",
                      fieldType: Constants.userName,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomFormField(onTextChange: (val){_.updateUserName(val);},
                      hint: "Name of Father/Husband",
                      fieldType: Constants.userName,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomFormField(onTextChange: (val){_.updateUserName(val);},
                      hint: "CNIC - 85202-6761678-8",
                      fieldType: Constants.cnicNumber,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        Expanded(
                          child: DateFormFieldContainer(text:"CNIC Start date",
                            isRounded: true,
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: DateFormFieldContainer(isRounded: true,text:"CNIC Expirey date"),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomFormField(onTextChange: (val){_.updateNumber(val);},
                      hint: "Passport No.",
                      fieldType: Constants.accountNo,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      // width: Get.width / 1,
                      // margin: EdgeInsets.all(10.0),
                      // padding: const EdgeInsets.only(left: 10.0, right: 5.0),

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.whiteColor,
                          border:
                              Border.all(width: 0.5, color: AppColor.dimblack)),
                      child: DropdownButton(   isExpanded: true,
                        alignment: Alignment.center,
                        icon: const Visibility(
                          visible: false,
                          child: Icon(Icons.arrow_downward),
                        ),
                        iconSize: 0,
                        underline: Container(
                          alignment: Alignment.center,
                          color: AppColor.whiteColor,
                        ),

                        borderRadius: BorderRadius.circular(10),
                        // value: _.dropdownvalue,
                        hint: Center(
                          child: RestInvestTitle(
                            text: _.incomevalue == null || _.incomevalue == ""
                                ? "Source of Income"
                                : _.incomevalue,
                            textColor: AppColor.black,
                          ),
                        ),

                        items: incomeItems.map((String? incomeItems) {
                          return DropdownMenuItem<String>(
                              value: incomeItems, child: Text(incomeItems!));
                        }).toList(),
                        onChanged: (String? value) {
                          _.incomevalue = value!;
                          _.update();
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      // width: Get.width / 1,
                      // margin: EdgeInsets.all(10.0),
                      // padding: const EdgeInsets.only(left: 10.0, right: 5.0),

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.whiteColor,
                          border:
                              Border.all(width: 0.5, color: AppColor.dimblack)),
                      child: DropdownButton(   isExpanded: true,
                        alignment: Alignment.center,
                        icon: const Visibility(
                          visible: false,
                          child: Icon(Icons.arrow_downward),
                        ),

                        iconSize: 0,
                        underline: Container(
                          alignment: Alignment.center,
                          color: AppColor.whiteColor,
                        ),

                        borderRadius: BorderRadius.circular(10),
                        // value: _.dropdownvalue,
                        hint: Center(
                          child: RestInvestTitle(
                            text:
                                _.occupationvalue == null || _.occupationvalue == ""
                                    ? "Occupations"
                                    : _.occupationvalue,
                            textColor: AppColor.black,
                            textAlign: TextAlign.center,
                          ),
                        ),

                        items: occupationItems.map((String? occupationItems) {
                          return DropdownMenuItem<String>(
                              value: occupationItems,
                              child: Text(occupationItems!));
                        }).toList(),
                        onChanged: (String? value) {
                          _.occupationvalue = value!;
                          _.update();
                        },
                      ),
                    ),
                    // Expanded(
                    //     child: RoundContainer(
                    //   isSquare: false,
                    //   voidcallback: () {
                    //     _.displayDialog(context, incomeItems);
                    //   },
                    // )),
                    const SizedBox(
                      width: 4,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomFormField(onTextChange: (val){_.updateUserName(val);},
                      hint: "NTN",
                      fieldType: Constants.text,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomFormField(onTextChange: (val){_.updateEmail(val);},
                      hint: "Address",
                      textAlign: TextAlign.center,
                      fieldType: Constants.emailField,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: Get.width,
                      // margin: EdgeInsets.all(10.0),
                      // padding: const EdgeInsets.only(left: 10.0, right: 5.0),

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.whiteColor,
                          border:
                              Border.all(width: 0.5, color: AppColor.dimblack)),
                      child: DropdownButton(   isExpanded: true,
                        alignment: Alignment.center,
                        icon: const Visibility(
                          visible: false,
                          child: Icon(Icons.arrow_downward),
                        ),
                        iconSize: 0,
                        underline: Container(
                          color: AppColor.whiteColor,
                        ),

                        borderRadius: BorderRadius.circular(10),
                        // value: _.dropdownvalue,
                        hint: Center(
                          child: RestInvestTitle(
                            text: _.bracketvalue == null || _.bracketvalue == ""
                                ? "Income Bracket"
                                : _.bracketvalue,
                            textColor: AppColor.black,
                          ),
                        ),

                        items: bracketItems.map((String? bracketItems) {
                          return DropdownMenuItem<String>(
                              value: bracketItems, child: Text(bracketItems!));
                        }).toList(),
                        onChanged: (String? value) {
                          _.bracketvalue = value!;
                          _.update();
                        },
                      ),
                    ),
                    // RoundContainer(
                    //   isSquare: false,
                    //   voidcallback: () {
                    //     _.displayDialog(context, bracketItems);
                    //   },
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    RestInvestButton(isSquare: true,
                      text: "Submit",
                      buttonColor: AppColor.blueColor,
                      textColor: AppColor.whiteColor,
                      onPress: () {
                        // if (_.formKey.currentState!.validate()) {
                        // _.formKey.currentState!.save();
                        Get.toNamed(AppRoute.generateCode);

                      }
                        // Fluttertoast.showToast(
                        //     msg: "Please fill all fields",
                        //     toastLength: Toast.LENGTH_SHORT,
                        //     gravity: ToastGravity.BOTTOM,
                        //     timeInSecForIosWeb: 1,
                        //     backgroundColor: Colors.black,
                        //     textColor: Colors.white,
                        //     fontSize: 16.0);

                    ),
                  ],
                ),
              ),
            ),
          ));
        });
  }
}
