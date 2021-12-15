import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investintrust/controller/home_screen_controller.dart';

class MarketScreenController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final homeController = Get.find<HomeScreenController>();
}
