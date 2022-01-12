import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:investintrust/data/models/common_model.dart';
import 'package:investintrust/data/models/gen_verification_code_for_dig_user.dart';
import 'package:investintrust/data/models/new_dig_user_reg_data_before_otp.dart';
import 'package:investintrust/data/repository.dart';
import 'package:investintrust/routes/routes.dart';
import 'package:investintrust/widgets/constant_widget.dart';


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
  String groupValue = '0';
  var character = 0;
  TextEditingController cNicNumberController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController otpVerificationController = TextEditingController();

  NewDigUserRegDataBeforeOTP? newDigUserRegDataBeforeOTP;
  GenVerificationCodeForDigUser? genVerificationCodeForDigUser;
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
            timeInSecForIosWeb: 1,
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

  onGenVerificationCodeForDigUser(BuildContext context) async {
      if (cNicNumberController.text.isEmpty ||
          cNicNumberController.text == '' ||
          cNicNumberController.text == null) {
        Fluttertoast.showToast(
            msg: 'Please Enter cNic Number',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
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
            timeInSecForIosWeb: 1,
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
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        try {
          isLoading = true;
          update();
          genVerificationCodeForDigUser =
          await _repository.onGenVerificationCodeForDigUser(
              cNicNumberController.text, emailController.text, mobileNumberController.text
          );
          isLoading = false;
          if (noInternet) {
            noInternet = false;
          }
          update();
          if(genVerificationCodeForDigUser!.meta!.message == 'OK' && genVerificationCodeForDigUser!.meta!.code == '200'){
            customDialogPin(context,"Please check your provided email address and mobile number for verification code");
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



  onValidateVerificationCodeForDigUser() async {
    if (cNicNumberController.text.isEmpty ||
        cNicNumberController.text == '' ||
        cNicNumberController.text == null) {
      Fluttertoast.showToast(
          msg: 'Please Enter cNic Number',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
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
          timeInSecForIosWeb: 1,
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
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if(mobileNumberOwner == 'Select'){
      Fluttertoast.showToast(
          msg: 'Please select Ownership of your Mobile Number',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if(groupValue == '0'){
      Fluttertoast.showToast(
          msg: 'Please select Account Type',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      try {
        isLoading = true;
        update();
        common =
        await _repository.onValidateVerificationCodeForDigUser(
            cNicNumberController.text, emailController.text, mobileNumberController.text,
            mobileNumberOwnerCode,groupValue,otpVerificationController.text
        );
        isLoading = false;
        if (noInternet) {
          noInternet = false;
        }
        update();
        if(common!.meta!.message == 'OK' && common!.meta!.code == '200'){
          Get.toNamed(AppRoute.accountopeningbasicinformation);
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
}

