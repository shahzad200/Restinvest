import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaxCalculatorScreenController extends GetxController {
  var formKey = GlobalKey<FormState>();
  String categoryvalue = "";
  String bracketvalue = "";
  String incomevalue = "";
  String occupationvalue = "";
  var space = SizedBox(
    height: 10,
  );

  var scaffoldKey = GlobalKey<ScaffoldState>();
}
