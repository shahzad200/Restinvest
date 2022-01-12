import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investintrust/routes/routes.dart';
import 'package:investintrust/controller/account_opening_submit_button_screen_controller.dart';
import 'package:investintrust/views/account_opening_basic_information_screen.dart';
import 'package:investintrust/views/account_opening_document_upload_screen.dart';
import 'package:investintrust/views/account_opening_fatca_screen.dart';
import 'package:investintrust/views/account_opening_kyc_detail_screen.dart';
import 'package:investintrust/views/account_opening_preview_screen.dart';
import 'package:investintrust/views/account_opening_request_screen.dart';
import 'package:investintrust/views/account_opening_risk_profile_screen.dart';
import 'package:investintrust/views/account_opening_submit_button_screen.dart';
import '../views/account_opening_bank_detail_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        // home: const AccountOpenRiskProfileScreen(),
      getPages: AppRoute.navMain,
      initialRoute: AppRoute.splashRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      // getPages: [
      //   GetPage(
      //     name: AppRoute.splashRoute,
      //     page: () => const SplashScreen(),
      //   ),
      //   GetPage(
      //     name: AppRoute.loginRoute,
      //     page: () => const LoginScreen(),
      //   ),
      //   GetPage(
      //     name: AppRoute.passwordRoute,
      //     page: () => const PasswordScreen(),
      //   ),
      //   GetPage(
      //     name: AppRoute.registerRoute,
      //     page: () => const RegisterScreen(),
      //   ),
      //   GetPage(
      //     name: AppRoute.homeRoute,
      //     page: () => const HomeScreen(),
      //   ),
      //   GetPage(
      //     name: AppRoute.navRoute,
      //     page: () => const NavScreen(),
      //   ),
      //   GetPage(
      //     name: AppRoute.branchesRoute,
      //     page: () => const BranchesScreen(),
      //   ),
      //   GetPage(
      //     name: AppRoute.learningRoute,
      //     page: () => const LearningScreen(),
      //   ),
      //   GetPage(
      //     name: AppRoute.marketRoute,
      //     page: () => const MarketScreen(),
      //   ),
      //   GetPage(
      //     name: AppRoute.productRoute,
      //     page: () => const ProductScreen(),
      //   ),
      //   GetPage(
      //     name: AppRoute.fundRoute,
      //     page: () => const PicFundScreen(),
      //   ),
      //   GetPage(
      //     name: AppRoute.fundManagerRoute,
      //     page: () => const FundManagerScreen(),
      //   ),
      //   GetPage(
      //     name: AppRoute.userrRoute,
      //     page: () => const UserrScreen(),
      //   ),
      //   GetPage(
      //     name: AppRoute.redemptionRoute,
      //     page: () => const RedemptionScreen(),
      //   ),
      //   GetPage(
      //     name: AppRoute.portofolioRoute,
      //     page: () => const PortofolioScreen(),
      //   ),
      //   GetPage(
      //     name: AppRoute.purchasesRoute,
      //     page: () => const PurchasesScreen(),
      //   ),
      //   GetPage(
      //     name: AppRoute.f2ftransferRoute,
      //     page: () => const F2FTransferScreen(),
      //   ),
      //   GetPage(
      //     name: AppRoute.reportsRoute,
      //     page: () => const ReportsScreen(),
      //   ),
      //   GetPage(
      //     name: AppRoute.viewreportsRoute,
      //     page: () => const ViewReportsScreen(),
      //   ),
      //   GetPage(
      //     name: AppRoute.dailynavRoute,
      //     page: () => const DailyNavScreen(),
      //   ),
      //   GetPage(
      //     name: AppRoute.taxcalculatorRoute,
      //     page: () => const TaxCalculatorScreen(),
      //   ),
      // ],

    );
  }
}
