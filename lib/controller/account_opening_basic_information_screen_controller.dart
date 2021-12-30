import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AccountOpenBasicInformationScreenController extends GetxController{
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var userName = "".obs;
  var password = "".obs;
  var number = "".obs;
  var email = "".obs;
  String dropdownvalue = "";
  String amountvalue = "";
  String paymentvalue = "";
  bool isChecked=false;

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
}
