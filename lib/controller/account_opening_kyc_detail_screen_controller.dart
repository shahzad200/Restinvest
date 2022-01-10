import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'account_opening_basic_information_screen_controller.dart';
import 'account_opening_request_screen_controller.dart';


class AccountOpenKycDetailScreenController extends GetxController{
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var userName = "".obs;
  var password = "".obs;
  var number = "".obs;
  var email = "".obs;
  AccountOpenBasicInformationScreenController controller = Get.find<AccountOpenBasicInformationScreenController>();
  String dropdownvalue = "";
  String amountvalue = "";
  String paymentvalue = "";
  bool isChecked=false;
  var charactor=0;
  var income=0;
  var source=0;
  var transaction=0;
  var rupees=0;
  var mode=0;
  var modetransaction=0;
  String occupationGroupValue = '0';
  String inComeGroupValue = '0';
  String transactionGroupValue = '0';
  String turnoverGroupValue = '0';
  String annualIncomeGroupValue = '0';
  String expectedIncomeGroupValue = '0';

  TextEditingController userNameController = TextEditingController();

  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void updateUserName(value) {
    userName(value);
    update();
  }

  void updatePassword(value) {
    password(value);
    update();
  }
  void updateEmail(value) {
    email(value);
    update();
  }

  void updateNumber(value) {
    number(value);
    update();
  }


  // void handleRadioValueChange(String value) {
  //   groupValue = value;
  //   printInfo(info: value.toString() + 'JHGJHGJG');
  //   update();
  // }


}
