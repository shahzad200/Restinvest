import 'dart:io';
import 'dart:typed_data';
import 'package:nit/utils/constants.dart';
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
  File? mobileImage;
  // File? otherImage;
  File? nomineeImage;
  String? cnicFrontName;
  String? cnicBackName;
  String? srcIncomeName;
  String? plainImageName;
  String? otherImageName;
  String? zaKatImageName;
  String? mobileImageName;
  String? nomineeImageName;
  Common? common;
  bool isLoading = false;
  bool noInternet = false;
  bool cnicFrontUpload = false;
  bool cnicBackUpload = false;
  bool incomeProofUpload = false;
  bool signUpload = false;
  bool zaKatUpload = false;
  bool mobileUpload = false;
  // bool otherUpload = false;
  bool nomineeUpload = false;
  final _repository = Repository();
  Uint8List? cNicB;
  Uint8List? cNicF;
  Uint8List? srcIn;
  Uint8List? planImg;
  Uint8List? zaKat;
  Uint8List? mobile;
  Uint8List? nomineeDoc;


  @override
  void onInit() async {
    // TODO: implement onInit
    if(Constant.validateVerificationCodeForDigUser!.response!.docUploadDisclaimerChecked == true){
      dynamic dynamicList = Constant.validateVerificationCodeForDigUser!.response!.cnicFrontDoc!['fileContent'];
      List<int> intList = dynamicList.cast<int>().toList(); //This is the magical line.
      cNicF = Uint8List.fromList(intList);
      cnicFrontUpload = true;
      dynamic dynamicListB = Constant.validateVerificationCodeForDigUser!.response!.cnicBackDoc!['fileContent'];
      List<int> intListB = dynamicListB.cast<int>().toList(); //This is the magical line.
      cNicB = Uint8List.fromList(intListB);
      cnicBackUpload = true;
      isChecked = Constant.validateVerificationCodeForDigUser!.response!.docUploadDisclaimerChecked ?? false;
      dynamic dynamicListI = Constant.validateVerificationCodeForDigUser!.response!.incomeProofDoc!['fileContent'];
      List<int> intListI = dynamicListI.cast<int>().toList(); //This is the magical line.
      srcIn = Uint8List.fromList(intListI);
      incomeProofUpload = true;
      // printInfo(info: srcIn.toString());
      dynamic dynamicListSig = Constant.validateVerificationCodeForDigUser!.response!.signatureDoc!['fileContent'];
      List<int> intListSig = dynamicListSig.cast<int>().toList(); //This is the magical line.
      planImg = Uint8List.fromList(intListSig);
      signUpload = true;

      dynamic dynamicListNominee = Constant.validateVerificationCodeForDigUser!.response!.requiredDocs![0].fileContent;
      List<int> intListNominee = dynamicListNominee.cast<int>().toList(); //This is the magical line.
      nomineeDoc = Uint8List.fromList(intListNominee);
      nomineeUpload = true;
      // printInfo(info: planImg.toString());

      if(Constant.validateVerificationCodeForDigUser!.response!.zakatExempt == true)
      {
        if(Constant.validateVerificationCodeForDigUser!.response!.zakatDeclarationDoc != null) {
          dynamic dynamicListZak = Constant.validateVerificationCodeForDigUser!
              .response!.zakatDeclarationDoc!['fileContent'];
          List<int> intListZak = dynamicListZak.cast<int>()
              .toList(); //This is the magical line.
          zaKat = Uint8List.fromList(intListZak);
          zaKatUpload = true;
        }
        // printInfo(info: zaKat.toString());
      }

      if(Constant.validateVerificationCodeForDigUser!.response!.mobileRegisteredWith != '4')
      {
        if(Constant.validateVerificationCodeForDigUser!.response!.mobileNoProofDoc != null){
          dynamic dynamicListMob = Constant.validateVerificationCodeForDigUser!.response!.mobileNoProofDoc!['fileContent'];
          List<int> intListMob = dynamicListMob.cast<int>().toList(); //This is the magical line.
          mobile = Uint8List.fromList(intListMob);
          mobileUpload = true;
        }
        // printInfo(info: mobile.toString());
      }
    }
  super.onInit();
  }



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
    isLoading = true;
    update();
      if(cNicF == null){
        isLoading = false;
        update();
        showToast('Please select cnic front image');
      }else if(cNicB == null){
        isLoading = false;
        update();
        showToast('Please select cnic back image');
      } else if(srcIn == null){
        isLoading = false;
        update();
        showToast('Please select cnic source of income image');
      } else if(planImg == null){
        isLoading = false;
        update();
        showToast('Please select plane image');
      } else if(nomineeDoc == null){
        isLoading = false;
        update();
        showToast('Please select nominee cnic image');
      }else if(Constant.zakValue == 'YES'){
        if(zaKat == null){
          isLoading = false;
          update();
          showToast('Please select zakat image');
        } else if(Constant.mobileReg != '4'){
          if(mobile == null){
            isLoading = false;
            update();
            showToast('Please select mobile number verification image');
          } else{
            isLoading = false;
            update();
            onUploadDoc();
          }
        } else{
          isLoading = false;
          update();
          onUploadDoc();
        }
      } else if(Constant.mobileReg != '4'){
        if(mobile == null){
          isLoading = false;
          update();
          showToast('Please select mobile number verification image');
        } else{
          isLoading = false;
          update();
          onUploadDoc();
        }
      }  else{
        isLoading = false;
        update();
        onUploadDoc();
      }
  }

  onUploadDoc() async {
    if(isChecked){
      try {
        if(!isLoading) {
          isLoading = true;
        }
        update();
        // Uint8List cNicB =  cnicBack!.readAsBytesSync();
        // Uint8List cNicF =  cnicFront!.readAsBytesSync();
        // Uint8List srcIn =  srcIncome!.readAsBytesSync();
        // Uint8List planImg =  plainImage!.readAsBytesSync();
        // Uint8List? zaKat;
        // Uint8List? mobile;
        // if(zaKatImage != null){
        //   zaKat = zaKatImage!.readAsBytesSync();
        // }
        // if(mobileImage != null){
        //   mobile = mobileImage!.readAsBytesSync();
        // }
        common = await _repository.onPartialSavingForDigUserScreen6(cNicB, cNicF,
            srcIn, planImg,zaKat,mobile,nomineeDoc,isChecked);
        isLoading = false;
        if (noInternet) {
          noInternet = false;
        }
        update();
        if(common!.meta!.message == 'OK' && common!.meta!.code == '200'){
          Get.to( AccountOpenPreviewScreen());
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
    } else {
      showToast('Please check disclaimer');
    }

  }


}
