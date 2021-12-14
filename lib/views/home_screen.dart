import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investintrust/widgets/no_internet.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller/home_screen_controller.dart';
import '../routes/routes.dart';

import '../utils/colors.dart';
import '../widgets/constant_widget.dart';

import '../widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
        init: HomeScreenController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: AppColor.whiteColor,
              leading: InkWell(
                onTap: () {
                  controller.scaffoldKey.currentState!.openDrawer();
                },
                child: const Icon(
                  Icons.menu,
                  color: AppColor.blueColor,
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(right: 50),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.contain,
                    height: 100,
                    width: 100,
                  )
                ]),
              ),
            ),
            drawer: const CustomDrawer(),
            key: controller.scaffoldKey,
            body: SingleChildScrollView(
              child: controller.isLoading
                  ? const CircularProgressIndicator()
                  : controller.noInternet
                      ? NoInternetWgt(
                          onTryAgain: controller.getSocialLinks,
                          key: controller.scaffoldKey)
                      : Column(
                          children: [
                            Container(
                              color: AppColor.blueColor,
                              height: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(AppRoute.navRoute);
                                    },
                                    child: IconButtonText(
                                      icon: const Nav(),
                                      text: "NAV History",
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(AppRoute.branchesRoute);
                                    },
                                    child: IconButtonText(
                                      icon: const Branches(),

                                      // color: AppColor.whiteColor,

                                      text: "BRANCHES",
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(AppRoute.learningRoute);
                                    },
                                    child: IconButtonText(
                                        icon: const Learning(),
                                        text: "LEARNING"),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: ContainerBox(
                                  icon: const Market(),
                                  textColor: AppColor.blueColor,
                                  text: 'Market',
                                  voidcallback: () {
                                    Get.toNamed(AppRoute.marketRoute);
                                  },
                                  containerColor: AppColor.whiteColor,
                                )),
                                Expanded(
                                    child: ContainerBox(
                                  icon: const Portofol(),
                                  textColor: AppColor.blueColor,
                                  text: 'LOGIN',
                                  voidcallback: () {
                                    Get.toNamed(AppRoute.loginRoute);
                                  },
                                  containerColor: AppColor.liteblue,
                                )),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: ContainerBox(
                                  icon: const FundManager(),
                                  textColor: AppColor.blueColor,
                                  text: 'FUND MANAGER\n       REPORT',
                                  voidcallback: () {
                                    Get.toNamed(AppRoute.fundManagerRoute);
                                  },
                                  containerColor: AppColor.liteblue,
                                )),
                                Expanded(
                                    child: ContainerBox(
                                  textColor: AppColor.blueColor,
                                  icon: const News(),
                                  text: 'NEWS',
                                  voidcallback: () {},
                                  containerColor: AppColor.whiteColor,
                                )),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: ContainerBox(
                                  icon: const Product(),
                                  textColor: AppColor.blueColor,
                                  text: 'PRODUCTS',
                                  voidcallback: () {
                                    Get.toNamed(AppRoute.productRoute);
                                  },
                                  containerColor: AppColor.whiteColor,
                                )),
                                Expanded(
                                    child: ContainerBox(
                                  icon: const PicFund(),
                                  textColor: AppColor.blueColor,
                                  text: 'PIC YOUR FUND',
                                  voidcallback: () {
                                    Get.toNamed(AppRoute.fundRoute);
                                  },
                                  containerColor: AppColor.liteblue,
                                )),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: ContainerBox(
                                  icon: const Calculator(),
                                  textColor: AppColor.blueColor,
                                  text: 'TEXT CALCULATOR',
                                  voidcallback: () {
                                    Get.toNamed(AppRoute.taxcalculatorRoute);
                                  },
                                  containerColor: AppColor.liteblue,
                                )),
                                Expanded(
                                    child: ContainerBox(
                                        icon: const DailyNav(),
                                        textColor: AppColor.blueColor,
                                        text: 'DAILY NAV',
                                        voidcallback: () {
                                          Get.toNamed(AppRoute.dailynavRoute);
                                        },
                                        containerColor: AppColor.whiteColor)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: RowContainerBox(
                                        containerColor:
                                            AppColor.blueColor.withOpacity(.8),
                                        text: "Call",
                                        textColor: AppColor.whiteColor,
                                        voidcallback: () {
                                          customLaunch(
                                              'tel: ${controller.socialMediaLink.response!.homeLinks!.advisorPhone}');
                                        },
                                        icon: const Call())),
                                const SizedBox(
                                  width: 2,
                                ),
                                Expanded(
                                    child: RowContainerBox(
                                        containerColor:
                                            AppColor.blueColor.withOpacity(.8),
                                        text: "SMS",
                                        textColor: AppColor.whiteColor,
                                        voidcallback: () {
                                          customLaunch(
                                              'sms: ${controller.socialMediaLink.response!.homeLinks!.advisorSms} ');
                                        },
                                        icon: const Sms())),
                                const SizedBox(
                                  width: 2,
                                ),
                                Expanded(
                                    child: RowContainerBox(
                                        containerColor:
                                            AppColor.blueColor.withOpacity(.8),
                                        text: "EMAIL",
                                        textColor: AppColor.whiteColor,
                                        voidcallback: () {
                                          customLaunch(
                                              'email: ${controller.socialMediaLink.response!.homeLinks!.advisorEmail}');
                                        },
                                        icon: const Mail())),
                                const SizedBox(
                                  width: 2,
                                ),
                                Expanded(
                                    child: RowContainerBox(
                                        containerColor:
                                            AppColor.blueColor.withOpacity(.8),
                                        text: "ABOUT Us",
                                        textColor: AppColor.whiteColor,
                                        voidcallback: () {
                                          customLaunch(
                                              'about: ${controller.socialMediaLink.response!.homeLinks!.aboutUs}');
                                        },
                                        icon: const Chat()))
                              ],
                            )
                          ],
                        ),
            ),
          );
        });
  }

  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print(' could not launch $command');
    }
  }
}
