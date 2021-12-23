import 'package:flutter/material.dart';


class DialogBox extends StatelessWidget {
  const DialogBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      actions: [Row(children: [
        CircularProgressIndicator(),Text("Please Wait......"),
      ],)],
    );
  }
}
