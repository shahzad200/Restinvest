
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controller/nav_screen_controller.dart';

import '../utils/colors.dart';
import '../widgets/constant_widget.dart';

class NavScreen extends StatelessWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavScreenController>(
        init: NavScreenController(),
        builder: (_) {
          return Scaffold(
              backgroundColor: AppColor.lightWhite,
              appBar: AppBar(
                backgroundColor: AppColor.blueColor,
                leading: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColor.whiteColor,
                    )),
                title: const RestInvestTitle(
                  text: "NAV",
                  textColor: AppColor.whiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              body: WebView(
                // initialUrl: 'https://nit.com.pk/NewNit/NAV.aspx',
                initialUrl:
                    '${Constant.socialMediaLink!.response!.homeLinks!.latestNav}',
              )

              // SingleChildScrollView(
              //   padding: const EdgeInsets.only(top: 6, left: 30, right: 30),
              //   child: Column(
              //     children: [
              //       Row(
              //         children: [
              //           Container(
              //             height: 35,
              //             width: 50,
              //             decoration: BoxDecoration(
              //                 color: AppColor.lightGreyColor,
              //                 border:
              //                     Border.all(width: 1, color: AppColor.greyColor),
              //                 borderRadius: const BorderRadius.only(
              //                     topLeft: Radius.circular(4.0),
              //                     bottomLeft: Radius.circular(4.0))),
              //             child: const Center(
              //                 child: RestInvestTitle(
              //               text: "Fund",
              //               textColor: AppColor.black,
              //             )),
              //           ),
              //           Expanded(
              //               child: InkWell(
              //             onTap: () {
              //               _.displayDialog(context, _);
              //             },
              //             child: Container(
              //               height: 35,
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.end,
              //                 children: const [
              //                   Icon(
              //                     Icons.keyboard_arrow_down,
              //                     color: AppColor.dimblack,
              //                   )
              //                 ],
              //               ),
              //               decoration: BoxDecoration(
              //                 border:
              //                     Border.all(width: 1, color: AppColor.greyColor),
              //               ),
              //             ),
              //           ))
              //         ],
              //       ),
              //       const SizedBox(
              //         height: 15,
              //       ),
              //       Row(
              //         children: [
              //           Container(
              //             height: 35,
              //             width: 40,
              //             decoration: BoxDecoration(
              //                 border:
              //                     Border.all(width: 1, color: AppColor.greyColor),
              //                 borderRadius: const BorderRadius.only(
              //                     topLeft: Radius.circular(4.0),
              //                     bottomLeft: Radius.circular(4.0))),
              //             child: IconButton(
              //               icon: const Calender(
              //                 color: AppColor.greyColor,
              //                 height: 80,
              //                 width: 80,
              //               ),
              //               onPressed: () {
              //                 _.selectDate(context, 0);
              //               },
              //             ),
              //           ),
              //           Expanded(
              //             child: Container(
              //               height: 35,
              //               decoration: BoxDecoration(
              //                   border: Border.all(
              //                       width: 1, color: AppColor.greyColor)),
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 children: <Widget>[
              //                   Text(
              //                       "${_.selectedDate.day}/${_.selectedDate.month}/${_.selectedDate.year}")
              //                 ],
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //       const SizedBox(
              //         height: 15,
              //       ),
              //       Row(
              //         children: [
              //           Container(
              //             height: 35,
              //             width: 40,
              //             decoration: BoxDecoration(
              //                 border:
              //                     Border.all(width: 1, color: AppColor.greyColor),
              //                 borderRadius: const BorderRadius.only(
              //                     topLeft: Radius.circular(4.0),
              //                     bottomLeft: Radius.circular(4.0))),
              //             child: IconButton(
              //               icon: const Calender(
              //                 color: AppColor.greyColor,
              //                 height: 30,
              //                 width: 30,
              //               ),
              //               onPressed: () {
              //                 _.selectDate(context, 1);
              //               },
              //             ),
              //           ),
              //           Expanded(
              //             child: Container(
              //               height: 35,
              //               decoration: BoxDecoration(
              //                   border: Border.all(
              //                       width: 1, color: AppColor.greyColor)),
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 children: <Widget>[
              //                   Text(
              //                       "${_.endDate.day}/${_.endDate.month}/${_.endDate.year}")
              //                 ],
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              );
        });
  }
}
