import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      padding: const EdgeInsets.only(top: 60),
      color: AppColor.whiteColor,
      width: Get.width / 1.9,
      child: Drawer(
        child: Constant.userId == '-0456' ?
        ListView(children: [
          ListTile(
            onTap: () {
              // Navigator.pop(context);
              Get.back();

              // Get.back();
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
              Get.toNamed(AppRoute.loginRoute);
            },
            leading: const Logout(),
            title: const RestInvestTitle(
              text: "Login",
              textColor: AppColor.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ])
         : ListView(children: [
          ListTile(
            onTap: () {
              // Get.put(HomeScreenController()).update();
              Get.back();
              Get.offAllNamed(AppRoute.homeRoute);

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
              Get.back();
              Get.toNamed(AppRoute.portofolioRoute);
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
              Get.back();
              Get.toNamed(AppRoute.redemptionRoute);
              CustomDialog(context);
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
              Get.back();
              Get.toNamed(AppRoute.purchasesRoute);
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
              Get.back();
              Get.toNamed(AppRoute.f2ftransferRoute);
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
              Get.back();
              Get.toNamed(AppRoute.reportsRoute);
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
              Get.to(WebViewScreen(title: 'Complains',
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
      ),
    );
  }
}
