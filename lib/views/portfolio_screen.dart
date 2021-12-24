import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investintrust/controller/login_screen_controller.dart';
import 'package:investintrust/controller/portfolio_screen_controller.dart';



import 'package:investintrust/data/models/login_model.dart';
import 'package:investintrust/utils/constants.dart';


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
              title: Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Logo(
                  height: 80,
                  width: 80,
                ),
              ),
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
                      children: const [
                        RestInvestTitle(
                          fontSize: 16,
                          textColor: AppColor.greyColor,
                          text: "As on Dec 10,2021",
                          fontWeight: FontWeight.w900,
                        ),
                      ],
                    ),
                  ),
              Container(
                height: Get.height/3.5,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _.loginController.loginModel!.response!.accounts!.length,
                    itemBuilder: (context, index) {
                      // RemoteMessage message = _messages[index];
                      _.totalInvestment = _.totalInvestment + double.parse(_.loginController.loginModel!.response!.accounts![index]!.portfolioInvestmentValue!);
                      var userfund = 0.0;
                      for(int i = 0; i < _.loginController.loginModel!.response!.accounts![index].userFundBalances!.length; i++){
                        userfund = userfund + double.parse(_.loginController.loginModel!.response!.accounts![index].userFundBalances![i].fundvolume!);
                      }
                      return listItem(_.loginController.loginModel!.response!.accounts![index].folioNumber, userfund.toStringAsFixed(2));
                    }),
              ),

                  const SizedBox(
                    height: 40,
                  ),
                  ListTile(
                    leading: const RestInvestTitle(
                      text: "Total Investment Value",
                      fontWeight: FontWeight.w900,
                    ),
                    trailing:  RestInvestTitle(
                      text: "PKR "+ _.totalInvestment.toStringAsFixed(2),
                      fontWeight: FontWeight.w900,
                    ),
                    onTap: () {},
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: CustomRoundButton(
                              text: "Investment by Fund",
                              textColor: _.investButton
                                  ? Colors.white
                                  : AppColor.black,
                              onPress: () {
                                _.investTrust(0);
                              },
                              buttonColor: _.investButton
                                  ? AppColor.blueColor
                                  : AppColor.whiteColor)),
                      Expanded(
                          child: CustomRoundButton(
                        text: "Portfolio Allocation",
                        textColor: _.portfolioButton
                            ? Colors.white
                            : AppColor.black,
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
                  _.portfolioButton?const SizedBox():Column(
                    children: [
                      RoundColumnButton(
                        icon:const Icon(Icons.cabin),
                        height: 45,
                        width: 45,
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
                        icon: Icon(Icons.cabin),
                        height: 45,
                        width: 45,
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
                        icon: Icon(Icons.cabin),
                        height: 45,
                        width: 45,
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

  Widget listItem(String? folioNumber, String? amount){
    return Column(
      children: [
        ListTile(
          leading: RestInvestTitle(
            text: folioNumber ?? '6564',
            textColor: AppColor.dimblack,
          ),
          trailing: RestInvestTitle(
            text: 'PKR '+ amount! ?? '0.0',
            fontWeight: FontWeight.w900,
            textColor: AppColor.black,
          ),
          onTap: () {},
        ),
        CustomDivider(color: AppColor.dimblack.withOpacity(0.2)),
      ],
    );
  }


}
