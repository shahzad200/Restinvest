
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nit/data/models/city_data.dart' as city;
import 'package:nit/data/models/common_model.dart';
import 'package:nit/data/models/state_data.dart' as state;
import 'package:nit/data/repository.dart';
import 'package:nit/routes/routes.dart';
import 'package:nit/utils/constants.dart';
import 'package:nit/widgets/constant_widget.dart';


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
  var character = 0;
  TextEditingController titleController = TextEditingController();
  TextEditingController tinNumberController = TextEditingController();
  TextEditingController taxResCountryController = TextEditingController();
  TextEditingController cnicController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  AccountOpenBasicInformationScreenController controller =
      Get.find<AccountOpenBasicInformationScreenController>();

  bool isLoading = false;
  bool noInternet = false;
  String countryValue = "PAKISTAN";
  String countryCode = "001";
  String stateValue = "";
  String stateCode = "";
  String taxCountryValue = "PAKISTAN";
  String cityCode = "";
  String taxCountryCode = "001";
  String birthCityValue = "";
  String birthCityCode = "";
  String taxResCountriesOtherThanPakGroupValue = 'N';
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

    titleController.text = Constant.uTitle;
    cnicController.text = Constant.cNic;
    if(Constant.validateVerificationCodeForDigUser!.response!.fatcaDisclaimerChecked == true
    && Constant.validateVerificationCodeForDigUser!.response!.crsDisclaimerChecked == true)
      {
        countryCode = Constant.validateVerificationCodeForDigUser!.response!.birthCountryCode ?? '001';
        if(countryCode != null || countryCode != ''){
          controller.newDigUserRegDataAfterOTP!.response!.countries!.indexWhere((element){
            if(element.countryCode == countryCode){
              countryValue = element.countryName!;
              onStateData(countryCode).then((value){
                onCityData(countryCode).then((value) {
                  stateCode = Constant.validateVerificationCodeForDigUser!.response!.birthStateCode ?? '';
                  if(stateCode != null || stateCode != ''){
                     int index = stateList.indexWhere((element) => element.code == stateCode);
                     printInfo(info: 'IINNDDEECX'+index.toString());
                     stateValue = stateList[index].description!;
                    // stateList!.indexWhere((element) {
                    //   printInfo(info: element.code!+'HJGHJHGJ'+birthCityCode);
                    //   if(element.code == stateCode){
                    //     stateValue = element.description!;
                    //   }
                    //   return true;
                    // });
                  }
                  birthCityCode = Constant.validateVerificationCodeForDigUser!.response!.birthCityCode ?? '';
                  if(birthCityCode != null || birthCityCode != ''){
                    int index = cityList.indexWhere((element) => element.cityCode == birthCityCode);
                    printInfo(info: 'IINNDDEECX'+index.toString());
                    birthCityValue = cityList[index].cityName!;
                    // cityList!.indexWhere((element) {
                    //   printInfo(info: element.cityCode!+'HJGHJHGJ'+birthCityCode);
                    //   if(element.cityCode == birthCityCode){
                    //     birthCityValue = element.cityName!;
                    //   }
                    //   return true;
                    // });
                  }
                });
              });
              return true;
            }else{
              return false;
            }
          });
        }

        taxResCountriesOtherThanPakGroupValue = Constant.validateVerificationCodeForDigUser!.response!.taxResCountryOtherThanPak == ''
        ? 'N' : Constant.validateVerificationCodeForDigUser!.response!.taxResCountryOtherThanPak ?? 'N';

        if(taxResCountriesOtherThanPakGroupValue == 'oth'){
          taxResCountryController.text = Constant.validateVerificationCodeForDigUser!.response!.otherTaxResCountry ?? '';
        }

        if(controller.newDigUserRegDataAfterOTP!.response!.fatcaInfoList!.length == Constant.validateVerificationCodeForDigUser!.response!.fatcaInfo!.length )
        {
          for(int k = 0 ; k < controller.newDigUserRegDataAfterOTP!.response!.fatcaInfoList!.length ; k++)
          {
            controller.newDigUserRegDataAfterOTP!.response!.fatcaInfoList![k].answer =
                Constant.validateVerificationCodeForDigUser!.response!.fatcaInfo![k].answer;
          }
        }
        termsConditions = Constant.validateVerificationCodeForDigUser!.response!.crsDisclaimerChecked ?? false;

        taxCountryCode = Constant.validateVerificationCodeForDigUser!.response!.taxPaidCountry ?? '001';
        if(taxCountryCode != null || taxCountryCode != '')
          {
            controller.newDigUserRegDataAfterOTP!.response!.nationalities!.indexWhere((element) {
              if(element.countryCode == taxCountryCode) {
                taxCountryValue = element.countryName!;
                return true;
              } else{
                return false;
              }

            });
          }
        if(taxCountryCode != '001' && taxCountryCode != ''){
          tinNumberController.text = Constant.validateVerificationCodeForDigUser!.response!.taxIdentificationNumber ?? '';
        }
        disclaimerIsChecked = termsConditions = Constant.validateVerificationCodeForDigUser!.response!.fatcaDisclaimerChecked ?? false;
      }else {
      onStateData(
          countryCode).then((value){
        onCityData(countryCode);
      });
    }





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
                    if (disclaimerIsChecked != false) {
                      if(taxCountryCode != '001'){
                        if(tinNumberController.text != null && tinNumberController.text != "")
                        {
                          if(taxResCountriesOtherThanPakGroupValue != 'oth'){
                            onSaveData(context);
                          } else{
                            if(taxResCountryController.text != null && taxResCountryController.text != '')
                            {
                              onSaveData(context);
                            } else{
                              showToast('Please enter tax residential country');
                            }
                          }
                        }else{
                          showToast('Please enter Tin Number');
                        }
                      }else{
                        if(taxResCountriesOtherThanPakGroupValue != 'oth'){
                          onSaveData(context);
                        } else{
                          if(taxResCountryController.text != null && taxResCountryController.text != '')
                          {
                            onSaveData(context);
                          } else{
                            showToast('Please enter tax residential country');
                          }
                        }
                      }
                    } else {
                      showToast('Please check disclaimer');
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

  onSaveData(BuildContext context) async{
    try {
      // CustomDialog(context);
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
          taxCountryCode,
          taxResCountriesOtherThanPakGroupValue,
          taxResCountriesOtherThanPakGroupValue == 'oth' ? taxResCountryController.text : '',
          titleController.text,
          list,taxCountryCode == '001' ? '' : tinNumberController.text);
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
        customDialogPinn(context,e.toString().replaceAll('Exception:', ''));
        // Fluttertoast.showToast(
        //     msg: e.toString().replaceAll('Exception:', ''),
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 5,
        //     backgroundColor: Colors.black,
        //     textColor: Colors.white,
        //     fontSize: 16.0);
      }
    }
  }


 Future<bool> onCityData(String countryCode) async {
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
        showToast(e.toString());
        return false;
      }
    }
  }

  Future<bool> onStateData(String countryCode) async {
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
        showToast(e.toString());
        return false;
      }
    }
  }
}
