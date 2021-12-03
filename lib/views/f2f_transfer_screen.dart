import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/f2f_transfer_screen_controller.dart';
import '/controller/f2f_transfer_screen_controller.dart';

import '../utils/colors.dart';
import '../widgets/button.dart';
import '../widgets/constant_widget.dart';

import '../widgets/drawer.dart';
import '../widgets/textformfiled.dart';

class F2FTransferScreen extends StatelessWidget {
  const F2FTransferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<F2FTransferScreenController>(
        init: F2FTransferScreenController(),
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
                    children: const [
                      Expanded(
                          child: DropDownContainerIcon(
                        textColor: AppColor.dimblack,
                        text: "From Account",
                      )),
                      SizedBox(
                        width: 6,
                      ),
                      Expanded(
                          child: DropDownContainerIcon(
                        textColor: AppColor.dimblack,
                        text: "Transfer From Fund",
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Expanded(
                          child: EmptyRowContainer(
                        text: "From Fund Electronic Units",
                        textColor: AppColor.dimblack,
                      )),
                      SizedBox(
                        width: 6,
                      ),
                      Expanded(
                          child: EmptyRowContainer(
                        text: "From Fund Amount (Rs.)",
                        textColor: AppColor.dimblack,
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Expanded(
                          child: DropDownContainerIcon(
                        textColor: AppColor.dimblack,
                        text: "To Account",
                      )),
                      SizedBox(
                        width: 6,
                      ),
                      Expanded(
                          child: DropDownContainerIcon(
                        textColor: AppColor.dimblack,
                        text: "Transfer to Fund",
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: CustomRowButton(
                              text: "Units",
                              textColor: AppColor.black,
                              textSize: 14,
                              onPress: () {
                                _.investTrust(0);
                              },
                              buttonColor: _.investButton
                                  ? AppColor.blueColor
                                  : AppColor.whiteColor)),
                      Expanded(
                          child: CustomRowButton(
                        text: "Percentages",
                        textColor: AppColor.black,
                        textSize: 14,
                        onPress: () {
                          _.investTrust(1);
                        },
                        buttonColor: _.portfolioButton
                            ? AppColor.blueColor
                            : AppColor.whiteColor,
                      )),
                      Expanded(
                          child: CustomRowButton(
                        text: "All Units",
                        textColor: AppColor.black,
                        textSize: 14,
                        onPress: () {
                          _.investTrust(2);
                        },
                        buttonColor: _.buttonclick3
                            ? AppColor.blueColor
                            : AppColor.whiteColor,
                      )),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          isRounded: true,
                          hint: "Unit Balance",
                          textInputType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                          child: SizedBox(
                        height: 35,
                        child: RoundContainer(
                          isSquare: true,
                          voidcallback: () {},
                        ),
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 35,
                          child: CustomTextFormField(
                            isRounded: true,
                            hint: "Pin Code",
                            textInputType: TextInputType.emailAddress,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                          child: SizedBox(
                        height: 35,
                        child: RestInvestButton(
                          isSquare: true,
                          onPress: () {},
                          text: "Generate Financial PIN",
                          buttonColor: AppColor.blueColor,
                          textColor: AppColor.whiteColor,
                          textSize: 16,
                        ),
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ContainerCheckBoxText(
                    isChecked: false,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 40,
                    child: RestInvestButton(
                      isSquare: true,
                      text: "Submit",
                      onPress: () {},
                      buttonColor: AppColor.blueColor,
                      textColor: AppColor.whiteColor,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
