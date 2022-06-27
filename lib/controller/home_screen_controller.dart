
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nit/widgets/constant_widget.dart';
import 'package:path/path.dart';

import '../data/repository.dart';
import '../utils/constants.dart';

import 'package:url_launcher/url_launcher.dart';

class HomeScreenController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final _repository = Repository();
  bool isLoading = false;

  bool noInternet = false;
  // https://nit.com.pk/NewNit/Complains.aspx
  // https://nit.com.pk/NewNit/ConsolidatedFMRW.aspx
  @override
  void onInit() async {
    if(Constant.socialMediaLink == null) {
      getSocialLinks();
    }
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

  Future<void> _makePhoneCall(String phoneNumber) async {
    // Use `Uri` to ensure that `phoneNumber` is properly URL-encoded.
    // Just using 'tel:$phoneNumber' would create invalid URLs in some cases,
    // such as spaces in the input, which would cause `launch` to fail on some
    // platforms.
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());
  }


  getSocialLinks() async {
    try {
      isLoading = true;
      update();
      Constant.socialMediaLink = await _repository.socialMediaLinks();
      isLoading = false;
      if(noInternet) {
        noInternet = false;
      }
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
        // customDialogPinn(context,e.toString().replaceAll('Exception:', ''));
        Fluttertoast.showToast(
            msg: e.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }
}
