
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:nit/data/api_client.dart';
import 'package:nit/data/models/common_model.dart';
import 'package:nit/data/models/load_fund_plans.dart';
import 'package:nit/data/models/login_model.dart' as login;
import 'package:nit/data/models/login_model.dart';
import 'package:nit/data/repository.dart';
import 'package:nit/utils/constants.dart';
import 'package:nit/widgets/constant_widget.dart';
import 'package:nit/widgets/custome_dialog.dart';
import 'package:nit/widgets/transaction_dialog.dart' as trans;


class RedemptionScreenController extends GetxController {
  // var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isChecked = false;
  String fundNamevalue = "";
  String fundNameCode = "";
  String accountvalue = "";
  String paymentvalue = "";
  bool unitButton = true;
  bool percentageButton = false;
  bool percentageEnable = false;
  bool allUnitButton = false;
  bool isLoading = false;
  bool noInternet = false;
  bool isCheckPrivacy = false;

  TextEditingController unitBalanceController = TextEditingController();
  TextEditingController percentController = TextEditingController();
  TextEditingController picCodeController = TextEditingController();
  List<login.UserFundBalances> fundNameListItems = [];
  ApiClient api = ApiClient();
  final _repository = Repository();
  LoadFundsPlans? loadFundsPlans;
  final map = login.UserFundBalances();
  double? calUnitBalanceValue;
  Common? pinCode;
  Common? submitResponse;
  String ?fundUnits;
  List<Accounts> listAccount = [];

  @override
  void onInit() async{



    isLoading = true;
    update();
    Constant.loginModel!.response!.accounts!.forEach((element) {
      if(element.vpsAccount != true){
        listAccount.add(element);
      }
    });
    // for (int i = 0; i < Constant.loginModel!.response!.accounts!.length; i++) {
    //   if (Constant.loginModel!.response!.accounts![i].vpsAccount == true) {
    //     listAccount.add(Constant.loginModel!.response!.accounts![i]);
    //   }
    // }
    accountvalue = listAccount[0].folioNumber!;
    listAccount[0].userFundBalances!.forEach((element) {
      map.fundShort =element.fundShort;
      map.fundCode =element.fundCode;
      map.fundvolume =element.fundvolume;
      map.fundName =element.fundName;
      map.fundPercent =element.fundPercent;
      map.fundRedPrice =element.fundRedPrice;
      map.fundSaleLoad =element.fundSaleLoad;
      map.fundUnits =element.fundUnits;
      map.offerPrice =element.offerPrice;
      map.priceDate =element.priceDate;
      map.unitClassess =element.unitClassess;
      fundNameListItems.add(login.UserFundBalances.fromJson(map.toJson()));

    });
    if(fundNameListItems.isNotEmpty){
      fundNamevalue = fundNameListItems[0].fundShort!;
      fundNameCode = fundNameListItems[0].fundCode!;
    }
    if(listAccount[0].userFundBalances!.isNotEmpty){
      loadFundsPlans =await  api.onLoadFundsPlans(Constant.userId, listAccount[0].userFundBalances![0].fundCode!, accountvalue, "RED");
    }
    if(isLoading) {
      isLoading = false;
    }
    update();
    super.onInit();
  }

  @override
  void onReady()async{

    Get.back();
    super.onReady();
  }

  late int index = 0;
  String? electronicUnit(){




    if(loadFundsPlans != null) {
      print(fundNamevalue);
      print("saad");
      print(fundVolume);
      if(loadFundsPlans!.response!.userFundBalances!.isNotEmpty){
        index = loadFundsPlans!.response!.userFundBalances!.indexWhere((
            element) => element.fundShort == fundNamevalue);
        fundUnits= loadFundsPlans!.response!.userFundBalances![index ?? 0].fundUnits;
        return fundUnits;
      }else{
        return '0';
      }
    }else {
      return '0';
    }
  }

  String? fundAmount(){
    if(loadFundsPlans != null) {
      if(loadFundsPlans!.response!.userFundBalances!.isNotEmpty){
        return loadFundsPlans!.response!.userFundBalances![index ?? 0].fundvolume;
      }else {
        return "0";
      }
    }else {
      return "0";
    }
  }

  calUnitBalance (s){
    String d = loadFundsPlans!.response!.userFundBalances![index].fundRedPrice ?? '0';
    double val = double.parse(d) * double.parse(s);
    return val;
  }

