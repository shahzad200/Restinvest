import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RedemptionScreenController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isChecked = false;
  String dropdownvalue = "";
  String amountvalue = "";
  String paymentvalue = "";
  bool investButton = false;
  bool portfolioButton = false;
  bool buttonclick3 = false;

  investTrust(index) {
    switch (index) {
      case 0:
        {
          investButton = true;
          portfolioButton = false;
          buttonclick3 = false;

          update();
          break;
        }
      case 1:
        {
          investButton = false;
          portfolioButton = true;
          buttonclick3 = false;

          update();
          break;
        }
      case 2:
        {
          investButton = false;
          portfolioButton = false;
          buttonclick3 = true;

          update();
          break;
        }
    }
  }

  displayDialog(BuildContext context, Widget body) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: body,
          );
        });
  }
}
