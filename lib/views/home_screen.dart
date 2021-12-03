import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              title: Padding(
                padding: const EdgeInsets.only(right: 50),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.contain,
                    height: 60,
                    width: 60,
                  )
                ]),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed(AppRoute.navRoute);
                          },
                          child: IconButtonText(
                            icon: const Icon(
                              Icons.timelapse_sharp,
                              color: AppColor.whiteColor,
                            ),
                            text: "Nav",
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(AppRoute.branchesRoute);
                          },
                          child: IconButtonText(
                            icon: const Icon(
                              Icons.timelapse_sharp,
                              color: AppColor.whiteColor,
                            ),
                            text: "BRANCHES",
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(AppRoute.learningRoute);
                          },
                          child: IconButtonText(
                              icon: const Icon(
                                Icons.timelapse_sharp,
                                color: AppColor.whiteColor,
                              ),
                              text: "LEARNING"),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: ContainerBox(
                        textColor: AppColor.blueColor,
                        icon: const Icon(Icons.mark_as_unread_outlined),
                        text: 'Market',
                        voidcallback: () {
                          Get.toNamed(AppRoute.marketRoute);
                        },
                        containerColor: AppColor.whiteColor,
                      )),
                      Expanded(
                          child: ContainerBox(
                        textColor: AppColor.blueColor,
                        icon: const Icon(Icons.person),
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
                        textColor: AppColor.blueColor,
                        icon: const Icon(Icons.mark_as_unread_outlined),
                        text: 'FUND MANAGER\n       REPORT',
                        voidcallback: () {
                          Get.toNamed(AppRoute.fundManagerRoute);
                        },
                        containerColor: AppColor.liteblue,
                      )),
                      Expanded(
                          child: ContainerBox(
                        textColor: AppColor.blueColor,
                        icon: const Icon(Icons.mark_as_unread_outlined),
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
                        textColor: AppColor.blueColor,
                        icon: const Icon(Icons.mark_as_unread_outlined),
                        text: 'PRODUCTS',
                        voidcallback: () {
                          Get.toNamed(AppRoute.productRoute);
                        },
                        containerColor: AppColor.whiteColor,
                      )),
                      Expanded(
                          child: ContainerBox(
                        textColor: AppColor.blueColor,
                        icon: const Icon(Icons.mark_as_unread_outlined),
                        text: 'PIC YOUR FUND',
                        voidcallback: () {
                          Get.toNamed(AppRoute.fundRoute);
                        },
                        containerColor: AppColor.liteblue,
                      )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: RowContainerBox(
                        containerColor: AppColor.blueColor.withOpacity(.8),
                        text: "Call",
                        textColor: AppColor.whiteColor,
                        voidcallback: () {},
                        icon: const Icon(
                          Icons.local_phone,
                          color: AppColor.whiteColor,
                        ),
                      )),
                      const SizedBox(
                        width: 2,
                      ),
                      Expanded(
                          child: RowContainerBox(
                        containerColor: AppColor.blueColor.withOpacity(.8),
                        text: "SMS",
                        textColor: AppColor.whiteColor,
                        voidcallback: () {},
                        icon: const Icon(
                          Icons.message,
                          color: AppColor.whiteColor,
                        ),
                      )),
                      const SizedBox(
                        width: 2,
                      ),
                      Expanded(
                          child: RowContainerBox(
                        containerColor: AppColor.blueColor.withOpacity(.8),
                        text: "EMAIL",
                        textColor: AppColor.whiteColor,
                        voidcallback: () {},
                        icon: const Icon(
                          Icons.email,
                          color: AppColor.whiteColor,
                        ),
                      )),
                      const SizedBox(
                        width: 2,
                      ),
                      Expanded(
                          child: RowContainerBox(
                        containerColor: AppColor.blueColor.withOpacity(.8),
                        text: "ABOUT",
                        textColor: AppColor.whiteColor,
                        voidcallback: () {},
                        icon: const Icon(
                          Icons.home,
                          color: AppColor.whiteColor,
                        ),
                      ))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
