import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:get/get.dart';
import 'package:investintrust/controller/generate_code_screen.dart';
import 'package:investintrust/controller/user_screen_controller.dart';
import 'package:investintrust/data/models/city_data.dart';
import 'package:investintrust/data/models/new_user_reg_data.dart';
import 'package:investintrust/utils/lists.dart';
import 'package:investintrust/widgets/constant_widget.dart';
import '../utils/constant.dart';
import 'package:investintrust/data/models/city_data.dart' as res;
import 'package:investintrust/data/models/city_sector_model.dart' as sector;
import '../widgets/datefield.dart';

import '../utils/colors.dart';

import '../widgets/button.dart';

import '../widgets/textformfiled.dart';

class GenerateCodeScreen extends StatelessWidget {
  GenerateCodeScreen({Key? key
  }) : super(key: key);
  final UserScreenController controller = Get.find<UserScreenController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GenerateCodeScreenController>(
        init: GenerateCodeScreenController(),
        builder: (_) {
          return SafeArea(
              child: Scaffold(
                key: _.scaffoldKey,
                body: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                  child: Form(
                    key: _.formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(height: 50,
                                // alignment: Alignment.center,
                                // width: Get.width,
                                // margin: EdgeInsets.all(10.0),
                                // padding: const EdgeInsets.only(left: 10.0, right: 5.0),

                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColor.whiteColor,
                                    border: Border.all(
                                        width: 0.5,
                                        color: AppColor.dimblack)),
                                child: DropdownButton(
                                  isExpanded: true,
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
                                      text: _.countryValue == null || _.countryValue == ""
                                          ? "Select Country"
                                          : _.countryValue,
                                      textColor: AppColor.black,
                                    ),
                                  ),
                                  items: controller.newUserRegData.response!.countries!.map<DropdownMenuItem<Countries>>((Countries? value){
                                    return DropdownMenuItem<Countries>(
                                      value: value,
                                      child: Text(value!.countryName!),
                                    );
                                  }).toList(),
                                  onChanged: (Countries? value) {
                                    _.countryValue = value!.countryName!;
                                    _.countryCode = value!.countryCode!;
                                    _.onCityData(value!.countryCode!);
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Expanded(
                              child: Container(height: 50,
                                  // alignment: Alignment.center,
                                  // width: Get.width,
                                  // margin: EdgeInsets.all(10.0),
                                  // padding: const EdgeInsets.only(left: 10.0, right: 5.0),

                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColor.whiteColor,
                                      border: Border.all(
                                          width: 0.5, color: AppColor.dimblack)),
                                  child: _.cityData != null
                                      ? DropdownButton(
                                    isExpanded: true,
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
                                        text: _.cityValue == null || _.cityValue == ""
                                            ? "Select Country"
                                            : _.cityValue,
                                        textColor: AppColor.black,
                                      ),
                                    ),
                                    items: _.cityData!.response!.map<DropdownMenuItem<res.Response>>((res.Response? value){
                                      return DropdownMenuItem<res.Response>(
                                        value: value,
                                        child: Text(value!.cityName!),
                                      );
                                    }).toList(),
                                    onChanged: (res.Response? value) {
                                      _.cityValue = value!.cityName!;
                                      _.cityCode = value!.cityCode!;
                                      _.onCitySectorData(value!.cityCode!);
                                    },
                                  )
                                      : const SizedBox()
                              ),
                            ),
                          ],
                        ),


