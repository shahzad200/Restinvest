import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nit/widgets/no_internet.dart';
import '../controller/portfolio_screen_controller.dart';


import '../data/models/login_model.dart';
import '../utils/constants.dart';
import '../utils/my_images.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';


import '../utils/colors.dart';
import '../widgets/button.dart';
import '../widgets/constant_widget.dart';
import '../widgets/custom_divider.dart';

import '../widgets/drawer.dart';

class PortofolioScreen extends StatelessWidget {
  const PortofolioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Color> color = <Color>[];
    color.add(AppColor.blueColor);
    color.add(AppColor.liteblue);
    color.add(AppColor.lightGreyColor);

    final List<double> stops = <double>[];
    stops.add(0.6);
    stops.add(0.5);
    stops.add(0.5);
    return GetBuilder<PortofolioScreenController>(
        init: PortofolioScreenController(),
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: const LogoNit(height: 60, width: 60,),
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
            body: Stack(
              children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: AppColor.blueColor,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RestInvestTitle(
                          fontSize: 16,
                          textColor: AppColor.greyColor,
                          text: "As on ${_.formatted!}",
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: AppColor.blueColor,
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          RestInvestTitle(
                            fontSize: 14,
                            textColor: AppColor.whiteColor,
                            text: "Folio No.",
                            fontWeight: FontWeight.w600,
                          ),
                          Spacer(),
                          RestInvestTitle(
                            fontSize: 14,
                            textColor: AppColor.whiteColor,
                            text: "Amount (Rs)",
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: Get.height / 4,
                    child:
                    // SingleChildScrollView(
                    //   child: Column(children: List.generate(_.loginController.loginModel!.response!.accounts!.length, (index){
                    //     _.totalInvestment = _.totalInvestment + double.parse(_.loginController.loginModel!.response!.accounts![index]!.portfolioInvestmentValue!);
                    //     var userfund = 0.0;
                    //     for(int i = 0; i < _.loginController.loginModel!.response!.accounts![index].userFundBalances!.length; i++){
                    //       userfund = userfund + double.parse(_.loginController.loginModel!.response!.accounts![index].userFundBalances![i].fundvolume!);
                    //     }
                    //     return InkWell( child: listItem(_.loginController.loginModel!.response!.accounts![index].folioNumber, userfund.toStringAsFixed(2)),onTap: (){
                    //       print("pressed");
                    //       _.selectedAccount = _.loginController.loginModel!.response!.accounts![index];
                    //       print(_.selectedAccount!.portfolioAnalyPurchasesMaxValue);
                    //       _.update();
                    //     },);
                    //   })),
                    // )


                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: Constant.loginModel!.response!.accounts!
                            .length,
                        itemBuilder: (context, index) {
                          // RemoteMessage message = _messages[index];
                          // _.totalInvestment = 0.0;
                          var userfund = 0.0;
                          for (int i = 0; i < Constant.loginModel!.response!
                              .accounts![index].userFundBalances!.length; i++) {
                            userfund = userfund + double.parse(Constant
                                .loginModel!.response!.accounts![index]
                                .userFundBalances![i].fundvolume!);
                          }
                          return listItem(index,Constant.loginModel!.response!
                              .accounts![index], userfund.toStringAsFixed(2), _,
                              context);
                        }),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: const RestInvestTitle(
                      text: "Total Investment Value",
                      fontWeight: FontWeight.w900,
                    ),
                    trailing: RestInvestTitle(
                      text: "${_.f.format(double.parse(_.totalInvestment!
                          .toStringAsFixed(2) ?? '0.0') ?? 0.0)}",
                      // text: "PKR "+ _.totalInvestment.toStringAsFixed(2),
                      fontWeight: FontWeight.w900,
                    ),
                    onTap: () {},
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: CustomRoundButton(isRound: false,
                              text: "Investment by Fund",
                              textColor: _.investButton
                                  ? Colors.white
                                  : AppColor.black,
                              textSize: 14,
                              onPress: () {
                                _.investTrust(0);
                              },
                              buttonColor: _.investButton
                                  ? AppColor.blueColor
                                  : AppColor.whiteColor)),
                      Expanded(
                          child: CustomRoundButton(
                            isRound: false,
                            text: "Portfolio Allocation",
                            textColor: _.portfolioButton
                                ? Colors.white
                                : AppColor.black,
                            onPress: () {
                              _.investTrust(1);
                            },
                            textSize: 14,
                            buttonColor: _.portfolioButton
                                ? AppColor.blueColor
                                : AppColor.whiteColor,
                          )),
                      const SizedBox(),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  _.portfolioButton ? const SizedBox() : Column(
                    children: [ Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Row(
                        children: [
                          RestInvestTitle(text: "PKR (000)",
                            fontSize: 12,
                            fontWeight: FontWeight.w500,),
                          SizedBox(width: Get.width / 4,),
                          RestInvestTitle(text: _.buttonclick3 ? "Summary" : _
                              .buttonclick4 ? "Purchase" : "Redumption",
                            fontSize: 12,
                            fontWeight: FontWeight.w500,),
                        ],
                      ),
                    ),
                      SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                RoundColumnButton(
                                  icon: Image.asset(
                                    MyImages.summery, height: 30,
                                    width: 30,),
                                  height: 45,
                                  width: 45,
                                  // textColor: AppColor.black,
                                  onPress: () async {
                                    // _.totalInvestment = 0.0;
                                    _.invest(0);
                                    _.chartDataSummery = [];
                                    _.loadDashboard = await _.onLoadDashboard(
                                        _.selectedAccount!.folioNumber,
                                        context);

                                    _.loadDashboard!.response!.portfolioSummary!
                                        .forEach((element) {
                                      print(element.scaleValueYaxis);
                                      if (double.parse(
                                          '${element.scaleValueYaxis}') !=
                                          0.00) {
                                        _.chartDataSummery!.add(ChartData(
                                            '${element.transMonthXaxis}',
                                            double.parse('${element
                                                .scaleValueYaxis}')),);
                                      }
                                    });
                                  },
                                  buttonColor: _.buttonclick3
                                      ? AppColor.blueColor
                                      : AppColor.lightGreyColor,
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                RoundColumnButton(
                                  icon: Image.asset(
                                    MyImages.purchase, height: 30,
                                    width: 30,),
                                  height: 45,
                                  width: 45,
                                  // textColor: AppColor.black,
                                  onPress: () {
                                    // _.totalInvestment = 0.0;
                                    _.invest(1);
                                  },
                                  buttonColor: _.buttonclick4
                                      ? AppColor.blueColor
                                      : AppColor.lightGreyColor,
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                RoundColumnButton(
                                  icon: Image.asset(
                                    MyImages.redumption, height: 30,
                                    width: 30,),
                                  height: 45,
                                  width: 45,
                                  // textColor: AppColor.black,
                                  onPress: () {
                                    // _.totalInvestment = 0.0;
                                    _.invest(2);
                                  },
                                  buttonColor: _.buttonclick5
                                      ? AppColor.blueColor
                                      : AppColor.lightGreyColor,
                                ),
                              ],
                            ),
                          ),
                          !_.isSummery ?
                          _.loadDashboard == null ? SizedBox() :
                          !_.buttonclick3 ? SizedBox() : double.parse(
                              _.loadDashboard!.response!
                                  .portfolioSummaryMaxValue!) == 0.00 ? Padding(
                            padding: EdgeInsets.only(
                              left: Get.width / 4, top: 100,),
                            child: RestInvestTitle(text: "No Data Found",
                              textColor: AppColor.blueColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,),
                          ) :
                          Expanded(
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 12.0),
                                  child: RotatedBox(
                                      quarterTurns: 3,
                                      child: Text("Rupees in PKR",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900
                                        ),
                                      )
                                  ),
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                        height: Get.height / 2.8,
                                        width: Get.width / 1.3,
                                        child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            //Initialize the spark charts widget
                                            child: SfCartesianChart(

                                                primaryXAxis: CategoryAxis(),
                                                primaryYAxis: NumericAxis(
                                                    minimum: 0,
                                                    maximum: double.parse(
                                                        _.loadDashboard!
                                                            .response!
                                                            .portfolioSummaryMaxValue!) >
                                                        1.0 && double.parse(
                                                        _.loadDashboard!
                                                            .response!
                                                            .portfolioSummaryMaxValue!) <
                                                        300.0 ? double.parse(
                                                        _.loadDashboard!
                                                            .response!
                                                            .portfolioSummaryMaxValue!) +
                                                        10 : double.parse(
                                                        _.loadDashboard!
                                                            .response!
                                                            .portfolioSummaryMaxValue!) +
                                                        40,
                                                    interval: double.parse(
                                                        _.loadDashboard!
                                                            .response!
                                                            .portfolioSummaryMaxValue!) >
                                                        1.0 && double.parse(
                                                        _.loadDashboard!
                                                            .response!
                                                            .portfolioSummaryMaxValue!) <
                                                        50.0 ? 5 : double.parse(
                                                        _.loadDashboard!
                                                            .response!
                                                            .portfolioSummaryMaxValue!) >
                                                        50.0 && double.parse(
                                                        _.loadDashboard!
                                                            .response!
                                                            .portfolioSummaryMaxValue!) <
                                                        100.0 ? 20 : double
                                                        .parse(_.loadDashboard!
                                                        .response!
                                                        .portfolioSummaryMaxValue!) >
                                                        100.0 && double.parse(
                                                        _.loadDashboard!
                                                            .response!
                                                            .portfolioSummaryMaxValue!) <
                                                        200.0 ? 40 : double
                                                        .parse(_.loadDashboard!
                                                        .response!
                                                        .portfolioSummaryMaxValue!) >
                                                        200.0 && double.parse(
                                                        _.loadDashboard!
                                                            .response!
                                                            .portfolioSummaryMaxValue!) <
                                                        300.0 ? 60 : double
                                                        .parse(_.loadDashboard!
                                                        .response!
                                                        .portfolioSummaryMaxValue!) >
                                                        300.0 && double.parse(
                                                        _.loadDashboard!
                                                            .response!
                                                            .portfolioSummaryMaxValue!) <
                                                        500.0 ? 100 : double
                                                        .parse(_.loadDashboard!
                                                        .response!
                                                        .portfolioSummaryMaxValue!) >
                                                        500.0 && double.parse(
                                                        _.loadDashboard!
                                                            .response!
                                                            .portfolioSummaryMaxValue!) <
                                                        1000.0 ? 200 : double
                                                        .parse(_.loadDashboard!
                                                        .response!
                                                        .portfolioSummaryMaxValue!) >
                                                        1000.0 && double.parse(
                                                        _.loadDashboard!
                                                            .response!
                                                            .portfolioSummaryMaxValue!) <
                                                        2000.0 ? 500 : double
                                                        .parse(_.loadDashboard!
                                                        .response!
                                                        .portfolioSummaryMaxValue!) >
                                                        2000.0 && double.parse(
                                                        _.loadDashboard!
                                                            .response!
                                                            .portfolioSummaryMaxValue!) <
                                                        3000.0 ? 700 : 900,
                                                    maximumLabels: 12),
                                                tooltipBehavior: _
                                                    .tooltipBehavior,
                                                series: <ChartSeries<
                                                    ChartData,
                                                    String>>[
                                                  ColumnSeries<ChartData,
                                                      String>(
                                                      dataSource: _
                                                          .chartDataSummery!,
                                                      xValueMapper: (
                                                          ChartData data,
                                                          _) => data.x,
                                                      yValueMapper: (
                                                          ChartData data,
                                                          _) => data.y,
                                                      name: '',
                                                      dataLabelSettings: const DataLabelSettings(
                                                          textStyle: TextStyle(
                                                              fontSize: 10,
                                                              color: AppColor
                                                                  .whiteColor),
                                                          isVisible: true,
                                                          labelAlignment: ChartDataLabelAlignment
                                                              .top,
                                                          showZeroValue: false,
                                                          labelIntersectAction: LabelIntersectAction
                                                              .shift
                                                        // labelPosition: ChartDataLabelPosition.outside
                                                      ),

                                                      // gradient: LinearGradient(colors: [Colors.red,AppColor.blueColor],
                                                      //   begin: Alignment.bottomCenter,
                                                      //   end: Alignment.topCenter,
                                                      // ),
                                                      color: AppColor.blueColor)
                                                ])
                                        )),
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 12.0),
                                      child: Text("Months",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900
                                        ),),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                              :
                          Padding(padding: EdgeInsets.only(
                              top: 100, left: Get.width / 5),
                              child: CircularProgressIndicator()),
                          _.selectedAccount == null ? SizedBox() :
                          _.buttonclick4 ?
                          double.parse(_.selectedAccount!
                              .portfolioAnalyPurchasesMaxValue!) == 0.00
                              ? Padding(
                            padding: EdgeInsets.only(
                              left: Get.width / 4, top: 100,),
                            child: RestInvestTitle(text: "No Data Found",
                              textColor: AppColor.blueColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,),
                          )
                              : Expanded(
                            child: Container(
                              height: Get.height / 2.8,
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0),
                                  //Initialize the spark charts widget
                                  child: SfCartesianChart(

                                      primaryXAxis: CategoryAxis(),
                                      primaryYAxis: NumericAxis(minimum: 0,
                                          maximum: double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyPurchasesMaxValue!) >
                                              1.0 && double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyPurchasesMaxValue!) <
                                              300.0 ? double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyPurchasesMaxValue!) +
                                              10 : double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyPurchasesMaxValue!) +
                                              40,
                                          interval: double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyPurchasesMaxValue!) >
                                              1.0 && double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyPurchasesMaxValue!) <
                                              50.0 ? 5 : double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyPurchasesMaxValue!) >
                                              50.0 && double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyPurchasesMaxValue!) <
                                              100.0 ? 20 : double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyPurchasesMaxValue!) >
                                              100.0 && double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyPurchasesMaxValue!) <
                                              200.0 ? 40 : double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyPurchasesMaxValue!) >
                                              200.0 && double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyPurchasesMaxValue!) <
                                              300.0 ? 60 : double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyPurchasesMaxValue!) >
                                              300.0 && double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyPurchasesMaxValue!) <
                                              500.0 ? 100 : double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyPurchasesMaxValue!) >
                                              500.0 && double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyPurchasesMaxValue!) <
                                              1000.0 ? 200 : double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyPurchasesMaxValue!) >
                                              1000.0 && double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyPurchasesMaxValue!) <
                                              2000.0 ? 500 : double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyPurchasesMaxValue!) >
                                              2000.0 && double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyPurchasesMaxValue!) <
                                              3000.0 ? 700 : 900,
                                          maximumLabels: 12),
                                      tooltipBehavior: _.tooltipBehavior,
                                      series: <ChartSeries<ChartData, String>>[
                                        ColumnSeries<ChartData, String>(
                                            dataSource: _.chartDataPurchase!,
                                            xValueMapper: (ChartData data,
                                                _) => data.x,
                                            yValueMapper: (ChartData data,
                                                _) => data.y,
                                            name: '',
                                            dataLabelSettings: DataLabelSettings(
                                                textStyle: TextStyle(
                                                    fontSize: 10,
                                                    color: AppColor.whiteColor),
                                                isVisible: true,
                                                labelAlignment: ChartDataLabelAlignment
                                                    .top,
                                                labelPosition: ChartDataLabelPosition
                                                    .outside
                                            ),
                                            // gradient: LinearGradient(colors: [Colors.red,AppColor.blueColor],
                                            //   begin: Alignment.bottomCenter,
                                            //   end: Alignment.topCenter,
                                            // ),
                                            color: AppColor.blueColor)
                                      ])
                              ),
                            ),
                          ) : SizedBox(),
                          _.selectedAccount == null ? SizedBox() :
                          !_.buttonclick5 ? const SizedBox() :
                          double.parse(_.selectedAccount!
                              .portfolioAnalyRedemptionsMaxValue!) == 0.00
                              ? Padding(
                            padding: EdgeInsets.only(
                              left: Get.width / 4, top: 100,),
                            child: const RestInvestTitle(text: "No Data Found",
                              textColor: AppColor.blueColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,),
                          )
                              : Expanded(
                            child: Container(
                              height: Get.height / 2.8,
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0),
                                  //Initialize the spark charts widget
                                  child: SfCartesianChart(

                                      primaryXAxis: CategoryAxis(),
                                      primaryYAxis: NumericAxis(minimum: 0,
                                          maximum: double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyRedemptionsMaxValue!) >
                                              1.0 && double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyRedemptionsMaxValue!) <
                                              300.0 ? double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyRedemptionsMaxValue!) +
                                              10 : double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyRedemptionsMaxValue!) +
                                              40,
                                          interval: double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyRedemptionsMaxValue!) >
                                              1.0 && double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyRedemptionsMaxValue!) <
                                              50.0 ? 5 : double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyRedemptionsMaxValue!) >
                                              50.0 && double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyRedemptionsMaxValue!) <
                                              100.0 ? 20 : double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyRedemptionsMaxValue!) >
                                              100.0 && double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyRedemptionsMaxValue!) <
                                              200.0 ? 40 : double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyRedemptionsMaxValue!) >
                                              200.0 && double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyRedemptionsMaxValue!) <
                                              300.0 ? 60 : double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyRedemptionsMaxValue!) >
                                              300.0 && double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyRedemptionsMaxValue!) <
                                              500.0 ? 100 : double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyRedemptionsMaxValue!) >
                                              500.0 && double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyRedemptionsMaxValue!) <
                                              1000.0 ? 200 : double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyRedemptionsMaxValue!) >
                                              1000.0 && double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyRedemptionsMaxValue!) <
                                              2000.0 ? 500 : double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyRedemptionsMaxValue!) >
                                              2000.0 && double.parse(
                                              _.selectedAccount!
                                                  .portfolioAnalyRedemptionsMaxValue!) <
                                              3000.0 ? 700 : 900,
                                          maximumLabels: 12),
                                      tooltipBehavior: _.tooltipBehavior,
                                      series: <ChartSeries<ChartData, String>>[
                                        ColumnSeries<ChartData, String>(
                                            dataSource: _.chartDataRedumption!,
                                            xValueMapper: (ChartData data,
                                                _) => data.x,
                                            yValueMapper: (ChartData data,
                                                _) => data.y,
                                            name: '',
                                            dataLabelSettings: DataLabelSettings(

                                              textStyle: TextStyle(fontSize: 10,
                                                  color: AppColor.whiteColor),
                                              isVisible: true,
                                              labelAlignment: ChartDataLabelAlignment
                                                  .top,
                                              // labelPosition: ChartDataLabelPosition.outside
                                            ),
                                            // gradient: LinearGradient(colors: [Colors.red,AppColor.blueColor],
                                            //   begin: Alignment.bottomCenter,
                                            //   end: Alignment.topCenter,
                                            // ),
                                            color: AppColor.blueColor)
                                      ])
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  _.portfolioButton ?
                  _.data.isEmpty ? Center(child: Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: RestInvestTitle(text: "No Data Found",
                        textColor: AppColor.blueColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,)
                  )) :
                  Container(
                    height: Get.height / 2.8,
                    child: SfCircularChart(
                        tooltipBehavior: _.tooltip,
                        legend: Legend(
                            isVisible: true,
                            overflowMode: LegendItemOverflowMode.wrap,
                            textStyle: TextStyle(fontSize: 14),
                            iconHeight: 14,
                            iconWidth: 14
                          // Border color and bord
                        ),
                        series: <CircularSeries>[
                          // Renders doughnut chart
                          DoughnutSeries<ChartData, String>(
                            enableTooltip: true,
                            dataLabelMapper: (ChartData data, _) => "${data
                                .y}%",
                            dataLabelSettings: DataLabelSettings(
                              // useSeriesColor: true,

                              textStyle: TextStyle(fontSize: 11,
                                  color: AppColor.whiteColor,
                                  fontWeight: FontWeight.bold),
                              isVisible: true,
                              labelAlignment: ChartDataLabelAlignment.top,
                            ),
                            animationDuration: 2000,
                            dataSource: _.data,

                            // pointColorMapper:(ChartData data,  _) => data.color,
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y,

                          )
                        ]
                    ),
                  ) : SizedBox(),
                ],
              ),
            ),
            _.isLoading
                ? const Center(
              child: DialogBox(),
            )
                : _.noInternet
                ? Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Container(
                  height: 180,
                  width: Get.width,
                  color: Colors.white,
                  child: NoInternetWgt(
                    onTryAgain: (){
                      _.noInternet = false;
                      _.update();
                    },
                  ),
                ),
              ),
            )
                : const SizedBox()
            ],
          ),
          );
        });
  }

  Widget listItem(int index,Accounts? account, String? amount,
      PortofolioScreenController controller, context) {
    return Column(
      children: [
        ListTile(
          leading: RestInvestTitle(
            text: account!.folioNumber ?? '',
            fontWeight: FontWeight.bold,
            textColor: controller.accNumber == account!.folioNumber ? AppColor
                .black : AppColor.dimblack,
          ),
          trailing: RestInvestTitle(
            // ${_.f.format(_.taxCredit ?? 0)}
            text: "${controller.f.format(
                double.parse(amount! ?? '0.0') ?? 0.0)}",

            fontWeight: FontWeight.bold,
            textColor: controller.amountAccount.toStringAsFixed(2) == amount ? AppColor.black :AppColor.dimblack,
          ),
          onTap: () async {
            if(account.vpsAccount == true){
              Constant.isVps = true;
              Constant.accountIndex = index;
              controller.update();
            }else{
              Constant.isVps = false;
              Constant.accountIndex = index;
              controller.update();
            }
            print("pressed");
            controller.amountAccount =  double.parse(amount);
            controller.selectedAccount = account;
            controller.chartDataSummery = [];
            controller.chartDataPurchase = [];
            controller.chartDataRedumption = [];
            controller.accNumber = account.folioNumber.toString();
            controller.loadDashboard =
            await controller.onLoadDashboard(account.folioNumber, context);
            controller.loadDashboard!.response!.portfolioSummary!.forEach((
                element) {
              controller.chartDataSummery!.add(ChartData(
                  '${element.transMonthXaxis}',
                  double.parse('${element.scaleValueYaxis}')),);
            });
            controller.selectedAccount!.portfolioAnalyPurchases!.forEach((
                element) {
              if (double.parse('${element.amountYaxis}') != 0.00) {
                controller.chartDataPurchase!.add(
                  ChartData('${element.fundShortXaxis}',
                      double.parse('${element.amountYaxis}')),
                );
              }
            });
            controller.selectedAccount!.portfolioAnalyRedemptions!.forEach((
                element) {
              if (double.parse('${element.amountYaxis}') != 0.00) {
                print(element.fundShortXaxis);
                controller.chartDataRedumption!.add(
                  ChartData('${element.fundShortXaxis}',
                      double.parse('${element.amountYaxis}')),
                );
              }
            });
            controller.data = [];
            controller.selectedAccount!.portfolioAllocationData!.forEach((
                element) {
              print("pie value");
              print("pie value");
              if (double.parse('${element.fundPercent}') != 0.0) {
                controller.data.add(
                  ChartData('${element.fundShort}',
                      double.parse('${element.fundPercent}')),
                );
              }
            });
            controller.update();
          },
        ),
        CustomDivider(color: AppColor.dimblack.withOpacity(0.2)),
      ],
    );
  }
}
