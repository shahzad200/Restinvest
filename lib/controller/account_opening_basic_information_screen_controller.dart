import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:investintrust/data/models/city_data.dart';
import 'package:investintrust/data/models/common_model.dart';
import 'package:investintrust/data/models/new_dig_user_reg_data_after_otp.dart';
import 'package:investintrust/data/repository.dart';
import 'package:investintrust/routes/routes.dart';
import 'package:investintrust/utils/constants.dart';
import 'package:investintrust/widgets/constant_widget.dart';

import 'account_opening_request_screen_controller.dart';


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
  bool isLifTime=false;
  String groupValue = '-1';
  var charactor=0;

  AccountOpenRequestScreenController controller = Get.find<AccountOpenRequestScreenController>();

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
  TextEditingController kinNameController = TextEditingController();
  TextEditingController kiNcNicController = TextEditingController();
  TextEditingController kinRelationController = TextEditingController();
  TextEditingController kinMobileNumberController = TextEditingController();

  TextEditingController otherCityController = TextEditingController();
  TextEditingController otherMailingController = TextEditingController();

  NewDigUserRegDataAfterOTP? newDigUserRegDataAfterOTP;
  CityData? mailingCityData;
  CityData? currentCityData;
  bool isMailingCity = false;
  bool isLoading = false;
  bool noInternet = false;
  String titleValue = "";
  String cNicIssueDate = DateTime.now().day.toString()+'/'+DateTime.now().month.toString()+'/'+DateTime.now().year.toString();
  String dObDate = DateTime.now().day.toString()+'/'+DateTime.now().month.toString()+'/'+DateTime.now().year.toString();
  String cNicExpDate = DateTime.now().day.toString()+'/'+DateTime.now().month.toString()+'/'+DateTime.now().year.toString();
  String IssueDate = DateTime.now().day.toString()+'/'+DateTime.now().month.toString()+'/'+DateTime.now().year.toString();
  String dOb = DateTime.now().day.toString()+'/'+DateTime.now().month.toString()+'/'+DateTime.now().year.toString();
  String Expiry = DateTime.now().day.toString()+'/'+DateTime.now().month.toString()+'/'+DateTime.now().year.toString();
  String titleCode = "";
  String martialValue = "";
  String martialCode = "";
  String nationalityValue = "PAKISTAN";
  String nationalityCode = "001";
  String residentStatusValue = "";
  String residentStatusCode = "";
  String kinRelationValue = "";
  String kinRelationCode = "";
  String religionValue = "";
  String religionCode = "";
  String zaKatValue = "";
  bool zaKatCode = false;
  String retirementValue = "";
  String retirementCode = "";
  String currentCountryValue = "PAKISTAN";
  String currentCountryCode = "001";
  String mailingCountryValue = "PAKISTAN";
  String mailingCountryCode = "001";
  String mailingCityValue = "";
  String mailingCityCode = "";
  String currentCityValue = "";
  String currentCityCode = "";
  String bankNameValue = "";
  String bankNameCode = "";
  String bankCityValue = "";
  String bankCityCode = "";
  String dividendMandateGroupValue = "0";
  final _repository = Repository();

  Common? common;

  @override
  void onInit() async {
    // TODO: implement onInit
   await onNewDigUserRegDataAfterOTP()
   //     .then((value) async {
   //   await onCityData(currentCountryCode).then((value) async {
   //     isMailingCity = true;
   //     await onCityData(mailingCountryCode).then((value) {
   //       cNicController.text = controller.cNicNumberController.text;
   //       eMailAddressController.text = controller.emailController.text;
   //       mobileController.text = controller.mobileNumberController.text;
   //     });
   //   });
   // });
       .then((value) async {
     if (Constant.validateVerificationCodeForDigUser!.response!.prevSessionDataFoundForUserFillingForm == false || Constant.validateVerificationCodeForDigUser!.response!.customerName ==
         '' || Constant.validateVerificationCodeForDigUser!.response!.country ==
         '' || Constant.validateVerificationCodeForDigUser!.response!.title == '') {

       await onCityData(currentCountryCode).then((value) async {
         isMailingCity = true;
         await onCityData(mailingCountryCode).then((value) {
           cNicController.text = controller.cNicNumberController.text;
           eMailAddressController.text = controller.emailController.text;
           mobileController.text = controller.mobileNumberController.text;
         });
       });

      //    isMailingCity = false;
      // await onCityData(currentCountryCode).then((value) async {
      //   isMailingCity = true;
      //  await onCityData(mailingCountryCode).then((value) {
      //    cNicController.text = Constant.validateVerificationCodeForDigUser!.response!.cnic! ?? '';
      //    // controller.cNicNumberController.text;
      //    eMailAddressController.text = Constant.validateVerificationCodeForDigUser!.response!.email ?? '';
      //    // controller.emailController.text;
      //    mobileController.text = Constant.validateVerificationCodeForDigUser!.response!.mobile ?? '';
      //    // controller.mobileNumberController.text;
      //  });
      //  });

       return true;
     } else {
       currentCountryCode = Constant.validateVerificationCodeForDigUser!.response!.country == null ||
           Constant.validateVerificationCodeForDigUser!.response!.country == null ?
       '001' : Constant.validateVerificationCodeForDigUser!.response!.country!;
       newDigUserRegDataAfterOTP!.response!.countries!.indexWhere((element) {
         if(element.countryCode == currentCountryCode){
           currentCountryValue = element.countryName!;
           return true;
         }else{
           return false;
         }
       });
       mailingCountryCode = Constant.validateVerificationCodeForDigUser!.response!.mailingCountryCode == null ||
           Constant.validateVerificationCodeForDigUser!.response!.mailingCountryCode == null ?
       '001' : Constant.validateVerificationCodeForDigUser!.response!.mailingCountryCode!;
       newDigUserRegDataAfterOTP!.response!.countries!.indexWhere((element) {
         if(element.countryCode == mailingCountryCode){
           mailingCountryValue = element.countryName!;
           return true;
         }else{
           return false;
         }
       });
       isMailingCity = false;
       await onCityData(currentCountryCode).then((value) {
         currentCityCode = Constant.validateVerificationCodeForDigUser!.response!.city ?? '';
         if(currentCityCode != null || currentCityCode != ''){
           currentCityData!.response!.indexWhere((element){
             if(element.cityCode == currentCityCode){
               currentCityValue = element.cityName!;
               return true;
             }else{
               return false;
             }
           });
         }
         if(currentCityCode == 'other'){
           otherCityController.text = Constant.validateVerificationCodeForDigUser!.response!.otherCity ?? '';
         }
       }).then((value) async {
         isMailingCity = true;
         await onCityData(currentCountryCode).then((value) {
           mailingCityCode = Constant.validateVerificationCodeForDigUser!.response!.mailingCity ?? '';
           if(mailingCityCode != null || mailingCityCode != ''){
             mailingCityData!.response!.indexWhere((element){
               if(element.cityCode == mailingCityCode){
                 mailingCityValue = element.cityName!;
                 return true;
               }else{
                 return false;
               }
             });
           }
           if(mailingCityCode == 'other'){
             otherMailingController.text = Constant.validateVerificationCodeForDigUser!.response!.mailingOtherCity ?? '';
           }
         });
       });
       isLifTime = Constant.validateVerificationCodeForDigUser!.response!.lifetimeCnicExpiry ?? false;
       isChecked = Constant.validateVerificationCodeForDigUser!.response!.basicInfoDisclaimerChecked ?? false;
       cNicController.text = Constant.validateVerificationCodeForDigUser!.response!.cnic ?? '';
       // controller.cNicNumberController.text;
       eMailAddressController.text = Constant.validateVerificationCodeForDigUser!.response!.email ?? '';
       // controller.emailController.text;
       mobileController.text = Constant.validateVerificationCodeForDigUser!.response!.mobile ?? '';
       // controller.mobileNumberController.text;
       titleCode = Constant.validateVerificationCodeForDigUser!.response!.title!;
       newDigUserRegDataAfterOTP!.response!.titleList!.indexWhere((element) {
         if(element.code == titleCode){
           titleValue = element.code!;
           return true;
         }else{
           return false;
         }
       });

       religionCode = Constant.validateVerificationCodeForDigUser!.response!.religion!;
       newDigUserRegDataAfterOTP!.response!.religions!.indexWhere((element) {
         if(element.religionCode == religionCode){
           religionValue = element.religionName!;
           return true;
         }else{
           return false;
         }
       });
       // cNicIssueDate = Constant.validateVerificationCodeForDigUser!.response!.cnicIssueDate!['day'];
       cNicIssueDate = Constant.validateVerificationCodeForDigUser!.response!.cnicIssueDate!['year'].toString()+
           '-'+Constant.validateVerificationCodeForDigUser!.response!.cnicIssueDate!['month'].toString()+
           '-'+Constant.validateVerificationCodeForDigUser!.response!.cnicIssueDate!['day'].toString()
           ;
       cNicExpDate = Constant.validateVerificationCodeForDigUser!.response!.cnicExpiryDate!['year'].toString()+
           '-'+Constant.validateVerificationCodeForDigUser!.response!.cnicExpiryDate!['month'].toString()+
           '-'+Constant.validateVerificationCodeForDigUser!.response!.cnicExpiryDate!['day'].toString();
       dObDate = Constant.validateVerificationCodeForDigUser!.response!.dateOfBirth!['year'].toString()+
           '-'+Constant.validateVerificationCodeForDigUser!.response!.dateOfBirth!['month'].toString()+
           '-'+Constant.validateVerificationCodeForDigUser!.response!.dateOfBirth!['day'].toString();
       nameController.text = Constant.validateVerificationCodeForDigUser!.response!.customerName ?? '';
       fNameController.text = Constant.validateVerificationCodeForDigUser!.response!.fatherSpouseName ?? '';
       mNameController.text = Constant.validateVerificationCodeForDigUser!.response!.mothersMaidenName ?? '';
       phoneController.text = Constant.validateVerificationCodeForDigUser!.response!.phoneOne ?? '';
       officePhoneController.text = Constant.validateVerificationCodeForDigUser!.response!.phoneTwo ?? '';
       currentAddressController.text = Constant.validateVerificationCodeForDigUser!.response!.residentialAddress ?? '';
       mailingAddressController.text = Constant.validateVerificationCodeForDigUser!.response!.mailingAddress ?? '';
       bankBranchController.text = Constant.validateVerificationCodeForDigUser!.response!.branchName ?? '';
       iBanNumberController.text = Constant.validateVerificationCodeForDigUser!.response!.bankAccountNo ?? '';
       kinNameController.text = Constant.validateVerificationCodeForDigUser!.response!.nominees![0].name ?? '';
       kiNcNicController.text = Constant.validateVerificationCodeForDigUser!.response!.nominees![0].cnic ?? '';
       kinMobileNumberController.text = Constant.validateVerificationCodeForDigUser!.response!.nominees![0].mobile ?? '';
       int? retirement  = Constant.validateVerificationCodeForDigUser!.response!.retirementAge ?? 0;
       if(retirement != null || retirement != 0){
         newDigUserRegDataAfterOTP!.response!.retirementAgeList!.indexWhere((element){
           if(element.code == retirement.toString()){
             retirementCode = element.code!;
             retirementValue = element.description!;
             return true;
           }else{
             return false;
           }
         });
       }
       bankNameCode = Constant.validateVerificationCodeForDigUser!.response!.bankName ?? '';
       if(bankNameCode != null || bankNameCode != ''){
         newDigUserRegDataAfterOTP!.response!.banks!.indexWhere((element){
           if(element.code == bankNameCode.toString()){
             bankNameValue = element.description!;
             return true;
           }else{
             return false;
           }
         });
       }
       bankCityCode = Constant.validateVerificationCodeForDigUser!.response!.branchCity ?? '';
       if(bankCityCode != null || bankCityCode != ''){
         newDigUserRegDataAfterOTP!.response!.pakCities!.indexWhere((element){
           if(element.cityCode == bankCityCode){
             bankCityValue = element.cityName!;
             return true;
           }else{
             return false;
           }
         });
       }
       dividendMandateGroupValue = Constant.validateVerificationCodeForDigUser!.response!.dividendMandate ?? '';
       // cNicIssueDate = Constant.validateVerificationCodeForDigUser!.response!.cnicIssueDate!.toString();
       // dObDate = Constant.validateVerificationCodeForDigUser!.response!.dateOfBirth!.toString();
       // cNicExpDate = Constant.validateVerificationCodeForDigUser!.response!.dateOfBirth!.toString();
       martialCode = Constant.validateVerificationCodeForDigUser!.response!.maritalStatus.toString();
       if(martialCode != null || martialCode != ''){
         newDigUserRegDataAfterOTP!.response!.maritalStatusList!.indexWhere((element){
           if(element.code == martialCode){
             martialValue = element.description!;
             return true;
           }else{
             return false;
           }
         });
       }
       nationalityCode = Constant.validateVerificationCodeForDigUser!.response!.nationalityCode ?? '001';
       if(nationalityCode != null || nationalityCode != ''){
         newDigUserRegDataAfterOTP!.response!.nationalities!.indexWhere((element){
           if(element.countryCode == nationalityCode){
             nationalityValue = element.countryName!;
             return true;
           }else{
             return false;
           }
         });
       }
       if(isLifTime){
         cNicExpDate = '9999-12-31';
       }
       residentStatusCode = Constant.validateVerificationCodeForDigUser!.response!.pakResident ?? '';
       if(residentStatusCode != null || residentStatusCode != ''){
         newDigUserRegDataAfterOTP!.response!.residentStatusList!.indexWhere((element){
           if(element.code == residentStatusCode){
             residentStatusValue = element.description!;
             return true;
           }else{
             return false;
           }
         });
       }
       kinRelationCode = Constant.validateVerificationCodeForDigUser!.response!.nominees![0].relation ?? '';
       if(kinRelationCode != null || kinRelationCode != ''){
         newDigUserRegDataAfterOTP!.response!.relationWithPrincipleList!.indexWhere((element){
           if(element.code == kinRelationCode){
             kinRelationValue = element.description!;
             return true;
           }else{
             return false;
           }
         });
       }
       religionCode = Constant.validateVerificationCodeForDigUser!.response!.religion ?? '';
       if(religionCode != null || religionCode != ''){
         newDigUserRegDataAfterOTP!.response!.religions!.indexWhere((element){
           if(element.religionCode == kinRelationCode){
             religionValue = element.religionName!;
             return true;
           }else{
             return false;
           }
         });
       }
       zaKatCode = Constant.validateVerificationCodeForDigUser!.response!.zakatExempt ?? false;
       if(zaKatCode != null || zaKatCode != false){
         newDigUserRegDataAfterOTP!.response!.zakatExemptionList!.indexWhere((element){
           if(element.code == zaKatCode){
             zaKatValue = element.description!;
             return true;
           }else{
             return false;
           }
         });
       }
     }});

   // isMailingCity = false;

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

  Future<bool> onNewDigUserRegDataAfterOTP() async {
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

 Future<bool> onCityData(String countryCode) async {
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

  String dateTime(DateTime date){
    return date.year.toString()+'-'+date.month.toString()+'-'+date.day.toString();
  }

  onSaveDataAccountOpeningBasicInfo() async {
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
    } else if(cNicIssueDate == "" || cNicIssueDate == IssueDate){
      showToast('Please select cnic issue date');
    } else if(cNicExpDate == "" || cNicExpDate == IssueDate){
      showToast('Please select cnic expire date');
    } else if(dObDate == "" || dObDate == IssueDate){
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
    } else if(mobileController.text == "" || mobileController.text.isEmpty || mobileController.text == null){
      showToast('Please enter mobile number');
    }
    // else if(phoneController.text == "" || phoneController.text.isEmpty || phoneController.text == null){
    //   showToast('Please enter phone number');
    // } else if(officePhoneController.text == "" || officePhoneController.text.isEmpty || officePhoneController.text == null){
    //   showToast('Please enter office phone number');
    // }
    else if(currentAddressController.text == "" || currentAddressController.text.isEmpty || currentAddressController.text == null){
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
    } else if(kinNameController.text == "" || kinNameController.text.isEmpty || kinNameController.text == null ){
      showToast('Please enter kin name');
    } else if(kiNcNicController.text == "" || kiNcNicController.text.isEmpty || kiNcNicController.text == null ){
      showToast('Please enter kin CNIC');
    } else if(kinRelationCode == "" || kinRelationValue == "" ){
      showToast('Please select relation with kin');
    } else if(kinMobileNumberController.text == "" || kinMobileNumberController.text.isEmpty || kinMobileNumberController.text == null ){
      showToast('Please enter kin mobile no.');
    } else if(!isChecked){
      showToast('Please check disclaimer');
    } else if(Constant.accType == 'I') {
      if(mailingCityCode == 'other'){
        if(otherMailingController.text == null || otherMailingController.text == ''){
          showToast('Please enter mailing city name');
        } else if(currentCityCode == 'other'){
          if(otherCityController.text == null || otherCityController.text == ''){
            showToast('Please enter other city name');
          }else{
            // printInfo(info: 'Called1');
            onSave();
          }
        }else{
          // printInfo(info: 'Called2');
          onSave();
        }
      }else if(currentCityCode == 'other'){
        if(otherCityController.text == null || otherCityController.text == ''){
          showToast('Please enter other city name');
        }else{
          // printInfo(info: 'Called3');
          onSave();
        }
      }else {
        // printInfo(info: 'Called4');
        onSave();
      }
    } else if(retirementValue == "" && retirementCode == ""){
      showToast('Please select retirement age');
  }  else if(mailingCityCode == 'other'){
      if(otherMailingController.text == null || otherMailingController.text == ''){
        showToast('Please enter mailing city name');
      } else if(currentCityCode == 'other'){
        if(otherCityController.text == null || otherCityController.text == ''){
          showToast('Please enter other city name');
        }else{
          // printInfo(info: 'Called5');
          onSave();
        }
      }else{
        // printInfo(info: 'Called6');
        onSave();
      }
    }else if(currentCityCode == 'other'){
      if(otherCityController.text == null || otherCityController.text == ''){
        showToast('Please enter other city name');
      }else{
        onSave();
      }
    } else{
      onSave();
    }
  }

  onSave() async {
    try {
      isLoading = true;
      update();
      common = await _repository.onPartialSavingForDigUser(
          mailingCityCode == 'other' ? otherMailingController.text : '',
          currentCityCode == 'other' ? otherCityController.text : '',
          controller.emailController.text, controller.mobileNumberController.text,
          controller.mobileNumberOwnerCode, controller.groupValue, iBanNumberController.text,
          bankBranchController.text, bankNameCode,bankBranchController.text,isChecked,isLifTime,
          bankCityCode, currentCityCode, cNicExpDate, cNicIssueDate, currentCountryCode,
          nameController.text, dObDate, dividendMandateGroupValue, fNameController.text,
          mailingAddressController.text, mailingCountryCode, mailingCityCode, martialCode,
          mNameController.text, nationalityCode,residentStatusCode,phoneController.text,officePhoneController.text,religionCode, currentAddressController.text,
          Constant.accType == 'I' ? 0 : int.parse(retirementCode), titleCode, zaKatCode, kinNameController.text,
          kiNcNicController.text, kinRelationCode, kinMobileNumberController.text);

      isLoading = false;
      if (noInternet) {
        noInternet = false;
      }
      update();
      if(common!.meta!.message == 'OK' && common!.meta!.code == '200'){
          Constant.zakValue = zaKatValue;
          printInfo(info: nameController.text+'jhgjgjhgjgg');
        Constant.uTitle = nameController.text;
        Get.toNamed(
            AppRoute.accountOpenKycDetailScreen);
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
