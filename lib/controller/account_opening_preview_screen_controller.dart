import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investintrust/data/models/common_model.dart';
import 'package:investintrust/data/repository.dart';
import 'package:investintrust/views/account_opening_submit_button_screen.dart';
import 'package:investintrust/widgets/constant_widget.dart';


class AccountOpenPreviewScreenController extends GetxController{
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isChecked=false;
  Common? common;
  bool isLoading = false;
  bool noInternet = false;
  final _repository = Repository();


  onSubmit() async {
    try {
      isLoading = true;
      update();
      common = await _repository.onSaveDigUser();
      isLoading = false;
      if (noInternet) {
        noInternet = false;
      }
      update();
      if(common!.meta!.message == 'OK' && common!.meta!.code == '200'){
        Get.to(const AccountOpenSubmitButtonScreen());
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
        showToast(e.toString().replaceAll('Exception:', ''));
      }
    }
  }

}