  String fundVolume = '';
  String approxAmount = '';
  String approxUnits = '';
  calculateUnits(String s){
    if(unitButton){
      print("KJHKJH"+loadFundsPlans!.response!.userFundBalances![index].fundUnits!);
      if(double.parse(s) <= double.parse(loadFundsPlans!.response!.userFundBalances![index].fundUnits ?? '0')){
        String d = loadFundsPlans!.response!.userFundBalances![index].fundRedPrice ?? '0';
        double val = double.parse(d) * double.parse(s);
        approxAmount =  val == 0 ? '': val.toStringAsFixed(2);
        print("sssssssssssssssssssssssssss$approxAmount");
        update();
      } else{
        unitBalanceController.text = '';
        calUnitBalanceValue = 0.0;
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
      print (">>>>>>>>>>>>>>>>>>nnnnn");
      print(fundVolume);
      print (">>>>>>>>>>>>>>>>>>");
      print(double.parse(s).toString());
      // print(double.parse(d).toString());
      print(approxUnits.toString());
      print (">>>>>>>>>>>>>>>>>>gggg");
      print( approxAmount.toString());
      print({"double.parse(d).toString() * double.parse(s).toString()"});

      print (">>>>>>>>>>>>>>>>>>unit");
      print(loadFundsPlans!.response!.userFundBalances![index].fundUnits.toString());
      print (">>>>>>>>>>>>>>>>>>price");
      print(loadFundsPlans!.response!.userFundBalances![index].fundRedPrice.toString());
      print (">>>>>>>>>>>>>>>>>>volume");
      print(loadFundsPlans!.response!.userFundBalances![index].fundvolume.toString());
      if(double.parse(s)<=100){


        String d = loadFundsPlans!.response!.userFundBalances![index].fundUnits ?? '0';
        String red = loadFundsPlans!.response!.userFundBalances![index].fundRedPrice ?? '0';
        percentageEnable = d == null || d == null? false:true;
        double val = double.parse(d) * double.parse(s);
        double approxUni = val / 100;
        double approxAmo = approxUni * double.parse(red);
        approxAmount = approxAmo.toStringAsFixed(2);
        print("zzzzzzzzzzzzzzzzzzzzz$approxAmount");
        approxUnits = approxUni.toStringAsFixed(2);
        update();
      } else{
        percentController.text = '';
        approxAmount = '';
        approxUnits = '';
        update();
        Fluttertoast.showToast(
            msg: 'Percentage must less than or equal to 100',
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
        if(loadFundsPlans!.response!.userFundBalances!.isNotEmpty) {
          String d = loadFundsPlans!.response!.userFundBalances![index].fundRedPrice ?? '0';
          String u = loadFundsPlans!.response!.userFundBalances![index].fundUnits ?? '0';
          double val = double.parse(d) * double.parse(u);
          // approxAmount =  val == 0 ? '': val.toStringAsFixed(2);
          approxAmount =  val == 0 ? '': loadFundsPlans!.response!.userFundBalances![index].fundvolume.toString();
          // print('>>>>> $');
          // approxUnits =  val == 0 ? '': loadFundsPlans!.response!.userFundBalances![index].fundUnits.toString();

          print('>>>>> $approxAmount');
          print("KJHKJH"+loadFundsPlans!.response!.userFundBalances![index].fundUnits!);
          print('>>>>> $approxUnits');


          unitBalanceController.text = u.toString();

          update();
        }
      }
    }
  }

  onGeneratePinCode(BuildContext context) async {
    try {
      isLoading = true;
      update();
      pinCode= await _repository.onGeneratePinCode(accountvalue, "RED");
      isLoading = false;
      if(noInternet) {
        noInternet = false;
      }
      if(pinCode!.meta!.message == 'OK' && pinCode!.meta!.code == '200'){
        customDialogPin(context , "Pin Code sent to your registered email address and mobile number successfully");
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
    print('tttttttttttt${fundUnits.toString()}');
    // api.onSaveRedemption(accessCode, authorizationPinCode, folioNumber, fundCode, redTransType, sessionId, sessionStartDate, totalUnits, transactionValue, unitClass, unitPlan, userId, userType)
    // if(unitBalanceController.text != null){
    //   if(calUnitBalanceValue != 0){
    if(unitBalanceController.text!=null&&unitBalanceController.text != "") {
      if(isCheckPrivacy!){


        print("data pin");
        if (unitButton) {
          if (unitBalanceController.text != null ||
              percentController.text != "") {
            if (calUnitBalanceValue! > 0 ||
                double.parse(unitBalanceController.text) > 0) {
              trans.showDialog(
                  context,
                  accountvalue,
                  '',
                  '',
                  '',
                  fundNamevalue,
                  "${unitBalanceController.text}",
                  // "${calUnitBalanceValue}",
                  percentageButton ? 'Percentage' : 'Units',
                  'RED',
                  onOkPress);
            }
          }
          else {
            // Fluttertoast.showToast(
            //     msg: 'Please enter Fund Balance',
            //     toastLength: Toast.LENGTH_SHORT,
            //     gravity: ToastGravity.CENTER,
            //     timeInSecForIosWeb: 5,
            //     backgroundColor: Colors.black,
            //     textColor: Colors.white,
            //     fontSize: 16.0);
            customDialogPinn(context,"Please enter Fund Balance/Percentage");

          }
        }

        if (percentageButton) {
          if (percentController.text != null && percentController.text != "") {
            if (double.parse(approxAmount) > 0 ||
                double.parse(approxUnits) > 0) {
              trans.showDialog(
                  context,
                  accountvalue,
                  '',
                  '',
                  '',
                  fundNamevalue,
                  percentController.text,
                  percentageButton ? 'Percentage' : 'Units',
                  'RED',
                  onOkPress);
            }
          }
          else {
            // Fluttertoast.showToast(
            //     msg: 'Please enter Percentage',
            //     toastLength: Toast.LENGTH_SHORT,
            //     gravity: ToastGravity.CENTER,
            //     timeInSecForIosWeb: 5,
            //     backgroundColor: Colors.black,
            //     textColor: Colors.white,
            //     fontSize: 16.0);
            customDialogPinn(context,"Please enter Fund Balance/Percentage");
          }
        }
        if(allUnitButton){
          print(">>>>>>>>>>>>>>$approxUnits>>>>>>>>>>>>>>>>>>>>>>>>>");
          print(">>>>>>>>>>>>>>");
          print(">>>>>>>>>>>>>>$approxAmount>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
          if (double.parse(approxAmount) > 0 ||
              double.parse(approxUnits) > 0) {
            trans.showDialog(
                context,
                accountvalue,
                '',
                '',
                '',
                fundNamevalue,
                "${unitBalanceController.text}",
                percentageButton ? 'Percentage' : 'Units',
                'RED',
                onOkPress);
          }
        }}else{
        // Fluttertoast.showToast(
        //     msg: 'Please Check Terms & Conditions',
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 5,
        //     backgroundColor: Colors.black,
        //     textColor: Colors.white,
        //     fontSize: 16.0);
        customDialogPinn(context,"Please Check Terms & Conditions");
      }
    }else{
      // Fluttertoast.showToast(
      //     msg: 'Please enter Pin',
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 5,
      //     backgroundColor: Colors.black,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
      customDialogPinn(context,"Please enter Pin");

    }
  }
  onOkPress(BuildContext context)async{
    try {
      isLoading = true;
      update();
      if(unitButton){
        submitResponse = await _repository.onSaveRedemption(picCodeController.text, accountvalue, fundNameCode,  "U", unitBalanceController.text, unitBalanceController.text.toString(),unitsCheck : "unit");

      }if(percentageButton){
        submitResponse = await _repository.onSaveRedemption(picCodeController.text, accountvalue, fundNameCode,  "P", percentController.text,fundUnits.toString(),unitsCheck: "percentage");

      }if(allUnitButton){
        print("ahjshdkjsadhjksdhjsadhsajkdh");
        print(fundVolume);
        print(fundNameCode);

        print("");
        // print(calUnitBalanceValue);
        submitResponse = await _repository.onSaveRedemption(picCodeController.text, accountvalue, fundNameCode,  "U", unitBalanceController.text, fundVolume,unitsCheck:  "allunits");

      }
      // submitResponse = await _repository.onSaveFundTransfer(
      //     pinCodeController.text, accountValue, toAccountValue,
      //     fundCode, percentageButton ? "P" : "U", "totalUnits", dataValue, toFundCode);
      isLoading = false;
      if(noInternet) {
        noInternet = false;
      }
      update();
      if(submitResponse!.meta!.message == 'OK' && submitResponse!.meta!.code == '200'){
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
        update();
        customDialogPinn(context,e.toString().replaceAll('Exception:', ''));
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
    index = 0;
    unitButton = true;
    percentageButton = false;
    allUnitButton = false;
    unitBalanceController.text = '';
    calUnitBalanceValue = 0.0;
    isCheckPrivacy = false;
    // update();
    isLoading = true;
    update();
    accountvalue = listAccount[0].folioNumber!;
    fundNameListItems = [];
    listAccount[0].userFundBalances!.forEach((element) {
      map.fundShort =element.fundShort;
      map.fundCode =element.fundCode;
      map.fundvolume =element.fundvolume;
      map.fundName =element.fundName;
      map.fundPercent =element.fundPercent;
      map.fundRedPrice =element.fundRedPrice;
      map.fundSaleLoad =element.fundSaleLoad;
      map.fundUnits =element.fundUnits;
      map.offerPrice =element.offerPrice;
      map.priceDate =element.priceDate;
      map.unitClassess =element.unitClassess;
      fundNameListItems.add(login.UserFundBalances.fromJson(map.toJson()));

    });
    if(fundNameListItems.isNotEmpty){
      fundNamevalue = fundNameListItems[0].fundShort!;
      fundNameCode = fundNameListItems[0].fundCode!;
    }
    unitBalanceController.text = '';
    percentController.text = '';
    picCodeController.text = '';
    loadFundsPlans = null;
    loadFundsPlans =await  api.onLoadFundsPlans(Constant.userId, listAccount[0].userFundBalances![0].fundCode!, accountvalue, "RED");
    print(loadFundsPlans!.response!);
    if(isLoading) {
      isLoading = false;
    }
    update();


  }

  investTrust(index) {
    switch (index) {
      case 0:
        {
          unitButton = true;
          percentageButton = false;
          allUnitButton = false;
          unitBalanceController.text = '';
          calUnitBalanceValue = 0.0;
          update();
          break;
        }
      case 1:
        {
          unitButton = false;
          percentageButton = true;
          allUnitButton = false;
          percentController.text = '';
          approxAmount = '';
          approxUnits = '';
          update();
          break;
        }
      case 2:
        {
          unitButton = false;
          percentageButton = false;
          allUnitButton = true;
          calculateUnits("0");
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