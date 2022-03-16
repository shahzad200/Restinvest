import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:nit/views/account_opening_document_upload_screen.dart';
import 'package:nit/views/account_opening_fatca_screen.dart';
import 'package:nit/views/account_opening_kyc_detail_screen.dart';
import 'package:nit/views/account_opening_risk_profile_screen.dart';
import 'package:nit/views/user_profile.dart';
import 'package:nit/views/vps/change_scheme_screen.dart';
import 'package:nit/views/vps/contribution_request_screen.dart';
import 'package:nit/views/vps/vps_redemption_screen.dart';
import '../views/account_opening_bank_detail_screen.dart';
import '../views/account_opening_basic_information_screen.dart';
import '../views/account_opening_request_screen.dart';
import '../views/branches_screen.dart';
import '../views/daily_nav_screen.dart';
import '../views/f2f_transfer_screen.dart';
import '../views/fundmanager_screen.dart';
import '../views/generate_code_screen.dart';
import '../views/home_screen.dart';
import '../views/learning_screen.dart';
import '../views/login_screen.dart';
import '../views/market_screen.dart';
import '../views/nav_screen.dart';
import '../views/password_screen.dart';
import '../views/picfund_screen.dart';
import '../views/pin_confirmation_screen.dart';
import '../views/portfolio_screen.dart';
import '../views/product_screen.dart';
import '../views/purchases_screen.dart';
import '../views/redemption_screen.dart';
import '../views/register_screen.dart';
import '../views/reports_screen.dart';
import '../views/splash_screen.dart';
import '../views/text_calculator_screen.dart';
import '../views/user_screen.dart';
import '../views/view_report_screen.dart';

class AppRoute {
  // static const String splashRoute = '/';
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
  static const String profileRoute = '/profile';
  static const String purchasesRoute = '/purchases';
  static const String f2ftransferRoute = '/f2ftransfer';
  static const String reportsRoute = '/reports';
  static const String viewreportsRoute = '/viewreports';
  static const String dailynavRoute = '/dailynav';
  static const String taxcalculatorRoute = '/taxcalculator';
  static const String pinConfirmation='/pinConfirmation';

  static const String accountopeningrequest='/accountopeningrequest';
  static const String accountopeningbasicinformation='/accountopeningbasicinformation';
  static const String accountopeningbankdetail='/accountopeningbankdetail';
  static const String accountOpenKycDetailScreen='/accountOpenKycDetailScreen';
  static const String accountOpenFatcaScreen='/accountOpenFatcaScreen';
  static const String accountOpenUploadScreen='/accountOpenUploadScreen';
  static const String accountOpenURiskScreen='/accountOpenRickScreen';
// VPS
  static const String vpsContribution = '/vpsContribution';
  static const String vpsRedemption = '/vpsRedemption';
  static const String vpsChangeSchema = '/vpsChangeSchema';
  AppRoute._();

  static List<GetPage> get navMain {
    return [
      GetPage(
        name: AppRoute.vpsContribution,
        page: () => const ContributionScreen(),
      ),
      GetPage(
        name: AppRoute.vpsRedemption,
        page: () => const VpsRedemptionScreen(),
      ),
      GetPage(
        name: AppRoute.vpsChangeSchema,
        page: () => const ChangeSchemeScreen(),
      ),
      GetPage(
        name: AppRoute.accountOpenURiskScreen,
        page: () => const AccountOpenRiskProfileScreen(),
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
        page: () =>const NavScreen(),
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
        name: AppRoute.profileRoute,
        page: () => const UserProfile(),
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
        page: () =>const  PinConfirmationScreen()
      ),
      GetPage(
          name: AppRoute.accountopeningrequest,
          page: () => const AccountOpenRequestScreen()
      ),
      GetPage(
          name: AppRoute.accountopeningbasicinformation,
          page: () =>const  AccountOpenBasicInformationScreen()
      ),
      GetPage(
          name: AppRoute.accountOpenKycDetailScreen,
          page: () =>const  AccountOpenKycDetailScreen()
      ),

      GetPage(
          name: AppRoute.accountopeningbankdetail,
          page: () => const AccountOpenBankDetailScreen()
      ),
      GetPage(
          name: AppRoute.accountOpenFatcaScreen,
          page: () => const AccountOpenFatcaScreen()
      ),
      GetPage(
          name: AppRoute.accountOpenUploadScreen,
          page: () => const AccountOpenDocumentUploadScreen(),
      ),
    ];
  }


}
