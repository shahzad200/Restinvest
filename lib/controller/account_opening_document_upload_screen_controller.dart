import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;


class AccountOpenDocumentUploadScreenController extends GetxController{
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isChecked=false;
  final picker = ImagePicker();
  File? cnicFront;
  File? cnicBack;
  File? srcIncome;
  File? plainImage;
  File? otherImage;
  String? cnicFrontName;
  String? cnicBackName;
  String? srcIncomeName;
  String? plainImageName;
  String? otherImageName;


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

}
