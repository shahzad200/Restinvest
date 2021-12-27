import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../data/models/daily_nav_prices.dart';

import '../data/repository.dart';


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
  void onInit() async{   dailyNavPrices = await _repository.onLoadDailyNavPrices();
  update();
    super.onInit();
  }

  @override
  void onReady()  {

    // TODO: implement onReady
    super.onReady();
  }

}
