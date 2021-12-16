import 'dart:convert';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:investintrust/data/models/login_model.dart';
import 'package:investintrust/data/repository.dart';

class LoginScreenController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
<<<<<<< HEAD
  var userName = "".obs;
  var password = "".obs;

=======
  final _repository = Repository();
  static late LoginModel loginModel;
  bool isLoading = false;
  bool noInternet = false;
>>>>>>> 15508a7b74805021b6d6fe3a3bebb1f0aeaf468e

  @override
  void onInit() {
    // TODO: implement onInit
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

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

<<<<<<< HEAD
  void onLoginPress() {
    if (formKey.currentState!.validate()) {
      var data = {'userName': userName, 'password' : password};





    }
=======
>>>>>>> 15508a7b74805021b6d6fe3a3bebb1f0aeaf468e

  void onLoginPress() async{
    String name = userNameController.value.text;
    String password = passwordController.value.text;
    final key = encrypt.Key.fromUtf8('codingaffairscom');

    final bytes = utf8.encode('codingaffairscom');
    final base64Str = base64.encode(bytes);

    print("keyyyyyyyyyy..........${key.bytes}");

    final iv = encrypt.IV.fromLength(16);

    final encrypter = encrypt.Encrypter(encrypt.AES(key,mode: encrypt.AESMode.cbc));

    final encrypted = encrypter.encrypt(password, iv: iv);
    try{
      isLoading = true;
      loginModel = await _repository.onLogin(name,encrypted.base16.toString());
      await _repository.onLoadDashBoard(loginModel.response!.accounts![0].folioNumber.toString());
      isLoading = false;
      update();
    }catch (e){
      if(e.toString() == 'Exception: No Internet'){
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
    print("keyyyy encrypted  ${encrypted.base16}");
  }
}
