
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nit/data/models/common_model.dart';
import 'package:nit/data/models/load_fund_plans.dart';
import 'package:nit/data/models/login_model.dart';
import 'package:nit/data/repository.dart';
import 'package:nit/utils/constant.dart';
import 'package:nit/utils/constants.dart';
import 'package:nit/utils/lists.dart';
import 'package:nit/widgets/constant_widget.dart';
import 'package:nit/widgets/transaction_dialog.dart' as trans;

class F2FTransferScreenController extends GetxController {
  // var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isChecked = false;
  String accountValue = Constant.loginModel!.response!.accounts![Constant.accountIndex].folioNumber ?? '';

  TextEditingController unitBalanceController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  List<Accounts> listAccount = [];
  String fundValue = '';
  String fundCode = '';
  String toAccountValue = Constant.loginModel!.response!.accounts![Constant.accountIndex].folioNumber ?? '';
  String toFundValue = "";
  String toFundCode = "";
  bool unitButton = true;
  bool percentageButton = false;
  bool allUnitButton = false;
  bool isCheckPrivacy = false;
  var f = NumberFormat("###,###.0#", "en_US");

  bool investButton = false;
  bool portfolioButton = false;
  bool buttonclick3 = false;


  final _repository = Repository();
  bool isLoading = false;
  bool noInternet = false;
  LoadFundsPlans? loadFundsPlans;
  Common? common;
  @override
  void onInit() async {
    Constant.loginModel!.response!.accounts!.forEach((element) {
      if(element.vpsAccount != true){
        listAccount.add(element);
      }
    });
    findIndex();
    onLoadFundsPlans();
    super.onInit();
  }

  int fundIndex = 0;
  int findIndex(){
    fundIndex = Constant.loginModel!.response!.accounts!.indexWhere((element) => element.folioNumber == accountValue);
    if(Constant.loginModel!.response!.accounts![fundIndex].userFundBalances!.isNotEmpty){
      fundValue = Constant.loginModel!.response!.accounts![fundIndex].userFundBalances![0].fundShort!;
      fundCode = Constant.loginModel!.response!.accounts![fundIndex].userFundBalances![0].fundCode!;
    }
    return fundIndex;
  }

  late int index = 0;
  String? electronicUnit(){
    if(loadFundsPlans != null) {
      if(loadFundsPlans!.response!.portfolioAllocationData!.isNotEmpty){
        index = loadFundsPlans!.response!.portfolioAllocationData!.indexWhere((
            element) => element.fundShort == fundValue);
        return loadFundsPlans!.response!.portfolioAllocationData![index ?? 0]
            .fundUnits ?? '0';
      }else{
        return '0';
      }
    }else {
      return '0';
    }
  }

  String fundVolume = '0';
  String? fundAmount(){
    if(loadFundsPlans != null) {
      if(loadFundsPlans!.response!.portfolioAllocationData!.isNotEmpty){
        fundVolume = loadFundsPlans!.response!.portfolioAllocationData![index ?? 0].fundvolume!;
        return loadFundsPlans!.response!.portfolioAllocationData![index ?? 0].fundvolume ?? '0';
      }else {
        return "0";
      }
    }else {
      return "0";
    }
  }

