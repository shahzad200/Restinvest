import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:investintrust/data/models/city_data.dart';
import 'package:investintrust/data/models/new_dig_user_reg_data_after_otp.dart';
import 'package:investintrust/data/repository.dart';
import 'package:investintrust/routes/routes.dart';
import 'package:investintrust/widgets/constant_widget.dart';


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
        showToast(e.toString());
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
        showToast(e.toString());
      }
    }
  }

  String dateTime(DateTime date){
    return date.day.toString()+'/'+date.month.toString()+'/'+date.year.toString();
  }

  onSaveDataAccountOpeningBasicInfo(){
    if(titleValue == "" && titleCode == ""){
      showToast('Please select title');
    } else if(nameController.text == "" || nameController.text.isEmpty || nameController.text == null){
      showToast('Please enter full name');
    } else if(fNameController.text == "" || fNameController.text.isEmpty || fNameController.text == null){
      showToast('Please enter father/husband name');
    } else if(mNameController.text == "" || mNameController.text.isEmpty || mNameController.text == null){
      showToast('Please enter mother name');
    } else if(cNicController.text == "" || cNicController.text.isEmpty || cNicController.text == null){
      showToast('Please enter cnic name');
    } else if(cNicIssueDate == ""){
      showToast('Please select cnic issue date');
    } else if(cNicExpDate == ""){
      showToast('Please select cnic expire date');
    } else if(dObDate == ""){
      showToast('Please select date of birth date');
    } else if(martialValue == "" && martialCode == ""){
      showToast('Please select martial status');
    } else if(nationalityValue == "" && nationalityCode == ""){
      showToast('Please select Nationality');
    } else if(residentStatusValue == "" && residentStatusCode == ""){
      showToast('Please select residential status');
    } else if(religionValue == "" && religionCode == ""){
      showToast('Please select religion');
    } else if(zaKatValue == "" && zaKatCode == ""){
      showToast('Please select zakat exemption');
    } else if(retirementValue == "" && retirementCode == ""){
      showToast('Please select retirement age');
    }  else if(mobileController.text == "" || mobileController.text.isEmpty || mobileController.text == null){
      showToast('Please enter mobile number');
    } else if(phoneController.text == "" || phoneController.text.isEmpty || phoneController.text == null){
      showToast('Please enter phone number');
    } else if(officePhoneController.text == "" || officePhoneController.text.isEmpty || officePhoneController.text == null){
      showToast('Please enter office phone number');
    } else if(currentAddressController.text == "" || currentAddressController.text.isEmpty || currentAddressController.text == null){
      showToast('Please enter current address');
    } else if(mailingAddressController.text == "" || mailingAddressController.text.isEmpty || mailingAddressController.text == null){
      showToast('Please enter mailing address');
    } else if(eMailAddressController.text == "" || eMailAddressController.text.isEmpty || eMailAddressController.text == null){
      showToast('Please enter email address');
    } else if(mailingCountryValue == "" && mailingCountryCode == ""){
      showToast('Please select mailing country');
    } else if(mailingCityValue == "" && mailingCityCode == ""){
      showToast('Please select mailing city');
    } else if(currentCountryValue == "" && currentCountryCode == ""){
      showToast('Please select current country');
    } else if(currentCityValue == "" && currentCityCode == ""){
      showToast('Please select current city');
    } else if(bankNameValue == "" && bankNameCode == ""){
      showToast('Please select bank name');
    } else if(bankCityValue == "" && bankCityCode == ""){
      showToast('Please select bank city');
    } else if(bankBranchController.text == "" || bankBranchController.text.isEmpty || bankBranchController.text == null){
      showToast('Please enter bank branch name');
    } else if(iBanNumberController.text == "" || iBanNumberController.text.isEmpty || iBanNumberController.text == null){
      showToast('Please enter IBAN number');
    } else if(dividendMandateGroupValue == '00'){
      showToast('Please select dividend mandate');
    } else if(!isChecked){
      showToast('Please check disclaimer');
    } else {
      Get.toNamed(
          AppRoute.accountOpenKycDetailScreen);
    }
  }


}
