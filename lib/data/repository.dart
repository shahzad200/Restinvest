

import 'package:investintrust/controller/login_screen_controller.dart';
import 'package:investintrust/data/models/calculate_tax.dart';
import 'package:investintrust/data/models/daily_nav_prices.dart';
import 'package:investintrust/data/models/load_dashboard.dart';
import 'package:investintrust/data/models/login_model.dart';
import 'package:investintrust/data/models/new_user_reg_data.dart';
import 'package:investintrust/data/models/social_media_links.dart';
import 'package:investintrust/utils/strings.dart';

import 'api_client.dart';
import 'models/common_model.dart';
import 'models/new_user_reg.dart';

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

  Future<NewUserRegData> onNewUserRegData()
  => _apiClient.onNewUserRegData();




  Future<NewUserRegister> onRegNewUser(String title, String fatherOrHusbandName, String cnicIsueDate,
      String cNicExpiryDate, String address, String country, String phone,
      String cell, String email, String gender, String occupation,
      String incomeSource, String name, String cnic, String passport,
      String ntn, String city, String otherCity, String sector, String fax,
      String birthDate, String maritalStatus, String incomeBracket, String religion,
      String filerNonFiler, String pinCode, String pinCodeExpiryConfigID
      ) => _apiClient.onRegNewUser(title, fatherOrHusbandName,
      cnicIsueDate, cNicExpiryDate,
      address, country, phone, cell, email, gender,
      occupation, incomeSource, name, cnic, passport,
      ntn, city, otherCity, sector, fax, birthDate,
      maritalStatus, incomeBracket, religion, filerNonFiler,
      pinCode, pinCodeExpiryConfigID);



  Future<Common> onSaveRedemption(String accessCode,String authorizationPinCode,
      String folioNumber,String fundCode,
      String redTransType,String sessionId,
      String sessionStartDate,String totalUnits,
      String transactionValue,String unitClass,
      String unitPlan,String userId,
      String userType
      ) => _apiClient.onSaveRedemption(accessCode, authorizationPinCode,
      folioNumber, fundCode, redTransType, sessionId,
      sessionStartDate, totalUnits, transactionValue,
      unitClass, unitPlan, userId, userType);



}