import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:investintrust/data/models/social_media_links.dart';
import 'package:investintrust/data/repository.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreenController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final _repository = Repository();
  bool isLoading = false;
  bool noInternet = false;
  late SocialMediaLink socialMediaLink;
  // Exception ex = Exception([message]);

  @override
  void onInit() async {
    await _repository.onLoadDailyNavPrices();
    // getSocialLinks();
    super.onInit();
  }

  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print(' could not launch $command');
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

  }


  getSocialLinks() async {
    try{
      isLoading = true;
      socialMediaLink = await _repository.socialMediaLinks();
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




}
