import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investintrust/data/models/login_model.dart';
import 'package:investintrust/utils/constants.dart';
import 'package:investintrust/utils/lists.dart';

import '../controller/f2f_transfer_screen_controller.dart';
import '/controller/f2f_transfer_screen_controller.dart';

import '../utils/colors.dart';
import '../widgets/button.dart';
import '../widgets/constant_widget.dart';

import '../widgets/drawer.dart';
import '../widgets/textformfiled.dart';

class F2FTransferScreen extends StatelessWidget {
  const F2FTransferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<F2FTransferScreenController>(
        init: F2FTransferScreenController(),
        builder: (_) {
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
                              textColor: AppColor.dimblack,
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
                                    text: _.accountValue == null ||
                                            _.accountValue == ""
                                        ? ""
                                        : _.accountValue,
                                    textColor: AppColor.black,
                                  ),
                                  icon: const Icon(Icons.keyboard_arrow_down,
                                      color: AppColor.blueColor, size: 35),
                                  items: Constant
                                      .loginModel!.response!.accounts!
                                      .map<DropdownMenuItem<Accounts>>(
                                          (Accounts? value) {
                                    return DropdownMenuItem<Accounts>(
                                      value: value,
                                      child: Text(value!.folioNumber!),
                                    );
                                  }).toList(),
                                  onChanged: (Accounts? value) {
                                    _.accountValue = value!.folioNumber!;
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
                              textColor: AppColor.dimblack,
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
                                    text:
                                        _.fundValue == null || _.fundValue == ""
                                            ? ""
                                            : _.fundValue,
                                    textColor: AppColor.black,
                                  ),
                                  icon: const Icon(Icons.keyboard_arrow_down,
                                      color: AppColor.blueColor, size: 35),
                                  items: Constant
                                      .loginModel!
                                      .response!
                                      .accounts![_.findIndex()]
                                      .userFundBalances!
                                      .map<DropdownMenuItem<UserFundBalances>>(
                                          (UserFundBalances? value) {
                                    return DropdownMenuItem<UserFundBalances>(
                                      value: value,
                                      child: Text(value!.fundShort!),
                                    );
                                  }).toList(),
                                  onChanged: (UserFundBalances? value) {
                                    _.fundValue = value!.fundShort!;
                                    _.fundCode = value.fundCode!;
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
                      //   textColor: AppColor.dimblack,
                      //   text: "From Account",
                      // )),
                      // const SizedBox(
                      //   width: 6,
                      // ),
                      // Expanded(
                      //     child: DropDownContainerIcon(
                      //   voidcallback: () {
                      //     _.displayDialog(
                      //         context,
                      //         Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             InkWell(
                      //               onTap: () {},
                      //               child: const RestInvestTitle(
                      //                 text: "NITIEF",
                      //               ),
                      //             ),
                      //             const SizedBox(height: 20),
                      //             const CustomDivider(),
                      //           ],
                      //         ));
                      //   },
                      //   textColor: AppColor.dimblack,
                      //   text: "Transfer From Fund",
                      // ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: EmptyRowContainer(
                        fontWeight: FontWeight.w800,
                        fontsize: 14,
                        hintColor: AppColor.black,
                        hint: "0",
                        text: _.electronicUnit() ?? '',
                        textColor: AppColor.dimblack,
                      )),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                          child: EmptyRowContainer(
                        fontWeight: FontWeight.w800,
                        fontsize: 14,
                        hintColor: AppColor.black,
                        hint: "0.00",
                        text: _.fundAmount() ?? '',
                        textColor: AppColor.dimblack,
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const RestInvestTitle(
                              text: "Account No.",
                              textColor: AppColor.dimblack,
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
                                    text: _.toaccountvalue == null ||
                                            _.toaccountvalue == ""
                                        ? "81656"
                                        : _.toaccountvalue,
                                    textColor: AppColor.black,
                                  ),
                                  icon: const Icon(Icons.keyboard_arrow_down,
                                      color: AppColor.blueColor, size: 35),
                                  items: toAccountItems
                                      .map((String? toAccountItems) {
                                    return DropdownMenuItem<String>(
                                        value: toAccountItems,
                                        child: Text(toAccountItems!));
                                  }).toList(),
                                  onChanged: (String? value) {
                                    _.toaccountvalue = value!;
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
                              textColor: AppColor.dimblack,
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
                                    text:
                                        _.fundvalue == null || _.fundvalue == ""
                                            ? "NIUT"
                                            : _.fundvalue,
                                    textColor: AppColor.black,
                                  ),
                                  icon: const Icon(Icons.keyboard_arrow_down,
                                      color: AppColor.blueColor, size: 35),
                                  items: transferFundItems
                                      .map((String? transferFundItems) {
                                    return DropdownMenuItem<String>(
                                        value: transferFundItems,
                                        child: Text(transferFundItems!));
                                  }).toList(),
                                  onChanged: (String? value) {
                                    _.fundvalue = value!;
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
                      //         const AccountDropDownContainer(
                      //           titleText: "81656",
                      //           hintText: "69558",
                      //         ));
                      //   },
                      //   textColor: AppColor.dimblack,
                      //   text: "To Account",
                      // )),
                      // const SizedBox(
                      //   width: 6,
                      // ),
                      // Expanded(
                      //     child: DropDownContainerIcon(
                      //   voidcallback: () {
                      //     _.displayDialog(
                      //         context,
                      //         const FundTransferDroDownContainer(
                      //           niutText: "NIUT",
                      //           nitgbText: "NITGBF",
                      //           nitifText: "NITIF",
                      //           nitmmfText: "NIT-MMF",
                      //           nitiifText: "NIT-IIF",
                      //           nitaafText: "NIT AAF",
                      //           nitimmffText: "NIT IMMF",
                      //         ));
                      //   },
                      //   textColor: AppColor.dimblack,
                      //   text: "Transfer to Fund",
                      // ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: CustomRowButton(
                              text: "Units",
                              textColor: AppColor.black,
                              textSize: 14,
                              onPress: () {
                                // _.investTrust(0);
                              },
                              buttonColor: _.investButton
                                  ? AppColor.blueColor
                                  : AppColor.whiteColor)),
                      Expanded(
                          child: CustomRowButton(
                        text: "Percentages",
                        textColor: AppColor.black,
                        textSize: 14,
                        onPress: () {
                          // _.investTrust(1);
                        },
                        buttonColor: _.portfolioButton
                            ? AppColor.blueColor
                            : AppColor.whiteColor,
                      )),
                      Expanded(
                          child: CustomRowButton(
                        text: "All Units",
                        textColor: AppColor.black,
                        textSize: 14,
                        onPress: () {
                          // _.investTrust(2);
                        },
                        buttonColor: _.buttonclick3
                            ? AppColor.blueColor
                            : AppColor.whiteColor,
                      )),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          isRounded: true,
                          hint: "Unit Balance",
                          textInputType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                          child: SizedBox(
                        height: 35,
                        child: RoundContainer(
                          text: "Approx. Amount",
                          textColor: AppColor.blueColor,
                          isSquare: true,
                          voidcallback: () {},
                        ),
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 35,
                          child: CustomTextFormField(
                            isRounded: true,
                            hint: "Pin Code",
                            textInputType: TextInputType.emailAddress,
                          ),
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
                  const SizedBox(
                    height: 10,
                  ),
                  ContainerCheckBoxText(
                    isChecked: false,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
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
