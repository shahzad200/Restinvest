import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/branches_screen_controller.dart';

import '../utils/colors.dart';
import '../widgets/constant_widget.dart';

class BranchesScreen extends StatelessWidget {
  const BranchesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BranchesScreenController>(
        init: BranchesScreenController(),
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
                text: "Branches",
                textColor: AppColor.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        });
  }
}
