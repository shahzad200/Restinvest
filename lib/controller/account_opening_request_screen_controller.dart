
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nit/data/models/common_model.dart';
import 'package:nit/data/models/gen_verification_code_for_dig_user.dart';
import 'package:nit/data/models/new_dig_user_reg_data_before_otp.dart';
import 'package:nit/data/models/validate_verification_code_for_dig_user.dart';
import 'package:nit/data/repository.dart';
import 'package:nit/routes/routes.dart';
import 'package:nit/utils/constants.dart';
import 'package:nit/widgets/constant_widget.dart';


class AccountOpenRequestScreenController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var userName = "".obs;
  var password = "".obs;
  var number = "".obs;
  var email = "".obs;
  String mobileNumberOwner = 'Select';
  String mobileNumberOwnerCode = '';
  bool isChecked = false;
  String groupValue = 'I';
  var character = 0;
  TextEditingController cNicNumberController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController otpVerificationController = TextEditingController();

  NewDigUserRegDataBeforeOTP? newDigUserRegDataBeforeOTP;
  GenVerificationCodeForDigUser? genVerificationCodeForDigUser;
  ValidateVerificationCodeForDigUser? validateVerificationCodeForDigUser;
  Common? common;
  bool isLoading = false;
  bool noInternet = false;
  final _repository = Repository();

  @override
  void onInit() {
    // TODO: implement onInit
    onNewDigUserRegDataBeforeOTP();
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

  onNewDigUserRegDataBeforeOTP() async {
    try {
      isLoading = true;
      update();
      newDigUserRegDataBeforeOTP =
      await _repository.onNewDigUserRegDataBeforeOTP();
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
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  void handleRadioValueChange(String value) {
    groupValue = value;
    printInfo(info: value.toString() + 'JHGJHGJG');
    update();
  }

  // 45345-3453453-4
  // 03042084628
  // dsfdsf@gmail.softech

  onGenVerificationCodeForDigUser(BuildContext context) async {
      if (cNicNumberController.text.isEmpty ||
          cNicNumberController.text == '' ||
          cNicNumberController.text == null) {
        Fluttertoast.showToast(
            msg: 'Please Enter cNic Number',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      else if (mobileNumberController.text.isEmpty ||
          mobileNumberController.text == '' ||
          mobileNumberController.text == null) {
        Fluttertoast.showToast(
            msg: 'Please Enter Mobile Number',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      else if (emailController.text.isEmpty || emailController.text == '' ||
          emailController.text == null) {
        Fluttertoast.showToast(
            msg: 'Please Enter Email Address',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        try {
          isLoading = true;
          update();
          common =
          await _repository.onGenVerificationCodeForDigUser(
              cNicNumberController.text, emailController.text, mobileNumberController.text
          );
          isLoading = false;
          if (noInternet) {
            noInternet = false;
          }
          update();
          if(common!.meta!.message == 'OK' && common!.meta!.code == '200'){
            customDialogPin(context,"Please check your provided email address and mobile number for verification code");
          }else {

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
            customDialogPin(context,e.toString().replaceAll('Exception: ', ''));
            // Fluttertoast.showToast(
            //     msg: e.toString().replaceAll('Exception: ', ''),
            //     toastLength: Toast.LENGTH_SHORT,
            //     gravity: ToastGravity.CENTER,
            //     timeInSecForIosWeb: 5,
            //     backgroundColor: Colors.black,
            //     textColor: Colors.white,
            //     fontSize: 16.0);
          }
        }
      }
    }



  onValidateVerificationCodeForDigUser() async {
    if (cNicNumberController.text.isEmpty ||
        cNicNumberController.text == '' ||
        cNicNumberController.text == null) {
      Fluttertoast.showToast(
          msg: 'Please Enter cNic Number',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    else if (mobileNumberController.text.isEmpty ||
        mobileNumberController.text == '' ||
        mobileNumberController.text == null) {
      Fluttertoast.showToast(
          msg: 'Please Enter Mobile Number',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    else if (emailController.text.isEmpty || emailController.text == '' ||
        emailController.text == null) {
      Fluttertoast.showToast(
          msg: 'Please Enter Email Address',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if(mobileNumberOwner == 'Select'){
      Fluttertoast.showToast(
          msg: 'Please select Ownership of your Mobile Number',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if(groupValue == '0'){
      Fluttertoast.showToast(
          msg: 'Please select Account Type',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {


      try {
        isLoading = true;
        update();
        validateVerificationCodeForDigUser =
        await _repository.onValidateVerificationCodeForDigUser(
            cNicNumberController.text, emailController.text, mobileNumberController.text,
            mobileNumberOwnerCode,groupValue,otpVerificationController.text
        );
        isLoading = false;
        if (noInternet) {
          noInternet = false;
        }
        update();
        if(validateVerificationCodeForDigUser!.meta!.message == 'OK' && validateVerificationCodeForDigUser!.meta!.code == '200'){
          Constant.validateVerificationCodeForDigUser = validateVerificationCodeForDigUser;
          Constant.sessionID = validateVerificationCodeForDigUser!.response!.sessionID!;
          Constant.cNic = validateVerificationCodeForDigUser!.response!.cnic!;
            Constant.accType = groupValue;
            Constant.mobileReg = mobileNumberOwnerCode;
          Get.toNamed(AppRoute.accountOpeningBasicInformation);
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
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      }
    }
  }
}

