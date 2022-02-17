import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:investintrust/data/models/load_dashboard.dart';
import 'package:investintrust/data/models/login_model.dart';
import 'package:investintrust/data/repository.dart';
import 'package:investintrust/utils/constants.dart';
import 'package:investintrust/widgets/constant_widget.dart';
import 'package:investintrust/widgets/custome_dialog.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'login_screen_controller.dart';

class PortofolioScreenController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  double totalInvestment = 0.0;
  bool investButton = true;
  bool portfolioButton = false;
  bool buttonclick3 = true;
  bool buttonclick4 = false;
  bool buttonclick5 = false;
  bool isLoading = false;
  bool noInternet = false;
  bool isCardView = false;
  bool isSummery = false;
  final _repository = Repository();
  LoadDashboard? loadDashboard;
  Accounts? selectedAccount;
  // final loginController = Get.find<LoginScreenController>();
  // LoginScreenController loginScreenController = Get.find<LoginScreenController>();
  late List<ChartData>? chartDataPurchase = [];
  late List<ChartData>? chartDataSummery = [];
  late List<ChartData>? chartDataRedumption = [];
  late List<ChartData> data = [];
  late TooltipBehavior tooltip;

  TooltipBehavior? tooltipBehavior;
  static final DateTime now = DateTime.now();
  
  static final DateFormat formatter = DateFormat.yMMMMd();
   String? formatted ;

   String accNumber = Constant.loginModel!.response!.accounts![0].folioNumber.toString();
  var f = NumberFormat("###,###.0#", "en_US");
  @override
  void onInit() async{
    formatted = formatter.format(now.subtract(const Duration(days: 1)));
    print(formatted);
    tooltipBehavior = TooltipBehavior(enable: true,);


      // data = [
      //   ChartData('CHN', 12),
      //   ChartData('GER', 15),
      //   ChartData('RUS', 30),
      //   ChartData('BRZ', 6.4),
      //   ChartData('IND', 14)
      // ];
      tooltip = TooltipBehavior(enable: true);

    Constant.loginModel!.response!.accounts!.forEach((element) {
      totalInvestment = totalInvestment + double.parse(element.portfolioInvestmentValue!);
    });

    update();
    super.onInit();
  }

  @override
  void onReady() async{

    selectedAccount = Constant.loginModel!.response!.accounts![0];
    loadDashboard =  await _repository.onLoadDashBoard(Constant.loginModel!.response!.accounts![0].folioNumber.toString());



    // loadDashboard.response
    isSummery = true;
    update();
    loadDashboard!.response!.portfolioSummary!.forEach((element) {
      if(double.parse('${element.scaleValueYaxis}') != 0.0){
        chartDataSummery!.add(
          ChartData('${element.transMonthXaxis}', double.parse('${element.scaleValueYaxis}')),
        );
      }
    });
    isSummery = false;
    update();
    selectedAccount!.portfolioAnalyPurchases!.forEach((element) {
      if(double.parse('${element.amountYaxis}') != 0.0) {
        chartDataPurchase!.add(
          ChartData('${element.fundShortXaxis}',
              double.parse('${element.amountYaxis}')),
        );
      }
    });
    selectedAccount!.portfolioAllocationData!.forEach((element) {
      print("pie value");
      print("pie value${element}");
      print("pie value");
      if(double.parse('${element["fundPercent"]}') != 0.0) {
        data.add(
          ChartData('${element["fundShort"]}',
              double.parse('${element["fundPercent"]}')),
        );
      }
    });
    selectedAccount!.portfolioAnalyRedemptions!.forEach((element) {
      if(double.parse('${element.amountYaxis}') != 0.0) {
        chartDataRedumption!.add(
          ChartData('${element.fundShortXaxis}',
              double.parse('${element.amountYaxis}')),
        );
      }
    });
    update();
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

 Future<LoadDashboard?> onLoadDashboard(folioNumber,context) async {
   LoadDashboard? dashboad;
    try {

      isLoading = true;
      update();
      dashboad =  await _repository.onLoadDashBoard(folioNumber);
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
    return dashboad!;
  }

}

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}