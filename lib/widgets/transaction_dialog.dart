import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investintrust/widgets/constant_widget.dart';

void showDialog(
    context,
    String accountNum,
    String toAccountNum,
    String fromFundName,
    String toFundName,
    String fundName,
    String data,
    String selectedTab,
    String requestType
    ) {
  print('KJHHGJH'+data);
  showGeneralDialog(
    barrierLabel: "Barrier",
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 700),
    context: context,
    pageBuilder: (_, __, ___) {
      return Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: requestType == 'FTF' ? 350 : 300,
          child: AlertDialog(
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const RestInvestTitle(
                  text: "Confirmation",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(
                  height: 5,
                ),
                const RestInvestTitle(
                  text: "Are you sure you want to submit this transaction?",
                  fontSize: 14,
                ),
                const SizedBox(
                  height: 15,
                ),
                requestType == 'FTF' ?
                Table(border: TableBorder.all(),
                    // Allows to add a border decoration around your table
                    children: [
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const RestInvestTitle(
                                text: "Account No.",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              RestInvestTitle(
                                text: accountNum,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const RestInvestTitle(
                                text: "From Account",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              RestInvestTitle(
                                text: toAccountNum,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const RestInvestTitle(
                                text: "From Fund",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              RestInvestTitle(
                                text: fromFundName,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const RestInvestTitle(
                                text: "To Fund",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              RestInvestTitle(
                                text: toFundName,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RestInvestTitle(
                                text: "Selected $selectedTab",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              RestInvestTitle(
                                text: selectedTab == "Percentage"
                                    ? data + "%"
                                    : data + "",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ])
                    :
                Table(border: TableBorder.all(),
                    // Allows to add a border decoration around your table
                    children: [
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const RestInvestTitle(
                                text: "Account No.",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              RestInvestTitle(
                                text: accountNum,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const RestInvestTitle(
                                text: "Fund Name",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              RestInvestTitle(
                                text: fundName,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RestInvestTitle(
                                text: "Selected $selectedTab",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              RestInvestTitle(
                                text: "$data " + selectedTab == "Percentage"
                                    ? "%"
                                    : "",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ]),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const RestInvestTitle(
                        text: "No",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    InkWell(
                      onTap: () {},
                      child: const RestInvestTitle(
                        text: "Yes",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      return SlideTransition(
        position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0)).animate(anim),
        child: child,
      );
    },
  );
}
