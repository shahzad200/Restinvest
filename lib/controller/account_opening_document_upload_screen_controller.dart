import 'dart:io';
import 'dart:typed_data';
import 'package:investintrust/utils/constants.dart';
import 'package:path/path.dart' as p;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../data/models/common_model.dart';
import '../data/repository.dart';
import '../views/account_opening_preview_screen.dart';
import '../widgets/constant_widget.dart';



class AccountOpenDocumentUploadScreenController extends GetxController{
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isChecked=false;
  final picker = ImagePicker();
  File? cnicFront;
  File? cnicBack;
  File? srcIncome;
  File? plainImage;
  File? zaKatImage;
  File? otherImage;
  String? cnicFrontName;
  String? cnicBackName;
  String? srcIncomeName;
  String? plainImageName;
  String? otherImageName;
  String? zaKatImageName;
  Common? common;
  bool isLoading = false;
  bool noInternet = false;
  bool cnicFrontUpload = false;
  bool cnicBackUpload = false;
  bool incomeProofUpload = false;
  bool signUpload = false;
  bool zaKatUpload = false;
  bool otherUpload = false;
  final _repository = Repository();

  Future<File?> getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    // _.paymentProofExt = p.extension(_.paymentProof!.path);
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


  onSaveDoc()async{
      if(cnicFront == null){
        showToast('Please select cnic front image');
      }else if(cnicBack == null){
        showToast('Please select cnic back image');
      } else if(srcIncome == null){
        showToast('Please select cnic source of income image');
      } else if(plainImage == null){
        showToast('Please select plane image');
      } else if(Constant.zakValue == 'YES'){
        if(plainImage == null){
          showToast('Please select zakat image');
        } else {
          onUploadDoc();
        }
      } else{
        onUploadDoc();
      }
  }

  onUploadDoc() async {
    try {
      isLoading = true;
      update();
      Uint8List cNicB =  cnicBack!.readAsBytesSync();
      Uint8List cNicF =  cnicFront!.readAsBytesSync();
      Uint8List srcIn =  srcIncome!.readAsBytesSync();
      Uint8List planImg =  plainImage!.readAsBytesSync();
      Uint8List? zaKat;
      if(zaKatImage != null){
        zaKat = zaKatImage!.readAsBytesSync();
      }
      common = await _repository.onPartialSavingForDigUserScreen6(cNicB, cNicF,
          srcIn, planImg,zaKat);
      isLoading = false;
      if (noInternet) {
        noInternet = false;
      }
      update();
      if(common!.meta!.message == 'OK' && common!.meta!.code == '200'){
        Get.to(const AccountOpenPreviewScreen());
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
