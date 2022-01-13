// import 'package:flutter/material.dart';
// import '../utils/colors.dart';
//
// import '../widgets/constant_widget.dart';
// import '../controller/splash_controller.dart';
// import 'package:get/get.dart';
//
// class SplashScreen extends StatelessWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//
//     return GetBuilder<SplashScreenController>(
//         init: SplashScreenController(),
//         builder: (_) {
//           return SafeArea(
//             child: Scaffold(
//               body: Container(
//                 width: width,
//                 height: height,
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(colors: [
//                     AppColor.whiteColor,
//                     AppColor.whiteColor,
//                   ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
//                 ),
//                 child: Center(
//                   child: Container(
//                       width: width / 2.5,
//                       child: const LogoNit(
//                         height: 120,
//                         width: 120,
//                       )),
//                 ),
//               ),
//             ),
//           );
//         });
//   }
// }
