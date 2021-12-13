import 'package:flutter/material.dart';
import 'package:investintrust/controller/daily_nav_screen_controller.dart';

import 'package:get/get.dart';
import 'package:investintrust/utils/lists.dart';
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
                            height: 45,
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
                                const CustomFundList(
                                  fontWeight: FontWeight.w900,
                                  fundText: "Fund Type",
                                  dateText: "Date",
                                  saleText: "Sale",
                                  purchaseText: "Repurchase",
                                  textSize: 14,
                                ),
                                Column(
                                  children:
                                      List.generate(mutualfund.length, (index) {
                                    return CustomFundList(
                                        fontWeight: FontWeight.w900,
                                        fundText: mutualfund[index]
                                            ["fund_type"],
                                        dateText: mutualfund[index]["date"],
                                        saleText: mutualfund[index]["sale"],
                                        purchaseText: mutualfund[index]
                                            ["repurchase"],
                                        textSize: 9.0);
                                  }),
                                ),
                                space,
                                space,
                                const CustomTextContainer(
                                  height: 25,
                                  text: "PENSION FUNDS",
                                  textAlign: TextAlign.start,
                                ),
                                const CustomFundList(
                                  fontWeight: FontWeight.w900,
                                  fundText: "Fund Type",
                                  dateText: "Date",
                                  saleText: "Sale",
                                  purchaseText: "Repurchase",
                                  textSize: 14,
                                ),
                                Column(
                                  children: List.generate(pensionfund.length,
                                      (index) {
                                    return CustomFundList(
                                        fontWeight: FontWeight.w900,
                                        fundText: pensionfund[index]
                                            ["fund_type"],
                                        dateText: pensionfund[index]["date"],
                                        saleText: pensionfund[index]["sale"],
                                        purchaseText: pensionfund[index]
                                            ["repurchase"],
                                        textSize: 9.0);
                                  }),
                                ),
                                space,
                                space,
                                const CustomTextContainer(
                                  height: 25,
                                  text: "EXCHANGE TRADED FUND",
                                  textAlign: TextAlign.left,
                                ),
                                const CustomFundList(
                                  fontWeight: FontWeight.w900,
                                  fundText: "Fund Type",
                                  dateText: "Date",
                                  saleText: "Sale",
                                  purchaseText: "Repurchase",
                                  textSize: 14,
                                ),
                                Column(
                                  children: List.generate(
                                      exchangetradedfund.length, (index) {
                                    return CustomFundList(
                                        fontWeight: FontWeight.w900,
                                        fundText: exchangetradedfund[index]
                                            ["fund_type"],
                                        dateText: exchangetradedfund[index]
                                            ["date"],
                                        saleText: exchangetradedfund[index]
                                            ["sale"],
                                        purchaseText: exchangetradedfund[index]
                                            ["repurchase"],
                                        textSize: 9.0);
                                  }),
                                ),
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
