import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investintrust/controller/home_screen_controller.dart';
import 'package:investintrust/widgets/constant_widget.dart';

class NavScreenController extends GetxController {
  var formKey = GlobalKey<FormState>();
  String? formatted;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool ischeck = false;

  // final homeController = Get.find<HomeScreenController>();

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
    int value = 0;
    return showDialog(
        context: context,
        builder: (context) {
          return const SizedBox(
            height: 300,
            child: SingleChildScrollView(
              child: AlertDialog(actions: [
                NavDropDownContainer(
                  nitpfcsText: "NIT-PFCSF",
                  nitpfmsfText: "NIT-IPFESF",
                  selectText: " Please Select",
                  nitText: "NIT-IEF",
                  nitiifText: "NIT-IIF",
                  niutText: "NI(U)T",
                  nitgbfText: "NIT-GBF",
                  nitifText: "NIT-IF",
                  nitmmfText: "NIT-MMF",
                  nitsefText: "NIT-SEF",
                  nitemofText: "NIT-EMOF",
                  nitpfText: "NIT-PF",
                  nitipfText: "NIT-IPF",
                  nitpfsefText: "NIT-PFESF",
                  nitipfmsfText: "NIT-PFMMSF",
                  nitpfdsText: "NIT-PFDSF",
                  nitimmfText: "NIT-IPFMMSF",
                  nitipfdsfText: "NIT-IPFDSF",
                  nitaaafText: "NIT-AAF",
                  nitpgtText: "NIT-PGETF",
                  nitipfesText: "NIT-IMMF",
                )
              ]),
            ),
          );
        });
  }
}
