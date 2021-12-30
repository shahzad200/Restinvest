import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investintrust/widgets/constant_widget.dart';

void showDialog(context, String accountNum, String fundName,
    String data,String selectedTab) {
  showGeneralDialog(
    barrierLabel: "Barrier",
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 700),
    context: context,
    pageBuilder: (_, __, ___) {
      return Align(
        alignment: Alignment.center,
        child: Container(
          height: 300,
          child: AlertDialog(
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RestInvestTitle(
                  text: "Confirmation",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: 5,
                ),
                RestInvestTitle(
                  text: "Are you sure you want to submit this transaction?",
                  fontSize: 14,
                ),
                SizedBox(
                  height: 15,
                ),
                Table(
                    border: TableBorder
                        .all(), // Allows to add a border decoration around your table
                    children: [
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RestInvestTitle(
                                text: "Account No.",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              RestInvestTitle(
                                text: "$accountNum",
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
                                text: "Fund Name",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              RestInvestTitle(
                                text: "$fundName",
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
                                text: "$data "+selectedTab == "Percentage"?"%":"",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ]),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [InkWell(
                  child: RestInvestTitle(
                    text: "No",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),SizedBox(width: 30,), InkWell(
                  child: RestInvestTitle(
                    text: "Yes",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),],)
              ],
            ),
          ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      return SlideTransition(
        position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
        child: child,
      );
    },
  );
}
