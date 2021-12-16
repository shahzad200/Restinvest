

import 'package:investintrust/controller/login_screen_controller.dart';
import 'package:investintrust/data/models/calculate_tax.dart';
import 'package:investintrust/data/models/daily_nav_prices.dart';
import 'package:investintrust/data/models/load_dashboard.dart';
import 'package:investintrust/data/models/login_model.dart';
import 'package:investintrust/data/models/social_media_links.dart';
import 'package:investintrust/utils/strings.dart';

import 'api_client.dart';
import 'models/common_model.dart';

class Repository {
  final _apiClient = ApiClient();

  Future<SocialMediaLink> socialMediaLinks()
  => _apiClient.socialMediaLinks();

  Future<LoginModel> onLogin(String name,String password)
  => _apiClient.onLogin(name,password);

  Future<Common> onResetPassword(String userId,String cNic)
  => _apiClient.onResetPassword(userId,cNic);


  Future<LoadDashboard> onLoadDashBoard(String folioNumber)
  => _apiClient.onLoadDashBoard(LoginScreenController.loginModel.response!.user!.userid.toString(),folioNumber);

  Future<CalculateTax> onCalculateTax(String salaried,
  String annualIncome)
  => _apiClient.onCalculateTax(salaried,annualIncome);

  Future<DailyNavPrices> onLoadDailyNavPrices()
  => _apiClient.onLoadDailyNavPrices();



}