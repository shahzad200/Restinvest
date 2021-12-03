import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investintrust/views/portfolio_screen.dart';
import '../widgets/datefield.dart';
import '../controller/purchases_screen_controller.dart';

import '../utils/colors.dart';
import '../widgets/button.dart';
import '../widgets/constant_widget.dart';

import '../widgets/drawer.dart';
import '../widgets/textformfiled.dart';

class PurchasesScreen extends StatelessWidget {
  const PurchasesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PurchasesScreenController>(
        init: PurchasesScreenController(),
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
                        textColor: AppColor.blueColor,
                        text: "Amount No.",
                      )),
                      SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: DropDownContainerIcon(
                          textColor: AppColor.blueColor,
                          text: 'Fund Name.',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Expanded(
                          child: EmptyRowContainer(
                        text: "Fund Bank Deposit",
                        textColor: AppColor.blueColor,
                      )),
                      SizedBox(
                        width: 6,
                      ),
                      Expanded(
                          child: EmptyRowContainer(
                        text: "Fund Account Deposit",
                        textColor: AppColor.blueColor,
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: DropDownContainerIcon(
                          textColor: AppColor.blueColor,
                          text: 'Payment Mode.',
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const RestInvestTitle(
                                text: 'Amount', textColor: AppColor.blueColor),
                            CustomTextFormField(
                              isRounded: true,
                              hint: "",
                              // textInputType: TextInputType.emailAddress,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const RestInvestTitle(
                                text: 'Bank Name',
                                textColor: AppColor.blueColor),
                            CustomTextFormField(
                              isRounded: true,
                              hint: "",
                              // textInputType: TextInputType.emailAddress,
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
                          children: [
                            const RestInvestTitle(
                                text: 'Bank Account No.',
                                textColor: AppColor.blueColor),
                            CustomTextFormField(
                              isRounded: true,
                              hint: "",
                              // textInputType: TextInputType.emailAddress,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const RestInvestTitle(
                                text: 'Check/Instrument No.',
                                textColor: AppColor.blueColor),
                            CustomTextFormField(
                              isRounded: true,
                              hint: "",
                              // textInputType: TextInputType.emailAddress,
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
                                text: 'Check/Instrument Date.',
                                textColor: AppColor.blueColor),
                            SizedBox(
                              height: 35,
                              child: DateFormFieldContainer(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          isRounded: true,
                          hint: "PIN CODE",
                          textInputType: TextInputType.number,
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
                  const SizedBox(height: 10),
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
