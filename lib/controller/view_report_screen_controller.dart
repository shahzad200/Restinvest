import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../data/models/view_reports.dart';
import '../data/repository.dart';
import '../widgets/pdf_view.dart';

class ViewReportsScreenController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  String startDate = "";
  String endDate = "";
  String selectedAccount = "";
  String folioNumber = "";
  String fundCode = "ALL";
  String reportType = "";
  final _repository = Repository();
  bool isLoading = false;
  bool noInternet = false;
  Uint8List? unit8list;
  late ViewReport viewReport;

  @override
  void onInit() {
    // reportType = Get.parameters!['param'] ?? 'TransferStatus';
    super.onInit();
  }

  String dateTime(DateTime date) {
    return date.day.toString() +
        '/' +
        date.month.toString() +
        '/' +
        date.year.toString();
  }

  onViewReport() async {
    reportType = Get.parameters!['param'] ?? 'TransferStatus';
    if (startDate != "" && startDate != null) {
      if (endDate != "" && endDate != null) {
        if (selectedAccount != "" && selectedAccount != null) {
          try {
            isLoading = true;
            update();
            viewReport = await _repository.onViewReport(
                startDate, endDate, fundCode, reportType, selectedAccount);
            unit8list = Uint8List.fromList(viewReport.response ?? [0, 9, 8]);
            // printInfo(info: unit8list.toString());

            isLoading = false;
            update();

            Get.to(PdfView(
              uint8list: unit8list,
            ));
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
                  msg: e.toString().replaceAll('Exception: ', ''),
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          }
        } else {
          Fluttertoast.showToast(
              msg: 'Please Select Account',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      } else {
        Fluttertoast.showToast(
            msg: 'Please Select EndDate',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } else {
      Fluttertoast.showToast(
          msg: 'Please Select StartDate',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
