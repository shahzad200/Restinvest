import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:investintrust/views/account_opening_request_screen.dart';
import 'package:investintrust/views/branches_screen.dart';
import 'package:investintrust/views/daily_nav_screen.dart';
import 'package:investintrust/views/f2f_transfer_screen.dart';
import 'package:investintrust/views/fundmanager_screen.dart';
import 'package:investintrust/views/generate_code_screen.dart';
import 'package:investintrust/views/home_screen.dart';
import 'package:investintrust/views/learning_screen.dart';
import 'package:investintrust/views/login_screen.dart';
import 'package:investintrust/views/market_screen.dart';
import 'package:investintrust/views/nav_screen.dart';
import 'package:investintrust/views/password_screen.dart';
import 'package:investintrust/views/picfund_screen.dart';
import 'package:investintrust/views/pin_confirmation_screen.dart';
import 'package:investintrust/views/portfolio_screen.dart';
import 'package:investintrust/views/product_screen.dart';
import 'package:investintrust/views/purchases_screen.dart';
import 'package:investintrust/views/redemption_screen.dart';
import 'package:investintrust/views/register_screen.dart';
import 'package:investintrust/views/reports_screen.dart';
import 'package:investintrust/views/splash_screen.dart';
import 'package:investintrust/views/text_calculator_screen.dart';
import 'package:investintrust/views/user_screen.dart';
import 'package:investintrust/views/view_report_screen.dart';

class AppRoute {
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String signUpRoute = '/signUp';
  static const String passwordRoute = '/password';
  static const String registerRoute = '/register';
  static const String userRoute = '/user';
  static const String homeRoute = '/home';
  static const String navRoute = '/nav';
  static const String branchesRoute = '/branches';
  static const String learningRoute = '/learning';
  static const String marketRoute = '/market';
  static const String productRoute = '/product';
  static const String fundRoute = '/fund';
  static const String generateCode = '/generateCode';

  static const String redemptionRoute = '/redemption';
  static const String fundManagerRoute = '/fundManager';
  static const String portofolioRoute = '/portofolio';
  static const String purchasesRoute = '/purchases';
  static const String f2ftransferRoute = '/f2ftransfer';
  static const String reportsRoute = '/reports';
  static const String viewreportsRoute = '/viewreports';
  static const String dailynavRoute = '/dailynav';
  static const String taxcalculatorRoute = '/taxcalculator';
  static const String pinConfirmation='/pinConfirmation';

  static const String accountopeningrequest='/accountopeningrequest';

  AppRoute._();

  static List<GetPage> get navMain {
    return [
      GetPage(
        name: AppRoute.splashRoute,
        page: () => const SplashScreen(),
      ),
      GetPage(
        name: AppRoute.loginRoute,
        page: () => const LoginScreen(),
      ),
      GetPage(
        name: AppRoute.passwordRoute,
        page: () => const PasswordScreen(),
      ),
      GetPage(
        name: AppRoute.registerRoute,
        page: () => const RegisterScreen(),
      ),
      GetPage(
        name: AppRoute.homeRoute,
        page: () => const HomeScreen(),
      ),
      GetPage(
        name: AppRoute.navRoute,
        page: () => NavScreen(),
      ),
      GetPage(
        name: AppRoute.branchesRoute,
        page: () => const BranchesScreen(),
      ),
      GetPage(
        name: AppRoute.learningRoute,
        page: () => const LearningScreen(),
      ),
      GetPage(
        name: AppRoute.marketRoute,
        page: () => const MarketScreen(),
      ),
      GetPage(
        name: AppRoute.productRoute,
        page: () => const ProductScreen(),
      ),
      GetPage(
        name: AppRoute.fundRoute,
        page: () => const PicFundScreen(),
      ),
      GetPage(
        name: AppRoute.fundManagerRoute,
        page: () => const FundManagerScreen(),
      ),
      GetPage(
        name: AppRoute.userRoute,
        page: () => const UserScreen(),
      ),
      GetPage(
        name: AppRoute.redemptionRoute,
        page: () => const RedemptionScreen(),
      ),
      GetPage(
        name: AppRoute.portofolioRoute,
        page: () => const PortofolioScreen(),
      ),
      GetPage(
        name: AppRoute.purchasesRoute,
        page: () => const PurchasesScreen(),
      ),
      GetPage(
        name: AppRoute.f2ftransferRoute,
        page: () => const F2FTransferScreen(),
      ),
      GetPage(
        name: AppRoute.reportsRoute,
        page: () => const ReportsScreen(),
      ),
      GetPage(
        name: AppRoute.viewreportsRoute,
        page: () => const ViewReportsScreen(),
      ),
      GetPage(
        name: AppRoute.dailynavRoute,
        page: () => const DailyNavScreen(),
      ),
      GetPage(
        name: AppRoute.taxcalculatorRoute,
        page: () => const TaxCalculatorScreen(),
      ),
      GetPage(
        name: AppRoute.generateCode,
        page: () =>  GenerateCodeScreen(),
      ),
      GetPage(
        name: AppRoute.pinConfirmation,
        page: () =>  PinConfirmationScreen()
      ),
      GetPage(
          name: AppRoute.accountopeningrequest,
          page: () =>  AccountOpenRequestScreen()
      ),
    ];
  }


}
