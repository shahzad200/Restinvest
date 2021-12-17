import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:investintrust/data/models/new_user_reg_data.dart';
import 'package:investintrust/data/repository.dart';

class UserrScreenController extends GetxController {
  var formKey = GlobalKey<FormState>();
  String titlevalue = "";
  String bracketvalue = "";
  String incomevalue = "";
  String occupationvalue = "";
  final _repository = Repository();
  bool isLoading = false;
  bool noInternet = false;
  late NewUserRegData newUserRegData;
  @override
  void onInit() {
    onNewUserRegData();
    // TODO: implement onInit
    super.onInit();
  }

  onNewUserRegData() async {
    try{
      isLoading = true;
      newUserRegData = await _repository.onNewUserRegData();
      isLoading = false;
      update();
    }catch (e){
      if(e.toString() == 'Exception: No Internet'){
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
