
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/report_screen_controller.dart';
import '../routes/routes.dart';
import '../widgets/constant_widget.dart';
import '../widgets/custom_divider.dart';

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
              title: const LogoNit(height: 60,width: 60,),
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
                        padding: EdgeInsets.all(15.0),
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
                      Get.toNamed(AppRoute.viewReportsRoute+"?param=AccStmt");
                    },
                    text: "Account Statement",
                  ),
                  CustomDivider(
                    color: AppColor.black.withOpacity(0.1),
                  ),
                  ReportsInkWellButton(
                    onTap: () {
                      Get.toNamed(AppRoute.viewReportsRoute+"?param=StmtOfAcc");
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
                      Get.toNamed(AppRoute.viewReportsRoute+"?param=RedStatus");
                    },
                    text: "Redemption Report",
                  ),
                  CustomDivider(
                    color: AppColor.black.withOpacity(0.1),
                  ),
                  ReportsInkWellButton(
                    onTap: () {
                      Get.toNamed(AppRoute.viewReportsRoute+"?param=SaleStatus");
                    },
                    text: "Purchase Report",
                  ),
                  CustomDivider(color: AppColor.black.withOpacity(0.1)),
                  ReportsInkWellButton(
                    onTap: () {
                      Get.toNamed(AppRoute.viewReportsRoute+"?param=TransferStatus");
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
