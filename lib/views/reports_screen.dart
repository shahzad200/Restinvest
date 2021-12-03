import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:investintrust/controller/report_screen_controller.dart';
import 'package:investintrust/routes/routes.dart';
import 'package:investintrust/widgets/constant_widget.dart';
import 'package:investintrust/widgets/custom_divider.dart';

import '../utils/colors.dart';

import '../widgets/drawer.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportsScreenController>(
        init: ReportsScreenController(),
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: AppColor.whiteColor,
              leading: InkWell(
                onTap: () {
                  _.scaffoldKey.currentState!.openDrawer();
                },
                child: const Icon(
                  Icons.menu,
                  color: AppColor.blueColor,
                ),
              ),
            ),
            drawer: const CustomDrawer(),
            key: _.scaffoldKey,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      color: AppColor.blueColor,
                      height: 50,
                      width: Get.width,
                      child: const Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: RestInvestTitle(
                          text: "Reports",
                          textColor: AppColor.whiteColor,
                          textAlign: TextAlign.start,
                          fontSize: 18,
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  ReportsInkWellButton(
                    onTap: () {
                      Get.toNamed(AppRoute.viewreportsRoute);
                    },
                    text: "Account Statement",
                  ),
                  const CustomDivider(),
                  ReportsInkWellButton(
                    onTap: () {
                      Get.toNamed(AppRoute.viewreportsRoute);
                    },
                    text: "Statement of Account ",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      color: AppColor.blueColor,
                      height: 50,
                      width: Get.width,
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: RestInvestTitle(
                          text: "Status Reports",
                          textColor: AppColor.whiteColor,
                          textAlign: TextAlign.start,
                          fontSize: 18,
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  ReportsInkWellButton(
                    onTap: () {
                      Get.toNamed(AppRoute.viewreportsRoute);
                    },
                    text: "Redemption Report",
                  ),
                  const CustomDivider(),
                  ReportsInkWellButton(
                    onTap: () {
                      Get.toNamed(AppRoute.viewreportsRoute);
                    },
                    text: "Purchase Report",
                  ),
                  const CustomDivider(),
                  ReportsInkWellButton(
                    onTap: () {
                      Get.toNamed(AppRoute.viewreportsRoute);
                    },
                    text: "F2F Transfer Report",
                  ),
                ],
              ),
            ),
          );
        });
  }
}
