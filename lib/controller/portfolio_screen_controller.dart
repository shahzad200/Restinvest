import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:investintrust/data/models/load_dashboard.dart';
import 'package:investintrust/data/repository.dart';
import 'package:investintrust/utils/constants.dart';

import 'login_screen_controller.dart';

class PortofolioScreenController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  bool investButton = true;
  bool portfolioButton = false;
  bool buttonclick3 = false;
  bool buttonclick4 = true;
  bool buttonclick5 = false;
  bool isLoading = false;
  bool noInternet = false;
  final _repository = Repository();
  LoadDashboard? loadDashboard;
  // LoginScreenController loginScreenController = Get.find<LoginScreenController>();
  @override
  void onInit() {
    onLoadDashboard();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  investTrust(index) {
    switch (index) {
      case 0:
        {
          investButton = true;
          portfolioButton = false;

          update();
          break;
        }
      case 1:
        {
          investButton = false;
          portfolioButton = true;

          update();
          break;
        }
    }
  }

  invest(index) {
    switch (index) {
      case 0:
        {
          buttonclick3 = true;
          buttonclick4 = false;
          buttonclick5 = false;

          update();
          break;
        }
      case 1:
        {
          buttonclick3 = false;
          buttonclick4 = true;
          buttonclick5 = false;

          update();
          break;
        }
      case 2:
        {
          buttonclick3 = false;
          buttonclick4 = false;
          buttonclick5 = true;

          update();
          break;
        }
    }
  }

  onLoadDashboard() async {
    try {
      isLoading = true;
      loadDashboard =  await _repository.onLoadDashBoard(Constant.loginModel!.response!.accounts![0].folioNumber.toString());
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
