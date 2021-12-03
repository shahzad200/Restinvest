import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:investintrust/controller/view_report_screen_controller.dart';
import 'package:investintrust/widgets/constant_widget.dart';
import 'package:investintrust/widgets/datefield.dart';

import '../utils/colors.dart';

import '../widgets/drawer.dart';

class ViewReportsScreen extends StatelessWidget {
  const ViewReportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewReportsScreenController>(
        init: ViewReportsScreenController(),
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
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            RestInvestTitle(
                                text: 'Start Date.', textColor: AppColor.black),
                            SizedBox(
                              height: 35,
                              child: DateFormFieldContainer(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            RestInvestTitle(
                                text: 'End Date.', textColor: AppColor.black),
                            SizedBox(
                              height: 35,
                              child: DateFormFieldContainer(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Expanded(
                          child: DropDownContainerIcon(
                        text: "Account No.",
                        textColor: AppColor.black,
                      )),
                      SizedBox(
                        width: 6,
                      ),
                      Expanded(
                          child: DropDownContainerIcon(
                        text: "Fund Name.",
                        textColor: AppColor.black,
                      ))
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
