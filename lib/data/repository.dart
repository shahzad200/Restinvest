

import 'package:investintrust/data/models/calculate_tax.dart';
import 'package:investintrust/data/models/daily_nav_prices.dart';
import 'package:investintrust/data/models/load_dashboard.dart';
import 'package:investintrust/data/models/login_model.dart';
import 'package:investintrust/data/models/social_media_links.dart';
import 'package:investintrust/utils/strings.dart';

import 'api_client.dart';

class Repository {
  final _apiClient = ApiClient();

  Future<SocialMediaLink> socialMediaLinks()
  => _apiClient.socialMediaLinks();

  Future<LoginModel> onLogin()
  => _apiClient.onLogin();

  Future<LoadDashboard> onLoadDashBoard()
  => _apiClient.onLoadDashBoard();

  Future<CalculateTax> onCalculateTax(String salaried,
  String annualIncome)
  => _apiClient.onCalculateTax(salaried,annualIncome);

  Future<DailyNavPrices> onLoadDailyNavPrices()
  => _apiClient.onLoadDailyNavPrices();



}