import 'dart:io';
import 'dart:typed_data';


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nit/data/models/common_model.dart';
import 'package:nit/data/models/login_model.dart';
import 'package:nit/data/models/vps/load_balance_for_vps_redemption.dart';

import 'package:nit/data/models/vps/vps_load_fund_plans.dart';
import 'package:nit/data/repository.dart';
import 'package:nit/utils/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nit/widgets/constant_widget.dart';

class VpsRedemptionScreenController extends GetxController{
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController genPinCodeController = TextEditingController();

  TextEditingController yearOneController = TextEditingController();
  TextEditingController taxPaidOneController = TextEditingController();
  TextEditingController totalTaxableOneController = TextEditingController();

  TextEditingController yearTwoController = TextEditingController();
  TextEditingController taxPaidTwoController = TextEditingController();
  TextEditingController totalTaxableTwoController = TextEditingController();

  TextEditingController yearThreeController = TextEditingController();
  TextEditingController taxPaidThreeController = TextEditingController();
  TextEditingController totalTaxableThreeController = TextEditingController();

  TextEditingController lastClosingController = TextEditingController();
  TextEditingController amountInPercentController = TextEditingController();
  TextEditingController amountInRsController = TextEditingController();


  bool unitClass = false;
  bool isLoading = false;
  bool noInternet = false;
  final _repository = Repository();
  final picker = ImagePicker();
  Common? common;
  List<Accounts> listAccount = [];
  VpsLoadFundPlan? vpsLoadFolioFunds;
  String? accountValue = '';
  String fundValue = '';
  String className = '';
  String fundCode = '';

  String maturity = '0';
  String afterRetirement = '0';

  File? taxAttachedOne;
  File? taxAttachedTwo;
  File? taxAttachedThree;

  String? taxAttachedOneExt;
  String? taxAttachedTwoExt;
  String? taxAttachedThreeExt;

  Uint8List? taxAttachedOneBytes;
  Uint8List? taxAttachedTwoBytes;
  Uint8List? taxAttachedThreeBytes;

