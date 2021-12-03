import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investintrust/utils/colors.dart';
import 'package:investintrust/widgets/constant_widget.dart';

class NavScreenController extends GetxController {
  var formKey = GlobalKey<FormState>();
  String? formatted;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool ischeck = false;

  DateTime selectedDate = DateTime.now();
  DateTime endDate = DateTime.now();
  selectDate(BuildContext context, value) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (value == 0) {
      if (selected != null && selected != selectedDate) {
        selectedDate = selected;
        update();
      }
    } else {
      if (selected != null && selected != endDate) {
        endDate = selected;
        update();
      }
    }
  }

  displayDialog(BuildContext context, controller) async {
    int _value = 1;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              Column(
                children: <Widget>[
                  for (int i = 1; i <= 10; i++)
                    ListTile(
                      title: Text(
                        'Radio $i',
                        style: TextStyle(),
                      ),
                      leading: Radio(
                        value: i,
                        groupValue: _value,
                        onChanged: i == 10
                            ? null
                            : (int? data) {
                                _value = data!;
                                update();
                              },
                      ),
                    ),
                ],
              ),
              // ListTile(
              //   onTap: () {
              //     controller.text();
              //     controller.update();
              //   },
              //   leading: const RestInvestTitle(
              //     text: "Please Selected",
              //   ),
              //   trailing: Radio(value: 1, groupValue: 1, onChanged: (int) {}),
              // ),
              // ListTile(
              //   leading: const RestInvestTitle(
              //     text: "Please Selected",
              //   ),
              //   trailing: Radio(value: 1, groupValue: 0, onChanged: (val) {}),
              // ),
              // ListTile(
              //   leading: const RestInvestTitle(
              //     text: "Please Selected",
              //   ),
              //   trailing: Radio(value: 0, groupValue: 1, onChanged: (int) {}),
              // ),
              // ListTile(
              //   leading: const RestInvestTitle(
              //     text: "Please Selected",
              //   ),
              //   trailing: Radio(value: 0, groupValue: 1, onChanged: (int) {}),
              // ),
              // ListTile(
              //   leading: const RestInvestTitle(
              //     text: "Please Selected",
              //   ),
              //   trailing: Radio(value: 0, groupValue: 1, onChanged: (int) {}),
              // ),
              // ListTile(
              //   leading: const RestInvestTitle(
              //     text: "Please Selected",
              //   ),
              //   trailing: Radio(value: 0, groupValue: 1, onChanged: (int) {}),
              // ),
              // ListTile(
              //   leading: const RestInvestTitle(
              //     text: "Please Selected",
              //   ),
              //   trailing: Radio(value: 0, groupValue: 1, onChanged: (int) {}),
              // ),
              // ListTile(
              //   leading: const RestInvestTitle(
              //     text: "Please Selected",
              //   ),
              //   trailing: Radio(value: 0, groupValue: 1, onChanged: (int) {}),
              // ),
              // ListTile(
              //   leading: const RestInvestTitle(
              //     text: "Please Selected",
              //   ),
              //   trailing: Radio(value: 0, groupValue: 1, onChanged: (int) {}),
              // ),
              // ListTile(
              //   leading: const RestInvestTitle(
              //     text: "Please Selected",
              //   ),
              //   trailing: Radio(value: 0, groupValue: 1, onChanged: (int) {}),
              // )
            ],
          );
        });
  }
}

enum SingingCharacter { lafayette, jefferson }
