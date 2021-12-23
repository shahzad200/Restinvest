import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/market_screen_controller.dart';

import '../utils/colors.dart';
import '../widgets/constant_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MarketScreenController>(
        init: MarketScreenController(),
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
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
                text: "MARKET",
                textColor: AppColor.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            body: WebView(
              initialUrl:
                  '${_.homeController.socialMediaLink!.response!.homeLinks!.market}',
            ),
          );
        });
  }
}
