import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';


class AccountOpenFatcaController extends GetxController{
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  // var userName = "".obs;
  // var password = "".obs;
  // var number = "".obs;
  // var email = "".obs;

  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  String cityValue2 = "";
  String tinNumber = "xzcxzc";
  bool isChecked=false;
  bool termsConditions=false;
  var charactor=0;
  TextEditingController titleController = TextEditingController();

  TextEditingController cnicController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  onSave (){
    if(titleController.text != null && titleController.text != ""){
      print("title");
      if(cnicController.text != null && cnicController.text != ""){
        print("cnic");
        if(countryValue != null && countryValue != ""){
          print("country value");
          if(stateValue != null && stateValue != ""){
            print("state");
            if(cityValue != null && cityValue != ""){
              print("city");
              if(termsConditions != null && termsConditions != false){
                print("terms conditions");
                if(cityValue2 != null && cityValue2 != ""){
                  print("city2");
                  if(tinNumber != null && tinNumber != ""){
                    print("tin number");
                    if(isChecked != null && isChecked != false){

                        print("success");
                    }else{
                      Fluttertoast.showToast(
                          msg: "Please check disclaimer",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  }else{
                    Fluttertoast.showToast(
                        msg: "Tin Number should not empty",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                }else{
                  Fluttertoast.showToast(
                      msg: "Select city",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
              }else{
                Fluttertoast.showToast(
                    msg: "Please check term & condition",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
            }else{
              Fluttertoast.showToast(
                  msg: "Select city",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          }else{
            Fluttertoast.showToast(
                msg: "Select state",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        }else{
          Fluttertoast.showToast(
              msg: "Select country",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      }else{
        Fluttertoast.showToast(
            msg: "Give cnic/nicop",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }else{
      Fluttertoast.showToast(
          msg: "Give account Title",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  // void updateUserName(value) {
  //   userName(value);
  //   update();
  // }
  //
  // void updatePassword(value) {
  //   password(value);
  //   update();
  // }
  // void updateEmail(value) {
  //   email(value);
  //   update();
  // }
  //
  // void updateNumber(value) {
  //   number(value);
  //   update();
  // }
}
