import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PortofolioScreenController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  bool investButton = true;
  bool portfolioButton = false;
  bool buttonclick3 = false;
  bool buttonclick4 = true;
  bool buttonclick5 = false;

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
}
