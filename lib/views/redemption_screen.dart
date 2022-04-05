
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nit/widgets/no_internet.dart';
import '../data/models/login_model.dart';
import '../utils/constants.dart';
import '../widgets/custome_dialog.dart';
import '../widgets/transaction_dialog.dart' as trans;


import '../controller/redemption_screen_controller.dart';

import '../utils/colors.dart';
import '../widgets/button.dart';
import '../widgets/constant_widget.dart';

import '../widgets/drawer.dart';
import '../widgets/textformfiled.dart';

class RedemptionScreen extends StatelessWidget {
  const RedemptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RedemptionScreenController>(
        init: RedemptionScreenController(),
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
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Column(
                children: [
                 const Padding(
                    padding:  EdgeInsets.only(top: 0.0,bottom: 10),
                    child:  Align(
                      alignment: Alignment.topCenter,
                      child: RestInvestTitle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        text: "REDEMPTION",
                        textColor: AppColor.black,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const RestInvestTitle(
                              // fontWeight: FontWeight.w900,
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
                                      width: 1, color: AppColor.black)),
                              child: Center(
                                child: DropdownButton<Accounts>(
                                  isExpanded: true,
                                  underline: Container(
                                    color: AppColor.whiteColor,
                                  ),

                                  borderRadius: BorderRadius.circular(6),
                                  // value: _.dropdownvalue,
                                  hint: RestInvestTitle(
                                    text: _.accountvalue == null ||
                                            _.accountvalue == ""
                                        ? "Select account"
                                        : _.accountvalue,
                                    fontSize: 12,
                                    textColor: AppColor.black,
                                  ),
                                  icon: const Icon(Icons.keyboard_arrow_down,
                                      color: AppColor.blueColor, size: 25),
                                  items: _.listAccount
                                      .map((Accounts? fromAccountItems) {
                                    return DropdownMenuItem<Accounts>(
                                        value: fromAccountItems,
                                        child: Text(
                                            fromAccountItems!.folioNumber!));
                                  }).toList(),
                                  onChanged: (Accounts? value) async {
                                    _.accountvalue = value!.folioNumber!;
                                    _.fundNameListItems = [];
                                    value.userFundBalances!.forEach((element) {
                                      _.fundNameListItems.add(element);
                                    });
                                    _.fundNamevalue =
                                        _.fundNameListItems[0].fundShort!;
                                    _.fundNameCode =
                                    _.fundNameListItems[0].fundCode!;
                                    CustomDialog(context);
                                    _.loadFundsPlans = await _.api
                                        .onLoadFundsPlans(
                                            Constant.userId,
                                            value
                                                .userFundBalances![0].fundCode!,
                                            value.folioNumber!,
                                            "RED");
                                    Get.back();
                                    _.approxUnits = "";
                                    _.approxAmount = "";
                                    _.calUnitBalanceValue = 0.0;
                                    _.unitBalanceController.text = "";
                                    _.unitButton = true;
                                    _.percentageEnable = false;
                                    _.percentageButton = false;
                                    _.allUnitButton = false;
                                    _.unitBalanceController.clear();
                                    _.percentController.clear();
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
                              // fontWeight: FontWeight.w900,
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
                                      width: 1, color: AppColor.black)),
                              child: Center(
                                child: DropdownButton<UserFundBalances>(
                                  isExpanded: true,
                                  underline: Container(
                                    color: AppColor.whiteColor,
                                  ),

                                  borderRadius: BorderRadius.circular(6),

                                  hint: RestInvestTitle(
                                    text: _.fundNamevalue == null ||
                                            _.fundNamevalue == ""
                                        ? "Fund Name"
                                        : _.fundNamevalue,
                                    fontSize: 12,
                                    textColor: AppColor.black,
                                  ),
                                  icon: const Icon(Icons.keyboard_arrow_down,
                                      color: AppColor.blueColor, size: 25),
                                  items: _.fundNameListItems.map(
                                      (UserFundBalances? fundNameListItems) {
                                    return DropdownMenuItem<UserFundBalances>(
                                        value: fundNameListItems,
                                        child: Text(
                                            fundNameListItems!.fundShort!));
                                  }).toList(),
                                  onChanged: (UserFundBalances? value) async {
                                    _.fundNamevalue = value!.fundShort!;
                                    _.fundNameCode = value!.fundCode!;
                                    CustomDialog(context);
                                    _.loadFundsPlans = await _.api
                                        .onLoadFundsPlans(
                                            Constant.userId,
                                            value.fundCode!,
                                            _.accountvalue,
                                            "RED");
                                    Get.back();
                                    _.approxUnits = "";
                                    _.approxAmount = "";
                                    _.unitBalanceController.text = "";
                                    _.unitButton = true;
                                    _.percentageEnable = false;
                                    _.allUnitButton = false;
                                    _.percentageButton = false;
                                    _.unitBalanceController.clear();
                                    _.percentController.clear();
                                    _.calUnitBalanceValue = 0.0;
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
                      //   text: "Account No.",
                      //   textColor: AppColor.dimblack,
                      // )),
                      // const SizedBox(
                      //   width: 6,
                      // ),
                      // Expanded(
                      //     child: DropDownContainerIcon(
                      //   voidcallback: () {
                      //     _.displayDialog(
                      //         context,
                      //         const FromFundDropDownContainer(
                      //           fundText: "Fund Name",
                      //           nitText: "NITIEF",
                      //         ));
                      //   },
                      //   text: "Fund Name",
                      //   textColor: AppColor.dimblack,
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
                        // fontWeight: FontWeight.w900,
                        fontsize: 14,
                        hintColor: AppColor.black,
                        hint: "${_.electronicUnit()}",
                        text: "Electronic Units",
                        textColor: AppColor.black,
                      )),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                          child: EmptyRowContainer(
                        // fontWeight: FontWeight.w900,
                        fontsize: 14,
                        hintColor: AppColor.black,
                        hint: "${_.fundAmount()}",
                        text: "Amount",
                        textColor: AppColor.black,
                      )),
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
                              textColor: _.unitButton
                                  ? AppColor.whiteColor
                                  : AppColor.black,
                              textSize: 12,
                              onPress: () {
                                _.investTrust(0);
                              },
                              buttonColor: _.unitButton
                                  ? AppColor.blueColor
                                  : AppColor.whiteColor)),
                      Expanded(
                          child: CustomRowButton(
                        text: "Percentages",
                        textColor: _.percentageButton
                            ? AppColor.whiteColor
                            : AppColor.black,
                        textSize: 12,
                        onPress: () {
                          _.investTrust(1);
                        },
                        buttonColor: _.percentageButton
                            ? AppColor.blueColor
                            : AppColor.whiteColor,
                      )),
                      Expanded(
                          child: CustomRowButton(
                        text: "All Units",
                        textColor: _.allUnitButton
                            ? AppColor.whiteColor
                            : AppColor.black,
                        textSize: 12,
                        onPress: () {
                          _.investTrust(2);
                        },
                        buttonColor: _.allUnitButton
                            ? AppColor.blueColor
                            : AppColor.whiteColor,
                      )),
                      const SizedBox(),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _.unitButton
                      ? Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextFormField(
                                    controller: _.unitBalanceController,
                                    isRounded: true,
                                    hint: "Enter Units",
                                    hintColor:
                                        double.parse(_.electronicUnit()!) > 0
                                            ? AppColor.black
                                            : Colors.black,
                                    textInputType: TextInputType.number,
                                    enable:
                                        double.parse(_.electronicUnit()!) > 0
                                            ? true
                                            : false,
                                    onChange: (val) {
                                      print(val);
                                      if (val.isNotEmpty) {
                                        _.calUnitBalanceValue =
                                            _.calUnitBalance(val);
                                      } else {
                                        _.calUnitBalanceValue = null;
                                      }
                                      if(val==''){
                                        _.calculateUnits('0');
                                      }else {
                                        _.calculateUnits(val);
                                      }
                                      _.update();
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Expanded(
                                    child: SizedBox(
                                  height: 35,
                                  child: RoundContainer(
                                    text: _.calUnitBalanceValue == null ||
                                            _.calUnitBalanceValue == 0.0
                                        ? "Approx. Amount"
                                        : _.calUnitBalanceValue!
                                            .toStringAsFixed(2),
                                    textColor: AppColor.black,
                                    isSquare: true,
                                    voidcallback: () {},
                                  ),
                                ))
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        )
                      : const SizedBox(),
                  _.percentageButton
                      ? Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextFormField(
                                    isRounded: true,
                                    controller: _.percentController,
                                    enable:
                                        double.parse(_.electronicUnit()!) > 0
                                            ? true
                                            : false,
                                    hint: "Percentage",
                                    hintColor:
                                        double.parse(_.electronicUnit()!) > 0
                                            ? AppColor.black
                                            : Colors.black,
                                    textInputType:
                                        const TextInputType.numberWithOptions(),
                                    onChange: (value) {
                                      if(value==''){
                                        _.calculateUnits('0');
                                      }else {
                                        _.calculateUnits(value);
                                      }
                                      _.update();
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Expanded(
                                    child: SizedBox(
                                  height: 35,
                                  child: RoundContainer(
                                    text: _.approxAmount == null ||
                                            _.approxAmount == ""
                                        ? "Approx. Amount"
                                        : "${_.approxAmount}",
                                    textColor: AppColor.black,
                                    isSquare: true,
                                    voidcallback: () {},
                                  ),
                                ))
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 35,
                              child: RoundContainer(
                                text:
                                    _.approxUnits == null || _.approxUnits == ""
                                        ? "Approx.Units"
                                        : "${_.approxUnits}",
                                textColor: AppColor.blueColor,
                                isSquare: true,
                                voidcallback: () {},
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        )
                      : const SizedBox(),
                  _.allUnitButton
                      ? Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: SizedBox(
                                  height: 35,
                                  child: RoundContainer(
                                    text: "${_.unitBalanceController.text}",
                                    textColor: AppColor.black,
                                    isSquare: true,
                                    voidcallback: () {},
                                  ),
                                )),
                                const SizedBox(
                                  width: 6,
                                ),
                                Expanded(
                                    child: SizedBox(
                                  height: 35,
                                  child: RoundContainer(
                                    text: _.approxAmount == null ||
                                            _.approxAmount == ""
                                        ? "0.00"
                                        : "${_.approxAmount}",
                                    textColor: AppColor.black,
                                    isSquare: true,
                                    voidcallback: () {},
                                  ),
                                ))
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        )
                      : const SizedBox(),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 35,
                          child: CustomTextFormField(
                            isRounded: true,
                            controller: _.picCodeController,
                            hint: "Pin Code",
                            hintColor: AppColor.black,
                            textInputType: TextInputType.text,
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
                          onPress: () {
                            _.onGeneratePinCode(context);
                          },
                          text: "Generate Financial",
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
                  CheckBoxContainer(
                    onTap: (bool? value) {
                      if (_.isCheckPrivacy) {
                        _.isCheckPrivacy = false;
                      } else {
                        _.isCheckPrivacy = true;
                      }
                      // _.isCheckPrivacy = value!;
                      _.update();
                    },
                    isChecked: _.isCheckPrivacy,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 40,
                    child: RestInvestButton(
                      isSquare: true,
                      text: "Submit",
                      onPress: () {
                        _.onSubmitPress(context);
                      },
                      buttonColor: AppColor.blueColor,
                      textColor: AppColor.whiteColor,
                    ),
                  )
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
