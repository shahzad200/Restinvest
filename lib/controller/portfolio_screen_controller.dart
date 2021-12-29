import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../data/models/load_dashboard.dart';
import '../data/repository.dart';
import '../utils/constants.dart';


class PortofolioScreenController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  bool investButton = true;
  bool portfolioButton = false;
  bool categoryButton = false;
  bool purchasesButton = true;
  bool fundButton = false;
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
          categoryButton = true;
          purchasesButton = false;
          fundButton = false;

          update();
          break;
        }
      case 1:
        {
          categoryButton = false;
          purchasesButton = true;
          fundButton = false;

          update();
          break;
        }
      case 2:
        {
          categoryButton = false;
          purchasesButton = false;
          fundButton = true;

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
