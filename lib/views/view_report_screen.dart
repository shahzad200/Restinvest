import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:investintrust/controller/view_report_screen_controller.dart';
import 'package:investintrust/utils/lists.dart';
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
                              child: DateFormFieldContainer(
                                isRounded: false,
                              ),
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
                              child: DateFormFieldContainer(
                                isRounded: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const RestInvestTitle(
                              text: "Account No.",
                              textColor: AppColor.blueColor,
                            ),
                            Container(
                              // margin: EdgeInsets.all(10.0),
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 5.0),
                              height: 35,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: AppColor.whiteColor,
                                  border: Border.all(
                                      width: 1, color: AppColor.dimblack)),
                              child: Center(
                                child: DropdownButton(
                                  isExpanded: true,
                                  underline: Container(
                                    color: AppColor.whiteColor,
                                  ),

                                  borderRadius: BorderRadius.circular(6),
                                  // value: _.dropdownvalue,
                                  hint: RestInvestTitle(
                                    text: _.amountvalue == null ||
                                            _.amountvalue == ""
                                        ? "81656"
                                        : _.amountvalue,
                                    textColor: AppColor.black,
                                  ),
                                  icon: const Icon(Icons.keyboard_arrow_down,
                                      color: AppColor.blueColor, size: 35),
                                  items: fromAccountItems
                                      .map((String? fromAccountItems) {
                                    return DropdownMenuItem<String>(
                                        value: fromAccountItems,
                                        child: Text(fromAccountItems!));
                                  }).toList(),
                                  onChanged: (String? value) {
                                    _.amountvalue = value!;
                                    _.update();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                          child: DropDownContainerIcon(
                        fontsize: 14,
                        fontWeight: FontWeight.bold,
                        voidcallback: () {},
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
