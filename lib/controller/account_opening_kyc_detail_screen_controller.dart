import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:investintrust/routes/routes.dart';
import 'package:investintrust/widgets/constant_widget.dart';

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
  String occupationGroupValue = '00';
  String inComeGroupValue = '00';
  String transactionGroupValue = '00';
  String turnoverGroupValue = '00';
  String annualIncomeGroupValue = '00';
  String expectedIncomeGroupValue = '00';

  TextEditingController employerController = TextEditingController();

  TextEditingController designationController = TextEditingController();
  TextEditingController natureOfBusinessController = TextEditingController();

  TextEditingController professionController = TextEditingController();
  TextEditingController geoDomesticController = TextEditingController();
  TextEditingController geoInternationalController = TextEditingController();
  TextEditingController counterDomesticController = TextEditingController();
  TextEditingController counterInternationalController = TextEditingController();
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


  onSaveDataKycDetail(){
    if(occupationGroupValue == '00'){
      showToast('Please select occupation/profession');
    } else if(inComeGroupValue == '00'){
      showToast('Please select source of income');
    } else if(employerController.text == "" || employerController.text.isEmpty || employerController.text == null){
      showToast('Please enter name of employer');
    } else if(designationController.text == "" || designationController.text.isEmpty || designationController.text == null) {
      showToast('Please enter designation');
    }else if(geoDomesticController.text == "" || geoDomesticController.text.isEmpty || geoDomesticController.text == null) {
      showToast('Please enter geographic involved domestic');
    }else if(geoInternationalController.text == "" || geoInternationalController.text.isEmpty || geoInternationalController.text == null) {
      showToast('Please enter geographic involved international');
    }else if(counterDomesticController.text == "" || counterDomesticController.text.isEmpty || counterDomesticController.text == null) {
      showToast('Please enter counter parties domestic');
    }else if(counterInternationalController.text == "" || counterInternationalController.text.isEmpty || counterInternationalController.text == null) {
      showToast('Please enter counter parties international');
    }else if(transactionGroupValue == "00") {
      showToast('Please select preferred mood of transaction');
    }else if(turnoverGroupValue == "00") {
      showToast('Please select expected turnover');
    }else if(expectedIncomeGroupValue == "00") {
      showToast('Please select expected investment amount');
    }else if(annualIncomeGroupValue == "00") {
      showToast('Please select annual income');
    }else if(!isChecked){
      showToast('Please check disclaimer');
    } else {
      Get.toNamed(AppRoute.accountOpenFatcaScreen);
    }

    }


}