                        const SizedBox(
                          height: 8,
                        ),
                        Row(children: [
                          Expanded(
                            child: CustomFormField(
                              controller: _.otherCityController,
                              onTextChange: (val) {},
                              hint: "Other City",
                              fieldType: Constants.cityname,

                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(width: 6,),
                          Expanded(
                            child: Container(height: 50,
                                // alignment: Alignment.center,
                                // width: Get.width,
                                // margin: EdgeInsets.all(10.0),
                                // padding: const EdgeInsets.only(left: 10.0, right: 5.0),

                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColor.whiteColor,
                                    border: Border.all(
                                        width: 0.5, color: AppColor.dimblack)),
                                child: _.citySector != null
                                    ? DropdownButton(
                                  isExpanded: true,
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
                                      text: _.sectorValue == null || _.sectorValue == ""
                                          ? "Select Sector"
                                          : _.sectorValue,
                                      textColor: AppColor.black,
                                    ),
                                  ),
                                  items: _.citySector!.response!.map<DropdownMenuItem<sector.Response>>((sector.Response? value){
                                    return DropdownMenuItem<sector.Response>(
                                      value: value,
                                      child: Text(value!.sectorName!),
                                    );
                                  }).toList(),
                                  onChanged: (sector.Response? value) {
                                    _.sectorValue = value!.sectorName!;
                                    _.sectorCode = value.sectorCode!;
                                    _.update();
                                  },
                                )
                                    : const SizedBox()
                            ),
                          ),
                        ],),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(height: 50,
                            // alignment: Alignment.center,
                            width: Get.width,
                            // margin: EdgeInsets.all(10.0),
                            // padding: const EdgeInsets.only(left: 10.0, right: 5.0),

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.whiteColor,
                                border: Border.all(
                                    width: 0.5, color: AppColor.dimblack)),
                            child: DropdownButton(
                              isExpanded: true,
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
                                  text: _.religionValue == null || _.religionValue == ""
                                      ? "Select Religion"
                                      : _.religionValue,
                                  textColor: AppColor.black,
                                ),
                              ),
                              items: controller.newUserRegData.response!.religions!.map<DropdownMenuItem<Religions>>((Religions? value){
                                return DropdownMenuItem<Religions>(
                                  value: value,
                                  child: Text(value!.religionName!),
                                );
                              }).toList(),
                              onChanged: (Religions? value) {
                                _.religionValue = value!.religionName!;
                                _.religionCode = value.religionCode!;
                                _.update();
                              },
                            )

                        ),


                        const SizedBox(
                          height: 8,
                        ),


                        CustomFormField(
                          controller: _.phoneController,
                          onTextChange: (val) {},
                          hint: "Phone",
                          fieldType: Constants.phoneNumberField,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        CustomFormField(
                          controller: _.cellController,
                          onTextChange: (val) {},
                          hint: "Cell",
                          textAlign: TextAlign.center,
                          fieldType: Constants.cellnumber,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomFormField(
                          controller: _.faxController,
                          onTextChange: (val) {},
                          hint: "Fax",
                          textAlign: TextAlign.center,
                          fieldType: Constants.faxnumber,
                        ),
                        const SizedBox(height: 10,),
                        CustomFormField(
                          controller: _.emailController,
                          onTextChange: (val) {},
                          hint: "Email",
                          textAlign: TextAlign.center,
                          fieldType: Constants.emailField,
                        ),
                        const SizedBox(height: 8,),

                        DateFormFieldContainer(isRounded:true,
                          text: 'Date of Birth',
                          mode: DateTimeFieldPickerMode.date,
                          dateFormatTrue: true,
                          initialValue: DateTime.now(),
                          onDateSelected: (value) {
                            _.dateOfBirth = controller.dateTime(value);
                          },
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(height: 50,
                                // alignment: Alignment.center,
                                // width: Get.width,
                                // margin: EdgeInsets.all(10.0),
                                // padding: const EdgeInsets.only(left: 10.0, right: 5.0),

                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColor.whiteColor,
                                    border: Border.all(
                                        width: 0.5, color: AppColor.dimblack)),
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
                                      text: _.genderValue == null || _.genderValue == ""
                                          ? "Gender"
                                          : _.genderValue,
                                      textColor: AppColor.black,
                                    ),
                                  ),

                                  items: gender.map((String? titleItems) {
                                    return DropdownMenuItem<String>(
                                        value: titleItems, child: Text(titleItems!));
                                  }).toList(),
                                  onChanged: (String? value) {
                                    _.genderValue = value!;
                                    _.update();
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Container(height: 50,
                                // alignment: Alignment.center,
                                // width: Get.width,
                                // margin: EdgeInsets.all(10.0),
                                // padding: const EdgeInsets.only(left: 10.0, right: 5.0),

                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColor.whiteColor,
                                    border: Border.all(
                                        width: 0.5, color: AppColor.dimblack)),
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
                                      text: _.maritalStatusValue == null || _.maritalStatusValue == ""
                                          ? "Marital Status"
                                          : _.maritalStatusValue,
                                      textColor: AppColor.black,
                                    ),
                                  ),

                                  items: maritalStatus.map((String? titleItems) {
                                    return DropdownMenuItem<String>(
                                        value: titleItems, child: Text(titleItems!));
                                  }).toList(),
                                  onChanged: (String? value) {
                                    _.maritalStatusValue = value!;
                                    _.update();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),


                        const SizedBox(
                          height: 8,
                        ),
                        Row(children: [
                          Expanded(
                            child: CustomFormField(
                              controller: _.pinCodeController,
                              onTextChange: (val) {},
                              hint: "Pin Code",
                              fieldType: Constants.pincode,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(width: 6,),
                          Expanded(
                            child: Container(height: 50,
                              // alignment: Alignment.center,
                              // width: Get.width,
                              // margin: EdgeInsets.all(10.0),
                              // padding: const EdgeInsets.only(left: 10.0, right: 5.0),

                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColor.whiteColor,
                                  border: Border.all(
                                      width: 0.5, color: AppColor.dimblack)),
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
                                    text: _.filerValue == null || _.filerValue == ""
                                        ? "Filer/NonFiler"
                                        : _.filerValue,
                                    textColor: AppColor.black,
                                  ),
                                ),

                                items: filerNonFiler.map((String? titleItems) {
                                  return DropdownMenuItem<String>(
                                      value: titleItems, child: Text(titleItems!));
                                }).toList(),
                                onChanged: (String? value) {
                                  _.filerValue = value!;
                                  _.update();
                                },
                              ),
                            ),
                          ),
                        ],),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomRoundButton(
                          isSquare: true,
                          text: "Generate Pin Code",
                          buttonColor: AppColor.blueColor,
                          textColor: AppColor.whiteColor,
                          onPress: () {
                            _.onNewUserPinGenration(controller.addressController.value.text,
                                _.phoneController.value.text, controller.cNicController.value.text,
                                _.emailController.value.text);
                          },
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        CustomRoundButton(
                          isSquare: true,
                          text: "Submit",
                          buttonColor: AppColor.blueColor,
                          textColor: AppColor.whiteColor,
                          onPress: () {
                            // _.onRegNewUser(controller.titleValue, controller.fatherNameController.value.text,
                            //     controller.issueDate, controller.expiryDate,
                            //     controller.addressController.value.text, _.countryCode,
                            //     _.phoneController.value.text, _.cellController.value.text,
                            //     _.emailController.value.text, _.genderValue,
                            //     controller.occupationCode, controller.incomeCode,
                            //     controller.nameController.value.text, controller.cNicController.value.text,
                            //     controller.passPortController.value.text,
                            //     controller.ntnController.value.text, _.cityCode, _.otherCityController.value.text,
                            //     _.sectorCode, _.faxController.value.text, _.dateOfBirth,
                            //     _.maritalStatusValue, controller.bracketCode, _.religionCode, _.filerValue,
                            //     _.pinCodeController.value.text, _.newUserPinGenration!.response!.pinCodeConfigId!.toString());
                            if (_.formKey.currentState!.validate()) {
                              _.formKey.currentState!.save();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        });
  }
}