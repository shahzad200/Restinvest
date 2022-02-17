import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:investintrust/utils/constants.dart';
import 'package:investintrust/widgets/no_internet.dart';
import '../controller/account_opening_document_upload_screen_controller.dart';

import '../widgets/button.dart';

import '../utils/colors.dart';

import '../widgets/constant_widget.dart';
import 'package:path/path.dart' as p;

import 'account_opening_preview_screen.dart';

class AccountOpenDocumentUploadScreen extends StatelessWidget {
  const AccountOpenDocumentUploadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    final height = Get.height;
    return GetBuilder<AccountOpenDocumentUploadScreenController>(
        init: AccountOpenDocumentUploadScreenController(),
        builder: (_) {
          var space = const SizedBox(
            height: 10,
          );
          return SafeArea(
              child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: AppColor.whiteColor,
              title: Padding(
                padding: EdgeInsets.only(right: Get.width / 6),
                child: const Logo(
                  height: 50,
                  width: 50,
                ),
              ),
              elevation: 0,
            ),
            key: _.scaffoldKey,
            body: Stack(children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: [
                  space,
                  const RestInvestTitle(
                    text: " NITL DIGITAL ACCOUNT OPENING FORM ",
                    textAlign: TextAlign.start,
                    fontSize: 14,
                    textColor: AppColor.blueColor,
                    fontWeight: FontWeight.w900,
                  ),
                  Container(
                    // height: Get.height,
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 1, color: AppColor.blueColor)),
                    child: Column(children: [
                      const CustomTextContainer(
                        fontSize: 16,
                        height: 35,
                        text: "DOCUMENTS UPLOAD",
                        textAlign: TextAlign.start,
                      ),
                      space,
                      SingleChildScrollView(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // Row(
                            //   children: const [
                            //     RestInvestTitle(
                            //       text: " OTP VERIFY > ",
                            //       textAlign: TextAlign.start,
                            //       textColor: AppColor.dimblack,
                            //       fontSize: 10,
                            //       fontWeight: FontWeight.w900,
                            //     ),
                            //     RestInvestTitle(
                            //       text: " BASIC INFORMATION > ",
                            //       textAlign: TextAlign.start,
                            //       textColor: AppColor.dimblack,
                            //       fontSize: 10,
                            //       fontWeight: FontWeight.w900,
                            //     ),
                            //     RestInvestTitle(
                            //       text: "KYC DETAIL > ",
                            //       textAlign: TextAlign.start,
                            //       textColor: AppColor.dimblack,
                            //       fontSize: 10,
                            //       fontWeight: FontWeight.w900,
                            //     ),
                            //     RestInvestTitle(
                            //       text: " FATCA > ",
                            //       textAlign: TextAlign.start,
                            //       textColor: AppColor.dimblack,
                            //       fontWeight: FontWeight.w900,
                            //       fontSize: 10,
                            //     ),
                            //     RestInvestTitle(
                            //       text: "UPLOAD DOCUMENTS > ",
                            //       textAlign: TextAlign.start,
                            //       textColor: AppColor.blueColor,
                            //       fontWeight: FontWeight.w900,
                            //       fontSize: 10,
                            //     ),
                            //   ],
                            // ),
                            space,
                            const RestInvestTitle(
                              text: "CNIC/NICOP FRONT:*",
                              textAlign: TextAlign.start,
                              textColor: AppColor.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 12,
                            ),
                            Container(
                              height: 35,
                              // height: Get.height,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomRoundButton(
                                      height: 25,
                                      width: 40,
                                      text: "+ Choose",
                                      buttonColor: AppColor.whiteColor,
                                      textColor: AppColor.black,
                                      onPress: () {
                                        _.cnicFrontUpload = false;
                                        _.update();
                                        showModalBottomSheet(
                                            backgroundColor: Colors.transparent,
                                            elevation: 0,
                                            context: context,
                                            builder: (BuildContext bc) {
                                              return SafeArea(
                                                child: Container(
                                                  decoration: const BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(20),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      20)),
                                                      color: Colors.white),
                                                  child: Wrap(
                                                    children: <Widget>[
                                                      ListTile(
                                                          leading: const Icon(Icons
                                                              .photo_library),
                                                          title: const Text(
                                                              'Photo Library'),
                                                          onTap: () async {
                                                            _.cnicFront = await _
                                                                .getImageFromGallery();
                                                            _.cnicFrontName =
                                                                p.basename(_
                                                                    .cnicFront!
                                                                    .path);
                                                            // _.paymentSlipExt = p.extension(_.paymentSlip!.path);
                                                            _.cNicF = _.cnicFront!.readAsBytesSync();
                                                            // _.paymentSlip!.readAsBytes().then((value) {
                                                            //   _.paymentSlipBytes = Uint8List.fromList(value);});
                                                            // print("Extention${_.paymentSlipExt}");
                                                            _.update();
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                            showToast('Uploaded');
                                                          }),
                                                      ListTile(
                                                        leading: const Icon(
                                                            Icons.photo_camera),
                                                        title:
                                                            const Text('Camera'),
                                                        onTap: () async {
                                                          _.cnicFront = await _
                                                              .getImageFromCamera();
                                                          _.cnicFrontName =
                                                              p.basename(_
                                                                  .cnicFront!
                                                                  .path);
                                                          // _.paymentSlipExt = p.extension(_.paymentSlip!.path);
                                                            _.cNicF = _.cnicFront!.readAsBytesSync();
                                                          // _.paymentSlip!.readAsBytes().then((value) {
                                                          //   _.paymentSlipBytes = Uint8List.fromList(value);});
                                                          // print("Extention${_.paymentSlipExt}");
                                                          _.update();
                                                          Navigator.of(context)
                                                              .pop();
                                                          showToast('Uploaded');
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                      isRound: false),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: AppColor.greyColor.withOpacity(0.5),
                                  border: Border.all(
                                      width: 1, color: AppColor.black)),
                            ),
                            Container(
                              // height: 35,
                              width: Get.width,
                              // height: Get.height,
                              decoration: BoxDecoration(
                                  color: AppColor.whiteColor,
                                  border: Border.all(
                                      width: 1, color: AppColor.black)),
                              child: _.cnicFrontUpload && _.cNicF != null
                                  ? Center(
                                      child: Image.memory(
                                      _.cNicF!,
                                      height: 80,
                                      width: 120,
                                    ))
                                  : SizedBox(),
                            ),
                            const RestInvestTitle(
                              text:
                                  "Allowed Type:(gif,jpg,jpeg,png,pdf,doc,docx)/,Max file size: 5MB,No of files\nallowed:1",
                              textAlign: TextAlign.start,
                              textColor: AppColor.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 10,
                            ),
                            space,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (_.cNicF != null) {
                                      _.cnicFrontUpload = true;
                                    }
                                    _.update();
                                  },
                                  child: const RestInvestTitle(
                                    text: "view uploaded image",
                                    textAlign: TextAlign.start,
                                    textColor: AppColor.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 10,
                                  ),
                                ),
                                CustomRoundButton(
                                    height: 35,
                                    width: 50,
                                    text: "Remove",
                                    onPress: () {
                                      if (_.cnicFrontUpload) {
                                        _.cnicFrontUpload = false;
                                      }
                                      if (_.cNicF != null) {
                                        _.cNicF = null;
                                      }
                                      _.update();
                                    },
                                    isRound: false),
                              ],
                            ),
                            space,
                            const RestInvestTitle(
                              text: "CNIC/NICOP BACK:*",
                              textAlign: TextAlign.start,
                              textColor: AppColor.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 12,
                            ),
                            Container(
                              height: 35,
                              // height: Get.height,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomRoundButton(
                                      height: 25,
                                      width: 40,
                                      text: "+ Choose",
                                      buttonColor: AppColor.whiteColor,
                                      textColor: AppColor.black,
                                      onPress: () {
                                        _.cnicBackUpload = false;
                                        _.update();
                                        showModalBottomSheet(
                                            backgroundColor: Colors.transparent,
                                            elevation: 0,
                                            context: context,
                                            builder: (BuildContext bc) {
                                              return SafeArea(
                                                child: Container(
                                                  decoration: const BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(20),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      20)),
                                                      color: Colors.white),
                                                  child:  Wrap(
                                                    children: <Widget>[
                                                       ListTile(
                                                          leading:  const Icon(Icons
                                                              .photo_library),
                                                          title:  const Text(
                                                              'Photo Library'),
                                                          onTap: () async {
                                                            _.cnicBack = await _
                                                                .getImageFromGallery();
                                                            _.cnicBackName =
                                                                p.basename(_
                                                                    .cnicBack!
                                                                    .path);
                                                            print(
                                                                "base name${_.cnicBackName}");
                                                            // _.paymentSlipExt = p.extension(_.paymentSlip!.path);
                                                            _.cNicB = _.cnicBack!.readAsBytesSync();
                                                            // _.paymentSlip!.readAsBytes().then((value) {
                                                            //   _.paymentSlipBytes = Uint8List.fromList(value);});
                                                            // print("Extention${_.paymentSlipExt}");
                                                            _.update();
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                            showToast('Uploaded');
                                                          }),
                                                       ListTile(
                                                        leading:  const Icon(
                                                            Icons.photo_camera),
                                                        title:
                                                             const Text('Camera'),
                                                        onTap: () async {
                                                          _.cnicBack = await _
                                                              .getImageFromCamera();
                                                          _.cnicBackName =
                                                              p.basename(_
                                                                  .cnicBack!
                                                                  .path);
                                                          print(
                                                              "base name${_.cnicBackName}");
                                                          // _.paymentSlipExt = p.extension(_.paymentSlip!.path);
                                                          _.cNicB = _.cnicBack!.readAsBytesSync();
                                                          // _.paymentSlip!.readAsBytes().then((value) {
                                                          //   _.paymentSlipBytes = Uint8List.fromList(value);});
                                                          // print("Extention${_.paymentSlipExt}");
                                                          _.update();
                                                          Navigator.of(context)
                                                              .pop();
                                                          showToast('Uploaded');
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                      isRound: false),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: AppColor.greyColor.withOpacity(0.5),
                                  border: Border.all(
                                      width: 1, color: AppColor.black)),
                            ),
                            Container(
                              // height: 35,
                              width: Get.width,
                              decoration: BoxDecoration(
                                  color: AppColor.whiteColor,
                                  border: Border.all(
                                      width: 1, color: AppColor.black)),
                              child: _.cnicBackUpload && _.cNicB != null
                                  ? Center(
                                      child: Image.memory(
                                      _.cNicB!,
                                      height: 80,
                                      width: 120,
                                    ))
                                  : const SizedBox(),
                            ),
                            const RestInvestTitle(
                              text:
                                  "Allowed Type:(gif,jpg,jpeg,png,pdf,doc,docx)/,Max file size: 5MB,No of files\nallowed:1",
                              textAlign: TextAlign.start,
                              textColor: AppColor.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 10,
                            ),
                            space,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (_.cNicB != null) {
                                      _.cnicBackUpload = true;
                                    }
                                    _.update();
                                  },
                                  child: const RestInvestTitle(
                                    text: "view uploaded image",
                                    textAlign: TextAlign.start,
                                    textColor: AppColor.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 10,
                                  ),
                                ),
                                CustomRoundButton(
                                    height: 35,
                                    width: 50,
                                    text: "Remove",
                                    onPress: () {
                                      if (_.cnicBackUpload) {
                                        _.cnicBackUpload = false;
                                      }
                                      if (_.cNicB != null) {
                                        _.cNicB = null;
                                      }
                                      _.update();
                                    },
                                    isRound: false),
                              ],
                            ),
                            space,
                            const RestInvestTitle(
                              text: "PROOF OF INCOME/SOURCE OF INCOME:*",
                              textAlign: TextAlign.start,
                              textColor: AppColor.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 12,
                            ),
                            Container(
                              height: 35,
                              // height: Get.height,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomRoundButton(
                                      height: 25,
                                      width: 40,
                                      text: "+ Choose",
                                      buttonColor: AppColor.whiteColor,
                                      textColor: AppColor.black,
                                      onPress: () {
                                        _.incomeProofUpload = false;
                                        _.update();
                                        showModalBottomSheet(
                                            backgroundColor: Colors.transparent,
                                            elevation: 0,
                                            context: context,
                                            builder: (BuildContext bc) {
                                              return SafeArea(
                                                child: Container(
                                                  decoration: const BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(20),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      20)),
                                                      color: Colors.white),
                                                  child:  Wrap(
                                                    children: <Widget>[
                                                       ListTile(
                                                          leading:  const Icon(Icons
                                                              .photo_library),
                                                          title:  const Text(
                                                              'Photo Library'),
                                                          onTap: () async {
                                                            _.srcIncome = await _
                                                                .getImageFromGallery();
                                                            _.srcIncomeName =
                                                                p.basename(_
                                                                    .srcIncome!
                                                                    .path);
                                                            // print("base name${_.baseName}");
                                                            // _.paymentSlipExt = p.extension(_.paymentSlip!.path);
                                                            _.srcIn = _.srcIncome!.readAsBytesSync();
                                                            // _.paymentSlip!.readAsBytes().then((value) {
                                                            //   _.paymentSlipBytes = Uint8List.fromList(value);});
                                                            // print("Extention${_.paymentSlipExt}");
                                                            _.update();
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                            showToast('Uploaded');
                                                          }),
                                                       ListTile(
                                                        leading:  const Icon(
                                                            Icons.photo_camera),
                                                        title:
                                                             const Text('Camera'),
                                                        onTap: () async {
                                                          _.srcIncome = await _
                                                              .getImageFromCamera();
                                                          _.srcIncomeName =
                                                              p.basename(_
                                                                  .srcIncome!
                                                                  .path);
                                                          // _.paymentSlipExt = p.extension(_.paymentSlip!.path);
                                                          _.srcIn = _.srcIncome!.readAsBytesSync();
                                                          // _.paymentSlip!.readAsBytes().then((value) {
                                                          //   _.paymentSlipBytes = Uint8List.fromList(value);});
                                                          // print("Extention${_.paymentSlipExt}");
                                                          _.update();
                                                          Navigator.of(context)
                                                              .pop();
                                                          showToast('Uploaded');
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                      isRound: false),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: AppColor.greyColor.withOpacity(0.5),
                                  border: Border.all(
                                      width: 1, color: AppColor.black)),
                            ),
                            Container(
                              // height: 35,
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: AppColor.whiteColor,
                                border:
                                    Border.all(width: 1, color: AppColor.black),
                              ),
                              child: _.incomeProofUpload && _.srcIn != null
                                  ? Center(
                                      child: Image.memory(
                                      _.srcIn!,
                                      height: 80,
                                      width: 120,
                                    ))
                                  : const SizedBox(),
                            ),
                            const RestInvestTitle(
                              text:
                                  "Allowed Type:(gif,jpg,jpeg,png,pdf,doc,docx)/,Max file size: 5MB,No of files\nallowed:1",
                              textAlign: TextAlign.start,
                              textColor: AppColor.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 10,
                            ),
                            space,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (_.srcIn != null) {
                                      _.incomeProofUpload = true;
                                    }
                                    _.update();
                                  },
                                  child: const RestInvestTitle(
                                    text: "view uploaded image",
                                    textAlign: TextAlign.start,
                                    textColor: AppColor.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 10,
                                  ),
                                ),
                                CustomRoundButton(
                                    height: 35,
                                    width: 50,
                                    text: "Remove",
                                    onPress: () {
                                      if (_.incomeProofUpload) {
                                        _.incomeProofUpload = false;
                                      }
                                      if (_.srcIn != null) {
                                        _.srcIn = null;
                                      }
                                      _.update();
                                    },
                                    isRound: false),
                              ],
                            ),
                            space,
                            const RestInvestTitle(
                              text: "SIGNATURE:*(Plain Paper)",
                              textAlign: TextAlign.start,
                              textColor: AppColor.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 12,
                            ),
                            Container(
                              height: 35,
                              // height: Get.height,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomRoundButton(
                                      height: 25,
                                      width: 40,
                                      text: "+ Choose",
                                      buttonColor: AppColor.whiteColor,
                                      textColor: AppColor.black,
                                      onPress: () {
                                        _.signUpload = false;
                                        _.update();
                                        showModalBottomSheet(
                                            backgroundColor: Colors.transparent,
                                            elevation: 0,
                                            context: context,
                                            builder: (BuildContext bc) {
                                              return SafeArea(
                                                child: Container(
                                                  decoration: const BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(20),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      20)),
                                                      color: Colors.white),
                                                  child:  Wrap(
                                                    children: <Widget>[
                                                       ListTile(
                                                          leading:  const Icon(Icons
                                                              .photo_library),
                                                          title:  const Text(
                                                              'Photo Library'),
                                                          onTap: () async {
                                                            _.plainImage = await _
                                                                .getImageFromGallery();
                                                            _.plainImageName =
                                                                p.basename(_
                                                                    .plainImage!
                                                                    .path);
                                                            // _.paymentSlipExt = p.extension(_.paymentSlip!.path);
                                                            _.planImg = _.plainImage!.readAsBytesSync();
                                                            // _.paymentSlip!.readAsBytes().then((value) {
                                                            //   _.paymentSlipBytes = Uint8List.fromList(value);});
                                                            // print("Extention${_.paymentSlipExt}");
                                                            _.update();
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                            showToast('Uploaded');
                                                          }),
                                                       ListTile(
                                                        leading:  const Icon(
                                                            Icons.photo_camera),
                                                        title:
                                                             const Text('Camera'),
                                                        onTap: () async {
                                                          _.plainImage = await _
                                                              .getImageFromCamera();
                                                          _.plainImageName =
                                                              p.basename(_
                                                                  .plainImage!
                                                                  .path);
                                                          // _.paymentSlipExt = p.extension(_.paymentSlip!.path);
                                                          _.planImg = _.plainImage!.readAsBytesSync();
                                                          // _.paymentSlip!.readAsBytes().then((value) {
                                                          //   _.paymentSlipBytes = Uint8List.fromList(value);});
                                                          // print("Extention${_.paymentSlipExt}");
                                                          _.update();
                                                          Navigator.of(context)
                                                              .pop();
                                                          showToast('Uploaded');
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                      isRound: false),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: AppColor.greyColor.withOpacity(0.5),
                                  border: Border.all(
                                      width: 1, color: AppColor.black)),
                            ),
                            Container(
                              // height: 35,
                              width: Get.width,
                              decoration: BoxDecoration(
                                  color: AppColor.whiteColor,
                                  border: Border.all(
                                      width: 1, color: AppColor.black)),
                              child: _.signUpload && _.planImg != null
                                  ? Center(
                                      child: Image.memory(
                                      _.planImg!,
                                      height: 80,
                                      width: 120,
                                    ))
                                  : const SizedBox(),
                            ),
                            const RestInvestTitle(
                              text:
                                  "Allowed Type:(gif,jpg,jpeg,png,pdf,doc,docx)/,Max file size: 5MB,No of files\nallowed:1",
                              textAlign: TextAlign.start,
                              textColor: AppColor.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 10,
                            ),
                            space,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (_.planImg != null) {
                                      _.signUpload = true;
                                    }
                                    _.update();
                                  },
                                  child: const RestInvestTitle(
                                    text: "view uploaded image",
                                    textAlign: TextAlign.start,
                                    textColor: AppColor.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 10,
                                  ),
                                ),
                                CustomRoundButton(
                                    height: 35,
                                    width: 50,
                                    text: "Remove",
                                    onPress: () {
                                      if (_.signUpload) {
                                        _.signUpload = false;
                                      }
                                      if (_.planImg != null) {
                                        _.planImg = null;
                                      }
                                      _.update();
                                    },
                                    isRound: false),
                              ],
                            ),
                            Constant.mobileReg != '4'
                                ? Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                space,
                                const RestInvestTitle(
                                  text: "MOBILE NUMBER PROOF:*",
                                  textAlign: TextAlign.start,
                                  textColor: AppColor.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 12,
                                ),
                                Container(
                                  height: 35,
                                  // height: Get.height,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      CustomRoundButton(
                                          height: 25,
                                          width: 40,
                                          text: "+ Choose",
                                          buttonColor:
                                          AppColor.whiteColor,
                                          textColor: AppColor.black,
                                          onPress: () {
                                            _.mobileUpload = false;
                                            _.update();
                                            showModalBottomSheet(
                                                backgroundColor:
                                                Colors.transparent,
                                                elevation: 0,
                                                context: context,
                                                builder:
                                                    (BuildContext bc) {
                                                  return SafeArea(
                                                    child: Container(
                                                      decoration: const BoxDecoration(
                                                          borderRadius: BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(
                                                                  20),
                                                              topLeft: Radius
                                                                  .circular(
                                                                  20)),
                                                          color: Colors
                                                              .white),
                                                      child: Wrap(
                                                        children: <
                                                            Widget>[
                                                          ListTile(
                                                              leading: const Icon(
                                                                  Icons
                                                                      .photo_library),
                                                              title: const Text(
                                                                  'Photo Library'),
                                                              onTap:
                                                                  () async {
                                                                _.mobileImage =
                                                                await _
                                                                    .getImageFromGallery();
                                                                _.mobileImageName = p.basename(_
                                                                    .mobileImage!
                                                                    .path);
                                                                _.mobile = _.mobileImage!.readAsBytesSync();
                                                                _.update();
                                                                Navigator.of(
                                                                    context)
                                                                    .pop();
                                                                showToast('Uploaded');
                                                              }),
                                                          ListTile(
                                                            leading:
                                                            const Icon(
                                                                Icons
                                                                    .photo_camera),
                                                            title: const Text(
                                                                'Camera'),
                                                            onTap:
                                                                () async {
                                                              _.mobileImage =
                                                              await _
                                                                  .getImageFromCamera();
                                                              _.mobileImageName =
                                                                  p.basename(_
                                                                      .zaKatImage!
                                                                      .path);
                                                              _.mobile = _.mobileImage!.readAsBytesSync();
                                                              _.update();
                                                              Navigator.of(
                                                                  context)
                                                                  .pop();
                                                              showToast('Uploaded');
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                });
                                          },
                                          isRound: false),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      color: AppColor.greyColor
                                          .withOpacity(0.5),
                                      border: Border.all(
                                          width: 1,
                                          color: AppColor.black)),
                                ),
                                Container(
                                  // height: 35,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      color: AppColor.whiteColor,
                                      border: Border.all(
                                          width: 1,
                                          color: AppColor.black)),
                                  child: _.mobileUpload &&
                                      _.mobile != null
                                      ? Center(
                                      child: Image.memory(
                                        _.mobile!,
                                        height: 80,
                                        width: 120,
                                      ))
                                      : SizedBox(),
                                ),
                                const RestInvestTitle(
                                  text:
                                  "Allowed Type:(gif,jpg,jpeg,png,pdf,doc,docx)/,Max file size: 5MB,No of files\nallowed:1",
                                  textAlign: TextAlign.start,
                                  textColor: AppColor.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 10,
                                ),
                                space,
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        if (_.mobile != null) {
                                          _.mobileUpload = true;
                                        }
                                        _.update();
                                      },
                                      child: const RestInvestTitle(
                                        text: "view uploaded image",
                                        textAlign: TextAlign.start,
                                        textColor: AppColor.black,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 10,
                                      ),
                                    ),
                                    CustomRoundButton(
                                        height: 35,
                                        width: 50,
                                        text: "Remove",
                                        onPress: () {
                                          if (_.mobileUpload) {
                                            _.mobileUpload = false;
                                          }
                                          if (_.mobile != null) {
                                            _.mobile = null;
                                          }
                                          _.update();
                                        },
                                        isRound: false),
                                  ],
                                ),
                              ],
                            )
                                : const SizedBox(),
                            Constant.zakValue == 'YES'
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      space,
                                      const RestInvestTitle(
                                        text: "ZAKAT PROOF:*",
                                        textAlign: TextAlign.start,
                                        textColor: AppColor.black,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 12,
                                      ),
                                      Container(
                                        height: 35,
                                        // height: Get.height,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CustomRoundButton(
                                                height: 25,
                                                width: 40,
                                                text: "+ Choose",
                                                buttonColor:
                                                    AppColor.whiteColor,
                                                textColor: AppColor.black,
                                                onPress: () {
                                                  _.zaKatUpload = false;
                                                  _.update();
                                                  showModalBottomSheet(
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      elevation: 0,
                                                      context: context,
                                                      builder:
                                                          (BuildContext bc) {
                                                        return SafeArea(
                                                          child: Container(
                                                            decoration: const BoxDecoration(
                                                                borderRadius: BorderRadius.only(
                                                                    topRight: Radius
                                                                        .circular(
                                                                            20),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            20)),
                                                                color: Colors
                                                                    .white),
                                                            child: Wrap(
                                                              children: <
                                                                  Widget>[
                                                                ListTile(
                                                                    leading: const Icon(
                                                                        Icons
                                                                            .photo_library),
                                                                    title: const Text(
                                                                        'Photo Library'),
                                                                    onTap:
                                                                        () async {
                                                                      _.zaKatImage =
                                                                          await _
                                                                              .getImageFromGallery();
                                                                      _.zaKatImageName = p.basename(_
                                                                          .zaKatImage!
                                                                          .path);
                                                                      _.zaKat = _.zaKatImage!.readAsBytesSync();
                                                                      _.update();
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                      showToast('Uploaded');
                                                                    }),
                                                                ListTile(
                                                                  leading:
                                                                      const Icon(
                                                                          Icons
                                                                              .photo_camera),
                                                                  title: const Text(
                                                                      'Camera'),
                                                                  onTap:
                                                                      () async {
                                                                    _.zaKatImage =
                                                                        await _
                                                                            .getImageFromCamera();
                                                                    _.zaKatImageName =
                                                                        p.basename(_
                                                                            .zaKatImage!
                                                                            .path);
                                                                    _.zaKat = _.zaKatImage!.readAsBytesSync();
                                                                    _.update();
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                    showToast('Uploaded');
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      });
                                                },
                                                isRound: false),
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                            color: AppColor.greyColor
                                                .withOpacity(0.5),
                                            border: Border.all(
                                                width: 1,
                                                color: AppColor.black)),
                                      ),
                                      Container(
                                        // height: 35,
                                        width: Get.width,
                                        decoration: BoxDecoration(
                                            color: AppColor.whiteColor,
                                            border: Border.all(
                                                width: 1,
                                                color: AppColor.black)),
                                        child: _.zaKatUpload &&
                                                _.zaKat != null
                                            ? Center(
                                                child: Image.memory(
                                                _.zaKat!,
                                                height: 80,
                                                width: 120,
                                              ))
                                            : const SizedBox(),
                                      ),
                                      const RestInvestTitle(
                                        text:
                                            "Allowed Type:(gif,jpg,jpeg,png,pdf,doc,docx)/,Max file size: 5MB,No of files\nallowed:1",
                                        textAlign: TextAlign.start,
                                        textColor: AppColor.black,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 10,
                                      ),
                                      space,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              if (_.zaKat != null) {
                                                _.zaKatUpload = true;
                                              }
                                              _.update();
                                            },
                                            child: const RestInvestTitle(
                                              text: "view uploaded image",
                                              textAlign: TextAlign.start,
                                              textColor: AppColor.black,
                                              fontWeight: FontWeight.w900,
                                              fontSize: 10,
                                            ),
                                          ),
                                          CustomRoundButton(
                                              height: 35,
                                              width: 50,
                                              text: "Remove",
                                              onPress: () {
                                                if (_.zaKatUpload) {
                                                  _.zaKatUpload = false;
                                                }
                                                if (_.zaKat != null) {
                                                  _.zaKat = null;
                                                }
                                                _.update();
                                              },
                                              isRound: false),
                                        ],
                                      ),
                                    ],
                                  )
                                : const SizedBox(),

                            space,
                            const RestInvestTitle(
                              text: "NOMINEE CNIC:",
                              textAlign: TextAlign.start,
                              textColor: AppColor.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 12,
                            ),
                            Container(
                              height: 35,
                              // height: Get.height,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomRoundButton(
                                      height: 25,
                                      width: 40,
                                      text: "+ Choose",
                                      buttonColor: AppColor.whiteColor,
                                      textColor: AppColor.black,
                                      onPress: () {
                                        _.otherUpload = false;
                                        _.update();
                                        showModalBottomSheet(
                                            backgroundColor: Colors.transparent,
                                            elevation: 0,
                                            context: context,
                                            builder: (BuildContext bc) {
                                              return SafeArea(
                                                child: Container(
                                                  decoration: const BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(20),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      20)),
                                                      color: Colors.white),
                                                  child: Wrap(
                                                    children: <Widget>[
                                                      ListTile(
                                                          leading: const Icon(Icons
                                                              .photo_library),
                                                          title:  const Text(
                                                              'Photo Library'),
                                                          onTap: () async {
                                                            _.otherImage = await _
                                                                .getImageFromGallery();
                                                            _.otherImageName =
                                                                p.basename(_
                                                                    .otherImage!
                                                                    .path);
                                                            // _.paymentSlipExt = p.extension(_.paymentSlip!.path);
                                                            // _.paymentSlipBytes = _.paymentSlip!.readAsBytesSync();
                                                            // _.paymentSlip!.readAsBytes().then((value) {
                                                            //   _.paymentSlipBytes = Uint8List.fromList(value);});
                                                            // print("Extention${_.paymentSlipExt}");
                                                            _.update();
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                            showToast('Uploaded');
                                                          }),
                                                       ListTile(
                                                        leading:  const Icon(
                                                            Icons.photo_camera),
                                                        title:
                                                             const Text('Camera'),
                                                        onTap: () async {
                                                          _.otherImage = await _
                                                              .getImageFromCamera();
                                                          _.otherImageName =
                                                              p.basename(_
                                                                  .otherImage!
                                                                  .path);
                                                          // _.paymentSlipExt = p.extension(_.paymentSlip!.path);
                                                          // _.paymentSlipBytes = _.paymentSlip!.readAsBytesSync();
                                                          // _.paymentSlip!.readAsBytes().then((value) {
                                                          //   _.paymentSlipBytes = Uint8List.fromList(value);});
                                                          // print("Extention${_.paymentSlipExt}");
                                                          _.update();
                                                          Navigator.of(context)
                                                              .pop();
                                                          showToast('Uploaded');
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                      isRound: false),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: AppColor.greyColor.withOpacity(0.5),
                                  border: Border.all(
                                      width: 1, color: AppColor.black)),
                            ),
                            Container(
                              // height: 35,
                              width: Get.width,
                              decoration: BoxDecoration(
                                  color: AppColor.whiteColor,
                                  border: Border.all(
                                      width: 1, color: AppColor.black)),
                              child: _.otherUpload && _.otherImage != null
                                  ? Center(
                                      child: Image.file(
                                      _.otherImage!,
                                      height: 80,
                                      width: 120,
                                    ))
                                  : SizedBox(),
                            ),
                            const RestInvestTitle(
                              text:
                                  "Allowed Type:(gif,jpg,jpeg,png,pdf,doc,docx)/,Max file size: 5MB,No of files\nallowed:1",
                              textAlign: TextAlign.start,
                              textColor: AppColor.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 10,
                            ),
                            space,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (_.otherImage != null) {
                                      _.otherUpload = true;
                                    }
                                    _.update();
                                  },
                                  child: const RestInvestTitle(
                                    text: "view uploaded image",
                                    textAlign: TextAlign.start,
                                    textColor: AppColor.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 10,
                                  ),
                                ),
                                CustomRoundButton(
                                    height: 35,
                                    width: 50,
                                    text: "Remove",
                                    onPress: () {
                                      if (_.otherUpload) {
                                        _.otherUpload = false;
                                      }
                                      if (_.otherImage != null) {
                                        _.otherImage = null;
                                      }
                                      _.update();
                                    },
                                    isRound: false),
                              ],
                            ),
                            space,
                            space,
                            const RestInvestTitle(
                              text: "*DISCLAIMER:",
                              textColor: AppColor.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: Checkbox(
                                      checkColor: AppColor.whiteColor,
                                      fillColor: MaterialStateColor.resolveWith(
                                          (states) => AppColor.blueColor),
                                      value: _.isChecked,
                                      onChanged: (bool? val) {
                                        _.isChecked = val!;
                                        _.update();
                                      }),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Expanded(
                                  child: RestInvestTitle(
                                    text:
                                        "Invester are fully informed and understand thatinvestment in units of Mutual Funds/CIS are not bank deposit,not guaranteed and not issued by any person.shareholders of AMCs are not responsible for any loose of investor resulting from the operation of any CIS launched/to be launched by the AMC unless otherwise mentioned",
                                    textColor: AppColor.black,
                                    fontSize: 8,
                                    textAlign: TextAlign.justify,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                            space,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomRoundButton(
                                    height: 35,
                                    width: 50,
                                    text: "Back",
                                    buttonColor: AppColor.backBlueColor,
                                    onPress: () {
                                      Get.back();
                                    },
                                    isRound: false),
                                const SizedBox(
                                  width: 10,
                                ),
                                CustomRoundButton(
                                    height: 35,
                                    width: 50,
                                    text: "SAVE&NEXT",
                                    onPress: () {
                                      if(_.isLoading){
                                        printInfo(info: 'jhjh');
                                      }else {
                                        _.onSaveDoc();
                                      }
                                      // Get.to(const AccountOpenPreviewScreen());
                                    },
                                    isRound: false),
                                const SizedBox(width: 20,),
                                const Text('6/8')
                              ],
                            ),
                            space
                          ],
                        ),
                      ),
                    ]),
                  )
                ],
              ),
            ),
              _.isLoading
                  ? const Center(
                child: DialogBox(),
              )
                  : _.noInternet
                  ? Positioned(
                bottom: 0,
                child: Container(
                  height: 180,
                  width: Get.width,
                  color: Colors.white,
                  child: NoInternetWgt(
                    onTryAgain: (){
                      _.noInternet = false;
                      _.update();
                    },
                  ),
                ),
              )
                  : const SizedBox()
            ]),
          ));
        });
  }
}
