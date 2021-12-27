import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../data/models/city_data.dart';
import '../data/models/city_sector_model.dart';
import '../data/models/new_user_pin_gen.dart';
import '../data/models/new_user_reg.dart';
import '../data/repository.dart';




class GenerateCodeScreenController extends GetxController{
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController otherCityController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cellController = TextEditingController();
  TextEditingController faxController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();

  String countryValue = "";
  String countryCode = "";
  String cityValue = "";
  String cityCode = "";
  String sectorValue = "";
  String sectorCode = "";
  String religionValue = "";
  String religionCode = "";
  String genderValue = "";
  String maritalStatusValue = "";
  String filerValue = "";
  String dateOfBirth = "";

  final _repository = Repository();
  bool isLoading = false;
  bool noInternet = false;
  CityData? cityData;
  CitySector? citySector;
  bool sectorResponse = false;
  NewUserPinGenration? newUserPinGenration;
  NewUserRegister? newUserRegister;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  onCityData(String countryCode) async {
    try {
      isLoading = true;
      update();
      cityData = await _repository.onCityData(countryCode);
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

  onCitySectorData(String cityCode) async {
    try {
      isLoading = true;
      update();
      citySector = await _repository.onCitySectorData(cityCode);
      // citySector.response ?? sectorResponse = true;
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

  onNewUserPinGenration(String address,
      String cell, String cNic, String email) async {
    try {
      isLoading = true;
      update();
      newUserPinGenration = await _repository.onNewUserPinGenration(address, cell, cNic, email);
      // citySector.response ?? sectorResponse = true;
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

  onRegNewUser(String title, String fatherOrHusbandName, String cnicIsueDate,
      String cNicExpiryDate, String address, String country, String phone,
      String cell, String email, String gender, String occupation,
      String incomeSource, String name, String cnic, String passport,
      String ntn, String city, String otherCity, String sector, String fax,
      String birthDate, String maritalStatus, String incomeBracket, String religion,
      String filerNonFiler, String pinCode, String pinCodeExpiryConfigID
      ) async {

    try {

      isLoading = true;
      update();
      newUserRegister = await _repository.onRegNewUser(title, fatherOrHusbandName,
          cnicIsueDate, cNicExpiryDate,
          address, country, phone, cell, email, gender == 'Male' ? 'M' : 'F',
          occupation, incomeSource, name, cnic, passport,
          ntn, city, otherCity, sector, fax, birthDate,
          maritalStatus, incomeBracket, religion, filerNonFiler,
          pinCode, pinCodeExpiryConfigID);
      // citySector.response ?? sectorResponse = true;
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