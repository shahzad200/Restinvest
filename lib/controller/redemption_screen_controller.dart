import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:investintrust/data/api_client.dart';
import 'package:investintrust/data/models/common_model.dart';
import 'package:investintrust/data/models/load_fund_plans.dart';
import 'package:investintrust/data/models/login_model.dart' as login;
import 'package:investintrust/utils/constants.dart';


class RedemptionScreenController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isChecked = false;
  String fundNamevalue = "";
  String amountvalue = "";
  String paymentvalue = "";
  bool unitButton = true;
  bool percentageButton = false;
  bool allUnitButton = false;
  List<login.UserFundBalances> fundNameListItems = [];
  ApiClient api = ApiClient();
  LoadFundsPlans? loadFundsPlans;
  final map = login.UserFundBalances();
  double? calUnitBalanceValue;
  Common? pinCode;


  @override
  void onInit() {
    amountvalue = Constant.loginModel!.response!.accounts![0].folioNumber!;
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

    update();
    super.onInit();
  }

  @override
  void onReady()async{
    loadFundsPlans =await  api.onLoadFundsPlans(Constant.userId, Constant.loginModel!.response!.accounts![0].userFundBalances![0].fundCode!, amountvalue, "RED");
    print(loadFundsPlans!.response!);
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
    String d = loadFundsPlans!.response!.portfolioAllocationData![index].fundRedPrice ?? '0';
    double val = double.parse(d) * double.parse(s);
    return val;
  }

  Future<Common> onPicCodeGenerate ()async{
    pinCode =await api.onGeneratePinCode(Constant.userId,amountvalue,"RED");
    return pinCode!;
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
