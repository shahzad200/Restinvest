import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:investintrust/data/models/new_dig_user_reg_data_req_list.dart';
import 'package:investintrust/data/repository.dart';


class AccountOpenRiskProfileScreenController extends GetxController{
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
  var charactor=0;
  var status=0;
  var occupation=0;
  var qualification=0;
  var object=0;
  var horzon=0;
  var knowledge=0;
  var Currentposition=0;
  var dependent =0;
  TextEditingController userNameController = TextEditingController();

  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool noInternet = false;
  NewDigUserRegDataRpqList? newDigUserRegDataRpqList;
  final _repository = Repository();
  int ageGroupValue = 00;
  int maritalStatusGroupValue = 00;
  int noOfDependentsGroupValue = 00;
  int occupationGroupValue = 00;
  int qualificationGroupValue = 00;
  int riskAppetiteGroupValue = 00;
  int investObjGroupValue = 00;
  int investHorizonGroupValue = 00;
  int investKnowledgeGroupValue = 00;
  int financialPositionGroupValue = 00;

  int ageScore = 0;
  int maritalStatusScore = 0;
  int noOfDependentsScore = 0;
  int occupationScore = 0;
  int qualificationScore = 0;
  int riskAppetiteScore = 0;
  int investObjScore = 0;
  int investHorizonScore = 0;
  int investKnowledgeScore = 0;
  int financialPositionScore = 0;

  bool isCalculate = false;
  int calculateValue = 0;

  @override
  void onInit() {
    // TODO: implement onInit
    onNewDigUserRegDataRpqList();
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


  onNewDigUserRegDataRpqList() async {
    try {
      isLoading = true;
      update();
      newDigUserRegDataRpqList =
      await _repository.onNewDigUserRegDataRpqList();
      isLoading = false;
      if (noInternet) {
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

  void calculateRisk() {
    if(ageGroupValue == 00){
      Fluttertoast.showToast(
          msg: 'Please Select Age',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }else if(maritalStatusGroupValue == 00){
      Fluttertoast.showToast(
          msg: 'Please Select Martial Status',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }else if(noOfDependentsGroupValue == 00){
      Fluttertoast.showToast(
          msg: 'Please Select No. of Dependent',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }else if(occupationGroupValue == 00){
      Fluttertoast.showToast(
          msg: 'Please Select Occupation',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }else if(qualificationGroupValue == 00){
      Fluttertoast.showToast(
          msg: 'Please Select Qualification',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }else if(riskAppetiteGroupValue == 00){
      Fluttertoast.showToast(
          msg: 'Please Select Risk Appetite',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }else if(investObjGroupValue == 00){
      Fluttertoast.showToast(
          msg: 'Please Select Investment Objective',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }else if(investHorizonGroupValue == 00){
      Fluttertoast.showToast(
          msg: 'Please Select Investment Horizon',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }else if(investKnowledgeGroupValue == 00){
      Fluttertoast.showToast(
          msg: 'Please Select Investment Knowledge',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }else if(financialPositionGroupValue == 00){
      Fluttertoast.showToast(
          msg: 'Please Select Investment Position',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }else {
      if(!isCalculate){
        isCalculate = true;
      }
      calculateValue = ageScore + maritalStatusScore + noOfDependentsScore +
          occupationScore + qualificationScore + riskAppetiteScore + investObjScore
          + investHorizonScore
          + investKnowledgeScore + financialPositionScore ;
      update();
    }

  }

}
