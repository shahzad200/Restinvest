import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/lists.dart';

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
                              textColor: AppColor.black,
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
                                      width: 1, color: AppColor.black)),
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
                              textColor: AppColor.black,
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
                                      width: 1, color: AppColor.black)),
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
                        hintColor: AppColor.black,
                        hint: "0",
                        text: "Electric Units",
                        textColor: AppColor.black,
                      )),
                      SizedBox(
                        width: 6,
                      ),
                      Expanded(
                          child: EmptyRowContainer(
                        // fontWeight: FontWeight.w900,
                        fontsize: 14,
                        hintColor: AppColor.black,
                        hint: "0.00",
                        text: "Amount",
                        textColor: AppColor.black,
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
                              textColor:
                              _.unitButton
                                  ? AppColor.whiteColor
                                  : AppColor.black,
                              textSize: 14,
                              onPress: () {
                                _.investTrust(0);
                              },
                              buttonColor:
                              _.unitButton
                                  ? AppColor.blueColor
                                  : AppColor.whiteColor)),
                      Expanded(
                          child: CustomRowButton(
                        text: "Percentages",
                        textColor: _.percentageButton
                            ? AppColor.whiteColor
                            : AppColor.black,
                        textSize: 14,
                        onPress: () {
                          _.investTrust(1);
                        },
                        buttonColor: _.percentageButton
                            ? AppColor.blueColor
                            : AppColor.whiteColor,
                      )),
                      Expanded(
                          child: CustomRowButton(
                        text: "All Units",
                        textColor: _.allUnitButton
                            ? AppColor.whiteColor
                            : AppColor.black,
                        textSize: 14,
                        onPress: () {
                          _.investTrust(2);
                        },
                        buttonColor: _.allUnitButton
                            ? AppColor.blueColor
                            : AppColor.whiteColor,
                      )),
                      const SizedBox(),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _.unitButton?Column(children: [ Row(
                   children: [
                     Expanded(
                       child: CustomTextFormField(
                         isRounded: true,
                         hint: "Unit Balance",hintColor: AppColor.black,
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
                             textColor: AppColor.black,
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
                             hint: "Pin Code",hintColor: AppColor.black,
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
                   ),],):SizedBox(),
                  _.percentageButton?Column(children: [ Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          isRounded: true,
                          hint: "Percentage",hintColor: AppColor.black,
                          textInputType: TextInputType.numberWithOptions(),
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
                              textColor: AppColor.black,
                              isSquare: true,
                              voidcallback: () {},
                            ),
                          ))
                    ],
                  ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 35,
                      child: RoundContainer(
                        text: "Approx.Units",
                        textColor: AppColor.blueColor,
                        isSquare: true,
                        voidcallback: () {},
                      ),
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
                              hint: "Pin Code",hintColor: AppColor.black,
                              textInputType: TextInputType.numberWithOptions(),
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
                    ),],):SizedBox(),
                  _.allUnitButton?Column(children: [ Row(
                    children: [
                      Expanded(
                          child: SizedBox(
                            height: 35,
                            child: RoundContainer(
                              text: "0",
                              textColor: AppColor.black,
                              isSquare: true,
                              voidcallback: () {},
                            ),
                          )),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                          child: SizedBox(
                            height: 35,
                            child: RoundContainer(
                              text: "0.00",
                              textColor: AppColor.black,
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
                              hint: "Pin Code",hintColor: AppColor.black,
                              textInputType: TextInputType.numberWithOptions(),
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
                    ),],):SizedBox(),
                  const SizedBox(
                    height: 10,
                  ),
                  CheckBoxContainer(isChecked: false,),
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
