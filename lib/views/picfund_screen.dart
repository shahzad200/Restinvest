
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/picfund_screen_controller.dart';
import '../utils/colors.dart';
import '../widgets/constant_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PicFundScreen extends StatelessWidget {
  const PicFundScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PicFundScreenController>(
        init: PicFundScreenController(),
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
                  text: "Pic Your Fund",
                  textColor: AppColor.whiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              body: WebView(
                initialUrl: 'https://nit.softech.pk/newnit/Pickyourfunds.aspx ',
              ));
        });
  }
}
