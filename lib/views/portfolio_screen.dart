import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investintrust/controller/portfolio_screen_controller.dart';

import '../utils/colors.dart';
import '../widgets/button.dart';
import '../widgets/constant_widget.dart';
import '../widgets/custom_divider.dart';

import '../widgets/drawer.dart';

class PortofolioScreen extends StatelessWidget {
  const PortofolioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PortofolioScreenController>(
        init: PortofolioScreenController(),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: AppColor.blueColor,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                  ListTile(
                    leading: const RestInvestTitle(
                      text: "81656",
                      textColor: AppColor.dimblack,
                    ),
                    trailing: const RestInvestTitle(
                      text: "PKR.00",
                      fontWeight: FontWeight.bold,
                      textColor: AppColor.black,
                    ),
                    onTap: () {},
                  ),
                  const CustomDivider(),
                  ListTile(
                    leading: const RestInvestTitle(
                      text: "81656",
                      textColor: AppColor.dimblack,
                    ),
                    trailing: const RestInvestTitle(
                      text: "PKR.00",
                      fontWeight: FontWeight.bold,
                      textColor: AppColor.black,
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ListTile(
                    leading: const RestInvestTitle(
                      text: "Total Investment Value",
                      fontWeight: FontWeight.w900,
                    ),
                    trailing: const RestInvestTitle(text: "PKR.00"),
                    onTap: () {},
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: CustomRoundButton(
                              text: "Investment by Fund",
                              textColor: AppColor.black,
                              onPress: () {
                                _.investTrust(0);
                              },
                              buttonColor: _.investButton
                                  ? AppColor.blueColor
                                  : AppColor.whiteColor)),
                      Expanded(
                          child: CustomRoundButton(
                        text: "Portfolio Allocation",
                        textColor: AppColor.black,
                        onPress: () {
                          _.investTrust(1);
                        },
                        buttonColor: _.portfolioButton
                            ? AppColor.blueColor
                            : AppColor.whiteColor,
                      )),
                      const SizedBox(),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      RoundColumnButton(
                        height: 45,
                        width: 50,
                        textColor: AppColor.black,
                        onPress: () {
                          _.invest(0);
                        },
                        buttonColor: _.buttonclick3
                            ? AppColor.blueColor
                            : AppColor.whiteColor,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      RoundColumnButton(
                        height: 45,
                        width: 50,
                        textColor: AppColor.black,
                        onPress: () {
                          _.invest(1);
                        },
                        buttonColor: _.buttonclick4
                            ? AppColor.blueColor
                            : AppColor.whiteColor,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      RoundColumnButton(
                        height: 45,
                        width: 50,
                        textColor: AppColor.black,
                        onPress: () {
                          _.invest(2);
                        },
                        buttonColor: _.buttonclick5
                            ? AppColor.blueColor
                            : AppColor.whiteColor,
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
