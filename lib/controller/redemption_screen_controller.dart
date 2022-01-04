import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:investintrust/data/api_client.dart';
import 'package:investintrust/data/models/common_model.dart';
import 'package:investintrust/data/models/load_fund_plans.dart';
import 'package:investintrust/data/models/login_model.dart' as login;
import 'package:investintrust/data/repository.dart';
import 'package:investintrust/utils/constants.dart';
import 'package:investintrust/widgets/constant_widget.dart';
import 'package:investintrust/widgets/transaction_dialog.dart' as trans;


class RedemptionScreenController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isChecked = false;
  String fundNamevalue = "";
  String accountvalue = "";
  String paymentvalue = "";
  bool unitButton = true;
  bool percentageButton = false;
  bool percentageEnable = false;
  bool allUnitButton = false;
  bool isLoading = false;
  bool noInternet = false;
  TextEditingController unitBalanceController = TextEditingController();
  TextEditingController percentController = TextEditingController();
  List<login.UserFundBalances> fundNameListItems = [];
  ApiClient api = ApiClient();
  final _repository = Repository();
  LoadFundsPlans? loadFundsPlans;
  final map = login.UserFundBalances();
  double? calUnitBalanceValue;
  Common? pinCode;



  @override
  void onInit() async{
    accountvalue = Constant.loginModel!.response!.accounts![0].folioNumber!;
    Constant.loginModel!.response!.accounts![0].userFundBalances!.forEach((element) {
      map.fundShort =element.fundShort;
      map.fundCode =element.fundCode;
      map.fundvolume =element.fundvolume;
      map.fundName =element.fundName;
      map.fundPercent =element.fundPercent;
      map.fundRedPrice =element.fundRedPrice;
      map.fundSaleLoad =element.fundSaleLoad;
      map.fundUnits =element.fundUnits;
      map.offerPrice =element.offerPrice;
      map.priceDate =element.priceDate;
      map.unitClassess =element.unitClassess;
      fundNameListItems.add(login.UserFundBalances.fromJson(map.toJson()));

    });
    if(fundNameListItems.isNotEmpty){
      fundNamevalue = fundNameListItems[0].fundShort!;
    }
    loadFundsPlans =await  api.onLoadFundsPlans(Constant.userId, Constant.loginModel!.response!.accounts![0].userFundBalances![0].fundCode!, accountvalue, "RED");
    print(loadFundsPlans!.response!);

    update();
    super.onInit();
  }

  @override
  void onReady()async{

    Get.back();
    super.onReady();
  }

  late int index = 0;
  String? electronicUnit(){
    if(loadFundsPlans != null) {
      if(loadFundsPlans!.response!.userFundBalances!.isNotEmpty){
        index = loadFundsPlans!.response!.userFundBalances!.indexWhere((
            element) => element.fundShort == fundNamevalue);
        return loadFundsPlans!.response!.userFundBalances![index ?? 0]
            .fundUnits;
      }else{
        return '0';
      }
    }else {
      return '0';
    }
  }

  String? fundAmount(){
    if(loadFundsPlans != null) {
      if(loadFundsPlans!.response!.userFundBalances!.isNotEmpty){
        return loadFundsPlans!.response!.userFundBalances![index ?? 0].fundvolume;
      }else {
        return "0";
      }
    }else {
      return "0";
    }
  }

  calUnitBalance (s){
    String d = loadFundsPlans!.response!.userFundBalances![index].fundRedPrice ?? '0';
    double val = double.parse(d) * double.parse(s);
    return val;
  }


  String approxAmount = '';
  String approxUnits = '';
  calculateUnits(String s){
    if(unitButton){
      String d = loadFundsPlans!.response!.userFundBalances![index].fundRedPrice ?? '0';
      double val = double.parse(d) * double.parse(s);
      approxAmount =  val == 0 ? '': val.toStringAsFixed(2);
      update();
    }
    if(percentageButton){
      String d = loadFundsPlans!.response!.userFundBalances![index].fundUnits ?? '0';
      String red = loadFundsPlans!.response!.userFundBalances![index].fundRedPrice ?? '0';
      percentageEnable = d == null || d == null? false:true;
      double val = double.parse(d) * double.parse(s);
      double approxUni = val / 100;
      double approxAmo = approxUni * double.parse(red);
      approxAmount = approxAmo.toStringAsFixed(2);
      approxUnits = approxUni.toStringAsFixed(2);
      update();
    }
    if(allUnitButton){
      if(loadFundsPlans != null) {
        if(loadFundsPlans!.response!.userFundBalances!.isNotEmpty) {
          String d = loadFundsPlans!.response!.userFundBalances![index].fundRedPrice ?? '0';
          String u = loadFundsPlans!.response!.userFundBalances![index].fundUnits ?? '0';
          double val = double.parse(d) * double.parse(u);
          approxAmount =  val == 0 ? '': val.toStringAsFixed(2);
          unitBalanceController.text = u.toString();
          update();
        }
      }
    }
  }

  onGeneratePinCode(BuildContext context) async {
    try {
      isLoading = true;
      update();
      pinCode= await _repository.onGeneratePinCode(accountvalue, "RED");
      isLoading = false;
      if(noInternet) {
        noInternet = false;
      }
      if(pinCode!.meta!.message == 'OK' && pinCode!.meta!.code == '200'){
        customDialogPin(context , "Pin Code sent to your email address successfully");
      }
    } catch (e) {
      if (e.toString() == 'Exception: No Internet') {
        isLoading = false;
        noInternet = true;
        update();
      } else {
        isLoading = false;
        noInternet = false;
        update();
        Fluttertoast.showToast(
            msg: e.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }


  onSubmitPress(BuildContext context){
    // api.onSaveRedemption(accessCode, authorizationPinCode, folioNumber, fundCode, redTransType, sessionId, sessionStartDate, totalUnits, transactionValue, unitClass, unitPlan, userId, userType)
    if(unitBalanceController.text != ''){
      if(calUnitBalanceValue != 0){
        if(calUnitBalanceValue! > 0 || double.parse(unitBalanceController.text) > 0 || double.parse(percentController.text) >0){
          trans.showDialog(context,accountvalue,'',fundNamevalue,
              '','',"${unitButton?calUnitBalanceValue:percentageButton?percentController.text:unitBalanceController.text}",percentageButton ? 'Percentage':'Units','RED',onOkPress);
        } else {
          Fluttertoast.showToast(
              msg: 'Please enter Fund Balance/Percentage',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      } else {
        Fluttertoast.showToast(
            msg: 'Please enter Fund Balance/Percentage',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } else {
      Fluttertoast.showToast(
          msg: 'Please enter Fund Balance/Percentage',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  onOkPress(){
    isLoading = true;
    update();
  }


  investTrust(index) {
    switch (index) {
      case 0:
        {
          unitButton = true;
          percentageButton = false;
          allUnitButton = false;

          update();
          break;
        }
      case 1:
        {
          unitButton = false;
          percentageButton = true;
          allUnitButton = false;

          update();
          break;
        }
      case 2:
        {
          unitButton = false;
          percentageButton = false;
          allUnitButton = true;
          calculateUnits("0");
          update();
          break;
        }
    }
  }

  displayDialog(BuildContext context, Widget body) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: body,
          );
        });
  }
}
