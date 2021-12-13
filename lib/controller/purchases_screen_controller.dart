import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PurchasesScreenController extends GetxController {
  var formKey = GlobalKey<FormState>();

  String dropdownvalue = "";
  String amountvalue = "";
  String paymentvalue = "";
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isChecked = false;
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
