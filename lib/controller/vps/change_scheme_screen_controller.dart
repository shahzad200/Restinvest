import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nit/data/models/common_model.dart';
import 'package:nit/data/models/login_model.dart';
import 'package:nit/data/models/vps/load_existing_schema_data.dart';
import 'package:nit/data/models/vps/load_schema_allocation.dart';
import 'package:nit/data/repository.dart';
import 'package:nit/utils/constants.dart';
import 'package:nit/widgets/constant_widget.dart';


class ChangeSchemeScreenController extends GetxController{
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  String dropdownValue = 'One';
  bool isChecked=false;

  var character = 0;
  var balance = 1;
  var data = 2;

  late List<TextEditingController> textControllerList = [];

  TextEditingController picCodeController = TextEditingController();
  DateTime? date;
  bool isLoading = false;
  bool noInternet = false;
  final _repository = Repository();
  Common? common;
  List<Accounts> listAccount = [];
  LoadExistingSchemeData? loadExistingSchemeData;
  LoadSchemeAllocations? loadSchemeAllocations;
  String? accountValue = '';
  List<PensionFundList>? pensionFundList;
  String? pensionFundName = '';
  String? pensionFundCode = '';
  String? schemaName = '';
  String? schemaCode = '';
  String? preSchemaCode = '';
  @override
  void onInit() {
    // textControllerList = new [];
    isLoading = true;
    update();
    for (int i = 0; i < Constant.loginModel!.response!.accounts!.length; i++) {
      if (Constant.loginModel!.response!.accounts![i].vpsAccount == true) {
        listAccount.add(Constant.loginModel!.response!.accounts![i]);
      }
    }
    accountValue = listAccount[0].folioNumber;
    if(listAccount[0].pensionFundList!.isNotEmpty){
      pensionFundList = listAccount[0].pensionFundList!;
    }
    if(pensionFundList!.isNotEmpty){
      pensionFundName = pensionFundList![0].fundName;
      pensionFundCode = pensionFundList![0].fundCode;
    }
    onVpsLoadExistingSchemaData();
    // isLoading = false;
    // update();
    // TODO: implement onInit
    super.onInit();
  }



  onVpsLoadExistingSchemaData() async {
    try {
      isLoading = true;
      update();
      loadExistingSchemeData =
      await _repository.onVpsLoadExistingSchemaData(accountValue!);
      if(pensionFundList!.isNotEmpty){
        pensionFundName = pensionFundList![0].fundName;
        pensionFundCode = pensionFundList![0].fundCode;
      }
      schemaName = loadExistingSchemeData!.response!.schemes![0].param2;
      schemaCode = loadExistingSchemeData!.response!.schemes![0].param1;
      preSchemaCode = loadExistingSchemeData!.response!.schemes![0].param1;
      if(loadExistingSchemeData!.meta!.code == '200'){
        onVpsLoadSchemeAllocations(accountValue!,
            pensionFundCode!,
            loadExistingSchemeData!.response!.schemeCode!,
            loadExistingSchemeData!.response!.previousSchemeCode!);
      }else{
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
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }


  onVpsLoadSchemeAllocations(String folioNumber,String fundCode,String schemeCode,String previousSchemeCode) async {
    try {
      isLoading = true;
      update();
      loadSchemeAllocations =
      await _repository.onVpsLoadSchemeAllocations(folioNumber,
          fundCode, schemeCode,
          previousSchemeCode);
      schemaCode = loadSchemeAllocations!.response!.schemeCode;
      preSchemaCode = loadExistingSchemeData!.response!.previousSchemeCode;
      isLoading = false;
      if (noInternet) {
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


  onVpsGeneratePinCode(BuildContext context) async {
    try {
      isLoading = true;
      update();
      common = await _repository.onVpsGeneratePinCode(accountValue!, 'CONT');
      isLoading = false;
      if (noInternet) {
        noInternet = false;
      }
      if (common!.meta!.message == 'OK' && common!.meta!.code == '200') {
        update();
        customDialogPin(context,
            "Pin Code sent to your registered email address and mobile number successfully");
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
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }


  onSubmit(BuildContext context){
    double total = 0;
    int i = 0;
    if(loadSchemeAllocations!.response!.pensionSubfunds!.isNotEmpty){
      loadSchemeAllocations!.response!.pensionSubfunds!.forEach((element) {
        total = total + double.parse(textControllerList[i].value.text == '' ? '0': textControllerList[i].value.text);
        i++;
      });
      if(total < 100){
        showToast('Percentage cannot be less than 100');
      }else if(total == 100){
        int i = 0;
        loadSchemeAllocations!.response!.pensionSubfunds!.forEach((element) {
          element.percentage = textControllerList[i].value.text == '' ? '0' : textControllerList[i].value.text;
          i++;
        });
        if(picCodeController.text.isEmpty || picCodeController.text == null){
          showToast('Please enter generated pin code');
        } else if(!isChecked){
          showToast('Please check note');
        }else{
          onSaveChangeScheme(context);
        }
      }
    }else{
      showToast('You do not have any pension sub fund');
    }

  }



  onSaveChangeScheme(BuildContext context) async {
    try {
      isLoading = true;
      update();
      common = await _repository.onSaveChangeScheme(pensionFundCode!, accountValue!,
          schemaCode!, preSchemaCode!, picCodeController.text, loadSchemeAllocations!.response!.pensionSubfunds);
      isLoading = false;
      if (noInternet) {
        noInternet = false;
      }
      update();
      if(common!.meta!.code == '200'){
        customDialogPin(context,
            "Request Submitted successfully");
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
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }

  }

  onReset(){
    isLoading = true;
    update();
    picCodeController.text = '';
    for (int i = 0; i < Constant.loginModel!.response!.accounts!.length; i++) {
      if (Constant.loginModel!.response!.accounts![i].vpsAccount == true) {
        listAccount.add(Constant.loginModel!.response!.accounts![i]);
      }
    }
    accountValue = listAccount[0].folioNumber;
    if(listAccount[0].pensionFundList!.isNotEmpty){
      pensionFundList = listAccount[0].pensionFundList!;
    }
    if(pensionFundList!.isNotEmpty){
      pensionFundName = pensionFundList![0].fundName;
      pensionFundCode = pensionFundList![0].fundCode;
    }
    onVpsLoadExistingSchemaData();
  }


}
