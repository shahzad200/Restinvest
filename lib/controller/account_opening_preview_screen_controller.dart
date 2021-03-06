
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nit/data/models/common_model.dart';
import 'package:nit/data/repository.dart';
import 'package:nit/utils/constants.dart';
import 'package:nit/views/account_opening_submit_button_screen.dart';
import 'package:nit/widgets/constant_widget.dart';


import 'account_opening_document_upload_screen_controller.dart';


class AccountOpenPreviewScreenController extends GetxController{
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isChecked=false;
  Common? common;
  bool isLoading = false;
  bool noInternet = false;
  final _repository = Repository();
  bool cNicFront = true;
  bool cNicBack = false;
  bool srcIncome = false;
  bool nominee = false;
  bool sigPage = false;
  bool zaKat = false;
  bool mobileReg = false;
  AccountOpenDocumentUploadScreenController con = Get.find<AccountOpenDocumentUploadScreenController>();

  onSubmit(context) async {
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
        Constant.sessionID = '0';
        Constant.cNic = '0';
        Constant.uTitle = '0';
        Constant.accType = '0';
        Constant.zakValue = '0';
        Constant.mobileReg = '0';

        Get.offAll(const AccountOpenSubmitButtonScreen());
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
        customDialogPinn(context,e.toString().replaceAll('Exception:', ''));
      }
    }
  }

}
