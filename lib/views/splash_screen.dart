
 import 'package:flutter/material.dart';
import '../controller/splash_controller.dart';
import 'package:get/get.dart';


 class SplashScreen extends StatelessWidget {
   const SplashScreen({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {

     return GetBuilder<SplashScreenController> (
         init: SplashScreenController(),
         builder: (_) {
       return SafeArea(
       child: Scaffold(
       body: Container(),
       ) );



     });
   }

 }
