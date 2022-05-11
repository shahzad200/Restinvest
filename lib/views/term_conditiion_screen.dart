

import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../controller/nav_screen_controller.dart';

import '../utils/colors.dart';
import '../widgets/constant_widget.dart';

class TermConditionScreen extends StatelessWidget {
  const TermConditionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pdfController = PdfController(
        document: PdfDocument.openAsset('assets/terms.pdf'),
        // initialPage: 2
    );

    return GetBuilder<NavScreenController>(
        init: NavScreenController(),
        builder: (_) {
          return Scaffold(
              backgroundColor: AppColor.lightWhite,
              appBar: AppBar(
                backgroundColor: AppColor.blueColor,
                leading: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColor.whiteColor,
                    )),
                title: const RestInvestTitle(
                  text: "Term&Condition",
                  textColor: AppColor.whiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),

body: PdfView(
  controller: pdfController,
),


        );
  });
}}