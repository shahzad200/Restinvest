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
  String accountvalue = "";
  String paymentvalue = "";
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
  Uint8List? paymentProofBytes;
  Uint8List? paymentSlipBytes;
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
  LoadFundsPlans? loadFundsPlans;
  FundBankAccountDetails? selectedFund;
  final map = login.UserFundBalances();
  double? calUnitBalanceValue;
  Common? pinCode;
  Common? submitResponse;

  @override
  void onInit() async {
    accountvalue = Constant.loginModel!.response!.accounts![0].folioNumber!;
    Constant.loginModel!.response!.accounts![0].userFundBalances!
        .forEach((element) {
      map.fundShort = element.fundShort;
      map.fundCode = element.fundCode;
      map.fundvolume = element.fundvolume;
      map.fundName = element.fundName;
      map.fundPercent = element.fundPercent;
      map.fundRedPrice = element.fundRedPrice;
      map.fundSaleLoad = element.fundSaleLoad;
      map.fundUnits = element.fundUnits;
      map.offerPrice = element.offerPrice;
      map.priceDate = element.priceDate;
      map.unitClassess = element.unitClassess;
      fundNameListItems.add(login.UserFundBalances.fromJson(map.toJson()));
    });
    if (fundNameListItems.isNotEmpty) {
      fundNamevalue = fundNameListItems[0].fundShort!;
      fundSale = fundNameListItems[0].fundSaleLoad!;
    }
    // loadFundsPlans =await  api.onLoadFundsPlans(Constant.userId, Constant.loginModel!.response!.accounts![0].userFundBalances![0].fundCode!, accountvalue, "RED");
    loadFundsPlans = await api.onLoadFundsPlans(
        Constant.userId,
        Constant
            .loginModel!.response!.accounts![0].userFundBalances![0].fundCode!,
        accountvalue,
        "FTF");
    if (loadFundsPlans != null) {
      selectedFund =
          loadFundsPlans!.response!.toFunds![0].fundBankAccountDetails![0];
      collectionBankAccount = selectedFund!.accountNo!;
      collectionBankCode = selectedFund!.bankCode!;
    }

    update();
    super.onInit();
  }

  onGeneratePinCode(BuildContext context) async {
    try {
      isLoading = true;
      update();
      pinCode = await _repository.onGeneratePinCode(accountvalue, "RED");
      isLoading = false;
      if (noInternet) {
        noInternet = false;
      }
      if (pinCode!.meta!.message == 'OK' && pinCode!.meta!.code == '200') {
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
    if (paymentvalueCode != null) {
      print("payment");
      if (amountController.text != null || amountController.text != "") {
        print("amount");
        if (bankNameController.text != null || bankNameController.text != "") {
          print("bank name");
          if (bankAccountController.text != null ||
              bankAccountController.text != "") {
            print("bank account");
            if (installmentController.text != null ||
                installmentController.text != "") {
              print("installment");
              if (date != null || date != "") {
                print("date");
                if (picCodeController.text != null ||
                    picCodeController.text != "") {
                  print("pin code");
                  if (paymentProof == null) {
                    print("payment proof");
                    if (paymentSlip == null) {
                      print("payment slip");
                      Fluttertoast.showToast(
                          msg: 'Please select payment proof',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else {
                      print("preesed");
                      trans.showDialog(
                          context,
                          accountvalue,
                          '',
                          '',
                          '',
                          fundNamevalue,
                          "${amountController.text}",
                          percentageButton ? 'Percentage' : 'Units',
                          'PUR',
                          onOkPress);

                    }
                  } else {
                    print("ksjalkjdklasndlkasd");
                    trans.showDialog(
                        context,
                        accountvalue,
                        '',
                        '',
                        '',
                        fundNamevalue,
                        "${amountController.text}",
                        "",
                        'PUR',
                        onOkPress);
                  }
                } else {
                  Fluttertoast.showToast(
                      msg: 'Please enter pin code',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
              } else {
                Fluttertoast.showToast(
                    msg: 'Please select date',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
            } else {
              Fluttertoast.showToast(
                  msg: 'Please enter Check/installment account No.',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          } else {
            Fluttertoast.showToast(
                msg: 'Please enter bank account No.',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        } else {
          Fluttertoast.showToast(
              msg: 'Please enter bank name',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      } else {
        Fluttertoast.showToast(
            msg: 'Please enter amount',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } else {
      Fluttertoast.showToast(
          msg: 'Please select payment mode',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  onOkPress(BuildContext context)async{
    try {
      isLoading = true;
      update();
     submitResponse  =await api.onSavePurchase(
       fundNamevalue,
       accountvalue,
       amountController.text,
       installmentController.text,
       date.toString(),
       bankNameController.text,
       bankAccountController.text,
       picCodeController.text,
       paymentvalueCode,
       collectionBankAccount,
       collectionBankCode,
       fundSale,
       paymentProofBytes.toString(),
       paymentProofExt!,
       paymentSlipBytes.toString(),
       paymentSlipExt!,
     );
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
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
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