  String approxAmount = '';
  String approxUnits = '';
  String dataValue = '';
  calculateUnits(String s){
    if(unitButton){
      dataValue = s;
      if(double.parse(dataValue) <= double.parse(loadFundsPlans!.response!.portfolioAllocationData![index].fundUnits ?? '0')) {
        String d = loadFundsPlans!.response!.portfolioAllocationData![index]
            .fundRedPrice ?? '0';
        double val = double.parse(d) * double.parse(s);
        approxAmount = val == 0 ? '' : val.toStringAsFixed(2);
        update();
      } else{
        unitBalanceController.text = '';
        update();
        Fluttertoast.showToast(
            msg: 'Unit Balance must less than or equal to available units',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
    if(percentageButton){
      dataValue = s;
      if(double.parse(dataValue) <= 100)
      {
        String d = loadFundsPlans!.response!.portfolioAllocationData![index].fundUnits ?? '0';
        String red = loadFundsPlans!.response!.portfolioAllocationData![index].fundRedPrice ?? '0';
        double val = double.parse(d) * double.parse(s);
        double approxUni = val / 100;
        double approxAmo = approxUni * double.parse(red);
        approxAmount = approxAmo.toStringAsFixed(2);
        approxUnits = approxUni.toStringAsFixed(2);
        update();
      } else {
        unitBalanceController.text = '';
        update();
        Fluttertoast.showToast(
            msg: 'Percentage must be less than or equal to 100',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
    if(allUnitButton){
      if(loadFundsPlans != null) {
        if(loadFundsPlans!.response!.portfolioAllocationData!.isNotEmpty) {
          String d = loadFundsPlans!.response!.portfolioAllocationData![index].fundRedPrice ?? '0';
          String u = loadFundsPlans!.response!.portfolioAllocationData![index].fundUnits ?? '0';
          double val = double.parse(d) * double.parse(u);
          approxAmount =  val == 0 ? '': val.toStringAsFixed(2);
          unitBalanceController.text = u.toString();
          dataValue = u;
          update();
        }
      }
    }
  }

  investTrust(index) {
    switch (index) {
      case 0:
        {
          unitButton = true;
          percentageButton = false;
          allUnitButton = false;
          approxAmount = '';
          approxUnits = '';
          unitBalanceController.text = '';
          update();
          break;
        }
      case 1:
        {
          unitButton = false;
          percentageButton = true;
          allUnitButton = false;
          approxAmount = '';
          approxUnits = '';
          unitBalanceController.text = '';
          update();
          break;
        }
      case 2:
        {
          unitButton = false;
          percentageButton = false;
          allUnitButton = true;
          approxAmount = '';
          approxUnits = '';
          unitBalanceController.text = '';
          update();
          calculateUnits('0');
          break;
        }
    }
  }

  onGeneratePinCode(BuildContext context) async {
    try {
      isLoading = true;
      update();
      common = await _repository.onGeneratePinCode(accountValue, "FTF");
      isLoading = false;
      if(noInternet) {
        noInternet = false;
      }
      update();
      if(common!.meta!.message == 'OK' && common!.meta!.code == '200'){
        customDialogPin(context,"Pin Code sent to your registered email address and mobile number successfully");
      }
      // update();
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
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }

  }

  onLoadFundsPlans() async {
    try {


      print(fundNameItems);
      print("jdksaksjdklsajdlksdjaaaaaa");
      print("asaddddddddddddddddddddd");

      isLoading = true;
      toAccountValue = Constant.loginModel!.response!.accounts![0].folioNumber ?? '';
      update();
      printInfo(info: accountValue+'jjgjgj'+fundCode+'hhghgh',);
      loadFundsPlans = await _repository.onLoadFundsPlans(fundCode, accountValue, "FTF");

      print("hello world");
      print(loadFundsPlans);

      print("shahzad");
      print ( toFundValue);
      print(">>>>>>>>>>>>>>>>>>>>>>");
      print( toFundCode);

      toFundValue = loadFundsPlans!.response!.toFunds![0].fundShort!;
      toFundCode = loadFundsPlans!.response!.toFunds![0].fundCode!;
      isLoading = false;
      if(noInternet) {
        noInternet = false;
      }
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
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }

  }

  onSubmitPress(BuildContext context){


    print("cxzzfdsfdsfdsfds");
    print(toAccountValue);
    print("Asafd");

    print(fundValue);
    print("cxzzfdsfdsfdsfds");
    print(toFundValue);



    print(fundNameItems.toString());

    if(unitBalanceController.text != ''){
      if(dataValue != ''){
        if(double.parse(dataValue) > 0 || double.parse(unitBalanceController.text) > 0 ){
          if(isCheckPrivacy){
            trans.showDialog(context,accountValue,toAccountValue,fundValue,
                toFundValue,'',dataValue,percentageButton ? 'Percentage':'Units','FTF',
                onOkPress);
          }else{
            // showToast( "Please accept Terms & Conditions.");
            customDialogPinn(context,"Please accept Terms & Conditions.");
          }
        } else {
          // Fluttertoast.showToast(
          //     msg: 'Please enter Fund Balance/Percentage',
          //     toastLength: Toast.LENGTH_SHORT,
          //     gravity: ToastGravity.CENTER,
          //     timeInSecForIosWeb: 5,
          //     backgroundColor: Colors.black,
          //     textColor: Colors.white,
          //     fontSize: 16.0);
          customDialogPinn(context,"Please enter Fund Balance/Percentage");
        }
      } else {
        // Fluttertoast.showToast(
        //     msg: 'Please enter Fund Balance/Percentage',
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 5,
        //     backgroundColor: Colors.black,
        //     textColor: Colors.white,
        //     fontSize: 16.0);
        customDialogPinn(context,"Please enter pin code");

      }
    } else {
      // Fluttertoast.showToast(
      //     msg: 'Please enter Fund Balance/Percentage',
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 5,
      //     backgroundColor: Colors.black,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
      customDialogPinn(context,"Please enter Fund Balance/Percentage");

    }
  }

  onOkPress(BuildContext context) async {
    try {
      print(fundNameItems.toString());

      print(accountValue);print(toFundCode);
      print ( Constants.pincode);
      print("kjshjdashdkjsadhkjsadddddd");
      print(pinCodeController.text);
      print("saim");
      print(toAccountValue);
      print("dddddd");
      print (fundValue);
      print (dataValue);
      print("hjkjjjkkjljlklklklklklklklklklklklklk");
      print(fundCode.toString());
      print("hjkjjjkkjljlklklklklklklklklklklklklk");
      print(toFundValue.toString());
      print("ali");
      print(toFundCode.toString());
      isLoading = true;
      update();
      common = await _repository.onSaveFundTransfer(
          pinCodeController.text, accountValue, toAccountValue,
          fundCode, percentageButton ? "P" : "U", percentageButton ? fundVolume :dataValue , dataValue, toFundCode);
      isLoading = false;
      if(noInternet) {
        noInternet = false;
      }
      update();
      if(common!.meta!.message == 'OK' && common!.meta!.code == '200'){
        customDialogPin(context,"Request Submitted successfully");
        clearPage();
      }
      // update();
    } catch (e) {
      if (e.toString() == 'Exception: No Internet') {
        isLoading = false;
        noInternet = true;
        update();
      } else {
        isLoading = false;
        noInternet = false;
        update();  customDialogPinn(context,e.toString().replaceAll('Exception:', ''));

        // Fluttertoast.showToast(
        //     msg: e.toString().replaceAll('Exception:', ''),
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 5,
        //     backgroundColor: Colors.black,
        //     textColor: Colors.white,
        //     fontSize: 16.0);
      }
    }

  }


  void clearPage() async {
    isChecked = false;
    accountValue = Constant.loginModel!.response!.accounts![0].folioNumber ?? '';

    unitBalanceController.text = '';
    pinCodeController.text = '';

    fundValue = Constant.loginModel!.response!.accounts![0].userFundBalances![0].fundShort ?? '';
    fundCode = Constant.loginModel!.response!.accounts![0].userFundBalances![0].fundCode ?? '';
    toAccountValue = Constant.loginModel!.response!.accounts![0].folioNumber ?? '';
    toFundValue = "B";
    toFundCode = "";
    unitButton = true;
    percentageButton = false;
    allUnitButton = false;
    isCheckPrivacy = false;

    investButton = false;
    portfolioButton = false;
    buttonclick3 = false;

    isLoading = false;
    noInternet = false;
    loadFundsPlans = null;

    fundIndex = 0;
    index = 0;
    fundVolume = '0';
    approxAmount = '';
    approxUnits = '';
    dataValue = '';
    findIndex();
    onLoadFundsPlans();

  }



}