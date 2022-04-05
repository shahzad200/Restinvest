
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controller/tax_calculator_screen_controller.dart';
import '../utils/colors.dart';
import '../utils/lists.dart';
import '../widgets/button.dart';
import '../widgets/custom_divider.dart';
import '../widgets/textformfiled.dart';

import '../widgets/constant_widget.dart';

class TaxCalculatorScreen extends StatelessWidget {
  const TaxCalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaxCalculatorScreenController>(
        init: TaxCalculatorScreenController(),
        builder: (_) {
          var space = const SizedBox(
            height: 10,
          );
          return SafeArea(
              child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: AppColor.whiteColor,
              title: Padding(
                padding:  EdgeInsets.only(right: Get.width/6),
                child: Logo(
                  height: 55,
                  width: 55,
                ),
              ),
              elevation: 0,
            ),
            key: _.scaffoldKey,
            body: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: [
                  space,
                  Container(
                    // height: Get.height,
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 1, color: AppColor.blueColor)),
                    child: Column(children: [
                       CustomTextContainer(fontSize: 14,
                        height: 45,
                        text: "TAX SAVING CALCULATOR",
                        textAlign: TextAlign.center,
                      ),
                      space,
                      SingleChildScrollView(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const RestInvestTitle(
                                        text: "CATEGORY:",
                                        fontSize: 12,
                                        textColor: AppColor.black,
                                        fontWeight: FontWeight.w900,
                                      ),
                                      Container(
                                        // margin: EdgeInsets.all(10.0),
                                        padding: const EdgeInsets.only(
                                            left: 10.0, right: 5.0),
                                        height: 35,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: AppColor.whiteColor,
                                            border: Border.all(
                                                width: 1,
                                                color: AppColor.blueColor)),
                                        child: Center(
                                          child: DropdownButton(
                                            isExpanded: true,
                                            underline: Container(
                                              color: AppColor.whiteColor,
                                            ),

                                            borderRadius:
                                                BorderRadius.circular(6),
                                            // value: _.dropdownvalue,
                                            hint: RestInvestTitle(
                                              text: _.categoryValue == null ||
                                                      _.categoryValue == ""
                                                  ? "Select"
                                                  : _.categoryValue,
                                              textColor: AppColor.black,
                                            ),
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down,
                                                color: AppColor.blueColor,
                                                size: 35),
                                            items: catergoryItems
                                                .map((String? catergoryItems) {
                                              return DropdownMenuItem<String>(
                                                  value: catergoryItems,
                                                  child: Text(catergoryItems!));
                                            }).toList(),
                                            onChanged: (String? value) {
                                              _.categoryValue = value!;
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const RestInvestTitle(
                                        text: 'ANNUAL INCOME:',
                                        textColor: AppColor.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w900,
                                      ),
                                      Form(
                                        key: _.formKey,
                                        child: CustomTextFormField(
                                          validations: (value) {
                                            print('hgfhfhfghfghfgh' +
                                                value.toString());
                                            if (value.isNotEmpty) {
                                              return null;
                                            } else {
                                              return 'Please Fill';
                                            }
                                          },
                                          controller: _.textEditingController,
                                          color: AppColor.blueColor,
                                          textInputType: TextInputType.number,
                                          isRounded: true,
                                          hint: "0.0",
                                          //  textInputType: TextInputType.emailAddress,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Center(
                              child: CustomRoundButton(isRound: false,
                                text: "CALCULATE",
                                textSize: 12,
                                onPress: () {
                                  // _.displayDialog(context, _);
                                  _.onCalculate();
                                },
                                height: 30,
                                width: Get.width / 1.9,
                              ),
                            ),
                            space,
                            Row(
                              children: [
                                // Expanded(
                                //     child: DropDownContainerIcon(
                                //   text: "Tax (%)",
                                //   color: AppColor.blueColor,
                                //   fontWeight: FontWeight.w900,
                                //   voidcallback: () {},
                                //   text1: "${_.tax}",
                                //   fontsize: 12,
                                //   textColor: AppColor.black,
                                // )),
                                Expanded(
                                    child: EmptyRowContainer(
                                      color: AppColor.blueColor,
                                      hintColor: AppColor.black,
                                      fontWeight: FontWeight.w900,
                                      fontsize: 12,
                                      hint: "${_.tax ??0.0}",
                                      text:  "Tax (%)",
                                      textColor: AppColor.black,
                                    )),
                                const SizedBox(
                                  width: 6,
                                ),
                                Expanded(
                                    child: EmptyRowContainer(
                                  color: AppColor.blueColor,
                                  hintColor: AppColor.black,
                                  fontWeight: FontWeight.w900,
                                  fontsize: 12,
                                  hint: "${_.f.format(_.income ??0)}",
                                  text: "INCOME TAX AMOUNT:",
                                  textColor: AppColor.black,
                                ))
                              ],
                            ),
                            space,
                            // space,
                            Row(
                              children: const [
                                Expanded(
                                  child:
                                  RestInvestTitle(
                                    text: "TAX CREDIT IN MUTUAL FUND ",
                                    textColor: AppColor.blueColor,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                  ),
                                ),
                                Expanded(
                                  child: RestInvestTitle(
                                  // text: "(SECTION 62 OF ITO)",
                                  text: "(SECTION 62 OF ITO*)",
                                  fontSize: 12,
                                  textColor: AppColor.blueColor,
                                  fontWeight: FontWeight.w900,
                                ),
                            ),
                              ],
                            ),
                            const CustomDivider(color: AppColor.blueColor),
                            space,
                            // space,
                            CustomCreditContainer(
                              text1: "${_.f.format(_.mutual ??0)}",
                              investtext: "INVESTMENT IN MUTUAL FUND:",
                              credittext: "TAX CREDIT IN MUTUAL FUND:",
                              text2: "${_.f.format(_.creditMutual ?? 0) }",
                            ),
                            space,
                            // space,
                            Row(
                              children: const [
                                Expanded(
                                  child: RestInvestTitle(
                                    text: "TAX CREDIT IN PENSION FUND",
                                    textColor: AppColor.blueColor,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                  ),
                                ),
                                Expanded(
                                  child:
                                RestInvestTitle(
                                  // text: "(SECTION 63 OF ITO)",
                                  text: "(SECTION 63 OF ITO**)",
                                  fontSize: 12,
                                  textColor: AppColor.blueColor,
                                  fontWeight: FontWeight.w900,
                                ),
                            )
                              ],
                            ),
                            const CustomDivider(color: AppColor.blueColor),
                            space,
                            // space,
                            CustomCreditContainer(
                              text1: "${_.f.format(_.pension ??0)}",
                              investtext: "INVESTMENT IN PENSION FUND:",
                              credittext: "TAX CREDIT IN PENSION FUND:",
                              text2: "${_.f.format(_.creditPension ??0)}",
                            ),
                            space,
                            Container(
                              height: 45,
                              color: AppColor.blueColor,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RestInvestTitle(
                                    text: "TOTAL TAX CREDIT:Rs ${_.f.format(_.taxCredit ?? 0)}",
                                    textColor: AppColor.whiteColor,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ],
                              ),
                            ),
                            space,
                            // space,
                            // const RestInvestTitle(
                            //   text: "DISCLAIMER:",
                            //   textColor: AppColor.black,
                            //   fontWeight: FontWeight.w900,
                            //   fontSize: 12,
                            // ),
                            // space,
                            Row(
                              children: const [
                                Expanded(
                                  child:  RestInvestTitle(
                                    text:
                                        "* As per section 62 of Income Tax Ordinance,2001,an indiviual investor of open end mutual fund account can claim tax credit on investment up to Rs. 2,000,000/- or 20% of individual's taxable income whichever is lower.",
                                    textColor: AppColor.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                            space,
                            Row(
                              children: const [

                                 Expanded(
                                   child: RestInvestTitle(
                                    text:
                                        "** As per section 63 of Income Tax Ordinance,2001,an eligible person joining Vountary Pension Scheme can avail tax credit up to 20% of (eligible) person's taxable income for the relevant tax year. ",
                                    textColor: AppColor.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 10,
                                ),
                                 ),
                              ],
                            ),
                            space
                          ],
                        ),
                      ),
                    ]),
                  )
                ],
              ),
            ),
          ));
        });
  }
}
