import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class F2FTransferScreenController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isChecked = false;
  String accountvalue = "";
  String fundvalue = "";
  String toaccountvalue = "";
  String transfervalue = "";

  bool unit = false;
  bool percentage = false;
  bool allUnit = false;

  investTrust(index) {
    switch (index) {
      case 0:
        {
          unit = true;
          percentage = false;
          allUnit = false;

          update();
          break;
        }
      case 1:
        {
          unit = false;
          percentage = true;
          allUnit = false;

          update();
          break;
        }
      case 2:
        {
          unit = false;
          percentage = false;
          allUnit = true;

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