  bool isChecked=false;
  int groupValue = -1;

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
    onVpsLoadFolioFunds();
    // TODO: implement onInit
    super.onInit();
  }

  onVpsLoadFolioFunds() async {
    try {
      isLoading = true;
      update();
      LoadBalancesForVpsRedemption? loadBalancesForVpsRedemption;
     vpsLoadFolioFunds =
      await _repository.onVpsRedLoadFolioFunds(accountValue!, "VRED");
      fundValue = vpsLoadFolioFunds!.response!.userFundBalances![0].fundName!;
      fundCode = vpsLoadFolioFunds!.response!.userFundBalances![0].fundCode!;
      if(vpsLoadFolioFunds!.response!.userFundBalances![0].unitClassess!.length > 1){
        unitClass = true;
        className = vpsLoadFolioFunds!.response!.userFundBalances![0].unitClassess![0].className!;
        isLoading = false;
        if (noInternet) {
          noInternet = false;
        }
        update();
      } else{
        className = vpsLoadFolioFunds!.response!.userFundBalances![0].unitClassess![0].className!;
        isLoading = false;
        onVpsLoadBalancesForVpsRedemption();
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

  String calculate25(){
    double last = double.parse(lastClosingController.text);
    String percent = ((last / 100) * 25).toStringAsFixed(2);
    return percent;
  }

  otherAmount(bool percent,){
    if(percent){
      double last = double.parse(amountInPercentController.text);
      if(last > 100){
        amountInPercentController.text = '100';
        amountInRsController.text = lastClosingController.text;
        showToast('Percentage cannot be greater than 100');
      } else {
        double last = double.parse(amountInPercentController.text);
        amountInRsController.text = ((double.parse(lastClosingController.text) / 100) * last).toStringAsFixed(2);
      }
    } else{
      double last = double.parse(amountInRsController.text);
      if(last > double.parse(lastClosingController.text)){
        amountInPercentController.text = '100';
        amountInRsController.text = lastClosingController.text;
        showToast('Percentage cannot be greater than ${lastClosingController.text}');
      } else{
        double last = double.parse(amountInRsController.text);
        amountInPercentController.text = (last / (double.parse(lastClosingController.text)) * 100).toStringAsFixed(2);
      }
    }
  }

  Future<File?> getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    return File(pickedFile!.path);
  }

  Future<File?> getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    return File(pickedFile!.path);
  }

  onVpsGeneratePinCode(BuildContext context) async {
    try {
      isLoading = true;
      update();
      common = await _repository.onVpsGeneratePinCode(accountValue!, 'VRED');
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
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }


  onVpsLoadBalancesForVpsRedemption() async {
    try {
      isLoading = true;
      update();
      LoadBalancesForVpsRedemption? loadBalancesForVpsRedemption;
      loadBalancesForVpsRedemption = await _repository.onVpsLoadBalancesForVpsRedemption(
      accountValue!, fundCode, className);
      if(loadBalancesForVpsRedemption.meta!.code == '200'){
        lastClosingController.text = loadBalancesForVpsRedemption.response!.availableBalance.toString();
        maturity = loadBalancesForVpsRedemption.response!.maturity.toString();
        afterRetirement = loadBalancesForVpsRedemption.response!.afterRetirement.toString();
        groupValue = double.parse(
            lastClosingController.text == '' || lastClosingController.text == null ? '0' :
            lastClosingController.text
        ) > 0 ? 0 : -1;
        amountInPercentController.text = double.parse(
            lastClosingController.text == '' || lastClosingController.text == null ? '0' :
            lastClosingController.text
        ) > 0 ? '100' : '';
        amountInRsController.text = double.parse(
            lastClosingController.text == '' || lastClosingController.text == null ? '0' :
            lastClosingController.text
        ) > 0 ? lastClosingController.text : '';
      }
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
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }


  onPressSubmit(BuildContext context){
    if(amountInPercentController.text == null || amountInPercentController.text == ''){
      showToast('Please enter amount for transaction');
    } else if(yearOneController.text == null || yearOneController.text == ''){
      showToast('Please enter year');
    } else if(taxPaidOneController.text == null || taxPaidOneController.text == ''){
      showToast('Please enter tax paid');
    } else if(totalTaxableOneController.text == null || totalTaxableOneController.text == ''){
      showToast('Please enter total taxable income');
    } else if(yearTwoController.text == null || yearTwoController.text == ''){
      showToast('Please enter year');
    } else if(taxPaidTwoController.text == null || taxPaidTwoController.text == ''){
      showToast('Please enter tax paid');
    } else if(totalTaxableTwoController.text == null || totalTaxableTwoController.text == ''){
      showToast('Please enter total taxable income');
    } else if(yearThreeController.text == null || yearThreeController.text == ''){
      showToast('Please enter year');
    } else if(taxPaidThreeController.text == null || taxPaidThreeController.text == ''){
      showToast('Please enter tax paid');
    } else if(totalTaxableThreeController.text == null || totalTaxableThreeController.text == ''){
      showToast('Please enter total taxable income');
    } else if(taxAttachedOneBytes == null ){
      showToast('Please select image for tax one');
    } else if(taxAttachedTwoBytes == null ){
      showToast('Please select image for tax two');
    } else if(taxAttachedThreeBytes == null ){
      showToast('Please select image for tax three');
    } else if(genPinCodeController.text == null || genPinCodeController.text == ''){
      showToast('Please enter pin code');
    } else if(!isChecked){
      showToast('Please check note');
    } else {
      onSaveVpsRedemption(context);
    }
  }

  onSaveVpsRedemption(BuildContext context) async {
    isLoading = true;
    update();
   try{
      common = await _repository.onSaveVpsRedemption('other',
          amountInPercentController.text, lastClosingController.text, maturity,
          afterRetirement, fundCode, className, accountValue!,
          genPinCodeController.text, yearOneController.text, taxPaidOneController.text,
          totalTaxableOneController.text, taxAttachedOneBytes, taxAttachedOneExt!,
          yearTwoController.text, taxPaidTwoController.text,
          totalTaxableTwoController.text, taxAttachedTwoBytes,
          taxAttachedTwoExt!, yearThreeController.text, taxPaidThreeController.text,
          totalTaxableThreeController.text,
          taxAttachedThreeBytes, taxAttachedThreeExt!);
      isLoading = false;
      update();
      if(common!.meta!.message == 'OK' && common!.meta!.code == '200'){
        customDialogPin(context,"Request Submitted successfully");
        onReset();
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


  onReset(){
    groupValue = -1;
    accountValue = listAccount[0].folioNumber;
    onVpsLoadFolioFunds();
    genPinCodeController.text = '';
     yearOneController.text = '';
     taxPaidOneController.text = '';
     totalTaxableOneController.text = '';
     yearTwoController.text = '';
     taxPaidTwoController.text = '';
     totalTaxableTwoController.text = '';
     yearThreeController.text = '';
     taxPaidThreeController.text = '';
     totalTaxableThreeController.text = '';
     lastClosingController.text = '';
     amountInPercentController.text = '';
     amountInRsController.text = '';
     taxAttachedOne = null;
     taxAttachedTwo = null;
     taxAttachedThree = null;
     taxAttachedOneExt = '';
     taxAttachedTwoExt  = '';
     taxAttachedThreeExt  = '';
     taxAttachedOneBytes = null;
     taxAttachedTwoBytes = null;
     taxAttachedThreeBytes  = null;
    isChecked = false;
    isLoading = false;
    if (noInternet) {
      noInternet = false;
    }
    update();
  }



}
