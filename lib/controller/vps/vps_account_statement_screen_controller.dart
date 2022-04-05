import 'dart:typed_data';


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nit/data/repository.dart';

import '../../data/models/login_model.dart';
import '../../data/models/vps/vps_view_report.dart';
import '../../utils/constants.dart';
import '../../widgets/pdf_view.dart';


class VpsAccountStatementScreenController extends GetxController{
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  String dropdownValue = 'One';
  final _repository = Repository();
  bool isChecked=false;
  var character = 0;
  var balance = 1;
  var data = 2;
  // vpsAccountStatement
  List<Accounts> listAccount = [];
  List<PensionFundList> pensionList = [];
  bool isLoading = false;
  bool noInternet = false;

  String fromDate = '';
  String toDate = '';


  String? accountValue = '';
  String? pensionFundCode = '';
  String? pensionFundValue = '';
  String fundValue = '';
  String fundCode = '';
  VpsViewReport? vpsViewReport;
  @override
  void onInit() {

    isLoading = true;
    update();
    for (int i = 0; i < Constant.loginModel!.response!.accounts!.length; i++) {
      if (Constant.loginModel!.response!.accounts![i].vpsAccount == true) {
        listAccount.add(Constant.loginModel!.response!.accounts![i]);
      }
    }
    accountValue = listAccount[0].folioNumber;
    if(listAccount.isNotEmpty && listAccount[0].pensionFundList != []){
      pensionList = listAccount[0].pensionFundList!;
      pensionFundValue = pensionList[0].fundName;
      pensionFundCode = pensionList[0].fundCode;
    }
    isLoading = false;
    update();

    // TODO: implement onInit
    super.onInit();
  }


  int getIndex(String accountNumber){
    int index = 0;
    index = listAccount.indexWhere((element) => element.folioNumber == accountNumber);
    return index;
  }



  String dateTime(DateTime date) {
    return date.day.toString() +
        '/' +
        date.month.toString() +
        '/' +
        date.year.toString();
  }

  Uint8List? unit8list;
  onVpsAccountStatement() async {
    try {
      isLoading = true;
      update();
      vpsViewReport =
      await _repository.onVpsViewReport(accountValue!, fromDate, toDate, pensionFundCode!, 'vpsAccStmt');
      if(vpsViewReport!.meta!.code == '200'){
        unit8list = Uint8List.fromList(vpsViewReport?.response ?? [0, 9, 8]);
        Get.to(PdfView(
          uint8list: unit8list,
        ));
      }
      else{
        isLoading = false;
        if (noInternet) {
          noInternet = false;
        }
        update();
      }
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
  }
  //
  // Future<VpsViewReport> onVpsViewReport(String accountValue,String fromDate,String toDate,String pensionFund
  //     ,String reportType)



}
