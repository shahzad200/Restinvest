import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class PasswordScreenController extends GetxController{
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();


  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var userName = "".obs;
  var password = "".obs;
  void updateUserName(value) {
    userName(value);
    update();
  }

  void updatePassword(value) {
    password(value);
    update();
  }
}
