
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../data/models/calculate_tax.dart';
import '../data/repository.dart';


class TaxCalculatorScreenController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var salared;
  var tax;
  var income;
  var pension;
  var creditPension;
  var mutual;
  var creditMutual;
  var taxCredit;
  var f = NumberFormat("###,###.0#", "en_US");
  TextEditingController textEditingController = TextEditingController();
  String categoryValue = "";
  String bracketValue = "";
  String incomeValue = "";
  String occupationValue = "";
  late CalculateTax calculateTax;
  final _repository = Repository();
  displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Container(
              padding: EdgeInsets.all(16),
              color: Colors.white.withOpacity(0.8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  CircularProgressIndicator(),
                  Text("Please wait....")
                ],
              ),
            ),
          );
        });
  }

  var space = SizedBox(
    height: 10,
  );

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  onCalculate() async {
    try {
      calculateTax = await _repository.onCalculateTax(
          categoryValue == 'Salaried' ? 'S' : "N",
          textEditingController.value.text);
      // print(calculateTax.response!.salaried);
      salared = calculateTax.response!.salaried;
      tax = calculateTax.response!.taxPercent;
      income = calculateTax.response!.incomeTaxAmount;
      pension = calculateTax.response!.investInPensionFund;
      creditPension = calculateTax.response!.taxCreditInPensionFund;
      mutual = calculateTax.response!.investInMutualFund;
      creditMutual = calculateTax.response!.taxCreditInMutualFund;
      taxCredit = calculateTax.response!.totalTaxCredit;
      update();
    } catch (e) {
      if (e.toString() == 'Exception: No Internet') {
        update();
      } else {
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
}
