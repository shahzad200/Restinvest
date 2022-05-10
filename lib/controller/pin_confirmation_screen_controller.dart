
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';

import 'package:nit/data/models/common_model.dart';
import 'package:nit/widgets/custome_dialog.dart';

import '../data/api_client.dart';

class PinConfirmationController extends GetxController{
  var formKey = GlobalKey<FormState>();

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var argument =Get.arguments;


  var pincode = "".obs;
  var cnic = "".obs;
  var userName = "".obs;
  var account = "".obs;
  var email = "".obs;
  void updateaccountNo(value) {
    account(value);
    update();
  }

  void updatePinCode(value) {
    pincode(value);
    update();
  }
  void updateSecurityCode(value) {
    email(value);
    update();
  }

  void updateUserName(value) {
    userName(value);
    update();
  }




  TextEditingController pinCodeController = TextEditingController();
  TextEditingController accNumberController = TextEditingController();

  TextEditingController cellNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController cnicController = TextEditingController();

  bool isLoading = false;
  bool noInternet = false;
  ApiClient api = ApiClient();
  Common? response;

  @override
  void onInit() {

    cnicController.text=argument["cNic"];
    emailController.text=argument["email"];
    cellNumberController.text=argument["cellNumber"];
    accNumberController.text=argument["accountNumber"];



    super.onInit();

  }
  onSubmitt(BuildContext context) async {
    try {
      print("jhsdkjfhdjksfh");
      print('hjjsdfjhsdgfjhfgsdjhdssssfgfdsfdsfsdhfgdsjhgashbvnmvbsdjhfgdh');
      print(response.toString());
      isLoading = true;
      CustomDialog(context);
      update();
      printInfo(info: cnicController.text);
      printInfo(info: pinCodeController.text);
      printInfo(info: accNumberController.text);
      printInfo(info: cellNumberController.text);
      printInfo(info: emailController.text);

      response = (await api.onRegisteredUserPin(accNumberController.text,
        cnicController.text, emailController.text, cellNumberController.text,pinCodeController.text,)) ;
      print("response!.meta!.code");
      print(response!.meta!.code);
      print("response!.meta!.code");
      if (response!.meta!.code == "200") {
        Get.back();
        Get.back();
        Get.back();
        Fluttertoast.showToast(
            msg: "Registered successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);


      }

      isLoading = false;
      update();


    } catch (e) {

      Get.back();
      if (e.toString() == 'Exception: No Internet') {
        isLoading = false;
        noInternet = true;
        update();
      } else {
        Get.back();
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

}



