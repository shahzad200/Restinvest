
import 'package:date_field/date_field.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nit/widgets/button.dart';
import '../../controller/vps/vps_account_statement_screen_controller.dart';
import '../../data/models/login_model.dart';
import '../../utils/colors.dart';
import '../../widgets/constant_widget.dart';
import '../../widgets/datefield.dart';
import '../../widgets/drawer.dart';
import '../../widgets/no_internet.dart';



class VpsAccountStatementScreen extends StatelessWidget {
  const VpsAccountStatementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VpsAccountStatementScreenController>(
        init: VpsAccountStatementScreenController(),
        builder: (_) {
          var space = const SizedBox(
            height: 10,
          );
          return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: const LogoNit(height: 60, width: 60,),
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
                    ListView(
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
                                text: "VPS ACCOUNT STATEMENT",
                                textColor: AppColor.black,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const RestInvestTitle(
                                          text: 'From Date:*',fontSize: 10,
                                          textColor: AppColor.black,
                                          fontWeight: FontWeight.w900,
                                        ),
                                        SizedBox(
                                          height: 35,
                                          child: DateFormFieldContainer(
                                            isRounded: false,
                                            isTrue: true,
                                            text: '',
                                            mode: DateTimeFieldPickerMode.date,
                                            dateFormatTrue: true,
                                            enable: _.isLoading || _.noInternet ? false : true,
                                            initialValue: DateTime.now(),
                                            onDateSelected: (value) {
                                              _.fromDate = _.dateTime(value);
                                              _.update();
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
                                          text: 'To Date:*',fontSize: 10,
                                          textColor: AppColor.black,
                                          fontWeight: FontWeight.w900,
                                        ),
                                        SizedBox(
                                          height: 35,
                                          child: DateFormFieldContainer(
                                            isRounded: false,
                                            isTrue: true,
                                            text: '',
                                            mode: DateTimeFieldPickerMode.date,
                                            dateFormatTrue: true,
                                            enable: _.isLoading || _.noInternet ? false : true,
                                            initialValue: DateTime.now(),
                                            onDateSelected: (value) {
                                              _.toDate = _.dateTime(value);
                                              _.update();
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              space,
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const RestInvestTitle(
                                          text: "Pension Fund:*",
                                          fontSize: 10,
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
                                          child: _.isLoading
                                              ? const SizedBox()
                                              : DropdownButton<PensionFundList>(
                                            isExpanded: true,
                                            underline: Container(
                                              color: AppColor.whiteColor,
                                            ),

                                            borderRadius:
                                            BorderRadius.circular(6),
                                            // value: _.dropdownvalue,
                                            hint: RestInvestTitle(
                                              text: _.pensionFundValue ==
                                                  null ||
                                                  _
                                                      .pensionFundValue ==
                                                      ""
                                                  ? "Select account"
                                                  : _.pensionFundValue,
                                              fontSize: 12,
                                              textColor: AppColor.black,
                                            ),
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down,
                                                color: AppColor.blueColor,
                                                size: 25),
                                            items: _.pensionList
                                                .map((PensionFundList?
                                            fromAccountItems) {
                                              return DropdownMenuItem<
                                                  PensionFundList>(
                                                  value: fromAccountItems,
                                                  child: Text(
                                                      fromAccountItems!
                                                          .fundName!));
                                            }).toList(),
                                            onChanged:
                                                (PensionFundList? value) async {
                                                  _.pensionFundValue =
                                                  value!.fundName!;
                                              _.pensionFundCode =
                                              value!.fundCode!;
                                              _.update();
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
                                          text: "Account Type:*",
                                          fontSize: 10,
                                          textColor: AppColor.black,
                                          fontWeight: FontWeight.w900,
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
                                ],
                              ),
                              space,
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const RestInvestTitle(
                                          text: "Account Number:*",
                                          fontSize: 10,
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
                                          child: _.isLoading
                                              ? const SizedBox()
                                              : DropdownButton<Accounts>(
                                            isExpanded: true,
                                            underline: Container(
                                              color: AppColor.whiteColor,
                                            ),

                                            borderRadius:
                                            BorderRadius.circular(6),
                                            // value: _.dropdownvalue,
                                            hint: RestInvestTitle(
                                              text: _.accountValue ==
                                                  null ||
                                                  _
                                                      .accountValue ==
                                                      ""
                                                  ? "Select account"
                                                  : _.accountValue,
                                              fontSize: 12,
                                              textColor: AppColor.black,
                                            ),
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down,
                                                color: AppColor.blueColor,
                                                size: 25),
                                            items: _.listAccount
                                                .map((Accounts?
                                            fromAccountItems) {
                                              return DropdownMenuItem<
                                                  Accounts>(
                                                  value: fromAccountItems,
                                                  child: Text(
                                                      fromAccountItems!
                                                          .folioNumber!));
                                            }).toList(),
                                            onChanged:
                                                (Accounts? value) async {
                                              _.accountValue =
                                              value!.folioNumber!;
                                              _.pensionList = _.listAccount[_.getIndex(value!.folioNumber!)].pensionFundList!;
                                              _.update();
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                              space,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  CustomRoundButton(
                                      isRound: false,
                                      text: "View Reports",
                                      width: 120,
                                      height: 40,
                                      buttonColor: AppColor.blueColor,
                                      textColor: AppColor.whiteColor,
                                      onPress: () {
                                        _.onVpsAccountStatement();
                                      }),
                                ],
                              ),


                            ],
                          ),
                        ]),
                    _.isLoading
                        ? const Center(
                      child: DialogBox(),
                    )
                        : _.noInternet
                        ? Positioned(
                      bottom: 0,
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
                    )
                        : const SizedBox()
                  ],
                ),
              ));
        });
  }
}
