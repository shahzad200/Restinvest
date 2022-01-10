import 'dart:typed_data';

import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:investintrust/data/models/load_fund_plans.dart';
import 'package:investintrust/data/models/login_model.dart';
import 'package:investintrust/utils/constant.dart';
import 'package:investintrust/utils/constants.dart';
import 'package:investintrust/widgets/custome_dialog.dart';
import 'package:path/path.dart' as p;
import '../utils/lists.dart';


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
                                  items: Constant.loginModel!.response!.accounts!
                                      .map((Accounts? fromAccountItems) {
                                    return DropdownMenuItem<Accounts>(
                                        value: fromAccountItems,
                                        child: Text(fromAccountItems!.folioNumber!));
                                  }).toList(),
                                  onChanged: (Accounts? value)async {
                                    _.accountvalue = value!.folioNumber!;
                                    _.fundNameListItems = [];
                                    value.userFundBalances!.forEach((element) {
                                      _.fundNameListItems.add(element);
                                    });
                                    _.fundNamevalue = _.fundNameListItems[0].fundShort!;
                                    _.fundSale = _.fundNameListItems[0].fundSaleLoad!;
                                    CustomDialog(context);
                                    _.loadFundsPlans =await  _.api.onLoadFundsPlans(Constant.userId, value.userFundBalances![0].fundCode!, value.folioNumber!, "F2F");
                                    if(_.loadFundsPlans != null){
                                      _.loadFundsPlans!.response!.toFunds!.forEach((element) {
                                        if(element!.fundCode == value!.folioNumber!){
                                          _.selectedFund = element.fundBankAccountDetails![0];
                                          _.collectionBankAccount = _.selectedFund!.accountNo!;
                                          _.collectionBankCode = _.selectedFund!.bankCode! ;
                                        }
                                      });
                                    }
                                    Get.back();
                                    // _.approxUnits = "";
                                    // _.approxAmount = "";
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
                                      width: 1, color: AppColor.black)),
                              child: Center(
                                child: DropdownButton<UserFundBalances>(
                                  isExpanded: true,
                                  underline: Container(
                                    color: AppColor.whiteColor,
                                  ),

                                  borderRadius: BorderRadius.circular(6),
                                  // value: _.dropdownvalue,
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
                                  items: _.fundNameListItems
                                      .map((UserFundBalances? fundNameListItems) {
                                    return DropdownMenuItem<UserFundBalances>(
                                        value: fundNameListItems,
                                        child: Text(fundNameListItems!.fundShort!));
                                  }).toList(),
                                  onChanged: (UserFundBalances? value) async{
                                    _.fundNamevalue = value!.fundShort!;
                                    _.fundSale = value!.fundSaleLoad!;

                                    CustomDialog(context);
                                    _.loadFundsPlans =await  _.api.onLoadFundsPlans(Constant.userId, value.fundCode!, _.accountvalue, "F2F");
                                    if(_.loadFundsPlans != null){
                                      _.loadFundsPlans!.response!.toFunds!.forEach((element) {
                                        if(element!.fundCode == value!.fundCode!){
                                          _.selectedFund = element.fundBankAccountDetails![0];
                                          _.collectionBankAccount = _.selectedFund!.accountNo!;
                                          _.collectionBankCode = _.selectedFund!.bankCode! ;
                                        }
                                      });
                                    }
                                    Get.back();
                                    // _.approxUnits = "";
                                    // _.approxAmount = "";
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
                    children:  [
                      Expanded(
                          child: EmptyRowContainer(
                        fontWeight: FontWeight.w800,
                        fontsize: 14,
                        hintColor: AppColor.black,
                        hint: _.selectedFund == null?"":"${_.selectedFund!.bankName}",
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
                        hint: _.selectedFund == null?"":"${_.selectedFund!.accountNo}",
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
                                        ? "Payment Mode"
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
                                    if(value == "Cheque"){
                                      _.paymentvalueCode = "CH";
                                    }else if(value == "IBFT"){
                                      _.paymentvalueCode = "IB";
                                    }else if(value == "Online"){
                                      _.paymentvalueCode = "ON";
                                    }
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
                              controller: _.amountController,
                              isRounded: true,
                              textInputType: TextInputType.numberWithOptions(),
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
                              controller: _.bankNameController,
                              isRounded: true,
                              textInputType: TextInputType.text,
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
                              textInputType: TextInputType.numberWithOptions(),
                              controller: _.bankAccountController,
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
                              textInputType: TextInputType.numberWithOptions(),
                              controller: _.installmentController,
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
                              child: DateFormFieldContainer(isRounded:false,isTrue:true,
                                text: '',
                                mode: DateTimeFieldPickerMode.date,
                                dateFormatTrue: true,
                                initialValue: DateTime.now(),
                                onDateSelected: (value){
_.date = value;
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
                        child: SizedBox(
                          height: 35,
                          child: CustomTextFormField(
                            isRounded: true,
                            controller: _.picCodeController,
                            hint: "Pin Code",
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
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                    Padding(
                      padding:  EdgeInsets.only(left:_.paymentProof == null? 20.0:0.0),
                      child: Column(children: [

                        RestInvestTitle(text: "Payment Proof",textColor: AppColor.blueColor,),
                        SizedBox(height: 5,),
                        GestureDetector(onTap: (){
                          showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              builder: (BuildContext bc) {
                                return SafeArea(
                                  child: Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),color: Colors.white),
                                    child: new Wrap(
                                      children: <Widget>[
                                        new ListTile(
                                            leading: new Icon(Icons.photo_library),
                                            title: new Text('Photo Library'),
                                            onTap: ()async {
                                              _.paymentProof =await _.getImageFromGallery();
                                              _.paymentProofExt = p.extension(_.paymentProof!.path);
                                              _.paymentProof!.readAsBytes().then((value) {
                                                _.paymentProofBytes = Uint8List.fromList(value);});
                                              print("Extention${_.paymentProofExt}");
                                              _.update();
                                              Navigator.of(context).pop();
                                            }),
                                        new ListTile(
                                          leading: new Icon(Icons.photo_camera),
                                          title: new Text('Camera'),
                                          onTap: ()async {
                                            _.paymentProof = await _.getImageFromCamera();
                                            _.paymentProofExt = p.extension(_.paymentProof!.path);
                                            _.paymentProof!.readAsBytes().then((value) {
                                              _.paymentProofBytes = Uint8List.fromList(value);});
                                            print("Extention${_.paymentProofExt}");
                                            _.update();
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                          );
                        }, child:_.paymentProof == null ? Image.asset(Constants.paymentSlip,height: 100,width: 50,fit: BoxFit.contain,):Image.file(_.paymentProof!,width: Get.width/2.6,height: Get.width/3,fit: BoxFit.fill))
                      ],),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(right:_.paymentSlip == null? 20.0:0.0),
                      child: Column(children: [

                        RestInvestTitle(text: "Payment Slip",textColor: AppColor.blueColor,),
                        SizedBox(height: 5,),
                        GestureDetector( onTap: (){
                          showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              context: context,
                              builder: (BuildContext bc) {
                                return SafeArea(
                                  child: Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),color: Colors.white),

                                    child: new Wrap(
                                      children: <Widget>[
                                        new ListTile(
                                            leading: new Icon(Icons.photo_library),
                                            title: new Text('Photo Library'),
                                            onTap: ()async {
                                              _.paymentSlip =await _.getImageFromGallery();
                                              _.paymentSlipExt = p.extension(_.paymentSlip!.path);
                                              _.paymentSlip!.readAsBytes().then((value) {
                                                _.paymentSlipBytes = Uint8List.fromList(value);});
                                              print("Extention${_.paymentSlipExt}");
                                              _.update();
                                              Navigator.of(context).pop();
                                            }),
                                        new ListTile(
                                          leading: new Icon(Icons.photo_camera),
                                          title: new Text('Camera'),
                                          onTap: ()async {
                                            _.paymentSlip = await _.getImageFromCamera();
                                            _.paymentSlipExt = p.extension(_.paymentSlip!.path);
                                            _.paymentSlip!.readAsBytes().then((value) {
                                              _.paymentSlipBytes = Uint8List.fromList(value);});
                                            print("Extention${_.paymentSlipExt}");
                                            _.update();
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                          );
                        },child:_.paymentSlip == null ? Image.asset(Constants.paymentSlip,height: 100,width: 50,fit: BoxFit.contain,):Image.file(_.paymentSlip!,width: Get.width/2.6,height: Get.width/3,fit: BoxFit.fill,))
                      ],),
                    )
                  ],),
                  const SizedBox(height: 10),
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
                  space,
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
          );
        });
  }
}
