import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:investintrust/data/models/city_data.dart';
import 'package:investintrust/data/models/new_dig_user_reg_data_after_otp.dart';
import 'package:investintrust/data/repository.dart';
import 'package:investintrust/routes/routes.dart';


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
  TextEditingController nameController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  TextEditingController mNameController = TextEditingController();
  TextEditingController cNicController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController officePhoneController = TextEditingController();
  TextEditingController currentAddressController = TextEditingController();
  TextEditingController mailingAddressController = TextEditingController();
  TextEditingController eMailAddressController = TextEditingController();
  TextEditingController bankBranchController = TextEditingController();
  TextEditingController iBanNumberController = TextEditingController();
  NewDigUserRegDataAfterOTP? newDigUserRegDataAfterOTP;
  CityData? mailingCityData;
  CityData? currentCityData;
  bool isMailingCity = false;
  bool isLoading = false;
  bool noInternet = false;
  String titleValue = "";
  String cNicIssueDate = "";
  String dObDate = "";
  String cNicExpDate = "";
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
  String dividendMandateGroupValue = "00";
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

  String dateTime(DateTime date){
    return date.day.toString()+'/'+date.month.toString()+'/'+date.year.toString();
  }

  onSaveDataAccountOpeningBasicInfo(){
    if(titleValue == "" && titleCode == ""){
      Fluttertoast.showToast(
          msg: 'Please select title',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if(nameController.text == "" || nameController.text.isEmpty || nameController.text == null){
      Fluttertoast.showToast(
          msg: 'Please enter full name',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if(fNameController.text == "" || fNameController.text.isEmpty || fNameController.text == null){
      Fluttertoast.showToast(
          msg: 'Please enter father/husband name',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if(mNameController.text == "" || mNameController.text.isEmpty || mNameController.text == null){
      Fluttertoast.showToast(
          msg: 'Please enter mother name',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if(cNicController.text == "" || cNicController.text.isEmpty || cNicController.text == null){
      Fluttertoast.showToast(
          msg: 'Please enter cnic name',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if(cNicIssueDate == ""){
      Fluttertoast.showToast(
          msg: 'Please select cnic issue date',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if(cNicExpDate == ""){
      Fluttertoast.showToast(
          msg: 'Please select cnic expire date',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if(dObDate == ""){
      Fluttertoast.showToast(
          msg: 'Please select date of birth date',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if(martialValue == "" && martialCode == ""){
      Fluttertoast.showToast(
          msg: 'Please select martial status',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if(nationalityValue == "" && nationalityCode == ""){
      Fluttertoast.showToast(
          msg: 'Please select Nationality',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if(residentStatusValue == "" && residentStatusCode == ""){
      Fluttertoast.showToast(
          msg: 'Please select residential status',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if(religionValue == "" && religionCode == ""){
      Fluttertoast.showToast(
          msg: 'Please select religion',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if(zaKatValue == "" && zaKatCode == ""){
      Fluttertoast.showToast(
          msg: 'Please select zakat exemption',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if(retirementValue == "" && retirementCode == ""){
      Fluttertoast.showToast(
          msg: 'Please select retirement age',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }  else if(mobileController.text == "" || mobileController.text.isEmpty || mobileController.text == null){
      Fluttertoast.showToast(
          msg: 'Please enter mobile number',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if(phoneController.text == "" || phoneController.text.isEmpty || phoneController.text == null){
      Fluttertoast.showToast(
          msg: 'Please enter phone number',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if(officePhoneController.text == "" || officePhoneController.text.isEmpty || officePhoneController.text == null){
      Fluttertoast.showToast(
          msg: 'Please enter office phone number',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if(currentAddressController.text == "" || currentAddressController.text.isEmpty || currentAddressController.text == null){
      Fluttertoast.showToast(
          msg: 'Please enter current address',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if(mailingAddressController.text == "" || mailingAddressController.text.isEmpty || mailingAddressController.text == null){
      Fluttertoast.showToast(
          msg: 'Please enter mailing address',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if(eMailAddressController.text == "" || eMailAddressController.text.isEmpty || eMailAddressController.text == null){
      Fluttertoast.showToast(
          msg: 'Please enter email address',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if(mailingCountryValue == "" && mailingCountryCode == ""){
      Fluttertoast.showToast(
          msg: 'Please select mailing country',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if(mailingCityValue == "" && mailingCityCode == ""){
      Fluttertoast.showToast(
          msg: 'Please select mailing city',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if(currentCountryValue == "" && currentCountryCode == ""){
      Fluttertoast.showToast(
          msg: 'Please select current country',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if(currentCityValue == "" && currentCityCode == ""){
      Fluttertoast.showToast(
          msg: 'Please select current city',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if(bankNameValue == "" && bankNameCode == ""){
      Fluttertoast.showToast(
          msg: 'Please select bank name',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if(bankCityValue == "" && bankCityCode == ""){
      Fluttertoast.showToast(
          msg: 'Please select bank city',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if(bankBranchController.text == "" || bankBranchController.text.isEmpty || bankBranchController.text == null){
      Fluttertoast.showToast(
          msg: 'Please enter bank branch name',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if(iBanNumberController.text == "" || iBanNumberController.text.isEmpty || iBanNumberController.text == null){
      Fluttertoast.showToast(
          msg: 'Please enter IBAN number',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if(dividendMandateGroupValue == '00'){
      Fluttertoast.showToast(
          msg: 'Please select dividend mandate',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if(!isChecked){
      Fluttertoast.showToast(
          msg: 'Please check disclaimer',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Get.toNamed(
          AppRoute.accountOpenKycDetailScreen);
    }



  }


}
