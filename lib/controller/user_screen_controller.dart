import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserScreenController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var userName = "".obs;
  var password = "".obs;
  var number = "".obs;
  var email = "".obs;

  TextEditingController userNameController = TextEditingController();

  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  String titlevalue = "";
  String bracketvalue = "";
  String incomevalue = "";
  String occupationvalue = "";
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void updateUserName(value) {
    userName(value);
    update();
  }

  void updatePassword(value) {
    password(value);
    update();
  }

  void updateEmail(value) {
    email(value);
    update();
  }

  void updateNumber(value) {
    number(value);
    update();
  }

  displayDialog(BuildContext context, list) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: CircularProgressIndicator(
              color: Colors.red,
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
