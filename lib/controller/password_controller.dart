
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nit/widgets/constant_widget.dart';
import '../data/models/common_model.dart';
import '../data/repository.dart';
class PasswordScreenController extends GetxController{
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();



  var userId = "".obs;
  var cnicNumber = "".obs;
  void updateUserId(value) {
    userId(value);
    update();
  }

  void updateCNICNumber(value) {
    cnicNumber(value);
    update();
  }

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


  onSubmit(BuildContext context) async {
    try{
      isLoading = true;
      common = await _repository.onResetPassword(userIdController.value.text,
          cNicController.value.text);
      if(common.meta!.message.toString() == "OK") {
        customDialogPin(context,"Visit your registered email ID to proceed");
      }
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
            msg: e.toString().replaceAll('Exception:', ''),
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
