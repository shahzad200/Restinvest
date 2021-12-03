import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserrScreenController extends GetxController {
  var formKey = GlobalKey<FormState>();
  displayDialog(BuildContext context, list) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: DialogListView(
              options: list,
            ),
          );
        });
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class DialogListView extends StatelessWidget {
  const DialogListView({
    Key? key,
    required this.options,
  }) : super(key: key);
  final List<String> options;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: options
          .map(
            (option) => InkWell(
              onTap: () {},
              child: Text(
                option,
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          )
          .toList(),
    );
  }
}
