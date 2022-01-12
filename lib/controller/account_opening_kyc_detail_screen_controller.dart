import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
      Fluttertoast.showToast(
          msg: 'Please select occupation/profession',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if(inComeGroupValue == '00'){
      Fluttertoast.showToast(
          msg: 'Please select source of income',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if(employerController.text == "" || employerController.text.isEmpty || employerController.text == null){
      Fluttertoast.showToast(
          msg: 'Please enter name of employer',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if(designationController.text == "" || designationController.text.isEmpty || designationController.text == null) {
      Fluttertoast.showToast(
          msg: 'Please enter designation',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }else if(geoDomesticController.text == "" || geoDomesticController.text.isEmpty || geoDomesticController.text == null) {
      Fluttertoast.showToast(
          msg: 'Please enter geographic involved domestic',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }else if(geoInternationalController.text == "" || geoInternationalController.text.isEmpty || geoInternationalController.text == null) {
      Fluttertoast.showToast(
          msg: 'Please enter geographic involved international',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }else if(counterDomesticController.text == "" || counterDomesticController.text.isEmpty || counterDomesticController.text == null) {
      Fluttertoast.showToast(
          msg: 'Please enter counter parties domestic',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }else if(counterInternationalController.text == "" || counterInternationalController.text.isEmpty || counterInternationalController.text == null) {
      Fluttertoast.showToast(
          msg: 'Please enter counter parties international',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }else if(transactionGroupValue == "00") {
      Fluttertoast.showToast(
          msg: 'Please select preferred mood of transaction',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }else if(turnoverGroupValue == "00") {
      Fluttertoast.showToast(
          msg: 'Please select expected turnover',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }else if(expectedIncomeGroupValue == "00") {

    }else if(annualIncomeGroupValue == "00") {

    }else if(!isChecked){

    }

    }


}
