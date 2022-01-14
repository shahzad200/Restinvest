import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:investintrust/data/models/city_data.dart' as city;
import 'package:investintrust/data/models/common_model.dart';
import 'package:investintrust/data/models/state_data.dart' as state;
import 'package:investintrust/data/repository.dart';
import 'package:investintrust/routes/routes.dart';
import 'package:investintrust/widgets/constant_widget.dart';
import 'package:investintrust/widgets/custome_dialog.dart';

import 'account_opening_basic_information_screen_controller.dart';

class AccountOpenFatcaController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  // var userName = "".obs;
  // var password = "".obs;
  // var number = "".obs;
  // var email = "".obs;

  String cityValue2 = "";
  String tinNumber = "xzcxzc";
  bool disclaimerIsChecked = false;
  bool termsConditions = false;
  var charactor = 0;
  TextEditingController titleController = TextEditingController();

  TextEditingController cnicController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  AccountOpenBasicInformationScreenController controller =
      Get.find<AccountOpenBasicInformationScreenController>();

  bool isLoading = false;
  bool noInternet = false;
  String countryValue = "";
  String countryCode = "";
  String stateValue = "";
  String stateCode = "";
  String taxCountryValue = "";
  String cityCode = "";
  String taxCountryCode = "";
  String birthCityValue = "";
  String birthCityCode = "";
  String taxResCountriesOtherThanPakGroupValue = '0';
  city.CityData? cityData;
  List<state.Response> stateList = [];
  List<city.Response> cityList = [];
  state.StateData? stateData;
  Common? common;
  final _repository = Repository();
  List<Map<dynamic, dynamic>> list = [
    {
      "answer": false,
      "questionCode": 1,
    },{
      "answer": false,
      "questionCode": 2,
    },{
      "answer": false,
      "questionCode": 3,
    },{
      "answer": false,
      "questionCode": 4,
    },{
      "answer": false,
      "questionCode": 5,
    },{
      "answer": false,
      "questionCode": 6,
    },{
      "answer": false,
      "questionCode": 7,
    }
  ];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  onSave(context) async {
    if (titleController.text != null && titleController.text != "") {
      print("title");
      if (cnicController.text != null && cnicController.text != "") {
        print("cnic");
        if (countryValue != null && countryValue != "") {
          print("country value");
          if (stateValue != null && stateValue != "") {
            print("state");
            if (taxCountryValue != null && taxCountryValue != "") {
              print("city");
              if ( termsConditions != false) {
                print("terms conditions");
                if (birthCityValue != null && birthCityValue != "") {
                  print("city2");
                  if (tinNumber != null && tinNumber != "") {
                    print("tin number");
                    if (disclaimerIsChecked != false) {
                      try {
                        CustomDialog(context);
                        isLoading = true;
                        update();
                        print("cnic${cnicController.text}");
                        print("citycode${cityCode}");
                        print("cityvalue${taxCountryValue}");
                        print("counrty${countryCode}");
                        print("state${stateCode}");
                        print("disclaim${disclaimerIsChecked}");
                        print("term${termsConditions}");
                        print("birthcity${birthCityCode}");
                        print("then${taxResCountriesOtherThanPakGroupValue}");
                        print("title${titleController.text}");
                        print("list${list}");
                         common =
                        await _repository.onFatcaScreenForDigUser(
                            birthCityCode,
                            countryCode,
                            stateCode,
                            disclaimerIsChecked,
                            termsConditions,
                            taxCountryValue,
                            cityCode,
                            taxResCountriesOtherThanPakGroupValue,
                            titleController.text,
                            list);
                         print(common.toString());
                        isLoading = false;
                        if (noInternet) {
                          noInternet = false;
                        }
                        update();
                        if (common!.meta!.message == 'OK' &&
                            common!.meta!.code == '200') {
                          // Get.back();
                          Get.toNamed(AppRoute.accountOpenURiskScreen);
                        } else {
                          Get.back();
                          customDialogPin(
                              context, common!.meta!.error.toString());
                        }
                      } catch (e) {
                        // Get.back();
                        if (e.toString() == 'Exception: No Internet') {
                          isLoading = false;
                          noInternet = true;
                          update();
                        } else {
                          Get.back();
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
                    } else {
                      showToast('Please check disclaimer');
                    }
                  } else {
                    showToast('Tin Number should not empty');
                  }
                } else {
                  showToast('Select city');
                }
              } else {
                showToast('Please check term & condition');
              }
            } else {
              showToast('Select city');
            }
          } else {
            showToast('Select state');
          }
        } else {
          showToast('Select country');
        }
      } else {
        showToast('Give cnic/nicop');
      }
    } else {
      showToast('Give account Title');
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
        showToast(e.toString());
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
        showToast(e.toString());
      }
    }
  }
}
