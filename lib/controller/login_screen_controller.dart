import 'dart:convert';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:investintrust/data/models/login_model.dart';
import 'package:investintrust/data/repository.dart';
import 'package:investintrust/routes/routes.dart';
import 'package:investintrust/utils/constants.dart';
import 'package:investintrust/utils/strings.dart';
import 'package:investintrust/widgets/constant_widget.dart';
import 'package:investintrust/widgets/custome_dialog.dart';

class LoginScreenController extends GetxController {
  var formKey = GlobalKey<FormState>();
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
    final key = encrypt.Key.fromUtf8('codingaffairscom');

    final bytes = utf8.encode('codingaffairscom');
    // final base64Str = base64.encode(bytes);


    final iv = encrypt.IV.fromLength(16);

    final encrypter = encrypt.Encrypter(encrypt.AES(key,mode: encrypt.AESMode.cbc));

    // final encrypted = encrypter.encrypt("${passwordController.text}", iv: iv);
    final encrypted = encrypter.encrypt("Sneha*12", iv: iv);

    try{
      isLoading = true;
      CustomDialog(context);
      update();

      Constant.loginModel = await _repository.onLogin('MAHESH9',encrypted.base16.toString());
      // Constant.loginModel = await _repository.onLogin(userNameController.text,encrypted.base16.toString());
      Get.back();
      Get.toNamed(AppRoute.portofolioRoute);
      Constant.userId = Constant.loginModel!.response!.user!.userid.toString();

      isLoading = false;
      update();
    }catch (e){
      Get.back();
      if(e.toString() == 'Exception: No Internet'){
        isLoading = false;
        noInternet = true;
        update();
      } else {
        Get.back();
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
    print("keyyyy encrypted  ${encrypted.base16}");
  }
}