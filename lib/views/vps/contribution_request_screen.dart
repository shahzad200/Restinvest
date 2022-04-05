

import 'package:date_field/date_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nit/utils/constant.dart';
import 'package:nit/widgets/drawer.dart';
import 'package:nit/widgets/no_internet.dart';
import 'package:path/path.dart' as p;
import 'package:get/get.dart';
import 'package:nit/controller/account_opening_kyc_detail_screen_controller.dart';
import 'package:nit/controller/vps/contribution_request_screen_controller.dart';
import 'package:nit/data/models/login_model.dart';
import 'package:nit/data/models/vps/load_fund.dart';
import 'package:nit/utils/colors.dart';
import 'package:nit/utils/constants.dart';
import 'package:nit/utils/lists.dart';
import 'package:nit/widgets/button.dart';
import 'package:nit/widgets/constant_widget.dart';
import 'package:nit/widgets/datefield.dart';
import 'package:nit/widgets/textformfiled.dart';

class ContributionScreen extends StatelessWidget {
  const ContributionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContributionScreenController>(
        init: ContributionScreenController(),
        builder: (controller) {
          var space = const SizedBox(
            height: 10,
          );
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
                            text: "VPS CONTRIBUTION REQUEST",
                            textColor: AppColor.black,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            // _.findIndex();
                                            controller.onVpsLoadFolioFunds();
                                            // _.fundNameListItems = [];
                                            // value.userFundBalances!.forEach((element) {
                                            //   _.fundNameListItems.add(element);
                                            // });
                                            // _.fundNamevalue = _.fundNameListItems[0].fundShort!;

                                            // _.fundSale = _.fundNameListItems[0].fundSaleLoad!;
                                            // CustomDialog(context);
                                            // _.loadFundsPlans =await  _.api.onLoadFundsPlans(Constant.userId, value.userFundBalances![0].fundCode!, value.folioNumber!, "F2F");
                                            // if(_.loadFundsPlans != null){
                                            //   _.loadFundsPlans!.response!.toFunds!.forEach((element) {
                                            //     if(element!.fundCode == value!.folioNumber!){
                                            //       _.selectedFund = element.fundBankAccountDetails![0];
                                            //       _.collectionBankAccount = _.selectedFund!.accountNo!;
                                            //       _.collectionBankCode = _.selectedFund!.bankCode! ;
                                            //     }
                                            //   });
                                            // }
                                            // Get.back();
                                            // _.approxUnits = "";
                                            // _.approxAmount = "";
                                            // _.calUnitBalanceValue = 0.0;
                                            // _.unitBalanceController.text = "";
                                            // _.unitButton = true;
                                            // _.percentageEnable = false;
                                            // _.percentageButton = false;
                                            // _.allUnitButton = false;
                                            // _.unitBalanceController.clear();
                                            // _.percentController.clear();
                                            controller.update();
                                          },
                                        ),
                                      ),
                                    ]),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const RestInvestTitle(
                                      text: "Fund Name:*",
                                      textColor: AppColor.black,
                                      fontSize: 10,
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
                                        child: controller.isLoading ? const SizedBox() : DropdownButton<Funds>(
                                          isExpanded: true,
                                          underline: Container(
                                            color: AppColor.whiteColor,
                                          ),

                                          borderRadius:
                                          BorderRadius.circular(6),
                                          // value: _.dropdownvalue,
                                          hint: RestInvestTitle(
                                            text: controller.fundValue == null ||
                                                controller.fundValue == ''
                                                ? "Select fund"
                                                : controller.fundValue,
                                            fontSize: 12,
                                            textColor: AppColor.black,
                                          ),
                                          icon: const Icon(
                                              Icons.keyboard_arrow_down,
                                              color: AppColor.blueColor,
                                              size: 25),
                                          items: controller.isLoading ? null : controller.vpsLoadFolioFunds!.response!.funds!
                                              .map(
                                                  (Funds? funds) {
                                                return DropdownMenuItem<Funds>(
                                                    value: funds,
                                                    child: Text(controller.fundValue)
                                                );
                                              }).toList(),

                                          onChanged: controller.isLoading ? null : (Funds? value) async {
                                            controller.fundValue =
                                            value!.fundShort!;
                                            controller.fundCode = value.fundCode!;
                                            controller.onVpsLoadFolioFunds();
                                            controller.update();
                                          },
                                        ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          space,
                          const RestInvestTitle(
                            text: "Fund Bank Transfer/Deposit Details:*",
                            textColor: AppColor.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                          ),
                          space,
                           RestInvestTitle(
                            text: 'Fund Bank:  '+controller.fundBank,
                            fontSize: 10,
                            textColor: AppColor.black,
                            fontWeight: FontWeight.w900,
                          ),
                          space,
                           RestInvestTitle(
                            text: 'Fund Bank Account Number:  '+controller.fundBankAccountNumber,
                            textColor: AppColor.black,
                            fontSize: 10,
                            fontWeight: FontWeight.w900,
                          ),
                          space,
                           RestInvestTitle(
                            text: 'IBAN:  '+controller.iBan,
                            textColor: AppColor.black,
                            textAlign: TextAlign.left,
                            fontWeight: FontWeight.w900,
                            fontSize: 10,
                          ),
                          space,
                          Row(children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const RestInvestTitle(
                                    text: "Payment Mode:*",
                                    textColor: AppColor.black,
                                    fontSize: 10,
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
                                    child: Center(
                                      child: DropdownButton(
                                        isExpanded: true,
                                        underline: Container(
                                          color: AppColor.whiteColor,
                                        ),
                                        borderRadius: BorderRadius.circular(6),
                                        // value: _.dropdownvalue,
                                        hint: RestInvestTitle(
                                          text: controller.paymentValue == null ||
                                              controller.paymentValue == ""
                                              ? "Payment Mode"
                                              : controller.paymentValue,
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
                                          controller.paymentValue = value!;
                                          if (value == "Cheque") {
                                            controller.paymentValueCode = "CH";
                                            // _.date = null;
                                          } else if (value == "IBFT") {
                                            controller.paymentValueCode = "IB";
                                            controller.instrumentController.text = '';
                                          } else if (value == "1-Link") {
                                            controller.paymentValueCode = "ON";
                                            controller.instrumentController.text = '';
                                          }
                                          controller.update();
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
                                    controller: controller.amountController,
                                    enable: controller.isLoading ? false : true,
                                    isRounded: true,
                                    textInputType: TextInputType.number,
                                    hint: "",
                                    onChange: (value){
                                      if(int.parse(value.toString().replaceAll(',', '')) >= 1000000 ){
                                        controller.amountController.text = '100,000,0';
                                        controller.update();
                                        showToast('The amount cannot exceed 1000000 (1 million)');
                                      }
                                    },
                                    inputFormator: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      NumberForm()
                                    ],
                                    //  textInputType: TextInputType.emailAddress,
                                  ),
                                ],
                              ),
                            ),
                          ]),
                          space,
                          Row(
                            children: [
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  space,
                                  const RestInvestTitle(
                                    text: "Bank Name:*",
                                    textColor: AppColor.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  CustomTextFormField(
                                    controller: controller.bankNameController,
                                      color: AppColor.black,
                                    enable: controller.isLoading ? false : true,
                                  ),
                                ],
                              )),
                              const SizedBox(
                                width: 6,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    space,
                                    const RestInvestTitle(
                                      text: "Bank Account Number:*",
                                      textColor: AppColor.black,
                                      fontSize: 10,
                                      textAlign: TextAlign.left,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    CustomTextFormField(
                                        enable: controller.isLoading ? false : true,
                                        controller: controller.bankAccountController,
                                        color: AppColor.black),
                                  ],
                                ),
                              )
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
                                      text: 'Cheque/Instrument No:*',
                                      fontSize: 10,
                                      textColor: AppColor.black,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    CustomTextFormField(
                                      color: AppColor.dimblack,
                                      enable: controller.paymentValue == 'Cheque' && controller.isLoading == false ? true : false,
                                      isRounded: true,
                                      textInputType: TextInputType.numberWithOptions(),
                                      controller: controller.instrumentController,
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
                                      text: 'Cheque/Instrument Date:*',
                                      fontSize: 10,
                                      textColor: AppColor.black,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    SizedBox(
                                      height: 35,
                                      child: DateFormFieldContainer(
                                        isRounded: false,
                                        isTrue: true,
                                        enable: controller.paymentValue == 'Cheque' && controller.isLoading == false ? true : false,
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
                                      text: 'Enter Your 4 Digit Pin:*',
                                      textColor: AppColor.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    CustomTextFormField(color: AppColor.black,
                                      controller: controller.picCodeController,
                                      enable: controller.isLoading ? false : true,
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
                                      text: "Don't have a Financial Pin:*",
                                      fontSize: 10,
                                      textColor: AppColor.black,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    SizedBox(
                                        height: 35,
                                        child: CustomRoundButton(
                                          onPress: () {
                                            controller.isLoading ? printInfo(info: 'isLoading') :
                                            controller.onVpsGeneratePinCode(context);
                                          },
                                          text: "Click here to Generate",
                                          textSize: 14,
                                          buttonColor: AppColor.blueColor,
                                          isRound: false,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          space,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              controller.paymentValue != '1-Link' ?
                              Padding(
                                padding: EdgeInsets.only(
                                    left: controller.paymentProof == null ? 20.0 : 0.0),
                                child: Column(
                                  children: [
                                    const RestInvestTitle(
                                      text: "Payment Proof",
                                      textColor: AppColor.blueColor,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          controller.isLoading ? printInfo(info: 'isLoading') :
                                          showModalBottomSheet(
                                              context: context,
                                              backgroundColor: Colors.transparent,
                                              elevation: 0,
                                              builder: (BuildContext bc) {
                                                return SafeArea(
                                                  child: Container(
                                                    decoration: const BoxDecoration(
                                                        borderRadius: BorderRadius.only(
                                                            topRight:
                                                            Radius.circular(20),
                                                            topLeft:
                                                            Radius.circular(20)),
                                                        color: Colors.white),
                                                    child:  Wrap(
                                                      children: <Widget>[
                                                         ListTile(
                                                            leading:  const Icon(
                                                                Icons.photo_library),
                                                            title:  const Text(
                                                                'Photo Library'),
                                                            onTap: () async {
                                                              controller.paymentProof = await controller
                                                                  .getImageFromGallery();
                                                              controller.paymentProofExt =
                                                                  p.extension(controller
                                                                      .paymentProof!
                                                                      .path);

                                                              controller.paymentProofBytes = controller
                                                                  .paymentProof!
                                                                  .readAsBytesSync();

                                                              // then((value) {

                                                              // });
                                                              // print(
                                                              //     "Extention${controller.paymentProofExt}");
                                                              controller.update();
                                                              Navigator.of(context)
                                                                  .pop();
                                                            }),
                                                         ListTile(
                                                          leading:  const Icon(
                                                              Icons.photo_camera),
                                                          title:  const Text('Camera'),
                                                          onTap: () async {
                                                            controller.paymentProof = await controller
                                                                .getImageFromCamera();
                                                            controller.paymentProofExt =
                                                                p.extension(controller
                                                                    .paymentProof!
                                                                    .path);
                                                            controller.paymentProofBytes = controller
                                                                .paymentProof!
                                                                .readAsBytesSync();
                                                            // print(
                                                            //     "Extention${controller.paymentProofExt}");
                                                            controller.update();
                                                            Navigator.of(context).pop();
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              });
                                        },
                                        child: controller.paymentProof == null
                                            ? Image.asset(
                                          Constants.paymentSlip,
                                          height: 100,
                                          width: 50,
                                          fit: BoxFit.contain,
                                        )
                                            : Image.file(controller.paymentProof!,
                                            width: Get.width / 2.6,
                                            height: Get.width / 3,
                                            fit: BoxFit.fill))
                                  ],
                                ),
                              ) : const SizedBox(),
                              controller.paymentValue == 'Cheque' ? Padding(
                                padding: EdgeInsets.only(
                                    right: controller.depositProof == null ? 20.0 : 0.0),
                                child: Column(
                                  children: [
                                    const RestInvestTitle(
                                      text: "Deposit Slip",
                                      textColor: AppColor.blueColor,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          controller.isLoading ? printInfo(info: 'isLoading') :
                                          showModalBottomSheet(
                                              backgroundColor: Colors.transparent,
                                              elevation: 0,
                                              context: context,
                                              builder: (BuildContext bc) {
                                                return SafeArea(
                                                  child: Container(
                                                    decoration: const BoxDecoration(
                                                        borderRadius: BorderRadius.only(
                                                            topRight:
                                                            Radius.circular(20),
                                                            topLeft:
                                                            Radius.circular(20)),
                                                        color: Colors.white),
                                                    child: Wrap(
                                                      children: <Widget>[
                                                         ListTile(
                                                            leading: Icon(
                                                                Icons.photo_library),
                                                            title: Text(
                                                                'Photo Library'),
                                                            onTap: () async {
                                                              controller.depositProof = await controller
                                                                  .getImageFromGallery();
                                                              controller.depositProofExt =
                                                                  p.extension(controller
                                                                      .depositProof!
                                                                      .path);
                                                              controller.depositProofBytes = controller
                                                                  .depositProof!
                                                                  .readAsBytesSync();
                                                              // _.paymentSlip!.readAsBytes().then((value) {
                                                              //   _.paymentSlipBytes = Uint8List.fromList(value);});
                                                              // print(
                                                              //     "Extention${controller.depositProofExt}");
                                                              controller.update();
                                                              Navigator.of(context)
                                                                  .pop();
                                                            }),
                                                         ListTile(
                                                          leading:  const Icon(
                                                              Icons.photo_camera),
                                                          title:  const Text('Camera'),
                                                          onTap: () async {
                                                            controller.depositProof = await controller
                                                                .getImageFromCamera();
                                                            controller.depositProofExt =
                                                                p.extension(controller
                                                                    .depositProof!.path);
                                                            controller.depositProofBytes = controller
                                                                .depositProof!
                                                                .readAsBytesSync();
                                                            // _.paymentSlip!.readAsBytes().then((value) {
                                                            //   _.paymentSlipBytes = Uint8List.fromList(value);});
                                                            // print(
                                                            //     "Extention${controller.depositProofExt}");
                                                            controller.update();
                                                            Navigator.of(context).pop();
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              });
                                        },
                                        child: controller.depositProof == null
                                            ? Image.asset(
                                          Constants.paymentSlip,
                                          height: 100,
                                          width: 50,
                                          fit: BoxFit.contain,
                                        )
                                            : Image.file(
                                          controller.depositProof!,
                                          width: Get.width / 2.6,
                                          height: Get.width / 3,
                                          fit: BoxFit.fill,
                                        ))
                                  ],
                                ),
                              ) : const SizedBox(),
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomRoundButton(
                                  isRound: false,
                                  text: "Submit",
                                  width: 120,
                                  height: 40,
                                  buttonColor: AppColor.blueColor,
                                  textColor: AppColor.whiteColor,
                                  onPress: () {
                                    controller.isLoading ? printInfo(info: 'isLoading') :
                                    controller.onSubmit(context);
                                  }),
                              CustomRoundButton(
                                  isRound: false,
                                  text: "Reset",
                                  width: 120,
                                  height: 40,
                                  buttonColor: AppColor.blueColor,
                                  textColor: AppColor.whiteColor,
                                  onPress: () {
                                    controller.isLoading ? printInfo(info: 'isLoading') :
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
