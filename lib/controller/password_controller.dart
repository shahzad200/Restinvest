import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:investintrust/data/models/common_model.dart';
import 'package:investintrust/data/repository.dart';
class PasswordScreenController extends GetxController{
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
<<<<<<< HEAD


  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var userName = "".obs;
  var password = "".obs;
  void updateUserName(value) {
    userName(value);
    update();
  }

  void updatePassword(value) {
    password(value);
    update();
  }
=======
  final _repository = Repository();
  TextEditingController userIdController = TextEditingController();
  TextEditingController cNicController = TextEditingController();
  bool isLoading = false;
  bool noInternet = false;
  late Common common;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }


  onSubmit() async {
    try{
      isLoading = true;
      common = await _repository.onResetPassword(userIdController.value.text,
          cNicController.value.text);
      isLoading = false;
      update();
    }catch (e){
      if(e.toString() == 'Exception: No Internet'){
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


 
>>>>>>> 15508a7b74805021b6d6fe3a3bebb1f0aeaf468e
}
