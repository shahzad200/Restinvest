import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investintrust/utils/lists.dart';

import '../controller/redemption_screen_controller.dart';

import '../utils/colors.dart';
import '../widgets/button.dart';
import '../widgets/constant_widget.dart';

import '../widgets/drawer.dart';
import '../widgets/textformfiled.dart';

class RedemptionScreen extends StatelessWidget {
  const RedemptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RedemptionScreenController>(
        init: RedemptionScreenController(),
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
                          children: [
                            const RestInvestTitle(
                              // fontWeight: FontWeight.w900,
                              text: "Account No.",
                              textColor: AppColor.dimblack,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const RestInvestTitle(
                              text: "Fund Name",
                              // fontWeight: FontWeight.w900,
                              textColor: AppColor.dimblack,
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
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  underline: Container(
                                    color: AppColor.whiteColor,
                                  ),

                                  borderRadius: BorderRadius.circular(6),
                                  // value: _.dropdownvalue,
                                  hint: RestInvestTitle(
                                    text: _.dropdownvalue == null ||
                                            _.dropdownvalue == ""
                                        ? "NITIEF"
                                        : _.dropdownvalue,
                                    textColor: AppColor.black,
                                  ),
                                  icon: const Icon(Icons.keyboard_arrow_down,
                                      color: AppColor.blueColor, size: 35),
                                  items: fundNameListItems
                                      .map((String? fundNameListItems) {
                                    return DropdownMenuItem<String>(
                                        value: fundNameListItems,
                                        child: Text(fundNameListItems!));
                                  }).toList(),
                                  onChanged: (String? value) {
                                    _.dropdownvalue = value!;
                                    _.update();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Expanded(
                      //     child: DropDownContainerIcon(
                      //   voidcallback: () {
                      //     _.displayDialog(
                      //         context,
                      //         const DropDownAccountValueButton(
                      //           accountText: "Account No.",
                      //           hintText: "81656",
                      //           titleText: "69558",
                      //         ));
                      //   },
                      //   text: "Account No.",
                      //   textColor: AppColor.dimblack,
                      // )),
                      // const SizedBox(
                      //   width: 6,
                      // ),
                      // Expanded(
                      //     child: DropDownContainerIcon(
                      //   voidcallback: () {
                      //     _.displayDialog(
                      //         context,
                      //         const FromFundDropDownContainer(
                      //           fundText: "Fund Name",
                      //           nitText: "NITIEF",
                      //         ));
                      //   },
                      //   text: "Fund Name",
                      //   textColor: AppColor.dimblack,
                      // ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Expanded(
                          child: EmptyRowContainer(
                        // fontWeight: FontWeight.w900,
                        fontsize: 14,
                        hintColor: AppColor.dimblack,
                        hint: "0",
                        text: "Electric Units",
                        textColor: AppColor.dimblack,
                      )),
                      SizedBox(
                        width: 6,
                      ),
                      Expanded(
                          child: EmptyRowContainer(
                        // fontWeight: FontWeight.w900,
                        fontsize: 14,
                        hintColor: AppColor.dimblack,
                        hint: "0.00",
                        text: "Amount",
                        textColor: AppColor.dimblack,
                      )),
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
                      const SizedBox(),
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
                          hint: "Unit Balance",
                          textInputType: TextInputType.emailAddress,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                          child: SizedBox(
                        height: 35,
                        child: RoundContainer(
                          text: "Approx. Amount",
                          textColor: AppColor.dimblack,
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
                    child: RestInvestButton(isSquare:true,

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

class FromFundDropDownContainer extends StatefulWidget {
  const FromFundDropDownContainer({
    required this.nitText,
    required this.fundText,
    Key? key,
  }) : super(key: key);
  final String? nitText;
  final String? fundText;

  @override
  State<FromFundDropDownContainer> createState() =>
      _FromFundDropDownContainerState();
}

class _FromFundDropDownContainerState extends State<FromFundDropDownContainer> {
  String fundTitle = "";
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      RestInvestTitle(
        text: widget.fundText!,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      const SizedBox(
        height: 30,
      ),
      InkWell(
        onTap: () {
          setState(() {
            fundTitle = widget.nitText!;
            Navigator.pop(context);
          });
        },
        child: RestInvestTitle(
          text: widget.nitText!,
          fontSize: 18,
        ),
      ),
    ]);
  }
}
