import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nit/routes/routes.dart';

import '../controller/new_account_screen_controller.dart';

import '../utils/colors.dart';

import '../utils/constants.dart';
import '../widgets/constant_widget.dart';

import '../widgets/custom_divider.dart';
import '../widgets/drawer.dart';

class NewAccountScreen extends StatelessWidget {
  const NewAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewAccountScreenController>(
        init: NewAccountScreenController(),
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const LogoNit(
                height: 60,
                width: 60,
              ),
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
            body: Stack(children: [
              SingleChildScrollView(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Column(
                  children: [
                    Constant.loginModel!.response!.umsAccountExists == true &&
                            Constant.loginModel!.response!.vpsAccountExists ==
                                true
                        ? const SizedBox()
                        : Constant.loginModel!.response!.umsAccountExists ==
                                    true &&
                                Constant.loginModel!.response!
                                        .vpsAccountExists ==
                                    false
                            ? Padding(padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                                child: Align(
                                   alignment: Alignment.topLeft,
                                  child: InkWell(
                                    onTap: () {
                                      Get.toNamed(
                                          AppRoute.accountOpeningRequest);
                                    },
                                    child: const RestInvestTitle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20,
                                      text: "Pension Fund",
                                      textColor: AppColor.black,
                                    ),
                                  ),
                                ),
                              )
                            : CustomDivider(
                                color: AppColor.black.withOpacity(0.2),
                              ),
                    Constant.loginModel!.response!.vpsAccountExists == true &&
                            Constant.loginModel!.response!.umsAccountExists ==
                                false
                        ? Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, bottom: 10),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed(
                                      AppRoute.accountOpeningRequest);
                                },
                                child: const RestInvestTitle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20,
                                  text: "Mutual Fund",
                                  textColor: AppColor.black,
                                ),
                              ),
                            ),
                          )
                        : CustomDivider(
                            color: AppColor.black.withOpacity(0.2),
                          ),
                  ],
                ),
              ),
            ]),
          );
        });
  }
}
