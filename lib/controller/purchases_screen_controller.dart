import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:investintrust/data/api_client.dart';
import 'package:investintrust/data/models/common_model.dart';
import 'package:investintrust/data/models/load_fund_plans.dart';
import 'package:investintrust/data/models/load_fund_plans_p.dart';
import 'package:investintrust/data/models/login_model.dart' as login;
import 'package:investintrust/data/repository.dart';
import 'package:investintrust/utils/constants.dart';
import 'package:investintrust/widgets/constant_widget.dart';
import 'package:investintrust/widgets/transaction_dialog.dart' as trans;

class PurchasesScreenController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isChecked = false;
  String fundNamevalue = "";
  // String accountvalue = "";
  String paymentvalue = "Cheque";
  String paymentvalueCode = "";

  bool unitButton = true;
  bool percentageButton = false;
  bool percentageEnable = false;
  bool allUnitButton = false;
  bool isLoading = false;
  bool noInternet = false;
  bool isCheckPrivacy = false;

  File? paymentProof;
  String? paymentProofExt;
  File? paymentSlip;
  String? paymentSlipExt;
  List<int> paymentProofBytes = [];
  List<int> paymentSlipBytes = [];
  final picker = ImagePicker();
  DateTime? date ;
  String collectionBankAccount = "";
  String collectionBankCode = "";
  String fundSale = "";

  TextEditingController unitBalanceController = TextEditingController();
  TextEditingController percentController = TextEditingController();
  TextEditingController picCodeController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController bankAccountController = TextEditingController();
  TextEditingController installmentController = TextEditingController();
  List<login.UserFundBalances> fundNameListItems = [];
  ApiClient api = ApiClient();
  final _repository = Repository();
  LoadFundsPlansP? loadFundsPlansP;
  LoadFundsPlans? loadFundsPlans;
  // FundBankAccountDetails? selectedFund;
  final map = login.UserFundBalances();
  double? calUnitBalanceValue;
  Common? common;
  // Common? submitResponse;
  String fundValue = Constant.loginModel!.response!.accounts![0].userFundBalances![0].fundShort ?? '';
  String fundCode = Constant.loginModel!.response!.accounts![0].userFundBalances![0].fundCode ?? '';
  String fundSaleValue = Constant.loginModel!.response!.accounts![0].userFundBalances![0].fundSaleLoad ?? '';
  String accountValue = Constant.loginModel!.response!.accounts![0].folioNumber ?? '';
  String fundBankName = '';
  String fundBankAccountNumber = '';
  String fundBankCode = '';
  @override
  void onInit() async {
    if(accountValue != '') {
      onLoadFundsPlans();
      // onLoadFundsPlansP();
    }
    // accountvalue = Constant.loginModel!.response!.accounts![0].folioNumber!;
    // Constant.loginModel!.response!.accounts![0].userFundBalances!
    //     .forEach((element) {
    //   map.fundShort = element.fundShort;
    //   map.fundCode = element.fundCode;
    //   map.fundvolume = element.fundvolume;
    //   map.fundName = element.fundName;
    //   map.fundPercent = element.fundPercent;
    //   map.fundRedPrice = element.fundRedPrice;
    //   map.fundSaleLoad = element.fundSaleLoad;
    //   map.fundUnits = element.fundUnits;
    //   map.offerPrice = element.offerPrice;
    //   map.priceDate = element.priceDate;
    //   map.unitClassess = element.unitClassess;
    //   fundNameListItems.add(login.UserFundBalances.fromJson(map.toJson()));
    // });
    // if (fundNameListItems.isNotEmpty) {
    //   fundNamevalue = fundNameListItems[0].fundShort!;
    //   fundSale = fundNameListItems[0].fundSaleLoad!;
    // }
    // // loadFundsPlans =await  api.onLoadFundsPlans(Constant.userId, Constant.loginModel!.response!.accounts![0].userFundBalances![0].fundCode!, accountvalue, "RED");
    // loadFundsPlans = await api.onLoadFundsPlans(
    //     Constant.userId,
    //     Constant
    //         .loginModel!.response!.accounts![0].userFundBalances![0].fundCode!,
    //     accountValue,
    //     "FTF");
    // if (loadFundsPlans != null) {
    //   selectedFund =
    //       loadFundsPlans!.response!.toFunds![0].fundBankAccountDetails![0];
    //   collectionBankAccount = selectedFund!.accountNo!;
    //   collectionBankCode = selectedFund!.bankCode!;
    // }

    update();
    super.onInit();
  }


  int fundIndex = 0;
  int findIndex(){
    fundIndex = Constant.loginModel!.response!.accounts!.indexWhere((element) => element.folioNumber == accountValue);
    fundValue = Constant.loginModel!.response!.accounts![fundIndex].fundNavPriceData![0].fundShort!;
    fundCode = Constant.loginModel!.response!.accounts![fundIndex].fundNavPriceData![0].fundCode!;
    return fundIndex;
  }

  onLoadFundsPlansP() async {
    try {
      isLoading = true;
      // toAccountValue = Constant.loginModel!.response!.accounts![0].folioNumber ?? '';
      update();
      printInfo(info: accountValue+'jjgjgj'+fundCode+'hhghgh');
      loadFundsPlansP = await _repository.onLoadFundsPlansP(fundCode, accountValue, "","XX");
      int index = loadFundsPlans!.response!.toFunds!.indexWhere((element) => element.fundCode == fundCode);
      printInfo(info: 'jhgjh'+index.toString());
      fundBankName = loadFundsPlans!.response!.toFunds![index].fundBankAccountDetails![0].bankName.toString();
      fundBankAccountNumber = loadFundsPlans!.response!.toFunds![index].fundBankAccountDetails![0].accountNo.toString();
      fundBankCode = loadFundsPlans!.response!.toFunds![index].fundBankAccountDetails![0].bankCode.toString();
      // toFundValue = loadFundsPlans!.response!.toFunds![0].fundShort!;
      // toFundCode = loadFundsPlans!.response!.toFunds![0].fundShort!;
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
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }

  }

  onLoadFundsPlans() async {
    try {
      isLoading = true;
      // toAccountValue = Constant.loginModel!.response!.accounts![0].folioNumber ?? '';
      update();
      printInfo(info: accountValue+'jjgjgj'+fundCode+'hhghgh');
      loadFundsPlans = await _repository.onLoadFundsPlans('', accountValue, "FTF");
      fundValue = loadFundsPlans!.response!.toFunds![0].fundShort!;
      fundCode = loadFundsPlans!.response!.toFunds![0].fundCode!;
      fundSaleValue = loadFundsPlans!.response!.toFunds![0].fundSaleLoad!;
      fundBankName = loadFundsPlans!.response!.toFunds![0].fundBankAccountDetails![0].bankName.toString();
      fundBankAccountNumber = loadFundsPlans!.response!.toFunds![0].fundBankAccountDetails![0].accountNo.toString();
      fundBankCode = loadFundsPlans!.response!.toFunds![0].fundBankAccountDetails![0].bankCode.toString();
      // toFundValue = loadFundsPlans!.response!.toFunds![0].fundShort!;
      // toFundCode = loadFundsPlans!.response!.toFunds![0].fundShort!;
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
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }

  }



  onGeneratePinCode(BuildContext context) async {
    try {
      isLoading = true;
      update();
      common = await _repository.onGeneratePinCode(accountValue, "SALE");
      isLoading = false;
      if (noInternet) {
        noInternet = false;
      }
      if (common!.meta!.message == 'OK' && common!.meta!.code == '200') {
        update();
        customDialogPin(
            context, "Pin Code sent to your email address successfully");
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

  //Image Picker function to get image from gallery
  Future<File?> getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);


    // if (pickedFile != null) {
    //   paymentProof = File(pickedFile.path);
    // }
    //  File(pickedFile!.path).readAsBytes().then((value) {
    //    bytes = Uint8List.fromList(value);});
    return File(pickedFile!.path);
  }

//Image Picker function to get image from camera
  Future<File?> getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    // if (pickedFile != null) {
    //   paymentProof = File(pickedFile.path);
    // }

    return File(pickedFile!.path);
  }

  onSubmitPress(BuildContext context) {
    printInfo(info: amountController.text );
    if(amountController.text == null || amountController.text == ''){
      showToast('Please enter amount');
    }else if(bankNameController.text == null || bankNameController.text == ""){
      showToast('Please enter bank name');
    } else if(bankAccountController.text == null || bankAccountController.text == ""){
      showToast('Please enter bank account number');
    } else if(paymentvalue != '1-Link'){
      if(installmentController.text == null || installmentController.text == "" ){
        showToast('Please enter cheque/instrument No.');
      }else if(date == null || date == ""){
        showToast('Please enter cheque/instrument Date.');
      } else if(picCodeController.text == null || picCodeController.text == ''){
        showToast('Please enter pin code');
      } else if (paymentProof == null) {
        showToast('Please add payment proof');
      } else if (paymentSlip == null){
        showToast('Please add payment slip');
      } else if(!isCheckPrivacy){
        showToast('Please accept terms and conditions');
      } else {
        trans.showDialog(
            context,
            accountValue,
            '',
            '',
            '',
            fundValue,
            "${amountController.text}",
            percentageButton ? 'Percentage' : 'Units',
            'PUR',
            onOkPress);
      }
    } else if(picCodeController.text == null || picCodeController.text == ''){
      showToast('Please enter pin code');
    }  else if(!isCheckPrivacy){
      showToast('Please accept terms and conditions');
    } else {
      trans.showDialog(
          context,
          accountValue,
          '',
          '',
          '',
          fundValue,
          "${amountController.text}",
          percentageButton ? 'Percentage' : 'Units',
          'PUR',
          onOkPress);
    }
  }

  onOkPress(BuildContext context)async{
    try {
      isLoading = true;
      update();
      common = await
      _repository.onSavePurchase(
        fundCode,
        accountValue,
        amountController.text,
        paymentvalue != '1-Link' ? installmentController.text : '',
        paymentvalue != '1-Link' ? date.toString() : '',
        bankNameController.text,
        bankAccountController.text,
        picCodeController.text,
        paymentvalueCode,
        collectionBankAccount,
        collectionBankCode,
        fundSaleValue,
        paymentvalue != '1-Link'
            ? paymentProofBytes == null || paymentProofBytes.isEmpty
            ? ''
            : base64Encode(paymentProofBytes)
            : '',
        paymentvalue != '1-Link' ? paymentProofExt! : '',
        paymentvalue != '1-Link' ? paymentSlipBytes == null ||
            paymentSlipBytes.isEmpty ? '' : base64Encode(paymentSlipBytes) : '',
        paymentvalue != '1-Link' ? paymentSlipExt! : '',
      );
    } catch(e){
      if (e.toString() == 'Exception: No Internet') {
        isLoading = false;
        noInternet = true;
        update();
      } else {
        isLoading = false;
        noInternet = false;
        update();
        Fluttertoast.showToast(
            msg: e.toString().replaceAll('Exception:', ''),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }



     // api.onSavePurchase(
     //   fundValue,
     //   accountValue,
     //   amountController.text,
     //   installmentController.text,
     //   date.toString(),
     //   bankNameController.text,
     //   bankAccountController.text,
     //   picCodeController.text,
     //   paymentvalueCode,
     //   collectionBankAccount,
     //   collectionBankCode,
     //   fundSale,
     //   "${paymentProofBytes == null || paymentProofBytes.isEmpty?null :base64Encode(paymentProofBytes)}",
     //   // base64Encode(paymentProofBytes),
     //   paymentProofExt!,
     //   "${paymentSlipBytes == null || paymentSlipBytes.isEmpty?null :base64Encode(paymentSlipBytes)}",
     //
     //   "${paymentSlipExt}",
     // );
      // submitResponse = await _repository.onSaveFundTransfer(
      //     pinCodeController.text, accountValue, toAccountValue,
      //     fundCode, percentageButton ? "P" : "U", "totalUnits", dataValue, toFundCode);
      isLoading = false;
      if(noInternet) {
        noInternet = false;
      }
      update();
      if(common!.meta!.message == 'OK' && common!.meta!.code == '200'){
        customDialogPin(context,"Request Submitted successfully");
      }
      // update();
    // } catch (e) {
    //   if (e.toString() == 'Exception: No Internet') {
    //     isLoading = false;
    //     noInternet = true;
    //     update();
    //   } else {
    //     isLoading = false;
    //     noInternet = false;
    //     update();
    //     Fluttertoast.showToast(
    //         msg: e.toString(),
    //         toastLength: Toast.LENGTH_SHORT,
    //         gravity: ToastGravity.CENTER,
    //         timeInSecForIosWeb: 1,
    //         backgroundColor: Colors.black,
    //         textColor: Colors.white,
    //         fontSize: 16.0);
    //   }
    // }
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
