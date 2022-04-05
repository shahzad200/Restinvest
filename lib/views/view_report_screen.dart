import 'package:date_field/date_field.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/view_report_screen_controller.dart';
import '../data/models/login_model.dart';
import '../utils/constants.dart' as cons;
import '../widgets/button.dart';
import '../widgets/constant_widget.dart';
import '../widgets/datefield.dart';
import '../widgets/no_internet.dart';

import '../utils/colors.dart';

import '../widgets/drawer.dart';

class ViewReportsScreen extends StatelessWidget {
  const ViewReportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewReportsScreenController>(
        init: ViewReportsScreenController(),
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const LogoNit(height: 60,width: 60,),
              backgroundColor: AppColor.whiteColor,
              leading: InkWell(
                onTap: () {
                  _.scaffoldKey.currentState!.openDrawer();
                },
                child: const Icon(
                  Icons.menu,
                  color: AppColor.blueColor,
                ),
              ),
            ),
            drawer: const CustomDrawer(),
            key: _.scaffoldKey,
            body: Stack(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const RestInvestTitle(
                                    text: 'Start Date', textColor: AppColor.black),
                                SizedBox(
                                  height: 35,
                                  child:
                                  DateFormFieldContainer(isRounded:false,isTrue:false,
                                    text: 'Selected Date',
                                    mode: DateTimeFieldPickerMode.date,
                                    dateFormatTrue: true,
                                    enable: _.isLoading || _.noInternet ? false : true,
                                    initialValue: DateTime.now(),
                                    onDateSelected: (value){
                                      _.startDate = _.dateTime(value);
                                    },
                                  ),
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
                                    text: 'End Date', textColor: AppColor.black),
                                SizedBox(
                                  height: 35,
                                  child: DateFormFieldContainer(isRounded:false,isTrue:false,
                                    text: 'Selected Date',
                                    mode: DateTimeFieldPickerMode.date,
                                    dateFormatTrue: true,
                                    enable: _.isLoading || _.noInternet ? false : true,
                                    initialValue: DateTime.now(),
                                    onDateSelected: (value){
                                      _.endDate = _.dateTime(value);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const RestInvestTitle(
                                  text: "Account No.",
                                  textColor: AppColor.black,
                                ),
                                Container(
                                  // margin: EdgeInsets.all(10.0),
                                  padding:
                                  const EdgeInsets.only(left: 10.0, right: 5.0),
                                  height: 35,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: AppColor.whiteColor,
                                      border: Border.all(
                                          width: 1, color: AppColor.dimblack)),
                                  child: Center(
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
                                      hint: RestInvestTitle(
                                        text: _.selectedAccount == null || _.selectedAccount == ""
                                            ? "Select Account"
                                            : _.selectedAccount,
                                        textColor: AppColor.black,
                                      ),
                                      items: cons.Constant.loginModel!.response!.accounts!.map<DropdownMenuItem<Accounts>>((Accounts? value){
                                        return DropdownMenuItem<Accounts>(
                                          value: value,
                                          child: Text(value!.folioNumber!),
                                        );
                                      }).toList(),
                                      onChanged: _.isLoading || _.noInternet ? null : (Accounts? value) {
                                        _.selectedAccount = value!.folioNumber!;
                                        _.update();
                                      },
                                    ),
                                  ),
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
                                  text: "Fund Name",
                                  textColor: AppColor.black,
                                ),
                                Container(
                                  // margin: EdgeInsets.all(10.0),
                                  padding:
                                  const EdgeInsets.only(left: 10.0, right: 5.0),
                                  height: 35,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: AppColor.whiteColor,
                                      border: Border.all(
                                          width: 1, color: AppColor.dimblack)),
                                  child: const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('All')),
                                ),
                              ],
                            ),
                          ),
                          // Expanded(
                          //     child: DropDownContainerIcon(
                          //       text1: "All",
                          //       fontsize: 14,
                          //       fontWeight: FontWeight.bold,
                          //       voidcallback: () {
                          //         '';
                          //       },
                          //       text: "Fund Name",
                          //       textColor: AppColor.black,
                          //     )
                          // )
                        ],
                      ),
                      const SizedBox(height: 25),
                      SizedBox(
                        height: 40,
                        width: 200,
                        child: RestInvestButton(
                          text: 'VIEW REPORT',
                          buttonColor: AppColor.blueColor,
                          textColor: AppColor.whiteColor,
                          onPress: (){
                            _.isLoading || _.noInternet ? null :
                            _.onViewReport();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                _.isLoading
                    ? const Center(
                  child: DialogBox(),
                )
                    : _.noInternet
                    ? Align(
                  alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Container(
                          height: 180,
                          width: Get.width,
                          color: Colors.white,
                          child: NoInternetWgt(
                            onTryAgain: (){
                              _.noInternet = false;
                              _.update();
                            },
                          ),
                        ),
                      ),
                    )
                    : const SizedBox()
              ],
            ),
          );
        });
  }
}
