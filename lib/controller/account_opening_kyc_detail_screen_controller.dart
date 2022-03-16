import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nit/data/models/common_model.dart';
import 'package:nit/data/repository.dart';
import 'package:nit/routes/routes.dart';
import 'package:nit/utils/constants.dart';
import 'package:nit/widgets/constant_widget.dart';

import 'account_opening_basic_information_screen_controller.dart';
import 'account_opening_request_screen_controller.dart';


class AccountOpenKycDetailScreenController extends GetxController{
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var userName = "".obs;
  var password = "".obs;
  var number = "".obs;
  var email = "".obs;
  var f = NumberFormat("###,###.0#", "en_US");
  AccountOpenBasicInformationScreenController controller = Get.find<AccountOpenBasicInformationScreenController>();
  AccountOpenRequestScreenController con = Get.find<AccountOpenRequestScreenController>();

  String dropdownvalue = "";
  String amountvalue = "";
  String paymentvalue = "";
  bool isChecked=false;
  var charactor=0;
  var income=0;
  var source=0;
  var transaction=0;
  var rupees=0;
  var mode=0;
  var modetransaction=0;
  String occupationGroupValue = '00';
  String inComeGroupValue = '00';
  String transactionGroupValue = '00';
  String turnoverGroupValue = '00';
  String annualIncomeGroupValue = '00';
  String expectedIncomeGroupValue = '00';

  TextEditingController employerController = TextEditingController();

  TextEditingController designationController = TextEditingController();
  TextEditingController natureOfBusinessController = TextEditingController();

  TextEditingController professionController = TextEditingController();
  TextEditingController geoDomesticController = TextEditingController();
  TextEditingController geoInternationalController = TextEditingController();
  TextEditingController counterDomesticController = TextEditingController();
  TextEditingController counterInternationalController = TextEditingController();
  TextEditingController expTurnoverAmountController = TextEditingController();


  bool isLoading = false;
  bool noInternet = false;

