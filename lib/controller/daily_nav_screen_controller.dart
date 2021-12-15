import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:investintrust/data/models/daily_nav_prices.dart';
import 'package:investintrust/data/models/social_media_links.dart';
import 'package:investintrust/data/repository.dart';
import 'package:investintrust/widgets/constant_widget.dart';

class DailyNavScreenController extends GetxController {
  var formKey = GlobalKey<FormState>();
  String titlevalue = "";
  String bracketvalue = "";
  String incomevalue = "";
  String occupationvalue = "";

  var scaffoldKey = GlobalKey<ScaffoldState>();
  final _repository = Repository();
  bool isLoading = false;
  bool noInternet = false;
  DailyNavPrices? dailyNavPrices;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    dailyNavPrices = await _repository.onLoadDailyNavPrices();
    update();
    // TODO: implement onReady
    super.onReady();
  }
}
