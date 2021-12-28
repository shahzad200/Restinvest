import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investintrust/controller/login_screen_controller.dart';
import 'package:investintrust/controller/portfolio_screen_controller.dart';



import 'package:investintrust/data/models/login_model.dart';
import 'package:investintrust/utils/constants.dart';
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
              title: const LogoNit(),
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
                height: Get.height/4,
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
                    itemCount:Constant.loginModel!.response!.accounts!.length,
                    itemBuilder: (context, index) {
                      // RemoteMessage message = _messages[index];
                      // _.totalInvestment = 0.0;

                      var userfund = 0.0;
                      for(int i = 0; i < Constant.loginModel!.response!.accounts![index].userFundBalances!.length; i++){
                        userfund = userfund + double.parse(Constant.loginModel!.response!.accounts![index].userFundBalances![i].fundvolume!);
                      }
                      return listItem(Constant.loginModel!.response!.accounts![index], userfund.toStringAsFixed(2),_,context);
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:30.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                RoundColumnButton(
                                  icon:const Icon(Icons.cabin),
                                  height: 45,
                                  width: 45,
                                  textColor: AppColor.black,
                                  onPress: ()async {
                                    // _.totalInvestment = 0.0;
                                    _.invest(0);
                                    _.loadDashboard = await _.onLoadDashboard(_.selectedAccount!.folioNumber,context);

                                    _.loadDashboard!.response!.portfolioSummary!.forEach((element) {
                                      print(element.scaleValueYaxis);
                                      _.chartDataSummery!.add(ChartData('${element.transMonthXaxis}', double.parse('${element.scaleValueYaxis}')),);
                                    });

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
                                    // _.totalInvestment = 0.0;
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
                                    // _.totalInvestment = 0.0;
                                    _.invest(2);
                                  },
                                  buttonColor: _.buttonclick5
                                      ? AppColor.blueColor
                                      : AppColor.whiteColor,
                                ),
                              ],
                            ),
                          ),
                          _.loadDashboard==null ?SizedBox() :
                          !_.buttonclick3?SizedBox():double.parse(_.loadDashboard!.response!.portfolioSummaryMaxValue!) == 0.00?Padding(
                            padding:  EdgeInsets.only(left:Get.width/4 ,top:100,),
                            child: RestInvestTitle(text: "No Data Found",textColor: AppColor.blueColor,fontSize: 20,fontWeight: FontWeight.w600,),
                          )  :Expanded(
                            child: Padding(
                                padding: const EdgeInsets.only(left:8.0,right:8.0),
                                //Initialize the spark charts widget
                                child: SfCartesianChart(

                                    primaryXAxis: CategoryAxis(),
                                    primaryYAxis: NumericAxis(minimum: 0, maximum: double.parse(_.loadDashboard!.response!.portfolioSummaryMaxValue!)+40, interval:double.parse(_.loadDashboard!.response!.portfolioSummaryMaxValue!) >1.0 &&double.parse(_.loadDashboard!.response!.portfolioSummaryMaxValue!) <100.0?20 :double.parse(_.loadDashboard!.response!.portfolioSummaryMaxValue!) >100.0 &&double.parse(_.loadDashboard!.response!.portfolioSummaryMaxValue!) <200.0?40:double.parse(_.loadDashboard!.response!.portfolioSummaryMaxValue!) >200.0 &&double.parse(_.loadDashboard!.response!.portfolioSummaryMaxValue!) <300.0?60:double.parse(_.loadDashboard!.response!.portfolioSummaryMaxValue!) >300.0 &&double.parse(_.loadDashboard!.response!.portfolioSummaryMaxValue!) <500.0?100:double.parse(_.loadDashboard!.response!.portfolioSummaryMaxValue!) >500.0 &&double.parse(_.loadDashboard!.response!.portfolioSummaryMaxValue!) <1000.0?200:double.parse(_.loadDashboard!.response!.portfolioSummaryMaxValue!) >1000.0 &&double.parse(_.loadDashboard!.response!.portfolioSummaryMaxValue!) <2000.0?500:double.parse(_.loadDashboard!.response!.portfolioSummaryMaxValue!) >2000.0 &&double.parse(_.loadDashboard!.response!.portfolioSummaryMaxValue!) <3000.0?700:900,maximumLabels: 12),
                                    tooltipBehavior: _.tooltipBehavior,
                                    series: <ChartSeries<ChartData, String>>[
                                      ColumnSeries<ChartData, String>(
                                          dataSource: _.chartDataSummery!,
                                          xValueMapper: (ChartData data, _) => data.x,
                                          yValueMapper: (ChartData data, _) => data.y,
                                          name: 'Gold',
                                  dataLabelSettings: DataLabelSettings(
                                      textStyle: TextStyle(fontSize: 14,color: AppColor.whiteColor),
                                      isVisible: true,
                                      labelAlignment: ChartDataLabelAlignment.top,
                                      showZeroValue: false,
                                      // labelPosition: ChartDataLabelPosition.outside
                                  ),
                                          gradient: LinearGradient(colors: [Colors.red,AppColor.blueColor],
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                          ),
                                          color: AppColor.blueColor)
                                    ])
                            )),
                          _.selectedAccount == null? SizedBox():
                          _.buttonclick4?
                          double.parse(_.selectedAccount!.portfolioAnalyPurchasesMaxValue!) == 0.00?Padding(
                            padding:  EdgeInsets.only(left:Get.width/4 ,top:100,),
                            child: RestInvestTitle(text: "No Data Found",textColor: AppColor.blueColor,fontSize: 20,fontWeight: FontWeight.w600,),
                          )  :Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left:8.0,right:8.0),
                              //Initialize the spark charts widget
                              child: SfCartesianChart(

                                  primaryXAxis: CategoryAxis(),
                                  primaryYAxis: NumericAxis(minimum: 0, maximum: double.parse(_.selectedAccount!.portfolioAnalyPurchasesMaxValue!)+40, interval:40,),
                                  tooltipBehavior: _.tooltipBehavior,
                                  series: <ChartSeries<ChartData, String>>[
                                    ColumnSeries<ChartData, String>(
                                        dataSource: _.chartDataPurchase!,
                                        xValueMapper: (ChartData data, _) => data.x,
                                        yValueMapper: (ChartData data, _) => data.y,
                                        name: 'Gold',
                                dataLabelSettings: DataLabelSettings(
                                    textStyle: TextStyle(fontSize: 14,color: AppColor.whiteColor),
                                    isVisible: true,
                                    labelAlignment: ChartDataLabelAlignment.top,
                                    labelPosition: ChartDataLabelPosition.outside
                                ),
                                        gradient: LinearGradient(colors: [Colors.red,AppColor.blueColor],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                        ),
                                        color: AppColor.blueColor)
                                  ])
                            ),
                          ):SizedBox(),
                          _.selectedAccount == null? SizedBox():
                          !_.buttonclick5?SizedBox() :
                          double.parse(_.selectedAccount!.portfolioAnalyRedemptionsMaxValue!) == 0.00?Padding(
                            padding:  EdgeInsets.only(left:Get.width/4 ,top:100,),
                            child: RestInvestTitle(text: "No Data Found",textColor:AppColor.blueColor,fontSize: 20,fontWeight: FontWeight.w600,),
                          )  :Expanded(
                            child: Padding(
                                padding: const EdgeInsets.only(left:8.0,right:8.0),
                                //Initialize the spark charts widget
                                child: SfCartesianChart(

                                    primaryXAxis: CategoryAxis(),
                                    primaryYAxis: NumericAxis(minimum: 0, maximum: double.parse(_.selectedAccount!.portfolioAnalyRedemptionsMaxValue!)+40, interval:40,),
                                    tooltipBehavior: _.tooltipBehavior,
                                    series: <ChartSeries<ChartData, String>>[
                                      ColumnSeries<ChartData, String>(
                                          dataSource: _.chartDataRedumption!,
                                          xValueMapper: (ChartData data, _) => data.x,
                                          yValueMapper: (ChartData data, _) => data.y,
                                          name: 'Gold',
                                  dataLabelSettings: DataLabelSettings(

                                    textStyle: TextStyle(fontSize: 14,color: AppColor.whiteColor),
                                      isVisible: true,
                                    labelAlignment: ChartDataLabelAlignment.top,
                                    // labelPosition: ChartDataLabelPosition.outside
                                  ),
                                          gradient: LinearGradient(colors: [Colors.red,AppColor.blueColor],
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                          ),
                                          color: AppColor.blueColor)
                                    ])
                            ),
                          )
                        ],
                      ),
                    ],
                  ),

                  _.portfolioButton?
                  _.data.isEmpty?Center(child:Padding(
                      padding: const EdgeInsets.only(top:30.0),
                      child: RestInvestTitle(text: "No Data Found",textColor: AppColor.blueColor,fontSize: 20,fontWeight: FontWeight.w600,)
                  )) :
                  Column(children: [
                    SfCircularChart(
                      tooltipBehavior: _.tooltip,
                        legend: Legend(
                            isVisible: true, overflowMode: LegendItemOverflowMode.wrap,
                            textStyle: TextStyle(fontSize: 20),
                            iconHeight: 20,iconWidth: 20
                            // Border color and bord
                        ),
                        series: <CircularSeries>[
                          // Renders doughnut chart
                          DoughnutSeries<ChartData, String>(
                            enableTooltip: true,
                            dataLabelMapper:(ChartData data, _) => data.y.toString() ,
                              dataLabelSettings: DataLabelSettings(
                                // useSeriesColor: true,

                                  textStyle: TextStyle(fontSize: 16,color: AppColor.whiteColor,fontWeight:FontWeight.bold ),
                                  isVisible: true,
                                  labelAlignment: ChartDataLabelAlignment.top,
                                  // labelPosition: ChartDataLabelPosition.outside
                              ),
                              animationDuration: 2000,
                              dataSource: _.data,
                              // pointColorMapper:(ChartData data,  _) => data.color,
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y,

                          )
                        ]
                    )

                    // SfCircularChart(
                    //   tooltipBehavior: _.tooltip,
                    //     title: ChartTitle(text: "sdsd"),
                    //     series: <CircularSeries>[
                    //       PieSeries<ChartData, String>(
                    //           dataSource: _.data,
                    //
                    //           xValueMapper: (ChartData data, _) => data.x,
                    //           yValueMapper: (ChartData data, _) => data.y,
                    //           explode: true,
                    //           animationDuration: 1500,
                    //           // All the segments will be exploded
                    //           explodeAll: true
                    //       )
                    //     ]
                    // )
                  ],):SizedBox(),
                ],
              ),
            ),
          );
        });
  }

  Widget listItem(Accounts? account, String? amount,PortofolioScreenController controller,context){
    return Column(
      children: [
        ListTile(
          leading: RestInvestTitle(
            text: account!.folioNumber ?? '6564',
            textColor: AppColor.dimblack,
          ),
          trailing: RestInvestTitle(
            text: 'PKR '+ amount! ?? '0.0',
            fontWeight: FontWeight.w900,
            textColor: AppColor.black,
          ),
          onTap: () async{
            print("pressed");
            controller.selectedAccount = account;
            controller.chartDataSummery = [];
            controller.chartDataPurchase = [];
            controller.chartDataRedumption = [];
            controller.loadDashboard = await controller.onLoadDashboard(account.folioNumber,context);
            controller.loadDashboard!.response!.portfolioSummary!.forEach((element) {
              controller.chartDataSummery!.add(ChartData('${element.transMonthXaxis}', double.parse('${element.scaleValueYaxis}')),);
            });
            controller.selectedAccount!.portfolioAnalyPurchases!.forEach((element) {

              if(double.parse('${element.amountYaxis}') != 0.00){
                controller.chartDataPurchase!.add(
                  ChartData('${element.fundShortXaxis}', double.parse('${element.amountYaxis}')),
                );
              }

            });
            controller.selectedAccount!.portfolioAnalyRedemptions!.forEach((element) {

              if(double.parse('${element.amountYaxis}') != 0.00) {
                print(element.fundShortXaxis);
                controller.chartDataRedumption!.add(
                  ChartData('${element.fundShortXaxis}',
                      double.parse('${element.amountYaxis}')),
                );
              }
            });
            controller.data = [];
            controller.selectedAccount!.portfolioAllocationData!.forEach((element) {
              print("pie value");
              print("pie value");
              if(double.parse('${element["fundPercent"]}') != 0.0) {
                controller.data.add(
                  ChartData('${element["fundShort"]}',
                      double.parse('${element["fundPercent"]}')),
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
