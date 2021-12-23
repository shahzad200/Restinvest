import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investintrust/utils/lists.dart';

import '../widgets/datefield.dart';
import '../controller/purchases_screen_controller.dart';

import '../utils/colors.dart';
import '../widgets/button.dart';
import '../widgets/constant_widget.dart';

import '../widgets/drawer.dart';
import '../widgets/textformfiled.dart';

class PurchasesScreen extends StatelessWidget {
  const PurchasesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PurchasesScreenController>(
        init: PurchasesScreenController(),
        builder: (_) {
          var space = const SizedBox(
            height: 15,
          );
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
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
            body: SingleChildScrollView(
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
                              text: "Account No.",
                              textColor: AppColor.blueColor,
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
                                  underline: Container(
                                    color: AppColor.whiteColor,
                                  ),

                                  borderRadius: BorderRadius.circular(6),
                                  // value: _.dropdownvalue,
                                  hint: RestInvestTitle(
                                    text: _.amountvalue == null ||
                                            _.amountvalue == ""
                                        ? "Account No."
                                        : _.amountvalue,
                                    textColor: AppColor.black,
                                  ),
                                  icon: const Icon(Icons.keyboard_arrow_down,
                                      color: AppColor.blueColor, size: 30),
                                  items: fromAccountItems
                                      .map((String? fromAccountItems) {
                                    return DropdownMenuItem<String>(
                                        value: fromAccountItems,
                                        child: Text(fromAccountItems!));
                                  }).toList(),
                                  onChanged: (String? value) {
                                    _.amountvalue = value!;
                                    _.update();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Expanded(
                      //     child: DropDownContainerIcon(
                      //   voidcallback: () {
                      //     _.displayDialog(
                      //         context,
                      //         const DropDownAccountValueButton(
                      //           accountText: "Account No.",
                      //           hintText: "81656",
                      //           titleText: "69558",
                      //         ));
                      //   },
                      //   textColor: AppColor.blueColor,
                      //   text: "Amount No.",
                      // )),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const RestInvestTitle(
                              text: "Fund Name",
                              textColor: AppColor.blueColor,
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
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  underline: Container(
                                    color: AppColor.whiteColor,
                                  ),

                                  borderRadius: BorderRadius.circular(6),
                                  // value: _.dropdownvalue,
                                  hint: RestInvestTitle(
                                    text: _.dropdownvalue == null ||
                                            _.dropdownvalue == ""
                                        ? "Fund Name"
                                        : _.dropdownvalue,
                                    textColor: AppColor.black,
                                  ),
                                  icon: const Icon(Icons.keyboard_arrow_down,
                                      color: AppColor.blueColor, size: 35),
                                  items: fundNameItems
                                      .map((String? fundNameItems) {
                                    return DropdownMenuItem<String>(
                                        value: fundNameItems,
                                        child: Text(fundNameItems!));
                                  }).toList(),
                                  onChanged: (String? value) {
                                    _.dropdownvalue = value!;
                                    _.update();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Expanded(
                      //   child: DropDownContainerIcon(
                      //     voidcallback: () {
                      //       _.displayDialog(
                      //           context,
                      //           DropDownSelectValueContainer(
                      //             onTap: () {},
                      //             fundText: "Fund Name",
                      //             niText: "NIUT",
                      //             nitText: "NITGBF",
                      //             nitfText: "NITIF",
                      //             niefText: "NITEF",
                      //             nimmText: "NIT-MMF",
                      //             nifiText: "NIT-II",
                      //             niaaText: "NIT-AAF",
                      //             nitmfText: "NIT IMMF",
                      //             space: space,
                      //           ));
                      //     },
                      //     textColor: AppColor.blueColor,
                      //     text: 'Fund Name.',
                      //   ),
                      // ),
                    ],
                  ),
                  space,
                  Row(
                    children: const [
                      Expanded(
                          child: EmptyRowContainer(
                        fontWeight: FontWeight.w800,
                        fontsize: 14,
                        hintColor: AppColor.black,
                        hint: "BANK AL HABIB LIMITED",
                        text: "Fund Bank Deposit",
                        textColor: AppColor.blueColor,
                      )),
                      SizedBox(
                        width: 6,
                      ),
                      Expanded(
                          child: EmptyRowContainer(
                        fontWeight: FontWeight.w800,
                        fontsize: 14,
                        hintColor: AppColor.black,
                        hint: "0081-17426901-1",
                        text: "Fund Account Deposit",
                        textColor: AppColor.blueColor,
                      ))
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
                              text: "Payment Mode",
                              textColor: AppColor.blueColor,
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
                                  underline: Container(
                                    color: AppColor.whiteColor,
                                  ),

                                  borderRadius: BorderRadius.circular(6),
                                  // value: _.dropdownvalue,
                                  hint: RestInvestTitle(
                                    text: _.paymentvalue == null ||
                                            _.paymentvalue == ""
                                        ? "Cheque"
                                        : _.paymentvalue,
                                    textColor: AppColor.black,
                                  ),
                                  icon: const Icon(Icons.keyboard_arrow_down,
                                      color: AppColor.blueColor, size: 35),
                                  items: paymentModeItems
                                      .map((String? paymentModeItems) {
                                    return DropdownMenuItem<String>(
                                        value: paymentModeItems,
                                        child: Text(paymentModeItems!));
                                  }).toList(),
                                  onChanged: (String? value) {
                                    _.paymentvalue = value!;
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
                                text: 'Amount', textColor: AppColor.blueColor),
                            CustomTextFormField(
                              isRounded: true,
                              hint: "",
                              //  textInputType: TextInputType.emailAddress,
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
                                text: 'Bank Name',
                                textColor: AppColor.blueColor),
                            CustomTextFormField(
                              isRounded: true,
                              hint: "",
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
                                text: 'Bank Account No.',
                                textColor: AppColor.blueColor),
                            CustomTextFormField(
                              isRounded: true,
                              hint: "",
                              // textInputType: TextInputType.emailAddress,
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
                                text: 'Check/Instrument No.',
                                textColor: AppColor.blueColor),
                            CustomTextFormField(
                              color: AppColor.dimblack,
                              isRounded: true,
                              hint: "",
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
                                text: 'Check/Instrument Date.',
                                textColor: AppColor.blueColor),
                            SizedBox(
                              height: 35,
                              child: DateFormFieldContainer(
                                text: '',
                                mode: DateTimeFieldPickerMode.date,
                                dateFormatTrue: true,
                                initialValue: DateTime.now(),
                                onDateSelected: (value){

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
                        child: CustomTextFormField(
                          isRounded: true,
                          hint: "PIN CODE",
                          textInputType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                          child: SizedBox(
                        height: 35,
                        child: RestInvestButton(
                          isSquare: true,
                          onPress: () {},
                          text: "Generate Financial PIN",
                          buttonColor: AppColor.blueColor,
                          textColor: AppColor.whiteColor,
                          textSize: 16,
                        ),
                      ))
                    ],
                  ),
                  const SizedBox(height: 10),
                  ContainerCheckBoxText(
                    isChecked: false,
                  ),
                  space,
                  SizedBox(
                    height: 40,
                    child: RestInvestButton(
                      isSquare: true,
                      text: "Submit",
                      onPress: () {},
                      buttonColor: AppColor.blueColor,
                      textColor: AppColor.whiteColor,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
