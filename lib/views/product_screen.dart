import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investintrust/utils/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controller/product_screen_controller.dart';

import '../utils/colors.dart';
import '../widgets/constant_widget.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductScreenController>(
        init: ProductScreenController(),
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
                text: "Products",
                textColor: AppColor.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            body: WebView(
              initialUrl:
                  '${Constant.socialMediaLink!.response!.homeLinks!.products}',
            ),
          );
        });
  }
}
