import 'dart:convert';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nit/data/models/login_model.dart';
import 'package:nit/data/repository.dart';
import 'package:nit/routes/routes.dart';
import 'package:nit/utils/constants.dart';
import 'package:nit/utils/strings.dart';
import 'package:nit/widgets/constant_widget.dart';
import 'package:nit/widgets/custome_dialog.dart';

class LoginScreenController extends GetxController {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _repository = Repository();
  // static late LoginModel loginModel;
  bool isLoading = false;
  bool noInternet = false;
  var userName = "".obs;
  var password = "".obs;
  LoginModel? loginModel;
  void updateUserName(value) {
    userName(value);
    update();
  }

  void updatePassword(value) {
    password(value);
    update();
  }
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


  void onLoginPress(context) async{

     // _repository.onVpsViewReport();

    if(userNameController.text == '' || userNameController.text == null){
      Fluttertoast.showToast(
          msg: 'Please Enter User Name',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if(passwordController.text == '' || passwordController.text == null){
      Fluttertoast.showToast(
          msg: 'Please Enter Password',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      final key = encrypt.Key.fromUtf8('codingaffairscom');

      final bytes = utf8.encode('codingaffairscom');
      // final base64Str = base64.encode(bytes);


      final iv = encrypt.IV.fromLength(16);

      final encrypter = encrypt.Encrypter(
          encrypt.AES(key, mode: encrypt.AESMode.cbc));

      final encrypted = encrypter.encrypt("${passwordController.text}", iv: iv);
      // final encrypted = encrypter.encrypt("Sneha*12", iv: iv);
      // final encrypted = encrypter.encrypt("SAAD31", iv: iv);

      try {
        isLoading = true;
        CustomDialog(context);
        update();

        // Constant.loginModel = await _repository.onLogin('MAHESH9',encrypted.base16.toString());
        Constant.loginModel = await _repository.onLogin(
            userNameController.text, encrypted.base16.toString());
        Constant.drawerIndex = 3;
        Get.back();
        Get.offAllNamed(AppRoute.portofolioRoute);
        Constant.userId =
            Constant.loginModel!.response!.user!.userid.toString();
        Constant.isVps = false;
        Constant.accountIndex = 0;
        isLoading = false;
        update();
      } catch (e) {
        if (e.toString() == 'Exception: No Internet') {
          Get.back();
          isLoading = false;
          noInternet = true;
          update();
        } else {
          Get.back();
          isLoading = false;
          noInternet = false;
          update();
          Fluttertoast.showToast(
              msg: e.toString().replaceAll('Exception: ', ''),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      }
      print("keyyyy encrypted  ${encrypted.base16}");
    }
  }
}