import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nit/data/models/common_model.dart';
import 'package:nit/data/models/new_dig_user_reg_data_req_list.dart';
import 'package:nit/data/repository.dart';
import 'package:nit/routes/routes.dart';
import 'package:nit/utils/constants.dart';
import 'package:nit/widgets/constant_widget.dart';


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
  Common? common;

  @override
  void onInit() async {
    // TODO: implement onInit
   await onNewDigUserRegDataRpqList().then((value) {
     if(value){
       if(Constant.validateVerificationCodeForDigUser!.response!.rpqDisclaimerChecked! == true &&
           Constant.validateVerificationCodeForDigUser!.response!.rpqTotalScore! != 0){
         ageGroupValue = Constant.validateVerificationCodeForDigUser!.response!.rpqAge ?? 00;
         maritalStatusGroupValue = Constant.validateVerificationCodeForDigUser!.response!.rpqMaritalStatus ?? 00;
         noOfDependentsGroupValue = Constant.validateVerificationCodeForDigUser!.response!.rpqNoOfDependants ?? 00;
         occupationGroupValue = Constant.validateVerificationCodeForDigUser!.response!.rpqOccupation ?? 00;
         qualificationGroupValue = Constant.validateVerificationCodeForDigUser!.response!.rpqQualification ?? 00;
         riskAppetiteGroupValue = Constant.validateVerificationCodeForDigUser!.response!.rpqRiskAppetite ?? 00;
         investObjGroupValue = Constant.validateVerificationCodeForDigUser!.response!.rpqInvestmentObjective ?? 00;
         investHorizonGroupValue = Constant.validateVerificationCodeForDigUser!.response!.rpqInvestmentHorizon ?? 00;
         investKnowledgeGroupValue = Constant.validateVerificationCodeForDigUser!.response!.rpqInvestmentKnowledge ?? 00;
         financialPositionGroupValue = Constant.validateVerificationCodeForDigUser!.response!.rpqFinacialPosition ?? 00;
         calculateValue = Constant.validateVerificationCodeForDigUser!.response!.rpqTotalScore ?? 00;
         isCalculate = true;
         isChecked = Constant.validateVerificationCodeForDigUser!.response!.rpqDisclaimerChecked ?? false;
       }
     }
   });
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


  Future<bool> onNewDigUserRegDataRpqList() async {
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
      return true;
    } catch (e) {
      if (e.toString() == 'Exception: No Internet') {
        isLoading = false;
        noInternet = true;
        update();
        return false;
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
        return false;
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


  onSaveData() async {
    if(!isCalculate){
      showToast('Please calculate risk');
    }else if(!isChecked){
      showToast('Please check disclaimer');
    } else{
      try {
        isLoading = true;
        update();
        common = await _repository.onPartialSavingForDigUserScreen5(
            ageGroupValue, isChecked, financialPositionGroupValue,
            investHorizonGroupValue, investKnowledgeGroupValue,
            investObjGroupValue, maritalStatusGroupValue,
            noOfDependentsGroupValue, occupationGroupValue, qualificationGroupValue,
            riskAppetiteGroupValue, calculateValue);
        isLoading = false;
        if (noInternet) {
          noInternet = false;
        }
        update();
        if(common!.meta!.message == 'OK' && common!.meta!.code == '200'){
          Get.toNamed(AppRoute.accountOpenUploadScreen);
        }
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
              msg: e.toString().replaceAll('Exception:', ''),
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


}
