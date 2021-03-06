import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:nit/data/api_client.dart';
import 'package:nit/data/models/common_model.dart';
import 'package:nit/routes/routes.dart';
import 'package:nit/widgets/constant_widget.dart';
import 'package:nit/widgets/custome_dialog.dart';

class RegisterScreenController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  var accountNo = "".obs;
  var cellNumber = "".obs;
  var cnicNumber = "".obs;
  var email = "".obs;
  bool isLoading = false;
  bool noInternet = false;
  ApiClient api = ApiClient();
  Common? response;

  TextEditingController accountNumberController = TextEditingController();

  TextEditingController cellNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController cnicController = TextEditingController();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void updateAccountNo(value) {
    accountNo(value);
    update();
  }

  void updateCellNumber(value) {
    cellNumber(value);
    update();
  }

  void updateEmail(value) {
    email(value);
    update();
  }

  void updateCnicNumber(value) {
    cnicNumber(value);
    update();
  }

  onSubmitt(BuildContext context) async {
    try {
      isLoading = true;
      CustomDialog(context);
      update();
      var cnic=cnicController.text;
      var email=emailController.text;
      var accountNo=accountNumberController.text;
      var cellNumber=cellNumberController.text;
      print( cnicController.text);
      print( cellNumberController.text);
      print( accountNumberController.text);
      print( emailController.text);

      CustomDialog(context);
      response = await api.onRegisteredUser(accountNumberController.text,
          cnicController.text, emailController.text, cellNumberController.text);
      Get.back();
      update();
      if (response != null) {

        print("jdjdjdjd");

        print( cnic);
        print(cellNumber);
        print( accountNo);
        print( email);
        print("zzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
        Get.toNamed(AppRoute.pinConfirmation,arguments: {
          "cNic": cnic,
          "email": email,
          "cellNumber": cellNumber,
          "accountNumber":accountNo,

        });
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
        customDialogPinn(context,e.toString().replaceAll('Exception:', ''));

        // Fluttertoast.showToast(
        //     msg: e.toString(),
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 5,
        //     backgroundColor: Colors.black,
        //     textColor: Colors.white,
        //     fontSize: 16.0);
      }
    }
  }
}
