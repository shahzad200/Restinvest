import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investintrust/views/user_profile.dart';

import '../routes/routes.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';

import '../widgets/constant_widget.dart';
import '../widgets/custome_dialog.dart';
import '../widgets/web_view.dart';

import 'custom_divider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.only(top: 0),
      color: AppColor.whiteColor,
      width: Get.width / 1.9,
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Drawer(
          child: Constant.userId == '-0456'
              ? ListView(children: [
                  ListTile(
                    onTap: () {
                      if (Constant.drawerIndex == 1) {
                        Get.back();
                      } else {
                        printInfo(info: 'HGJG'+Constant.drawerIndex.toString());
                        Constant.drawerIndex = 1;
                        Get.back();
                        Get.offAllNamed(AppRoute.homeRoute);
                      }
                    },
                    leading: const Home(),
                    title: const RestInvestTitle(
                      text: "Home",
                      textColor: AppColor.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  CustomDivider(
                    color: AppColor.black.withOpacity(0.1),
                  ),
                  ListTile(
                    onTap: () {
                      if(Constant.drawerIndex == 9){
                        Get.back();
                      }else{
                        Constant.drawerIndex = 9;
                        Get.back();
                        Get.offAllNamed(AppRoute.loginRoute);
                      }
                    },
                    leading: const Logout(),
                    title: const RestInvestTitle(
                      text: "Login",
                      textColor: AppColor.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ])
              :
              // : Column(
              //   children: [
              //     Text(Constant.loginModel!.response!.user!.title ?? ''),
              ListView(children: [
                  ListTile(
                    onTap: () {
                      printInfo(
                          info:
                              Constant.loginModel!.response!.user!.title ?? '');
                    },
                    tileColor: AppColor.whiteColor,
                    leading: const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Icon(
                          Icons.person,
                          size: 60,
                        )),
                    title: RestInvestTitle(
                      text:
                          Constant.loginModel!.response!.user!.title ?? 'ghfhf',
                      textColor: AppColor.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomDivider(
                    color: AppColor.black.withOpacity(0.1),
                  ),
                  ListTile(
                    onTap: () {
                      // Get.put(HomeScreenController()).update();
                      if (Constant.drawerIndex == 1) {
                        Get.back();
                      } else {
                        Constant.drawerIndex = 1;
                        Get.back();
                        Get.offAllNamed(AppRoute.homeRoute);
                      }

                      // Get.toNamed(AppRoute.homeRoute);
                    },
                    leading: const Home(),
                    title: const RestInvestTitle(
                      text: "Home",
                      textColor: AppColor.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  CustomDivider(
                    color: AppColor.black.withOpacity(0.1),
                  ),
                  ListTile(
                    onTap: () {
                      if (Constant.drawerIndex == 2) {
                        Get.back();
                      } else {
                        Constant.drawerIndex = 2;
                        Get.back();
                        Get.offAllNamed(AppRoute.profileRoute);
                      }
                    },
                    leading: const Padding(
                        padding: EdgeInsets.only(right: 4),
                        child: Icon(Icons.person)),
                    title: const RestInvestTitle(
                      text: "Profile",
                      textColor: AppColor.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  CustomDivider(
                    color: AppColor.black.withOpacity(0.1),
                  ),
                  ListTile(
                    onTap: () {
                      if (Constant.drawerIndex == 3) {
                        Get.back();
                      } else {
                        Constant.drawerIndex = 3;
                        Get.back();
                        Get.offAllNamed(AppRoute.portofolioRoute);
                      }
                    },
                    leading: const Portofolio(),
                    title: const RestInvestTitle(
                      text: "Portofolio",
                      textColor: AppColor.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  CustomDivider(
                    color: AppColor.black.withOpacity(0.1),
                  ),
                  ListTile(
                    onTap: () {
                      if (Constant.drawerIndex == 4) {
                        Get.back();
                      } else {
                        Constant.drawerIndex = 4;
                        Get.back();
                        Get.offAllNamed(AppRoute.redemptionRoute);
                      }
                      // CustomDialog(context);
                    },
                    leading: const Redemption(),
                    title: const RestInvestTitle(
                      text: "Redemption",
                      textColor: AppColor.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  CustomDivider(
                    color: AppColor.black.withOpacity(0.1),
                  ),
                  ListTile(
                    onTap: () {
                      if (Constant.drawerIndex == 5) {
                        Get.back();
                      } else {
                        Constant.drawerIndex = 5;
                        Get.back();
                        Get.offAllNamed(AppRoute.purchasesRoute);
                      }
                    },
                    leading: const Purchase(),
                    title: const RestInvestTitle(
                      text: "Purchase",
                      textColor: AppColor.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  CustomDivider(
                    color: AppColor.black.withOpacity(0.1),
                  ),
                  ListTile(
                    onTap: () {
                      if (Constant.drawerIndex == 6) {
                        Get.back();
                      } else {
                        Constant.drawerIndex = 6;
                        Get.back();
                        Get.offAllNamed(AppRoute.f2ftransferRoute);
                      }
                    },
                    leading: const F2F(),
                    title: const RestInvestTitle(
                      text: "F2F Transfer",
                      textColor: AppColor.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  CustomDivider(
                    color: AppColor.black.withOpacity(0.1),
                  ),
                  ListTile(
                    onTap: () {
                      if (Constant.drawerIndex == 7) {
                        Get.back();
                      } else {
                        Constant.drawerIndex = 7;
                        Get.back();
                        Get.offAllNamed(AppRoute.reportsRoute);
                      }
                    },
                    leading: const Report(),
                    title: const RestInvestTitle(
                      text: "Reports",
                      textColor: AppColor.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  CustomDivider(
                    color: AppColor.black.withOpacity(0.1),
                  ),
                  ListTile(
                    onTap: () {
                      Get.to(WebViewScreen(
                        title: 'Complains',
                        link: 'https://nit.com.pk/NewNit/Complains.aspx',
                      ));
                    },
                    leading: const Complaint(),
                    title: const RestInvestTitle(
                      text: "Complaints",
                      textColor: AppColor.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  CustomDivider(
                    color: AppColor.black.withOpacity(0.1),
                  ),
                  ListTile(
                    onTap: () {
                      Constant.userId = '-0456';
                      Constant.drawerIndex = 9;
                      Constant.loginModel = null;
                      Get.offAllNamed(AppRoute.loginRoute);
                    },
                    leading: const Logout(),
                    title: const RestInvestTitle(
                      text: "Logout",
                      textColor: AppColor.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ]),
          //   ],
          // ),
        ),
      ),
    );
  }
}
