
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:investintrust/data/models/new_user_reg_data.dart';
import 'package:investintrust/data/repository.dart';
import 'package:investintrust/routes/routes.dart';

class UserScreenController extends GetxController {
  var formKey = GlobalKey<FormState>();

  var formKeyGenCode = GlobalKey<FormState>();
  var scaffoldKeyGenCode = GlobalKey<ScaffoldState>();


  var userName = "".obs;
  var password = "".obs;
  var number = "".obs;
  var email = "".obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController cNicController = TextEditingController();
  TextEditingController passPortController = TextEditingController();
  TextEditingController ntnController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  String titleValue = "";
  String bracketValue = "";
  String bracketCode = "";
  String incomeValue = "";
  String incomeCode = "";
  String occupationValue = "";
  String occupationCode = "";
  String issueDate = '';
  String expiryDate = '';
  final _repository = Repository();
  bool isLoading = false;
  bool noInternet = false;
   late NewUserRegData newUserRegData;

  @override
  void onInit() {
    onNewUserRegData();
    super.onInit();
  }



  onNewUserRegData() async {
    try {
      isLoading = true;
      newUserRegData = await _repository.onNewUserRegData();
      isLoading = false;
      update();
    } catch (e) {
      if (e.toString() == 'Exception: No Internet') {
        isLoading = false;
        noInternet = true;
        update();
      } else {
        isLoading = false;
        noInternet = false;
        update();
        Fluttertoast.showToast(
            msg: e.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }


  void goTONext(){
    // if (formKey.currentState!.validate()) {
    //   formKey.currentState!.save();
      if(titleValue == '' || titleValue == null){
        Fluttertoast.showToast(
            msg: 'Please Select Title',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if(issueDate == '' || issueDate == null){
        Fluttertoast.showToast(
            msg: 'Please Select CNIC Issue Date',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if(expiryDate == '' || expiryDate == null){
        Fluttertoast.showToast(
            msg: 'Please Select CNIC Expiry Date',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if(bracketValue == '' || bracketValue == null){
        Fluttertoast.showToast(
            msg: 'Please Select Source of Income',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if(occupationValue == '' || occupationValue == null){
        Fluttertoast.showToast(
            msg: 'Please Select Occupation',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if(incomeValue == '' || incomeValue == null){
        Fluttertoast.showToast(
            msg: 'Please Select Income Bracket',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }else {
        Get.toNamed(AppRoute.generateCode);
      }
    // }
  }


  String dateTime(DateTime date){
    return date.day.toString()+'/'+date.month.toString()+'/'+date.year.toString();
   //  int day = date.day;
   // return DateFormat("yyyy-MM-dd")
   //     .format(date);
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
          return const AlertDialog(
            content:  CircularProgressIndicator(
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
