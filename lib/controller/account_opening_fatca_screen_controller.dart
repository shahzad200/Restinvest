import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:investintrust/data/models/city_data.dart' as city;
import 'package:investintrust/data/models/state_data.dart' as state;
import 'package:investintrust/data/repository.dart';

import 'account_opening_basic_information_screen_controller.dart';


class AccountOpenFatcaController extends GetxController{
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  // var userName = "".obs;
  // var password = "".obs;
  // var number = "".obs;
  // var email = "".obs;


  String cityValue2 = "";
  String tinNumber = "xzcxzc";
  bool isChecked=false;
  bool termsConditions=false;
  var charactor=0;
  TextEditingController titleController = TextEditingController();

  TextEditingController cnicController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  AccountOpenBasicInformationScreenController controller = Get.find<AccountOpenBasicInformationScreenController>();


  bool isLoading = false;
  bool noInternet = false;
  String countryValue = "";
  String countryCode = "";
  String stateValue = "";
  String stateCode = "";
  String cityValue = "";
  String cityCode = "";
  String birthCityValue = "";
  String birthCityCode = "";
  String taxResCountriesOtherThanPakGroupValue = '0';
  city.CityData? cityData;
  List<state.Response> stateList = [];
  List<city.Response> cityList = [];
  state.StateData? stateData;
  final _repository = Repository();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  onSave (){
    if(titleController.text != null && titleController.text != ""){
      print("title");
      if(cnicController.text != null && cnicController.text != ""){
        print("cnic");
        if(countryValue != null && countryValue != ""){
          print("country value");
          if(stateValue != null && stateValue != ""){
            print("state");
            if(cityValue != null && cityValue != ""){
              print("city");
              if(termsConditions != null && termsConditions != false){
                print("terms conditions");
                if(cityValue2 != null && cityValue2 != ""){
                  print("city2");
                  if(tinNumber != null && tinNumber != ""){
                    print("tin number");
                    if(isChecked != null && isChecked != false){

                        print("success");
                    }else{
                      Fluttertoast.showToast(
                          msg: "Please check disclaimer",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  }else{
                    Fluttertoast.showToast(
                        msg: "Tin Number should not empty",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                }else{
                  Fluttertoast.showToast(
                      msg: "Select city",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
              }else{
                Fluttertoast.showToast(
                    msg: "Please check term & condition",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
            }else{
              Fluttertoast.showToast(
                  msg: "Select city",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          }else{
            Fluttertoast.showToast(
                msg: "Select state",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        }else{
          Fluttertoast.showToast(
              msg: "Select country",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      }else{
        Fluttertoast.showToast(
            msg: "Give cnic/nicop",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }else{
      Fluttertoast.showToast(
          msg: "Give account Title",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  onCityData(String countryCode) async {
    try {
      cityList = [];
      birthCityValue = "";
      isLoading = true;
      update();
      cityData = await _repository.onCityData(countryCode);
      cityData!.response!.forEach((element) {
        cityList.add(element);
      });
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
  onStateData(String countryCode) async {
    try {
      stateList = [];
      stateValue = "";
      isLoading = true;
      update();
      stateData = await _repository.onStateData(countryCode);
      stateData!.response!.forEach((element) {
        stateList.add(element);
      });
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
