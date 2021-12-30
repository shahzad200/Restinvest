import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:investintrust/data/models/common_model.dart';
import 'package:investintrust/data/models/load_fund_plans.dart';
import 'package:investintrust/data/repository.dart';
import 'package:investintrust/utils/constants.dart';
import 'package:investintrust/widgets/constant_widget.dart';

class F2FTransferScreenController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isChecked = false;
  String accountValue = Constant.loginModel!.response!.accounts![0].folioNumber ?? '';

  TextEditingController unitBalanceController = TextEditingController();

  String fundValue = Constant.loginModel!.response!.accounts![0].userFundBalances![0].fundShort ?? '';
  String fundCode = Constant.loginModel!.response!.accounts![0].userFundBalances![0].fundCode ?? '';
  String toAccountValue = Constant.loginModel!.response!.accounts![0].folioNumber ?? '';
  String toFundValue = "";
  String toFundCode = "";
  bool unitButton = true;
  bool percentageButton = false;
  bool allUnitButton = false;


  bool investButton = false;
  bool portfolioButton = false;
  bool buttonclick3 = false;


  final _repository = Repository();
  bool isLoading = false;
  bool noInternet = false;
  LoadFundsPlans? loadFundsPlans;
  Common? common;
  @override
  void onInit() async {
    findIndex();
      onLoadFundsPlans();
    super.onInit();
  }

  int fundIndex = 0;
  int findIndex(){
     fundIndex = Constant.loginModel!.response!.accounts!.indexWhere((element) => element.folioNumber == accountValue);
    fundValue = Constant.loginModel!.response!.accounts![fundIndex].userFundBalances![0].fundShort!;
    fundCode = Constant.loginModel!.response!.accounts![fundIndex].userFundBalances![0].fundCode!;
    return fundIndex;
  }

  late int index = 0;
  String? electronicUnit(){
    if(loadFundsPlans != null) {
      if(loadFundsPlans!.response!.portfolioAllocationData!.isNotEmpty){
        index = loadFundsPlans!.response!.portfolioAllocationData!.indexWhere((
            element) => element.fundShort == fundValue);
        return loadFundsPlans!.response!.portfolioAllocationData![index ?? 0]
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
      if(loadFundsPlans!.response!.portfolioAllocationData!.isNotEmpty){
        return loadFundsPlans!.response!.portfolioAllocationData![index ?? 0].fundvolume;
      }else {
        return "0";
      }
    }else {
      return "0";
    }
  }

  String approxAmount = '';
  String approxUnits = '';
  String dataValue = '';
    calculateUnits(String s){
      if(unitButton){
        dataValue = s;
        String d = loadFundsPlans!.response!.portfolioAllocationData![index].fundRedPrice ?? '0';
        double val = double.parse(d) * double.parse(s);
        approxAmount =  val == 0 ? '': val.toStringAsFixed(2);
        update();
      }
      if(percentageButton){
        dataValue = s;
        String d = loadFundsPlans!.response!.portfolioAllocationData![index].fundUnits ?? '0';
        String red = loadFundsPlans!.response!.portfolioAllocationData![index].fundRedPrice ?? '0';
        double val = double.parse(d) * double.parse(s);
        double approxUni = val / 100;
        double approxAmo = approxUni * double.parse(red);
        approxAmount = approxAmo.toStringAsFixed(2);
        approxUnits = approxUni.toStringAsFixed(2);
        update();
      }
      if(allUnitButton){
        if(loadFundsPlans != null) {
          if(loadFundsPlans!.response!.portfolioAllocationData!.isNotEmpty) {
            String d = loadFundsPlans!.response!.portfolioAllocationData![index].fundRedPrice ?? '0';
            String u = loadFundsPlans!.response!.portfolioAllocationData![index].fundUnits ?? '0';
            double val = double.parse(d) * double.parse(u);
            approxAmount =  val == 0 ? '': val.toStringAsFixed(2);
            unitBalanceController.text = u.toString();
            dataValue = u;
            update();
          }
          }
      }
  }

  investTrust(index) {
    switch (index) {
      case 0:
        {
          unitButton = true;
          percentageButton = false;
          allUnitButton = false;
          approxAmount = '';
          approxUnits = '';
          unitBalanceController.text = '';
          update();
          break;
        }
      case 1:
        {
          unitButton = false;
          percentageButton = true;
          allUnitButton = false;
          approxAmount = '';
          approxUnits = '';
          unitBalanceController.text = '';
          update();
          break;
        }
      case 2:
        {
          unitButton = false;
          percentageButton = false;
          allUnitButton = true;
          approxAmount = '';
          approxUnits = '';
          unitBalanceController.text = '';
          update();
          calculateUnits('0');
          break;
        }
    }
  }

  onGeneratePinCode(BuildContext context) async {
    try {
      isLoading = true;
      update();
      common = await _repository.onGeneratePinCode(accountValue, "RED");
      isLoading = false;
      if(noInternet) {
        noInternet = false;
      }
      if(common!.meta!.message == 'OK' && common!.meta!.code == '200'){
        customDialogPin(context);
      }
      // update();
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

  onLoadFundsPlans() async {
    try {
      isLoading = true;
      toAccountValue = Constant.loginModel!.response!.accounts![0].folioNumber ?? '';
      update();
      printInfo(info: accountValue+'jjgjgj'+fundCode+'hhghgh');
      loadFundsPlans = await _repository.onLoadFundsPlans(fundCode, accountValue, "FTF");
      toFundValue = loadFundsPlans!.response!.toFunds![0].fundShort!;
      toFundCode = loadFundsPlans!.response!.toFunds![0].fundShort!;
      isLoading = false;
      if(noInternet) {
        noInternet = false;
      }
      update();
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

}
