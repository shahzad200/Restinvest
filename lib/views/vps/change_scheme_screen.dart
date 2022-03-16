
import 'dart:ui';

import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nit/controller/vps/change_scheme_screen_controller.dart';
import 'package:nit/data/models/login_model.dart';
import 'package:nit/data/models/vps/load_existing_schema_data.dart';
import 'package:nit/data/models/vps/load_schema_allocation.dart' as pension;
import 'package:nit/utils/colors.dart';
import 'package:nit/widgets/button.dart';
import 'package:nit/widgets/constant_widget.dart';
import 'package:nit/widgets/datefield.dart';
import 'package:nit/widgets/drawer.dart';
import 'package:nit/widgets/no_internet.dart';
import 'package:nit/widgets/textformfiled.dart';






class ChangeSchemeScreen extends StatelessWidget {
  const ChangeSchemeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangeSchemeScreenController>(
        init: ChangeSchemeScreenController(),
        builder: (controller) {
          var space = const SizedBox(
            height: 10,
          );
          controller.textControllerList = [];
          return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: const LogoNit(height: 60,width: 60,),
                  backgroundColor: AppColor.whiteColor,
                  leading: InkWell(
                    onTap: () {
                      controller.scaffoldKey.currentState!.openDrawer();
                    },
                    child: const Icon(
                      Icons.menu,
                      color: AppColor.blueColor,
                    ),
                  ),
                ),
                drawer: const CustomDrawer(),
                key: controller.scaffoldKey,
                body: Stack(
                  children: [
                    ListView(
                      shrinkWrap: true,
                        keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                        padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                        children: [
                          const Padding(
                            padding:  EdgeInsets.only(top: 0.0,bottom: 10),
                            child:  Align(
                              alignment: Alignment.topCenter,
                              child: RestInvestTitle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                text: "VPS CHANGE SCHEME",
                                textColor: AppColor.black,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const RestInvestTitle(
                                text: "Account Number:*",fontSize: 10,
                                textColor: AppColor.black,
                                fontWeight: FontWeight.w900,
                              ),
                              Container(
                                // margin: EdgeInsets.all(10.0),
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 5.0),
                                height: 35,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: AppColor.whiteColor,
                                    border: Border.all(
                                        width: 1,
                                        color: AppColor.black)),
                                child: controller.isLoading ? const SizedBox() :DropdownButton<Accounts>(
                                  isExpanded: true,
                                  underline: Container(
                                    color: AppColor.whiteColor,
                                  ),

                                  borderRadius:
                                  BorderRadius.circular(6),
                                  // value: _.dropdownvalue,
                                  hint: RestInvestTitle(
                                    text: controller.accountValue == null ||
                                        controller.accountValue == ""
                                        ? "Select account"
                                        : controller.accountValue,
                                    fontSize: 12,
                                    textColor: AppColor.black,
                                  ),
                                  icon: const Icon(
                                      Icons.keyboard_arrow_down,
                                      color: AppColor.blueColor,
                                      size: 25),
                                  items: controller.listAccount
                                      .map(
                                          (Accounts? fromAccountItems) {
                                        return DropdownMenuItem<Accounts>(
                                            value: fromAccountItems,
                                            child: Text(fromAccountItems!
                                                .folioNumber!)
                                        );
                                      }).toList(),
                                  onChanged: (Accounts? value) async {
                                    controller.accountValue =
                                    value!.folioNumber!;
                                    controller.onVpsLoadExistingSchemaData();
                                    controller.update();
                                  },
                                ),
                              ),
                            ],
                          ),
                          space,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const RestInvestTitle(
                                text: "Fund Name:*",
                                textColor: AppColor.black,fontSize: 10,
                                fontWeight: FontWeight.w900,
                              ),
                              Container(
                                // margin: EdgeInsets.all(10.0),
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 5.0),
                                height: 35,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: AppColor.whiteColor,
                                    border: Border.all(
                                        width: 1,
                                        color: AppColor.black)),
                                child: controller.isLoading ? const SizedBox() :DropdownButton<PensionFundList>(
                                  isExpanded: true,
                                  underline: Container(
                                    color: AppColor.whiteColor,
                                  ),

                                  borderRadius:
                                  BorderRadius.circular(6),
                                  // value: _.dropdownvalue,
                                  hint: RestInvestTitle(
                                    text: controller.pensionFundName == null ||
                                        controller.pensionFundName == ""
                                        ? "Select Fund"
                                        : controller.pensionFundName,
                                    fontSize: 12,
                                    textColor: AppColor.black,
                                  ),
                                  icon: const Icon(
                                      Icons.keyboard_arrow_down,
                                      color: AppColor.blueColor,
                                      size: 25),
                                  items: controller.pensionFundList!
                                      .map(
                                          (PensionFundList? fromAccountItems) {
                                        return DropdownMenuItem<PensionFundList>(
                                            value: fromAccountItems,
                                            child: Text(fromAccountItems!
                                                .fundName!)
                                        );
                                      }).toList(),
                                  onChanged: (PensionFundList? value) async {
                                    controller.pensionFundName =
                                    value!.fundName!;
                                    controller.pensionFundCode =
                                    value!.fundCode!;
                                    controller.schemaName = controller.loadExistingSchemeData!.response!.schemes![0].param2;
                                    controller.schemaCode = controller.loadExistingSchemeData!.response!.schemes![0].param1;
                                    controller.preSchemaCode = controller.loadExistingSchemeData!.response!.schemes![0].param1;
                                    controller.onVpsLoadSchemeAllocations(controller.accountValue!,controller.pensionFundCode!,controller.schemaCode!,controller.preSchemaCode!);
                                    controller.update();
                                  },
                                ),
                              ),
                            ],
                          ),
                          space,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const RestInvestTitle(
                                text: "Application Date:*",fontSize: 10,
                                textColor: AppColor.black,
                                fontWeight: FontWeight.w900,
                              ),
                              SizedBox(
                                height: 35,
                                child: DateFormFieldContainer(
                                  isRounded: false,
                                  isTrue: true,
                                  enable: controller.isLoading == false ? true : false,
                                  text: '',
                                  mode: DateTimeFieldPickerMode.date,
                                  dateFormatTrue: true,
                                  initialValue: DateTime.now(),
                                  onDateSelected: (value) {
                                    controller.date = value;
                                    controller.update();
                                  },
                                ),
                              ),


                            ],
                          ),
                          space,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const RestInvestTitle(
                                text: "Scheme:*",
                                textColor: AppColor.black,fontSize: 10,
                                fontWeight: FontWeight.w900,
                              ),
                              Container(
                                // margin: EdgeInsets.all(10.0),
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 5.0),
                                height: 35,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: AppColor.whiteColor,
                                    border: Border.all(
                                        width: 1,
                                        color: AppColor.black)),
                                child: controller.isLoading ? const SizedBox() :DropdownButton<Schemes>(
                                  isExpanded: true,
                                  underline: Container(
                                    color: AppColor.whiteColor,
                                  ),

                                  borderRadius:
                                  BorderRadius.circular(6),
                                  // value: _.dropdownvalue,
                                  hint: RestInvestTitle(
                                    text: controller.schemaName == null ||
                                        controller.schemaName == ""
                                        ? "Select Schema"
                                        : controller.schemaName,
                                    fontSize: 12,
                                    textColor: AppColor.black,
                                  ),
                                  icon: const Icon(
                                      Icons.keyboard_arrow_down,
                                      color: AppColor.blueColor,
                                      size: 25),
                                  items: controller.loadExistingSchemeData!.response!.schemes!
                                      .map(
                                          (Schemes? fromAccountItems) {
                                        return DropdownMenuItem<Schemes>(
                                            value: fromAccountItems,
                                            child: Text(fromAccountItems!
                                                .param2!)
                                        );
                                      }).toList(),
                                  onChanged: (Schemes? value) async {

                                    controller.preSchemaCode = controller.schemaCode;
                                    controller.schemaName = value!.param2!;
                                    controller.schemaCode = value!.param1!;
                                    controller.onVpsLoadSchemeAllocations(controller.accountValue!,controller.pensionFundCode!,controller.schemaCode!,controller.preSchemaCode!);
                                    controller.update();
                                  },
                                ),
                              ),
                            ],
                          ),
                          space,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const RestInvestTitle(
                                text: "Sub-Fund Allocation:*",
                                fontSize: 14,
                                textColor: AppColor.black,
                                fontWeight: FontWeight.w900,
                              ),
                              space,
                              Container(
                                width: Get.width,
                                color: AppColor.greyColor.withOpacity(0.3),
                                // height: MediaQuery.of(context).size.height / 1.8,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 6,right: 6,bottom: 6),
                                  child: Column( crossAxisAlignment: CrossAxisAlignment.start,children: [
                                    const SizedBox(height: 10,),
                                    const RestInvestTitle(
                                      text: "Fund Name:*",
                                      fontSize: 12,
                                      textColor: AppColor.black,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    controller.isLoading || controller.loadSchemeAllocations!.response!.pensionSubfunds!.isEmpty ? const SizedBox():
                                        ListView.builder(
                                          shrinkWrap: true,
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemCount: controller.loadSchemeAllocations!.response!.pensionSubfunds!.length,
                                            itemBuilder: (context, index){
                                            controller.textControllerList.add(TextEditingController());
                                            return listItem(controller.loadSchemeAllocations!.response!.pensionSubfunds![index],
                                                controller.loadSchemeAllocations!.response!.editableAllocationPercentage!,
                                                controller,index);
                                            }
                                        )
                                  ],),
                                ),
                              ),
                              space,
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const RestInvestTitle(
                                          text: 'Enter Your 4 Digit Pin:*',
                                          textColor: AppColor.black,fontSize: 10,
                                          fontWeight: FontWeight.w900,
                                        ),
                                        CustomTextFormField(color: AppColor.dimblack,
                                          enable: controller.isLoading ? false : true,
                                          controller: controller.picCodeController,
                                          // textInputType: TextInputType.emailAddress,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const RestInvestTitle(
                                          text: "Don't have a Financial Pin:*",fontSize: 10,
                                          textColor: AppColor.black,
                                          fontWeight: FontWeight.w900,
                                        ),
                                        SizedBox(
                                            height: 35,
                                            child: CustomRoundButton(onPress: (){
                                              controller.isLoading ? printInfo(info: 'isLoading'):
                                                  controller.onVpsGeneratePinCode(context);
                                            },text: "Click here to Generate",textSize: 14,buttonColor: AppColor.blueColor,isRound: false,)
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              space,
                              const RestInvestTitle(
                                text: "Note",
                                textColor: AppColor.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w900,
                              ),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 25,
                                    width: 25,
                                    child: Checkbox(
                                        checkColor: AppColor.whiteColor,
                                        fillColor: MaterialStateColor.resolveWith(
                                                (states) => AppColor.blueColor),
                                        value: controller.isChecked,
                                        onChanged: (bool? val) {
                                          if(controller.isChecked){
                                            controller.isChecked = false;
                                          }else{
                                            controller.isChecked = true;
                                          }
                                          printInfo(info: controller.isChecked.toString());
                                          controller.update();
                                        }),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: RichText(
                                        text: const TextSpan(
                                            text:
                                            'I have read and understood the guidelines as stated in the',
                                            style: TextStyle(
                                              color: AppColor.black,
                                              fontSize: 10,
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: ' Offering Document',
                                                  style: TextStyle(
                                                      color: AppColor.blueColor,
                                                      fontSize: 10,
                                                      decoration:
                                                      TextDecoration.underline)),
                                              TextSpan(
                                                  text: ' /',
                                                  style: TextStyle(
                                                    color: AppColor.black,
                                                    fontSize: 10,
                                                  )),
                                              TextSpan(
                                                  text: ' Trust Deed',
                                                  style: TextStyle(
                                                      color: AppColor.blueColor,
                                                      fontSize: 10,
                                                      decoration:
                                                      TextDecoration.underline)),
                                              TextSpan(
                                                  text: ' &',
                                                  style: TextStyle(
                                                    color: AppColor.black,
                                                    fontSize: 10,
                                                  )),
                                              TextSpan(
                                                  text: ' Fund Manager Reports',
                                                  style: TextStyle(
                                                      color: AppColor.blueColor,
                                                      fontSize: 10,
                                                      decoration:
                                                      TextDecoration.underline)),
                                              TextSpan(
                                                  text:
                                                  ' of the fund and risk involved.',
                                                  style: TextStyle(
                                                    color: AppColor.black,
                                                    fontSize: 10,
                                                  )),
                                              TextSpan(
                                                  text: '\nI confirm acceptance of',
                                                  style: TextStyle(
                                                    color: AppColor.black,
                                                    fontSize: 10,
                                                  )),
                                              TextSpan(
                                                  text:
                                                  ' Term & Condition, Notes, Disclaimers',
                                                  style: TextStyle(
                                                      color: AppColor.blueColor,
                                                      fontSize: 10,
                                                      decoration:
                                                      TextDecoration.underline)),
                                              TextSpan(
                                                  text:
                                                  ' and all charges related to transaction.',
                                                  style: TextStyle(
                                                    color: AppColor.black,
                                                    fontSize: 10,
                                                  )),
                                            ])),
                                  ),
                                ],
                              ),
                              space,
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomRoundButton(
                                      isRound: false,
                                      text: "Submit",
                                      width: 120,
                                      height: 40,
                                      buttonColor:
                                      AppColor.blueColor,
                                      textColor: AppColor.whiteColor,
                                      onPress: () {
                                        // controller.onSaveChangeScheme();
                                        controller.onSubmit(context);
                                        // Get.back();
                                      }),
                                  CustomRoundButton(
                                      isRound: false,
                                      text: "Reset",
                                      width: 120,
                                      height: 40,
                                      buttonColor: AppColor.blueColor,
                                      textColor: AppColor.whiteColor,
                                      onPress: () {
                                        // Get.toNamed(AppRoute.accountStatement);
                                        controller.onReset();
                                      }),

                                ],
                              ),
                            ],
                          ),
                        ]),
                    controller.isLoading
                        ? const Center(
                      child: DialogBox(),
                    )
                        : controller.noInternet
                        ? Positioned(
                      bottom: 0,
                      child: Container(
                        height: 180,
                        width: Get.width,
                        color: Colors.white,
                        child: NoInternetWgt(
                          onTryAgain: (){
                            controller.noInternet = false;
                            controller.update();
                          },
                        ),
                      ),
                    )
                        : const SizedBox()
                  ],
                ),
              ));
        });
  }
}



