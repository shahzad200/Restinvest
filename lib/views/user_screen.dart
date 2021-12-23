import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:investintrust/data/models/new_user_reg_data.dart';
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
            body: _.isLoading ?
            const Center(child: CircularProgressIndicator()) : SingleChildScrollView(
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
                            text: _.titleValue == null || _.titleValue == ""
                                ? "Title"
                                : _.titleValue,
                            textColor: AppColor.black,
                          ),
                        ),

                        items: titleItems.map((String? titleItems) {
                          return DropdownMenuItem<String>(
                              value: titleItems, child: Text(titleItems!));
                        }).toList(),
                        onChanged: (String? value) {
                          _.titleValue = value!;
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
                      controller: _.nameController,
                      hint: "Full Name",
                      fieldType: Constants.userName,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomFormField(onTextChange: (val){_.updateUserName(val);},
                      controller: _.fatherNameController,
                      hint: "Name of Father/Husband",
                      fieldType: Constants.userName,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomFormField(onTextChange: (val){_.updateUserName(val);},
                      controller: _.cNicController,
                      hint: "CNIC - 85202-6761678-8",
                      fieldType: Constants.cnicNumber,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: DateFormFieldContainer(
                            text: 'CNIC Issue Date',
                            mode: DateTimeFieldPickerMode.date,
                            dateFormatTrue: true,
                            initialValue: DateTime.now(),
                            onDateSelected: (value) {
                              _.issueDate = _.dateTime(value);
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: DateFormFieldContainer(
                            text: 'CNIC Expiry Date',
                            mode: DateTimeFieldPickerMode.date,
                            dateFormatTrue: true,
                            initialValue: DateTime.now(),
                            onDateSelected: (value){
                              _.expiryDate = _.dateTime(value);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomFormField(onTextChange: (val){_.updateNumber(val);},
                      controller: _.passPortController,
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
                            text: _.bracketValue == null || _.bracketValue == ""
                                ? "Source of Income"
                                : _.bracketValue,
                            textColor: AppColor.black,
                          ),
                        ),
                        items: _.newUserRegData.response!.incomeSources!.map<DropdownMenuItem<IncomeSources>>((IncomeSources? value){
                          return DropdownMenuItem<IncomeSources>(
                            value: value,
                            child: Text(value!.incomeSourceName!),
                          );
                        }).toList(),
                        onChanged: (IncomeSources? value) {
                          _.bracketValue = value!.incomeSourceName!;
                          _.bracketCode = value!.incomeSourceId!;
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
                                _.occupationValue == null || _.occupationValue == ""
                                    ? "Occupations"
                                    : _.occupationValue,
                            textColor: AppColor.black,
                            textAlign: TextAlign.center,
                          ),
                        ),

                        items: _.newUserRegData.response!.occupations!.map<DropdownMenuItem<Occupations>>((Occupations? value){
                          return DropdownMenuItem<Occupations>(
                            value: value,
                            child: Text(value!.occupoationName!),
                          );
                        }).toList(),
                        onChanged: (Occupations? value) {
                          _.occupationValue = value!.occupoationName!;
                          _.occupationCode = value!.occupoationCode!;
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
                      controller: _.ntnController,
                      hint: "NTN",
                      fieldType: Constants.text,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomFormField(onTextChange: (val){_.updateEmail(val);},
                      controller: _.addressController,
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
                            text: _.incomeValue == null || _.incomeValue == ""
                                ? "Income Bracket"
                                : _.incomeValue,
                            textColor: AppColor.black,
                          ),
                        ),

                        items: _.newUserRegData.response!.incomeBrackets!.map<DropdownMenuItem<IncomeBrackets>>((IncomeBrackets? value){
                          return DropdownMenuItem<IncomeBrackets>(
                            value: value,
                            child: Text(value!.incomeBracketName!),
                          );
                        }).toList(),
                        onChanged: (IncomeBrackets? value) {
                          _.incomeValue = value!.incomeBracketName!;
                          _.incomeCode = value!.incomeBracketId!;
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
                      text: "Next",
                      buttonColor: AppColor.blueColor,
                      textColor: AppColor.whiteColor,
                      onPress: () {
                      _.goTONext();
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
            ) ,
          ));
        });
  }
}
