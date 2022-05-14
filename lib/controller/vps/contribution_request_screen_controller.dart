import 'dart:io';
import 'dart:typed_data';


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nit/data/models/common_model.dart';

import 'package:nit/data/models/login_model.dart';
import 'package:nit/data/models/vps/load_fund.dart';
import 'package:nit/data/repository.dart';
import 'package:nit/utils/constants.dart';
import 'package:nit/widgets/constant_widget.dart';

class ContributionScreenController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController amountController = TextEditingController();
  TextEditingController instrumentController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController bankAccountController = TextEditingController();
  TextEditingController picCodeController = TextEditingController();

  String dropdownValue = 'One';
  bool isChecked = false;

  var character = 0;
  var balance = 1;
  var data = 2;
  bool isLoading = false;
  bool noInternet = false;
  final _repository = Repository();
  VpsLoadFolioFunds? vpsLoadFolioFunds;
  String? accountValue = '';
  String fundValue = '';
  String fundCode = '';
  String fundBank = '';
  String fundBankCode = '';
  String fundBankAccountNumber = '';
  String fundBankAccountNumberCode = '';
  String iBan = '';
  List<Accounts> listAccount = [];
  Uint8List? paymentProofBytes;
  Uint8List? depositProofBytes;
  String paymentValue = "Cheque";
  String paymentValueCode = "CH";
  DateTime? date;
  final picker = ImagePicker();
  File? paymentProof;
  String? paymentProofExt;

  File? depositProof;
  String? depositProofExt;

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
    // isLoading = false;
    // update();
    // TODO: implement onInit
    super.onInit();
  }

  // onVpsLoadFolioFunds(String folioNumber, String requestType)

  Future<File?> getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    return File(pickedFile!.path);
  }

  Future<File?> getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    return File(pickedFile!.path);
  }

  Common? common;

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

  onVpsLoadFolioFunds() async {
    try {
      isLoading = true;
      // toAccountValue = Constant.loginModel!.response!.accounts![0].folioNumber ?? '';
      update();
      // printInfo(info: accountValue+'jjgjgj'+fundCode+'hhghgh');
      vpsLoadFolioFunds =
          await _repository.onVpsLoadFolioFunds(accountValue!, "CONT");
      fundValue = vpsLoadFolioFunds!.response!.funds![0].fundShort!;
      fundCode = vpsLoadFolioFunds!.response!.funds![0].fundCode!;
      fundBank = vpsLoadFolioFunds!
          .response!.funds![0].fundBankAccounts![0].bankName
          .toString();
      fundBankCode = vpsLoadFolioFunds!
          .response!.funds![0].fundBankAccounts![0].bankCode
          .toString();
      fundBankAccountNumber = vpsLoadFolioFunds!
          .response!.funds![0].fundBankAccounts![0].accountNo
          .toString();
      // fundBankAccountNumberCode = vpsLoadFolioFunds!.response!.funds![0].fundBankAccounts![0].ac
      iBan = vpsLoadFolioFunds!.response!.funds![0].fundBankAccounts![0].iban
          .toString();
      // printInfo(info: 'HGFHGFGH'+loadFundsPlans!.response!.toFunds!.length.toString());
      // fundSaleValue = loadFundsPlans!.response!.toFunds![0].fundSaleLoad!;
      // fundBankName = loadFundsPlans!.response!.toFunds![0].fundBankAccountDetails![0].bankName.toString();

      // fundBankCode = loadFundsPlans!.response!.toFunds![0].fundBankAccountDetails![0].bankCode.toString();
      // toFundValue = loadFundsPlans!.response!.toFunds![0].fundShort!;
      // toFundCode = loadFundsPlans!.response!.toFunds![0].fundShort!;
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

  onSubmit(BuildContext context) async {
    printInfo(info: paymentValue.toString());
    if (amountController.text == null || amountController.text == '') {
      showToast('Please enter amount');
    } else if (bankNameController == null || bankNameController.text == '') {
      showToast('Please enter bank name');
    } else if (bankAccountController == null ||
        bankAccountController.text == '') {
      showToast('Please enter bank account number');
    } else if (picCodeController == null || picCodeController.text == '') {
      showToast('Please enter pin code');
    } else if (!isChecked) {
      showToast('Please check note');
    } else if (paymentValue == "Cheque") {
      if (instrumentController == null || instrumentController.text == '') {
        showToast('Please enter check instrument number');
      } else if (date == null) {
        showToast('Please select date');
      } else if (paymentProof == null) {
        showToast('Please add payment proof');
      } else if (depositProof == null) {
        showToast('Please add deposit proof');
      } else {
        onVpsContribution(context);
      }
    } else if (paymentValue == "1-Link") {
      onVpsContribution(context);
    } else if (paymentProof == null) {
      showToast('Please add payment proof');
    } else {
      onVpsContribution(context);
    }
  }

  onVpsContribution(BuildContext context) async {
    isLoading = true;
    update();
    try {
      if (paymentValue == "Cheque") {
        paymentProofBytes = paymentProof!.readAsBytesSync();
        depositProofBytes = depositProof!.readAsBytesSync();
      }
      if (paymentValue == 'IBFT') {
        paymentProofBytes = paymentProof!.readAsBytesSync();
      }
      common = await _repository.onVpsContribution(
          amountController.text,
          fundCode,
          bankNameController.text,
          accountValue!,
          paymentValueCode,
          paymentValue == 'Cheque'
              ? date!.day.toString() +
                  '/' +
                  date!.month.toString() +
                  '/' +
                  date!.year.toString()
              : '',
          paymentValue == 'Cheque' ? instrumentController.text : '',
          paymentValue == 'Cheque' ? paymentProofExt ?? '' : '',
          paymentValue == 'Cheque' || paymentValue == 'IBFT'
              ? paymentProofBytes
              : null,
          paymentValue == 'Cheque' ? depositProofExt ?? '' : '',
          paymentValue == 'Cheque' ? depositProofBytes : null,
          picCodeController.text,
          bankAccountController.text,
          fundBankCode,
          fundBankAccountNumber);
      if (noInternet) {
        noInternet = false;
      }
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
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }


  onReset(){
    paymentValue = 'Cheque';
    amountController.text = '';
    bankNameController.text = '';
    bankAccountController.text = '';
    instrumentController.text = '';
    picCodeController.text = '';
    paymentProofBytes = null;
    depositProofBytes = null;
    paymentProof = null;
    depositProof = null;
    isChecked = false;
    isLoading = false;
  }


}
