import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/fundmanager_screen_controller.dart';

import '../utils/colors.dart';
import '../widgets/constant_widget.dart';

class FundManagerScreen extends StatelessWidget {
  const FundManagerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FundManagerScreenController>(
        init: FundManagerScreenController(),
        builder: (_) {
          return Scaffold(
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
                text: "Fund Manager Reports",
                textColor: AppColor.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        });
  }
}
