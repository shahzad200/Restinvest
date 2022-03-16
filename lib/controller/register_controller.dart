import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nit/data/api_client.dart';
import 'package:nit/data/models/common_model.dart';
import 'package:nit/routes/routes.dart';
import 'package:nit/widgets/custome_dialog.dart';

class RegisterScreenController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var userName = "".obs;
  var password = "".obs;
  var number = "".obs;
  var email = "".obs;
  bool isLoading = false;
  bool noInternet = false;
  ApiClient api = ApiClient();
  Common? response;

  TextEditingController accNumberController = TextEditingController();

  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController cnicController = TextEditingController();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void updateUserName(value) {
    userName(value);
    update();
  }

  void updatePassword(value) {
    password(value);
    update();
  }

  void updateEmail(value) {
    email(value);
    update();
  }

  void updateNumber(value) {
    number(value);
    update();
  }

  onSubmitt(BuildContext context) async {
    try {
      isLoading = true;
      CustomDialog(context);
      update();

      CustomDialog(context);
      response = await api.onRegisteredUser(accNumberController.text,
          cnicController.text, emailController.text, numberController.text);
      Get.back();
      if (response != null) {
        Get.toNamed(AppRoute.pinConfirmation);
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
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }
}