  Common? common;
  final _repository = Repository();
  @override
  void onInit() {
    if(Constant.validateVerificationCodeForDigUser!.response!.kycDisclaimerChecked == true &&
        Constant.validateVerificationCodeForDigUser!.response!.occupation != '' &&
    Constant.validateVerificationCodeForDigUser!.response!.sourceOfIncome != ''){
      occupationGroupValue = Constant.validateVerificationCodeForDigUser!.response!.occupation ?? '00';
      inComeGroupValue = Constant.validateVerificationCodeForDigUser!.response!.sourceOfIncome ?? '00';
      transactionGroupValue = Constant.validateVerificationCodeForDigUser!.response!.preferedModeOfTrans ?? '00';
      turnoverGroupValue = Constant.validateVerificationCodeForDigUser!.response!.expTurnoverInAccType ?? '00';
      annualIncomeGroupValue = Constant.validateVerificationCodeForDigUser!.response!.annualIncome ?? '00';
      expectedIncomeGroupValue = Constant.validateVerificationCodeForDigUser!.response!.expectedInvestmentAmount ?? '00';
      employerController.text = Constant.validateVerificationCodeForDigUser!.response!.employerName ?? '';
      designationController.text = Constant.validateVerificationCodeForDigUser!.response!.employerDesignation ?? '';
      natureOfBusinessController.text = Constant.validateVerificationCodeForDigUser!.response!.employerNatureOfBusiness ?? '';
      professionController.text = Constant.validateVerificationCodeForDigUser!.response!.employerProfession ?? '';
      if(occupationGroupValue == '013'){
      geoDomesticController.text = Constant.validateVerificationCodeForDigUser!.response!.domesticGeographies ?? '';
      geoInternationalController.text = Constant.validateVerificationCodeForDigUser!.response!.internationalGeographies ?? '';
      counterDomesticController.text = Constant.validateVerificationCodeForDigUser!.response!.domesticCounterParties ?? '';
      counterInternationalController.text = Constant.validateVerificationCodeForDigUser!.response!.internationalCounterParties ?? '';
      }
      expTurnoverAmountController.text = Constant.validateVerificationCodeForDigUser!.response!.expTurnoverInAccAmount.toString() ?? '';


      if(controller.newDigUserRegDataAfterOTP!.response!.pepsInfoList!.length == Constant.validateVerificationCodeForDigUser!.response!.pepsInfo!.length )
        {
          for(int k = 0 ; k < controller.newDigUserRegDataAfterOTP!.response!.pepsInfoList!.length ; k++)
          {
            controller.newDigUserRegDataAfterOTP!.response!.pepsInfoList![k].answer =
                Constant.validateVerificationCodeForDigUser!.response!.pepsInfo![k].answer;
          }
        }
      isChecked = Constant.validateVerificationCodeForDigUser!.response!.kycDisclaimerChecked ?? false;

    }
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


  onSaveDataKycDetail() async {
    if (occupationGroupValue == '00') {
      showToast('Please select occupation/profession');
    } else if (inComeGroupValue == '00') {
      showToast('Please select source of income');
    } else if (designationController.text == "" ||
        designationController.text.isEmpty ||
        designationController.text == null) {
      showToast('Please enter designation');
    } else if (transactionGroupValue == "00") {
      showToast('Please select preferred mood of transaction');
    } else if (turnoverGroupValue == "00") {
      showToast('Please select expected turnover');
    } else if (expectedIncomeGroupValue == "00") {
      showToast('Please select expected investment amount');
    } else if (annualIncomeGroupValue == "00") {
      showToast('Please select annual income');
    } else if (!isChecked) {
      showToast('Please checked disclaimer');
    } else if (occupationGroupValue == '013') {
      if (geoDomesticController.text == "" ||
          geoDomesticController.text.isEmpty ||
          geoDomesticController.text == null) {
        showToast('Please enter geographic involved domestic');
      } else if (geoInternationalController.text == "" ||
          geoInternationalController.text.isEmpty ||
          geoInternationalController.text == null) {
        showToast('Please enter geographic involved international');
      } else if (counterDomesticController.text == "" ||
          counterDomesticController.text.isEmpty ||
          counterDomesticController.text == null) {
        showToast('Please enter counter parties domestic');
      } else if (counterInternationalController.text == "" ||
          counterInternationalController.text.isEmpty ||
          counterInternationalController.text == null) {
        showToast('Please enter counter parties international');
      } else if(expTurnoverAmountController.text == '' ||
          expTurnoverAmountController.text.isEmpty ||
          expTurnoverAmountController.text == null){
        showToast('Please enter expected turnover amount');
      } else {
        onSaveData();
      }
    } else if (employerController.text == "" || employerController.text.isEmpty ||
        employerController.text == null) {
      showToast('Please enter name of employer');
    } else if(expTurnoverAmountController.text == '' ||
        expTurnoverAmountController.text.isEmpty ||
        expTurnoverAmountController.text == null){
      showToast('Please enter expected turnover amount');
    } else {
      onSaveData();
    }
  }
  onSaveData() async {
    try {
      isLoading = true;
      update();
      common = await _repository.onPartialSavingForDigUserScreen3(
        counterDomesticController.text, geoDomesticController.text,
        counterInternationalController.text, geoInternationalController.text, designationController.text,
        employerController.text, natureOfBusinessController.text,
        professionController.text, transactionGroupValue,
        int.parse(expTurnoverAmountController.text.replaceAll(',', '')), turnoverGroupValue, int.parse(expectedIncomeGroupValue), int.parse(annualIncomeGroupValue),
        isChecked, occupationGroupValue, inComeGroupValue,
        controller.newDigUserRegDataAfterOTP!.
        response!.pepsInfoList![0].answer ?? false,
        int.parse(controller.newDigUserRegDataAfterOTP!.
        response!.pepsInfoList![0].questionCode!),
        controller.newDigUserRegDataAfterOTP!.
        response!.pepsInfoList![1].answer ?? false,
        int.parse(controller.newDigUserRegDataAfterOTP!.
        response!.pepsInfoList![1].questionCode!),
        controller.newDigUserRegDataAfterOTP!.
        response!.pepsInfoList![2].answer ?? false,
        int.parse(controller.newDigUserRegDataAfterOTP!.
        response!.pepsInfoList![2].questionCode!),
        controller.newDigUserRegDataAfterOTP!.
        response!.pepsInfoList![3].answer ?? false,
        int.parse(controller.newDigUserRegDataAfterOTP!.
        response!.pepsInfoList![3].questionCode!),
        controller.newDigUserRegDataAfterOTP!.
        response!.pepsInfoList![4].answer ?? false,
        int.parse(controller.newDigUserRegDataAfterOTP!.
        response!.pepsInfoList![4].questionCode!),
      );

      isLoading = false;
      if (noInternet) {
        noInternet = false;
      }
      update();
      if(common!.meta!.message == 'OK' && common!.meta!.code == '200'){
        Get.toNamed(AppRoute.accountOpenFatcaScreen);
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


var f = NumberFormat("###,###.0#", "en_US");
class NumberForm extends TextInputFormatter {
  static const separator = ','; // Change this to '.' for other locales

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Short-circuit if the new value is empty
    if (newValue.text.length == 0) {
      return newValue.copyWith(text: '');
    }

    // Handle "deletion" of separator character
    String oldValueText = oldValue.text.replaceAll(separator, '');
    String newValueText = newValue.text.replaceAll(separator, '');

    if (oldValue.text.endsWith(separator) &&
        oldValue.text.length == newValue.text.length + 1) {
      newValueText = newValueText.substring(0, newValueText.length - 1);
    }

    // Only process if the old value and new value are different
    if (oldValueText != newValueText) {
      int selectionIndex =
          newValue.text.length - newValue.selection.extentOffset;
      final chars = newValueText.split('');

      String newString = '';
      for (int i = chars.length - 1; i >= 0; i--) {
        if ((chars.length - 1 - i) % 3 == 0 && i != chars.length - 1)
          newString = separator + newString;
        newString = chars[i] + newString;
      }

      return TextEditingValue(
        text: newString.toString(),
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndex,
        ),
      );
    }

    // If the new value and old value are the same, just return as-is
    return newValue;
  }
}
