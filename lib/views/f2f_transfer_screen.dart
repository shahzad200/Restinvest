
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nit/data/models/login_model.dart';
import 'package:nit/utils/constants.dart';
import 'package:nit/data/models/load_fund_plans.dart' as fund;
import 'package:nit/widgets/no_internet.dart';
import '../controller/f2f_transfer_screen_controller.dart';
import '/controller/f2f_transfer_screen_controller.dart';
import 'package:nit/widgets/transaction_dialog.dart' as trans;
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
                        text: "CONVERSION",
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
                                      width: 1, color: AppColor.black)),
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
                                  items: _.listAccount.map<DropdownMenuItem<Accounts>>((Accounts? value){
                                    return DropdownMenuItem<Accounts>(
                                      value: value,
                                      child: Text(value!.folioNumber!),
                                    );
                                  }).toList(),
                                  onChanged:  _.isLoading || _.noInternet ? null : (Accounts? value) {
                                    _.accountValue = value!.folioNumber!;
                                    _.unitBalanceController.text = '';
                                    _.approxAmount = '';
                                    _.unitButton = true;
                                    _.percentageButton = false;
                                    _.allUnitButton = false;
                                    _.findIndex();
                                    _.onLoadFundsPlans();
                                    // _.update();
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
                                      width: 1, color: AppColor.black)),
                              child: Center(
                                child: DropdownButton(
                                  isExpanded: true,
                                  underline: Container(
                                    color: AppColor.whiteColor,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                  // value: _.dropdownvalue,
                                  hint: RestInvestTitle(
                                    text: _.fundValue == null ||
                                        _.fundValue == ""
                                        ? ""
                                        : _.fundValue,
                                    textColor: AppColor.black,
                                  ),
                                  icon: const Icon(Icons.keyboard_arrow_down,
                                      color: AppColor.blueColor, size: 35),
                                  items: Constant.loginModel!.response!.accounts![_.fundIndex].userFundBalances!.map<DropdownMenuItem<UserFundBalances>>((UserFundBalances? value){
                                    return DropdownMenuItem<UserFundBalances>(
                                      value: value,
                                      child: Text(value!.fundShort!),
                                    );
                                  }).toList(),
                                  onChanged: _.isLoading || _.noInternet ? null : (UserFundBalances? value) {
                                    _.fundValue = value!.fundShort!;
                                    _.fundCode = value!.fundCode!;
                                    _.unitBalanceController.text = '';
                                    _.approxAmount = '';
                                    _.unitButton = true;
                                    _.percentageButton = false;
                                    _.allUnitButton = false;
                                    _.onLoadFundsPlans();
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
                        hint: _.isLoading? '0' : _.electronicUnit() == '0' ? '0' :_.f.format(double.parse(_.electronicUnit().toString())).toString(),
                        text:'From Fund Electronic Units',
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
                        hint: _.isLoading? '0' : _.fundAmount() == '0.00' ? '0' :_.f.format(double.parse(_.fundAmount().toString())).toString(),
                        text: 'From Fund Amount (Rs.)',
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
                              text: "To Account",
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
                                      width: 1, color: AppColor.black)),
                              child: Center(
                                child: DropdownButton(
                                  isExpanded: true,
                                  underline: Container(
                                    color: AppColor.whiteColor,
                                  ),

                                  borderRadius: BorderRadius.circular(6),
                                  // value: _.dropdownvalue,
                                  hint: RestInvestTitle(
                                    text: _.toAccountValue == null ||
                                            _.toAccountValue == ""
                                        ? " "
                                        : _.toAccountValue,
                                    textColor: AppColor.black,
                                  ),
                                  icon: const Icon(Icons.keyboard_arrow_down,
                                      color: AppColor.blueColor, size: 35),
                                  items: _.listAccount.map<DropdownMenuItem<Accounts>>((Accounts? value){
                                    return DropdownMenuItem<Accounts>(
                                      value: value,
                                      child: Text(value!.folioNumber!),
                                    );
                                  }).toList(),
                                  onChanged: _.isLoading || _.noInternet ? null : (Accounts? value) {
                                    _.toAccountValue = value!.folioNumber!;
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
                              text: "Transfer To Fund",
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
                                      width: 1, color: AppColor.black)),
                              child: Center(
                                child: _.isLoading ? const SizedBox() :DropdownButton(
                                  isExpanded: true,
                                  underline: Container(
                                    color: AppColor.whiteColor,
                                  ),

                                  borderRadius: BorderRadius.circular(6),
                                  // value: _.dropdownvalue,
                                  hint: RestInvestTitle(
                                    text: _.toFundValue == null ||
                                        _.toFundValue == ""
                                        ? " "
                                        : _.toFundValue,
                                    textColor: AppColor.black,
                                  ),
                                  icon: const Icon(Icons.keyboard_arrow_down,
                                      color: AppColor.blueColor, size: 35),
                                  items: _.loadFundsPlans!.response!.toFunds!.map<DropdownMenuItem<fund.ToFunds>>((fund.ToFunds? value){
                                    return DropdownMenuItem<fund.ToFunds>(
                                      value: value,
                                      child: Text(value!.fundShort!),
                                    );
                                  }).toList(),
                                  onChanged: _.isLoading || _.noInternet ? null : (fund.ToFunds? value) {
                                    _.toFundValue = value!.fundShort!;
                                    _.toFundValue=='NIT SIF'?'B':value!.fundShort!;
                                    _.toFundCode = value!.fundCode!;
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
                              textColor:
                              _.unitButton
                                  ? AppColor.whiteColor
                                  : AppColor.black,
                              textSize: 12,
                              onPress: () {
                                _.isLoading || _.noInternet ? null :
                                _.investTrust(0);
                              },
                              buttonColor:
                              _.unitButton
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
                              _.isLoading || _.noInternet ? null :
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
                              _.isLoading || _.noInternet ? null :
                              _.investTrust(2);
                            },
                            buttonColor: _.allUnitButton
                                ? AppColor.blueColor
                                : AppColor.whiteColor,
                          )),
                      const SizedBox(),
                    ],
                  ),
                  const SizedBox(height: 10),
                  _.percentageButton ? Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          controller: _.unitBalanceController,
                          enable: _.isLoading ? false : _.loadFundsPlans!.response!.portfolioAllocationData!.isNotEmpty &&
                              double.parse(_.loadFundsPlans!.response!.portfolioAllocationData![_.index].fundUnits!) > 0 ? true : false,
                          isRounded: true,
                          hint: "Percentage",hintColor: AppColor.black,
                          textInputType: TextInputType.number,
                          onChange: (v){
                            if(v==''){
                              _.calculateUnits('0');
                            }else {
                              _.calculateUnits(v);
                            }
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
                          text: _.approxAmount == '' ? "Approx. Amount" : _.approxAmount,
                          textColor: AppColor.blueColor,
                          isSquare: true,
                          voidcallback: () {},
                        ),
                      ))
                    ],
                  ) :
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          controller: _.unitBalanceController,
                          enable: _.isLoading || _.allUnitButton || _.noInternet ? false : _.loadFundsPlans!.response!.portfolioAllocationData!.isNotEmpty &&
                              double.parse(_.loadFundsPlans!.response!.portfolioAllocationData![_.index].fundUnits!) > 0 ? true : false,
                          isRounded: true,
                          hint: "Enter Units",hintColor: AppColor.black,
                          textInputType: TextInputType.number,
                          inputFormator: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                              RegExp(r'[0-9]'),
                            ),
                            FilteringTextInputFormatter.deny(
                              RegExp(
                                  r'^0+'), //users can't type 0 at 1st position
                            ),
                          ],
                          onChange: (v){
                            printInfo(info: "jhjghjhHJHGJHGjh"+v);
                            if(v==''){
                              _.calculateUnits('0');
                            }else {
                              _.calculateUnits(v);
                            }
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
                              text: _.approxAmount == '' ? "Approx. Amount" : _.approxAmount,
                              textColor: AppColor.blueColor,
                              isSquare: true,
                              voidcallback: () {},
                            ),
                          ))
                    ],
                  ),
                  _.percentageButton ? const SizedBox(
                    height: 10,
                  ) : const SizedBox(),
                  _.percentageButton ?
                  SizedBox(
                        height: 35,
                        child: RoundContainer(
                          text: _.approxUnits == '' ? "Approx. Units" : _.approxUnits,
                          textColor: AppColor.blueColor,
                          isSquare: true,
                          voidcallback: () {},
                        ),
                      ) : const SizedBox(),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 35,
                          child: CustomTextFormField(
                            controller: _.pinCodeController,
                            enable: _.isLoading || _.noInternet ? false : true,
                            isRounded: true,
                            hint: "Pin Code",hintColor: AppColor.black,
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
                            _.isLoading || _.noInternet ? null :
                            _.onGeneratePinCode(context);
                          },
                          text: "Generate Financial",
                          buttonColor: AppColor.blueColor,
                          textColor: AppColor.whiteColor,
                          textSize: 14,
                        ),
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CheckBoxContainer(onTap: (bool? value) {
                    if(_.isCheckPrivacy){
                      _.isCheckPrivacy = false;
                    }else{
                      _.isCheckPrivacy = true;
                    }
                    // _.isCheckPrivacy = value!;
                    _.update();
                  },isChecked: _.isCheckPrivacy,
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
                        _.isLoading || _.noInternet ? null :
                            _.onSubmitPress(context);
                        // trans.showDialog(context,_.accountValue,_.toAccountValue,_.fundValue,
                        //     _.toFundValue,'',_.dataValue,_.percentageButton ? 'Percentage':'Units','FTF');
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



