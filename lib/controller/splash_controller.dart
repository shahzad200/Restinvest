import 'package:get/get.dart';
import '../routes/routes.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAndToNamed(AppRoute.homeRoute);
    });
    super.onInit();
  }
}
