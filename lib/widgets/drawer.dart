import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investintrust/routes/routes.dart';
import 'package:investintrust/utils/colors.dart';
import 'package:investintrust/widgets/constant_widget.dart';

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
        child: ListView(children: [
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: const Icon(
              Icons.home,
            ),
            title: const RestInvestTitle(
              text: "Home",
            ),
          ),
          const CustomDivider(),
          ListTile(
            onTap: () {
              Get.toNamed(AppRoute.loginRoute);
            },
            leading: const Icon(
              Icons.person,
            ),
            title: const RestInvestTitle(
              text: "Login",
            ),
          ),
          const CustomDivider(),
          ListTile(
            onTap: () {
              Get.toNamed(AppRoute.portofolioRoute);
            },
            leading: const Icon(
              Icons.home,
            ),
            title: const RestInvestTitle(
              text: "Portofolio",
            ),
          ),
          const CustomDivider(),
          ListTile(
            onTap: () {
              Get.toNamed(AppRoute.redemptionRoute);
            },
            leading: const Icon(
              Icons.person,
            ),
            title: const RestInvestTitle(
              text: "Redemption",
            ),
          ),
          const CustomDivider(),
          ListTile(
            onTap: () {
              Get.toNamed(AppRoute.purchasesRoute);
            },
            leading: const Icon(
              Icons.home,
            ),
            title: const RestInvestTitle(
              text: "Purchases",
            ),
          ),
          const CustomDivider(),
          ListTile(
            onTap: () {
              Get.toNamed(AppRoute.f2ftransferRoute);
            },
            leading: const Icon(
              Icons.person,
            ),
            title: const RestInvestTitle(
              text: "F2F Transfer",
            ),
          ),
          const CustomDivider(),
          ListTile(
            onTap: () {
              Get.toNamed(AppRoute.reportsRoute);
            },
            leading: const Icon(
              Icons.home,
            ),
            title: const RestInvestTitle(
              text: "Reports",
            ),
          ),
          const CustomDivider(),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.person,
            ),
            title: const RestInvestTitle(
              text: "Complaints",
            ),
          ),
          const CustomDivider(),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.home,
            ),
            title: const RestInvestTitle(
              text: "Logout",
            ),
          ),
        ]),
      ),
    );
  }
}
