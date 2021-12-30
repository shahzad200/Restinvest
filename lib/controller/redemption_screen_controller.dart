import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:investintrust/data/models/login_model.dart';
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
  List<String> fundNameListItems = [];


  @override
  void onInit() {
    amountvalue = Constant.loginModel!.response!.accounts![0].folioNumber!;
    Constant.loginModel!.response!.accounts![0].userFundBalances!.forEach((element) {
      fundNameListItems.add(element.fundShort!);
    });
    if(fundNameListItems.isNotEmpty){
      fundNamevalue = fundNameListItems[0];
    }
    update();
    super.onInit();
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
