import 'package:encrypt/encrypt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginScreenController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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


  void onLoginPress(){
    if(formKey.currentState!.validate()){

    }

      // const plainText = 'SAAD30';
      // final key = Key.fromUtf8('codingaffairscom');
      // final iv = IV.fromLength(16);

      // final encrypter = Encrypter(AES(key));

      // final encrypted = encrypter.encrypt(plainText, iv: iv);

  }



}
