
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PinConfirmationController extends GetxController{
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();



  var accountNo = "".obs;
  var securityCode = "".obs;
  void updateAccountNumber(value) {
    accountNo(value);
    update();
  }

  void updateSecurityCode(value) {
    securityCode(value);
    update();
  }

  TextEditingController accountNoController = TextEditingController();
  TextEditingController securityCodeController = TextEditingController();
  bool isLoading = false;
  bool noInternet = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }






}
