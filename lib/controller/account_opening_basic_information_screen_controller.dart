import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:investintrust/data/models/city_data.dart';
import 'package:investintrust/data/models/new_dig_user_reg_data_after_otp.dart';
import 'package:investintrust/data/repository.dart';


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
  String groupValue = '-1';
  var charactor=0;
  TextEditingController userNameController = TextEditingController();

  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  NewDigUserRegDataAfterOTP? newDigUserRegDataAfterOTP;
  CityData? mailingCityData;
  CityData? currentCityData;
  bool isMailingCity = false;
  bool isLoading = false;
  bool noInternet = false;
  String titleValue = "";
  String titleCode = "";
  String martialValue = "";
  String martialCode = "";
  String nationalityValue = "";
  String nationalityCode = "";
  String residentStatusValue = "";
  String residentStatusCode = "";
  String religionValue = "";
  String religionCode = "";
  String zaKatValue = "";
  String zaKatCode = "";
  String retirementValue = "";
  String retirementCode = "";
  String currentCountryValue = "";
  String currentCountryCode = "";
  String mailingCountryValue = "";
  String mailingCountryCode = "";
  String mailingCityValue = "";
  String mailingCityCode = "";
  String currentCityValue = "";
  String currentCityCode = "";
  String bankNameValue = "";
  String bankNameCode = "";
  String bankCityValue = "";
  String bankCityCode = "";

  final _repository = Repository();
  @override
  void onInit() {
    // TODO: implement onInit
    onNewDigUserRegDataAfterOTP();
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

  onNewDigUserRegDataAfterOTP() async {
    try {
      isLoading = true;
      update();
      newDigUserRegDataAfterOTP =
      await _repository.onNewDigUserRegDataAfterOTP();
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


  onCityData(String countryCode) async {
    try {
      isLoading = true;
      update();
      if(isMailingCity) {
        mailingCityData = await _repository.onCityData(countryCode);
      }else {
        currentCityData = await _repository.onCityData(countryCode);
      }

      isLoading = false;
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
