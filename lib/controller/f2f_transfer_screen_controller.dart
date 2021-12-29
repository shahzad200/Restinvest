import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:investintrust/data/models/load_fund_plans.dart';
import 'package:investintrust/data/repository.dart';
import 'package:investintrust/utils/constants.dart';

class F2FTransferScreenController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isChecked = false;
  String accountValue = Constant.loginModel!.response!.accounts![0].folioNumber ?? '';
  String fundvalue = "";

  String fundValue = Constant.loginModel!.response!.accounts![0].userFundBalances![0].fundShort ?? '';
  String fundCode = Constant.loginModel!.response!.accounts![0].userFundBalances![0].fundCode ?? '';
  String toaccountvalue = "";
  String transfervalue = "";

  bool investButton = false;
  bool portfolioButton = false;
  bool buttonclick3 = false;


  final _repository = Repository();
  bool isLoading = false;
  bool noInternet = false;
  LoadFundsPlans? loadFundsPlans;
  @override
  void onInit() async {
      onLoadFundsPlans();
    super.onInit();
  }


  int findIndex(){
    return Constant.loginModel!.response!.accounts!.indexWhere((element) => element.folioNumber == accountValue);
  }

  late int index = 0;
  String? electronicUnit(){
    if(loadFundsPlans != null) {
      index = loadFundsPlans!.response!.portfolioAllocationData!.indexWhere((
          element) => element.fundShort == fundValue);
      return loadFundsPlans!.response!.portfolioAllocationData![index]
          .fundUnits;
    }
  }

  String? fundAmount(){
    if(loadFundsPlans != null) {
    return loadFundsPlans!.response!.portfolioAllocationData![index].fundvolume;
    }
  }
  onLoadFundsPlans() async {
    try {
      isLoading = true;
      update();
      loadFundsPlans = await _repository.onLoadFundsPlans(fundCode, accountValue, "FTF");
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