Widget listItem(pension.PensionSubFunds pensionSubFunds,bool edit,ChangeSchemeScreenController controller,int index){
  controller.textControllerList[index].text = pensionSubFunds.percentage! == '0' ? '' : pensionSubFunds.percentage!;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      RestInvestTitle(
        text: pensionSubFunds.fundName,
        fontSize: 12,
        textColor: AppColor.black,
        fontWeight: FontWeight.w900,
      ),
      const SizedBox(height: 3,),
      Row(children: [
        Expanded(
            child: EmptyRowContainer(
              // fontWeight: FontWeight.w900,
              fontsize: 9,
              hintColor: AppColor.dimblack,
              hint: edit == true ? '0' : pensionSubFunds.minPercentage.toString(),
              text: "Minimum %",
              fontWeight: FontWeight.w900,
              textColor: AppColor.black,
            )),
        const SizedBox(
          width: 6,
        ),
        Expanded(
            child: EmptyRowContainer(
              // fontWeight: FontWeight.w900,
              fontsize: 9,
              hintColor: AppColor.dimblack,
              hint: edit == true ? '100' :pensionSubFunds.maxPercentage.toString(),
              text: "Maximum %",
              fontWeight: FontWeight.w900,
              textColor: AppColor.black,
            )),
        const SizedBox(
          width: 6,
        ),
        Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const RestInvestTitle(
                    text: "Percentage %",
                    fontSize: 9,
                    textColor: AppColor.black,
                    fontWeight: FontWeight.w900,
                  ),
                  CustomTextFormField(
                    controller: controller.textControllerList[index],
                    // hint: edit == true ? pensionSubFunds.percentage :pensionSubFunds.percentage,
                      enable: edit == false ? false : true,
                      hintColor: edit == false ? AppColor.dimblack : AppColor.black,
                      textInputType: TextInputType.number,
                    length: 3,
                    onChange: (value){
                      if(value.isNotEmpty){
                        double total = 0;
                        int i = 0;
                        controller.loadSchemeAllocations!.response!.pensionSubfunds!.forEach((element) {
                          total = total + double.parse(controller.textControllerList[i].value.text == '' ? '0': controller.textControllerList[i].value.text);
                          i++;
                        });
                        print('TOTAL'+total.toString());
                        if(total > 100){
                          double rem = total - double.parse(controller.textControllerList[index].text.toString());
                          print('REMEN'+rem.toString());
                          controller.textControllerList[index].text = (100 - rem).toInt().toString();
                        }
                      }

                      controller.loadSchemeAllocations!.response!.pensionSubfunds![index].percentage =
                      controller.textControllerList[index].text == '' ? '0' : controller.textControllerList[index].text;
                    },
                  ),
                ],
              ),
            )),

      ]),
    ],
  );
}

