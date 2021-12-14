import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controller/learning_screen_controller.dart';

import '../utils/colors.dart';
import '../widgets/constant_widget.dart';

class LearningScreen extends StatelessWidget {
  const LearningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LearningScreenController>(
        init: LearningScreenController(),
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
                  text: "Learning",
                  textColor: AppColor.whiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              body: WebView(
                  initialUrl:
                      '${_.homeController.socialMediaLink.response!.homeLinks!.learning}'));
        });
  }
}
