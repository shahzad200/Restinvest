import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:investintrust/data/models/calculate_tax.dart';
import 'package:investintrust/data/repository.dart';

class TaxCalculatorScreenController extends GetxController {
  var formKey = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();
  String categoryValue = "";
  String bracketValue = "";
  String incomeValue = "";
  String occupationValue = "";
  late CalculateTax calculateTax;
  final _repository = Repository();
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
        try{
          calculateTax = await _repository.onCalculateTax(categoryValue == 'Salaried' ? 'S' :"N",
          textEditingController.value.text);
          update();
        }catch (e){
          if(e.toString() == 'Exception: No Internet'){
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
