import 'package:flutter/material.dart';
import 'package:investintrust/controller/daily_nav_screen_controller.dart';

import 'package:get/get.dart';
import 'package:investintrust/utils/lists.dart';
import 'package:investintrust/widgets/button.dart';
import '../utils/colors.dart';
import '../widgets/constant_widget.dart';

class DailyNavScreen extends StatelessWidget {
  const DailyNavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var space = const SizedBox(
      height: 10,
    );
    return GetBuilder<DailyNavScreenController>(
        init: DailyNavScreenController(),
        builder: (_) {
          return SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  backgroundColor: AppColor.whiteColor,
                  title: Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Logo(
                      height: 80,
                      width: 80,
                    ),
                  ),
                  elevation: 0,
                ),
                key: _.scaffoldKey,
                body: SingleChildScrollView(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(children: [
                    space,
                    Container(
                      // height: Get.height,
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: AppColor.blueColor)),
                      child: Column(
                        children: [
                          const CustomTextContainer(
                            height: 40,
                            text: "DAILY FUND PRICES",
                            textAlign: TextAlign.end,
                          ),
                          space,
                          space,
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                const CustomTextContainer(
                                  height: 25,
                                  text: "MUTUAL FUNDS",
                                  textAlign: TextAlign.start,
                                ),
                                space,
                                const CustomFundList(
                                  fontWeight: FontWeight.w900,
                                  fundText: "Fund Type",
                                  dateText: "Date",
                                  saleText: "Sale",
                                  purchaseText: "Repurchase",

                                  textSize: 12.0,
                                ),
                                _.dailyNavPrices == null ? const CircularProgressIndicator() :Column(
                                  children: List.generate(
                                      _
                                          .dailyNavPrices!
                                          .response!
                                          .dailyMutualFundNavList!
                                          .length, (index) {
                                    return CustomFundList(
                                        fontWeight: FontWeight.w700,
                                        fundText:
                                         _
                                            .dailyNavPrices!
                                           .response!
                                            .dailyMutualFundNavList![index]
                                            .fundType!,
                                        dateText:
                                         _
                                             .dailyNavPrices!
                                           .response!
                                             .dailyMutualFundNavList![index]
                                           .funddate!,
                                        saleText:
                                         _
                                             .dailyNavPrices!
                                            .response!
                                            .dailyMutualFundNavList![index]
                                            .fundSale!
                                             .toString(),
                                        purchaseText:
                                         _
                                            .dailyNavPrices!
                                            .response!
                                            .dailyMutualFundNavList![index]
                                            .fundRepurchase!
                                             .toString(),
                                        textSize: 12.0
                                    );
                                  }),
    ),

                                space,
                                const CustomTextContainer(
                                  height: 25,
                                  text: "PENSION ",
                                  textAlign: TextAlign.start,
                                ),
                                space,
                                const CustomFundList(
                                  fontWeight: FontWeight.w900,
                                  fundText: "Fund Type",
                                  dateText: "Date",
                                  saleText: "Sale",
                                  purchaseText: "Repurchase",
                                  textSize: 12.0,
                                ),
                                _.dailyNavPrices == null ? const CircularProgressIndicator() :    Column(
                              children: List.generate(
                                  _
                                      .dailyNavPrices!
                                      .response!
                                      .dailyPensionFundNavList!
                                      .length, (index) {
                                return CustomFundList(
                                    fontWeight: FontWeight.w700,
                                    fundText:
                                    _
                                        .dailyNavPrices!
                                        .response!
                                        .dailyPensionFundNavList![index]
                                        .fundType!,
                                    dateText:
                                    _
                                        .dailyNavPrices!
                                        .response!
                                        .dailyPensionFundNavList![index]
                                        .funddate!,
                                    saleText:
                                    _
                                        .dailyNavPrices!
                                        .response!
                                        .dailyPensionFundNavList![index]
                                        .fundSale!
                                        .toString(),
                                    purchaseText:
                                    _
                                        .dailyNavPrices!
                                        .response!
                                        .dailyPensionFundNavList![index]
                                        .fundRepurchase!
                                        .toString(),
                                    textSize: 12.0
                                );
                              }),),
                                space,
                                const CustomTextContainer(
                                  height: 25,
                                  text: "EXCHANGE TRADED FUND",
                                  textAlign: TextAlign.left,
                                ),
                                space,
                                const CustomFundList(
                                  fontWeight: FontWeight.w900,
                                  fundText: "Fund Type",
                                  dateText: "Date",
                                  saleText: "Sale",
                                  purchaseText: "Repurchase",
                                  textSize: 12.0,
                                ),
                                _.dailyNavPrices == null ? const CircularProgressIndicator() :    Column(
                                  children: List.generate(
                                      _
                                          .dailyNavPrices!
                                          .response!
                                          .dailyExchangeFundNavList!
                                          .length, (index) {
                                    return CustomFundList(
                                        fontWeight: FontWeight.w700,
                                        fundText:
                                        _
                                            .dailyNavPrices!
                                            .response!
                                            .dailyExchangeFundNavList![index]
                                            .fundType!,
                                        dateText:
                                        _
                                            .dailyNavPrices!
                                            .response!
                                            .dailyExchangeFundNavList![index]
                                            .funddate!,
                                        saleText:
                                        _
                                            .dailyNavPrices!
                                            .response!
                                            .dailyExchangeFundNavList![index]
                                            .fundSale!
                                            .toString(),
                                        purchaseText:
                                        _
                                            .dailyNavPrices!
                                            .response!
                                            .dailyExchangeFundNavList![index]
                                            .fundRepurchase!
                                            .toString(),
                                        textSize: 12.0
                                    );
                                  }),),
                                space,
                                space,
                                SizedBox(
                                  width: 300,
                                  height: 25,
                                  child: RestInvestButton(
                                    isSquare: true,
                                    text: "NAV HISTORY",
                                    onPress: () {},
                                    buttonColor: AppColor.blueColor,
                                    textColor: AppColor.whiteColor,
                                  ),
                                ),
                                space,
                                space
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
                )),
          );
        });
  }
}
