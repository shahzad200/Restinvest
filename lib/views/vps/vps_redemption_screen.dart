import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:nit/controller/vps/vps_redemption_screen_controller.dart';
import 'package:nit/data/models/login_model.dart';
import 'package:nit/data/models/vps/vps_load_fund_plans.dart' as vps;
import 'package:nit/utils/colors.dart';
import 'package:nit/widgets/button.dart';
import 'package:nit/widgets/constant_widget.dart';
import 'package:nit/widgets/drawer.dart';
import 'package:nit/widgets/no_internet.dart';
import 'package:nit/widgets/textformfiled.dart';
import 'package:path/path.dart' as p;

class VpsRedemptionScreen extends StatelessWidget {
  const VpsRedemptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VpsRedemptionScreenController>(
        init: VpsRedemptionScreenController(),
        builder: (controller) {
          var space = const SizedBox(
            height: 10,
          );
          return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: const LogoNit(height: 60,width: 60,),
                  backgroundColor: AppColor.whiteColor,
                  leading: InkWell(
                    onTap: () {
                      controller.scaffoldKey.currentState!.openDrawer();
                    },
                    child: const Icon(
                      Icons.menu,
                      color: AppColor.blueColor,
                    ),
                  ),
                ),
                drawer: const CustomDrawer(),
                key: controller.scaffoldKey,
            body: Stack(
              children: [
                ListView(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    children: [
                      const Padding(
                        padding:  EdgeInsets.only(top: 0.0,bottom: 10),
                        child:  Align(
                          alignment: Alignment.topCenter,
                          child: RestInvestTitle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            text: "VPS REDEMPTION",
                            textColor: AppColor.black,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const RestInvestTitle(
                                        text: "Account Number:*",
                                        fontSize: 10,
                                        textColor: AppColor.black,
                                        fontWeight: FontWeight.w900,
                                      ),
                                      Container(
                                        // margin: EdgeInsets.all(10.0),
                                        padding: const EdgeInsets.only(
                                            left: 10.0, right: 5.0),
                                        height: 35,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: AppColor.whiteColor,
                                            border: Border.all(
                                                width: 1,
                                                color: AppColor.black)),
                                        child: controller.isLoading
                                            ? const SizedBox()
                                            : DropdownButton<Accounts>(
                                                isExpanded: true,
                                                underline: Container(
                                                  color: AppColor.whiteColor,
                                                ),

                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                // value: _.dropdownvalue,
                                                hint: RestInvestTitle(
                                                  text: controller.accountValue ==
                                                              null ||
                                                          controller
                                                                  .accountValue ==
                                                              ""
                                                      ? "Select account"
                                                      : controller.accountValue,
                                                  fontSize: 12,
                                                  textColor: AppColor.black,
                                                ),
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: AppColor.blueColor,
                                                    size: 25),
                                                items: controller.listAccount
                                                    .map((Accounts?
                                                        fromAccountItems) {
                                                  return DropdownMenuItem<
                                                          Accounts>(
                                                      value: fromAccountItems,
                                                      child: Text(
                                                          fromAccountItems!
                                                              .folioNumber!));
                                                }).toList(),
                                                onChanged:
                                                    (Accounts? value) async {
                                                  controller.accountValue =
                                                      value!.folioNumber!;
                                                  controller
                                                      .onVpsLoadFolioFunds();
                                                  controller.update();
                                                },
                                              ),
                                      ),
                                    ]),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const RestInvestTitle(
                                      text: "Fund Name:*",
                                      textColor: AppColor.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    Container(
                                      // margin: EdgeInsets.all(10.0),
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 5.0),
                                      height: 35,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: AppColor.whiteColor,
                                          border: Border.all(
                                              width: 1, color: AppColor.black)),
                                      child: controller.isLoading
                                          ? const SizedBox()
                                          : DropdownButton<
                                              vps.UserFundBalances>(
                                              isExpanded: true,
                                              underline: Container(
                                                color: AppColor.whiteColor,
                                              ),

                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              // value: _.dropdownvalue,
                                              hint: RestInvestTitle(
                                                text: controller.fundValue ==
                                                            null ||
                                                        controller.fundValue ==
                                                            ''
                                                    ? "Select fund"
                                                    : controller.fundValue,
                                                fontSize: 12,
                                                textColor: AppColor.black,
                                              ),
                                              icon: const Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: AppColor.blueColor,
                                                  size: 25),
                                              items: controller.isLoading
                                                  ? null
                                                  : controller
                                                      .vpsLoadFolioFunds!
                                                      .response!
                                                      .userFundBalances!
                                                      .map(
                                                          (vps.UserFundBalances?
                                                              funds) {
                                                      return DropdownMenuItem<
                                                              vps.UserFundBalances>(
                                                          value: funds,
                                                          child: Text(controller
                                                              .fundValue));
                                                    }).toList(),

                                              onChanged: controller.isLoading
                                                  ? null
                                                  : (vps.UserFundBalances?
                                                      value) async {
                                                      controller.fundValue =
                                                          value!.fundName!;
                                                      controller.fundCode =
                                                          value.fundCode!;
                                                      controller
                                                          .onVpsLoadBalancesForVpsRedemption();
                                                      controller.update();
                                                    },
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          space,
                          Row(
                            children: [
                              controller.unitClass &&
                                      controller.isLoading == false
                                  ? Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const RestInvestTitle(
                                            text: "Unit Class",
                                            fontSize: 10,
                                            textColor: AppColor.black,
                                            fontWeight: FontWeight.w900,
                                          ),
                                          Container(
                                              // margin: EdgeInsets.all(10.0),
                                              padding: const EdgeInsets.only(
                                                  left: 10.0, right: 5.0),
                                              height: 35,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: AppColor.whiteColor,
                                                  border: Border.all(
                                                      width: 1,
                                                      color: AppColor.black)),
                                              child: DropdownButton<
                                                  vps.UnitClassess>(
                                                isExpanded: true,
                                                underline: Container(
                                                  color: AppColor.whiteColor,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                hint: RestInvestTitle(
                                                  text: controller.className ==
                                                              null ||
                                                          controller
                                                                  .className ==
                                                              ''
                                                      ? "Select Unit Class"
                                                      : controller.className,
                                                  fontSize: 12,
                                                  textColor: AppColor.black,
                                                ),
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: AppColor.blueColor,
                                                    size: 25),
                                                items: controller.isLoading
                                                    ? null
                                                    : controller
                                                        .vpsLoadFolioFunds!
                                                        .response!
                                                        .userFundBalances![0]
                                                        .unitClassess!
                                                        .map((vps.UnitClassess?
                                                            funds) {
                                                        return DropdownMenuItem<
                                                                vps.UnitClassess>(
                                                            value: funds,
                                                            child: Text(
                                                                controller
                                                                    .className));
                                                      }).toList(),
                                                onChanged: controller.isLoading
                                                    ? null
                                                    : (vps.UnitClassess?
                                                        value) async {
                                                        controller.className =
                                                            value!.className!;
                                                        controller
                                                            .onVpsLoadBalancesForVpsRedemption();
                                                        controller.update();
                                                      },
                                              )),
                                        ],
                                      ),
                                    )
                                  : const SizedBox(),
                              controller.unitClass
                                  ? const SizedBox(
                                      width: 6,
                                    )
                                  : const SizedBox(),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const RestInvestTitle(
                                    text:
                                        "Investment Value before redemption(Amount):",
                                    fontSize: 10,
                                    textColor: AppColor.black,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  CustomTextFormField(
                                    controller:
                                        controller.lastClosingController,
                                    color: AppColor.whiteColor,
                                    enable: false,
                                  ),
                                ],
                              )),
                            ],
                          ),
                          space,
                          const RestInvestTitle(
                            text: "Redemption % Option ",
                            textColor: AppColor.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                          ),
                          controller.isLoading == false && double.parse(
                              controller.lastClosingController.text == '' || controller.lastClosingController.text == null ? '0' :
                              controller.lastClosingController.text
                          ) > 0 ?
                          Row(
                            children: [
                              Radio(
                                value: 0,
                                groupValue: controller.groupValue,
                                onChanged: (int? val) {
                                  controller.groupValue = val!;
                                  controller.amountInPercentController.text =
                                      '100';
                                  controller.amountInRsController.text =
                                      controller.lastClosingController.text;
                                  controller.update();
                                },
                                fillColor: MaterialStateColor.resolveWith(
                                    (states) => AppColor.blueColor),
                              ),
                              RestInvestTitle(
                                text: "Entire Balance",
                                textColor: controller.groupValue == 0
                                    ? AppColor.black
                                    : AppColor.dimblack,
                                fontSize: 10,
                                fontWeight: FontWeight.w900,
                              ),
                              Radio(
                                value: 1,
                                groupValue: controller.groupValue,
                                onChanged: (int? val) {
                                  controller.groupValue = val!;
                                  controller.amountInPercentController.text =
                                      '25';
                                  controller.amountInRsController.text =
                                      controller.calculate25();

                                  controller.update();
                                },
                                fillColor: MaterialStateColor.resolveWith(
                                    (states) => AppColor.blueColor),
                              ),
                              RestInvestTitle(
                                text: "50% Of Total Balance",
                                textColor: controller.groupValue == 1
                                    ? AppColor.black
                                    : AppColor.dimblack,
                                fontSize: 10,
                                fontWeight: FontWeight.w900,
                              ),
                              Radio(
                                value: 2,
                                groupValue: controller.groupValue,
                                onChanged: (int? val) {
                                  controller.groupValue = val!;
                                  controller.amountInPercentController.text =
                                      '';
                                  controller.amountInRsController.text = '';

                                  controller.update();
                                },
                                fillColor: MaterialStateColor.resolveWith(
                                    (states) => AppColor.blueColor),
                              ),
                              RestInvestTitle(
                                text: "Others",
                                textColor: controller.groupValue == 2
                                    ? AppColor.black
                                    : AppColor.dimblack,
                                fontSize: 10,
                                fontWeight: FontWeight.w900,
                              ),
                            ],
                          ) : const SizedBox(),
                          space,
                          Row(children: [
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const RestInvestTitle(
                                  text: "Redemption Amount (% Balance):*",
                                  fontSize: 10,
                                  textColor: AppColor.black,
                                  fontWeight: FontWeight.w900,
                                ),
                                CustomTextFormField(
                                  controller:
                                      controller.amountInPercentController,
                                  color: AppColor.whiteColor,
                                  enable: double.parse(
                                      controller.lastClosingController.text == '' || controller.lastClosingController.text == null ? '0' :
                                      controller.lastClosingController.text
                                  ) > 0 ? true : false,
                                  textInputType: TextInputType.number,
                                  onChange: (v) {
                                    if (v.toString() == '') {
                                      controller.amountInRsController.text = '';
                                    } else {
                                      controller.otherAmount(true);
                                    }
                                  },
                                ),
                              ],
                            )),
                            const SizedBox(
                              width: 6,
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const RestInvestTitle(
                                  text: "Or In Rs:*",
                                  fontSize: 10,
                                  textColor: AppColor.black,
                                  fontWeight: FontWeight.w900,
                                ),
                                CustomTextFormField(
                                  controller: controller.amountInRsController,
                                  color: AppColor.black,
                                  textInputType: TextInputType.number,
                                  enable: double.parse(
                                      controller.lastClosingController.text == '' || controller.lastClosingController.text == null ? '0' :
                                      controller.lastClosingController.text
                                  ) > 0 ? true : false,
                                  onChange: (v) {
                                    if (v.toString() == '') {
                                      controller.amountInPercentController.text = '';
                                    } else {
                                      controller.otherAmount(false);
                                    }
                                  },
                                ),
                              ],
                            )),
                          ]),
                          space,
                          const RestInvestTitle(
                            text: "Tax Details:*",
                            textColor: AppColor.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                          ),
                          space,
                          Container(
                            // width: Get.width,
                            color: AppColor.greyColor.withOpacity(0.3),
                            // height: MediaQuery.of(context).size.height / 1.9,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 6, right: 6, bottom: 6),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(children: [
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const RestInvestTitle(
                                          text: "Year(YYYY)*",
                                          fontSize: 9,
                                          textColor: AppColor.black,
                                          fontWeight: FontWeight.w900,
                                        ),
                                        CustomTextFormField(
                                            controller:
                                                controller.yearOneController,
                                            enable: controller.isLoading ? false : true,
                                            textInputType:
                                                TextInputType.number),
                                      ],
                                    )),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const RestInvestTitle(
                                          text: "Tax Paid/Payable(RS)*",
                                          fontSize: 9,
                                          textColor: AppColor.black,
                                          fontWeight: FontWeight.w900,
                                        ),
                                        CustomTextFormField(
                                            controller:
                                                controller.taxPaidOneController,
                                            enable: controller.isLoading ? false : true,
                                            textInputType:
                                                TextInputType.number),
                                      ],
                                    )),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const RestInvestTitle(
                                          text: "Total Taxable/Income(RS)*",
                                          fontSize: 9,
                                          textColor: AppColor.black,
                                          fontWeight: FontWeight.w900,
                                        ),
                                        CustomTextFormField(
                                            controller: controller
                                                .totalTaxableOneController,
                                            enable: controller.isLoading ? false : true,
                                            textInputType:
                                                TextInputType.number),
                                      ],
                                    )),
                                  ]),
                                  space,
                                  const RestInvestTitle(
                                    text:
                                        'Attached proof(file formats allowed( gif,jpg,png,pdf ))',
                                    fontSize: 12,
                                    textColor: AppColor.dimblack,
                                    textAlign: TextAlign.left,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  Container(
                                    height: 35,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomRoundButton(
                                            height: 25,
                                            width: 40,
                                            text: "+ Choose",
                                            buttonColor: AppColor.whiteColor,
                                            textColor: AppColor.black,
                                            onPress: () {
                                              controller.isLoading ? printInfo(info: 'isLoading') :
                                              showModalBottomSheet(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  elevation: 0,
                                                  context: context,
                                                  builder: (BuildContext bc) {
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
                                                            color:
                                                                Colors.white),
                                                        child: Wrap(
                                                          children: <Widget>[
                                                            ListTile(
                                                                leading: const Icon(
                                                                    Icons
                                                                        .photo_library),
                                                                title: const Text(
                                                                    'Photo Library'),
                                                                onTap:
                                                                    () async {
                                                                  controller
                                                                          .taxAttachedOne =
                                                                      await controller
                                                                          .getImageFromGallery();
                                                                  controller
                                                                          .taxAttachedOneExt =
                                                                      p.extension(controller
                                                                          .taxAttachedOne!
                                                                          .path);

                                                                  controller
                                                                          .taxAttachedOneBytes =
                                                                      controller
                                                                          .taxAttachedOne!
                                                                          .readAsBytesSync();

                                                                  // then((value) {

                                                                  // });
                                                                  // print(
                                                                  //     "Extention${controller.paymentProofExt}");
                                                                  controller
                                                                      .update();
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                  showToast(
                                                                      'Uploaded');
                                                                }),
                                                            ListTile(
                                                              leading: const Icon(
                                                                  Icons
                                                                      .photo_camera),
                                                              title: const Text(
                                                                  'Camera'),
                                                              onTap: () async {
                                                                controller
                                                                        .taxAttachedOne =
                                                                    await controller
                                                                        .getImageFromCamera();
                                                                controller
                                                                        .taxAttachedOneExt =
                                                                    p.extension(
                                                                        controller
                                                                            .taxAttachedOne!
                                                                            .path);
                                                                controller
                                                                        .taxAttachedOneBytes =
                                                                    controller
                                                                        .taxAttachedOne!
                                                                        .readAsBytesSync();
                                                                // print(
                                                                //     "Extention${controller.paymentProofExt}");
                                                                controller
                                                                    .update();
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                showToast(
                                                                    'Uploaded');
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
                                        color:
                                            AppColor.greyColor.withOpacity(0.3),
                                        border: Border.all(
                                            width: 1,
                                            color: AppColor.greyColor)),
                                  ),
                                  Container(
                                    // height: 35,
                                    width: Get.width,
                                    // height: Get.height,
                                    decoration: BoxDecoration(
                                        color: AppColor.whiteColor,
                                        border: Border.all(
                                            width: 1,
                                            color: AppColor.greyColor)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(children: [
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const RestInvestTitle(
                                          text: "Year(YYYY)*",
                                          fontSize: 9,
                                          textColor: AppColor.black,
                                          fontWeight: FontWeight.w900,
                                        ),
                                        CustomTextFormField(
                                            controller:
                                                controller.yearTwoController,
                                            enable: controller.isLoading ? false : true,
                                            textInputType:
                                                TextInputType.number),
                                      ],
                                    )),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const RestInvestTitle(
                                          text: "Tax Paid/Payable(RS)*",
                                          fontSize: 9,
                                          textColor: AppColor.black,
                                          fontWeight: FontWeight.w900,
                                        ),
                                        CustomTextFormField(
                                            controller:
                                                controller.taxPaidTwoController,
                                            enable: controller.isLoading ? false : true,
                                            textInputType:
                                                TextInputType.number),
                                      ],
                                    )),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const RestInvestTitle(
                                          text: "Total Taxable/Income(RS)*",
                                          fontSize: 9,
                                          textColor: AppColor.black,
                                          fontWeight: FontWeight.w900,
                                        ),
                                        CustomTextFormField(
                                            controller: controller
                                                .totalTaxableTwoController,
                                            enable: controller.isLoading ? false: true,
                                            textInputType:
                                                TextInputType.number),
                                      ],
                                    )),
                                  ]),
                                  space,
                                  const RestInvestTitle(
                                    text:
                                        'Attached proof(file formats allowed( gif,jpg,png,pdf ))',
                                    fontSize: 10,
                                    textColor: AppColor.dimblack,
                                    textAlign: TextAlign.left,
                                    fontWeight: FontWeight.w900,
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
                                            buttonColor: AppColor.whiteColor,
                                            textColor: AppColor.black,
                                            onPress: () {
                                              controller.isLoading ? printInfo(info: 'isLoading') :
                                              showModalBottomSheet(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  elevation: 0,
                                                  context: context,
                                                  builder: (BuildContext bc) {
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
                                                            color:
                                                                Colors.white),
                                                        child: Wrap(
                                                          children: <Widget>[
                                                            ListTile(
                                                                leading: const Icon(
                                                                    Icons
                                                                        .photo_library),
                                                                title: const Text(
                                                                    'Photo Library'),
                                                                onTap:
                                                                    () async {
                                                                  controller
                                                                          .taxAttachedTwo =
                                                                      await controller
                                                                          .getImageFromGallery();
                                                                  controller
                                                                          .taxAttachedTwoExt =
                                                                      p.extension(controller
                                                                          .taxAttachedTwo!
                                                                          .path);

                                                                  controller
                                                                          .taxAttachedTwoBytes =
                                                                      controller
                                                                          .taxAttachedTwo!
                                                                          .readAsBytesSync();

                                                                  // then((value) {

                                                                  // });
                                                                  // print(
                                                                  //     "Extention${controller.paymentProofExt}");
                                                                  controller
                                                                      .update();
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                  showToast(
                                                                      'Uploaded');
                                                                }),
                                                            ListTile(
                                                              leading: const Icon(
                                                                  Icons
                                                                      .photo_camera),
                                                              title: const Text(
                                                                  'Camera'),
                                                              onTap: () async {
                                                                controller
                                                                        .taxAttachedTwo =
                                                                    await controller
                                                                        .getImageFromCamera();
                                                                controller
                                                                        .taxAttachedTwoExt =
                                                                    p.extension(
                                                                        controller
                                                                            .taxAttachedTwo!
                                                                            .path);
                                                                controller
                                                                        .taxAttachedTwoBytes =
                                                                    controller
                                                                        .taxAttachedTwo!
                                                                        .readAsBytesSync();
                                                                // print(
                                                                //     "Extention${controller.paymentProofExt}");
                                                                controller
                                                                    .update();
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                showToast(
                                                                    'Uploaded');
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
                                        color:
                                            AppColor.greyColor.withOpacity(0.3),
                                        border: Border.all(
                                            width: 1,
                                            color: AppColor.greyColor)),
                                  ),
                                  Container(
                                    // height: 35,
                                    width: Get.width,
                                    // height: Get.height,
                                    decoration: BoxDecoration(
                                        color: AppColor.whiteColor,
                                        border: Border.all(
                                            width: 1,
                                            color: AppColor.greyColor)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(children: [
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const RestInvestTitle(
                                          text: "Year(YYYY)*",
                                          fontSize: 9,
                                          textColor: AppColor.black,
                                          fontWeight: FontWeight.w900,
                                        ),
                                        CustomTextFormField(
                                            controller:
                                                controller.yearThreeController,
                                            enable: controller.isLoading ? false: true,
                                            textInputType:
                                                TextInputType.number),
                                      ],
                                    )),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const RestInvestTitle(
                                          text: "Tax Paid/Payable(RS)*",
                                          fontSize: 9,
                                          textColor: AppColor.black,
                                          fontWeight: FontWeight.w900,
                                        ),
                                        CustomTextFormField(
                                            controller: controller
                                                .taxPaidThreeController,
                                            enable: controller.isLoading ? false: true,
                                            textInputType:
                                                TextInputType.number),
                                      ],
                                    )),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const RestInvestTitle(
                                          text: "Total Taxable/Income(RS)*",
                                          fontSize: 9,
                                          textColor: AppColor.black,
                                          fontWeight: FontWeight.w900,
                                        ),
                                        CustomTextFormField(
                                            controller: controller
                                                .totalTaxableThreeController,
                                            enable: controller.isLoading ? false : true,
                                            textInputType:
                                                TextInputType.number),
                                      ],
                                    )),
                                  ]),
                                  space,
                                  const RestInvestTitle(
                                    text:
                                        'Attached proof(file formats allowed( gif,jpg,png,pdf ))',
                                    fontSize: 10,
                                    textColor: AppColor.dimblack,
                                    textAlign: TextAlign.left,
                                    fontWeight: FontWeight.w900,
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
                                            buttonColor: AppColor.whiteColor,
                                            textColor: AppColor.black,
                                            onPress: () {
                                              controller.isLoading ? printInfo(info: 'isLoading') :
                                              showModalBottomSheet(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  elevation: 0,
                                                  context: context,
                                                  builder: (BuildContext bc) {
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
                                                            color:
                                                                Colors.white),
                                                        child: Wrap(
                                                          children: <Widget>[
                                                            ListTile(
                                                                leading: const Icon(
                                                                    Icons
                                                                        .photo_library),
                                                                title: const Text(
                                                                    'Photo Library'),
                                                                onTap:
                                                                    () async {
                                                                  controller
                                                                          .taxAttachedThree =
                                                                      await controller
                                                                          .getImageFromGallery();
                                                                  controller
                                                                          .taxAttachedThreeExt =
                                                                      p.extension(controller
                                                                          .taxAttachedThree!
                                                                          .path);

                                                                  controller
                                                                          .taxAttachedThreeBytes =
                                                                      controller
                                                                          .taxAttachedThree!
                                                                          .readAsBytesSync();

                                                                  // then((value) {

                                                                  // });
                                                                  // print(
                                                                  //     "Extention${controller.paymentProofExt}");
                                                                  controller
                                                                      .update();
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                  showToast(
                                                                      'Uploaded');
                                                                }),
                                                            ListTile(
                                                              leading: const Icon(
                                                                  Icons
                                                                      .photo_camera),
                                                              title: const Text(
                                                                  'Camera'),
                                                              onTap: () async {
                                                                controller
                                                                        .taxAttachedThree =
                                                                    await controller
                                                                        .getImageFromCamera();
                                                                controller
                                                                        .taxAttachedThreeExt =
                                                                    p.extension(
                                                                        controller
                                                                            .taxAttachedThree!
                                                                            .path);
                                                                controller
                                                                        .taxAttachedThreeBytes =
                                                                    controller
                                                                        .taxAttachedThree!
                                                                        .readAsBytesSync();
                                                                controller
                                                                    .update();
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                showToast(
                                                                    'Uploaded');
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
                                        color:
                                            AppColor.greyColor.withOpacity(0.3),
                                        border: Border.all(
                                            width: 1,
                                            color: AppColor.greyColor)),
                                  ),
                                  Container(
                                    // height: 35,
                                    width: Get.width,
                                    // height: Get.height,
                                    decoration: BoxDecoration(
                                        color: AppColor.whiteColor,
                                        border: Border.all(
                                            width: 1,
                                            color: AppColor.greyColor)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          space,
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const RestInvestTitle(
                                      text: 'Enter Your 4 Digit Pin:*',
                                      textColor: AppColor.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    CustomTextFormField(
                                      color: AppColor.black,
                                      controller:
                                          controller.genPinCodeController,
                                      enable: controller.isLoading ? false : true,
                                      // textInputType: TextInputType.emailAddress,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const RestInvestTitle(
                                      text: "Don't have a Financial Pin:*",
                                      fontSize: 10,
                                      textColor: AppColor.black,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    SizedBox(
                                        height: 35,
                                        child: CustomRoundButton(
                                          onPress: () {
                                            controller.isLoading ? printInfo(info: 'isLoading') :
                                            controller
                                                .onVpsGeneratePinCode(context);
                                          },
                                          text: "Click here to Generate",
                                          textSize: 10,
                                          buttonColor: AppColor.blueColor,
                                          isRound: false,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          space,
                          const RestInvestTitle(
                            text: "Note",
                            textColor: AppColor.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                          ),
                          const SizedBox(height: 5),
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
                                    value: controller.isChecked,
                                    onChanged: (bool? val) {
                                      if (controller.isChecked) {
                                        controller.isChecked = false;
                                      } else {
                                        controller.isChecked = true;
                                      }
                                      printInfo(
                                          info:
                                              controller.isChecked.toString());
                                      controller.update();
                                    }),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: RichText(
                                    text: const TextSpan(
                                        text:
                                            'I have read and understood the guidelines as stated in the',
                                        style: TextStyle(
                                          color: AppColor.black,
                                          fontSize: 10,
                                        ),
                                        children: <TextSpan>[
                                      TextSpan(
                                          text: ' Offering Document',
                                          style: TextStyle(
                                              color: AppColor.blueColor,
                                              fontSize: 10,
                                              decoration:
                                                  TextDecoration.underline)),
                                      TextSpan(
                                          text: ' /',
                                          style: TextStyle(
                                            color: AppColor.black,
                                            fontSize: 10,
                                          )),
                                      TextSpan(
                                          text: ' Trust Deed',
                                          style: TextStyle(
                                              color: AppColor.blueColor,
                                              fontSize: 10,
                                              decoration:
                                                  TextDecoration.underline)),
                                      TextSpan(
                                          text: ' &',
                                          style: TextStyle(
                                            color: AppColor.black,
                                            fontSize: 10,
                                          )),
                                      TextSpan(
                                          text: ' Fund Manager Reports',
                                          style: TextStyle(
                                              color: AppColor.blueColor,
                                              fontSize: 10,
                                              decoration:
                                                  TextDecoration.underline)),
                                      TextSpan(
                                          text:
                                              ' of the fund and risk involved.',
                                          style: TextStyle(
                                            color: AppColor.black,
                                            fontSize: 10,
                                          )),
                                      TextSpan(
                                          text: '\nI confirm acceptance of',
                                          style: TextStyle(
                                            color: AppColor.black,
                                            fontSize: 10,
                                          )),
                                      TextSpan(
                                          text:
                                              ' Term & Condition, Notes, Disclaimers',
                                          style: TextStyle(
                                              color: AppColor.blueColor,
                                              fontSize: 10,
                                              decoration:
                                                  TextDecoration.underline)),
                                      TextSpan(
                                          text:
                                              ' and all charges related to transaction.',
                                          style: TextStyle(
                                            color: AppColor.black,
                                            fontSize: 10,
                                          )),
                                    ])),
                              ),
                            ],
                          ),
                          space,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomRoundButton(
                                  isRound: false,
                                  text: "Submit",
                                  width: 120,
                                  height: 40,
                                  buttonColor:
                                      AppColor.blueColor,
                                  textColor: AppColor.whiteColor,
                                  onPress: () {
                                   controller.isLoading == false ?
                                   controller.onPressSubmit(context) : printInfo(info: 'isLoading true ');
                                  }),
                              CustomRoundButton(
                                  isRound: false,
                                  text: "Reset",
                                  width: 120,
                                  height: 40,
                                  buttonColor: AppColor.blueColor,
                                  textColor: AppColor.whiteColor,
                                  onPress: () {
                                    controller.isLoading == false ?
                                    controller.onReset() : printInfo(info: 'isLoading true ');
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ]),
                controller.isLoading
                    ? const Center(
                  child: DialogBox(),
                )
                    : controller.noInternet
                    ? Positioned(
                  bottom: 0,
                  child: Container(
                    height: 180,
                    width: Get.width,
                    color: Colors.white,
                    child: NoInternetWgt(
                      onTryAgain: (){
                        controller.noInternet = false;
                        controller.update();
                      },
                    ),
                  ),
                )
                    : const SizedBox()
              ],
            ),
          ));
        });
  }
}
