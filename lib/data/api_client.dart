import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:investintrust/data/models/calculate_tax.dart';
import 'package:investintrust/data/models/common_model.dart';
import 'package:investintrust/data/models/daily_nav_prices.dart';

import 'package:investintrust/data/models/social_media_links.dart';

import 'models/load_dashboard.dart';
import 'models/login_model.dart';

class ApiClient {
  static const _baseUrl =
      'https://investintrust.nit.com.pk:8443/AssetConnectMobilePortal/UserService/';
  static const _epSocialMediaLinks = _baseUrl + 'socialMediaLinks';
  static const _epLogin = _baseUrl + 'login';
  static const _epLoadDashBoard = _baseUrl + 'loadDashboard';
  static const _epCalculateTax = _baseUrl + 'calculateTax';
  static const _epLoadDailyNavPrices = _baseUrl + 'loadDailyNavPrices';
  static const _epChangePassword = _baseUrl + 'changePassword';
  static const _epLoadFundsPlans = _baseUrl + 'loadFundsPlans';


  static const _epGeneratePinCode = _baseUrl + 'generatePinCode';
  static const _epSaveRedemption = _baseUrl + 'saveRedemption';
  static const _epSaveFundTransfer = _baseUrl + 'saveFundTransfer';
  static const _epSavePurchase = _baseUrl + 'savePurchase';

  static const _epViewReport = _baseUrl + 'viewReport';
  static const _epTaxCalculator = _baseUrl + 'taxCalculator';
  static const _epNewsNotification = _baseUrl + 'NewsNotification';
  static const _epRegisteredUser = _baseUrl + 'registeredUser';
  static const _epPickFundQuestions = _baseUrl + 'pickFundQuestions';
  static const _epGetExpectedFund = _baseUrl + 'getExpectedFund';

  static const _epNewUserRegData = _baseUrl + 'NewUserRegData';
  static const _epCityData = _baseUrl + 'CityData';
  static const _epCitySectorData = _baseUrl + 'CitySectorData';
  static const _epNewUserPinGenration = _baseUrl + 'newUserPinGenration';
  static const _epNewUserRegister = _baseUrl + 'newUserRegister';






  Future<SocialMediaLink> socialMediaLinks() async {
    try {
      final response = await http.post(Uri.parse(_epSocialMediaLinks));
      if (response.statusCode == 200) {
        SocialMediaLink socialMediaLink =
            SocialMediaLink.fromJson(jsonDecode(response.body));
        if (socialMediaLink.meta!.code.toString() == 200.toString()) {
          return socialMediaLink;
        } else {
          throw Exception(socialMediaLink.meta!.message);
        }
      } else {
        throw Exception('No Internet');
      }
    } catch (e) {
      throw Exception('No Internet');
    }
  }

  Future<LoginModel> onLogin(String userId,String password) async {
    try {
      final response = await http.post(
        Uri.parse(_epLogin),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'userId': userId,
          'password': password
        }),
      );
      if (response.statusCode == 200) {
        LoginModel loginModel = LoginModel.fromJson(jsonDecode(response.body));
        print(response.body);
        if (loginModel.meta!.code.toString() == 200.toString()) {
          return loginModel;
        } else {
          throw Exception(loginModel.meta!.message);
        }
      } else {
        throw Exception('No Internet');
      }
    } catch (e) {
      throw Exception('No Internet');
    }
  }

  Future<LoadDashboard> onLoadDashBoard(String userId, String folioNumber) async {
    print(userId+'nkj'+folioNumber);
    try {
      final response = await http.post(
        Uri.parse(_epLoadDashBoard),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'userId': 'SAAD30',
          'folioNumber': '81656',
          'reqType': 'MDBMPG'
        }),
      );
      if (response.statusCode == 200) {
        LoadDashboard loadDashboard =
            LoadDashboard.fromJson(jsonDecode(response.body));
        print(response.body);
        if (loadDashboard.meta!.code.toString() == 200.toString()) {
          return loadDashboard;
        } else {
          throw Exception(loadDashboard.meta!.message);
        }
      } else {
        throw Exception('No Internet');
      }
    } catch (e) {
      throw Exception('No Internet');
    }
  }

  Future<CalculateTax> onCalculateTax(String salaried, String annualIncome) async {
    try {
      final response = await http.post(
        Uri.parse(_epCalculateTax),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'salaried': salaried,
          'annualIncome': annualIncome,
        }),
      );
      if (response.statusCode == 200) {
        print(response.body);
        CalculateTax calculateTax =
        CalculateTax.fromJson(jsonDecode(response.body));
        if (calculateTax.meta!.code.toString() == 200.toString()) {
          return calculateTax;
        } else {
          throw Exception(calculateTax.meta!.message);
        }
      } else {
        throw Exception('No Internet');
      }
    } catch (e) {
      throw Exception('No Internet');
    }
  }

  Future<DailyNavPrices> onLoadDailyNavPrices() async {
    try {
      final response = await http.post(Uri.parse(_epLoadDailyNavPrices));
      if (response.statusCode == 200) {
        print("${response.body}");
        DailyNavPrices dailyNavPrices =
        DailyNavPrices.fromJson(jsonDecode(response.body));
        if (dailyNavPrices.meta!.code.toString() == 200.toString()) {
          return dailyNavPrices;
        } else {
          throw Exception(dailyNavPrices.meta!.message);
        }
      } else {
        throw Exception('No Internet');
      }
    } catch (e) {
      throw Exception('No Internet');
    }
  }

  Future<Common> onResetPassword(String userId,String cNic) async {
    print(userId+'nkj'+cNic);
    try {
      final response = await http.post(
        Uri.parse(_epChangePassword),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'userId': userId,
          'cnic': cNic,
          'requestType': 'F'
        }),
      );
      if (response.statusCode == 200) {
        Common common = Common.fromJson(jsonDecode(response.body));
        print(response.body);
        if (common.meta!.code.toString() == 200.toString()) {
          return common;
        } else {
          throw Exception(common.meta!.message);
        }
      } else {
        throw Exception('No Internet');
      }
    } catch (e) {
      throw Exception('No Internet');
    }
  }

  Future<Common> onLoadFundsPlans(String userId,String cNic) async {
    print(userId+cNic);
    try {
      final response = await http.post(
        Uri.parse(_epLoadFundsPlans),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'userId': userId,
          'fundCode': '00002',
          'folioNumber': '69558',
          'requestType' : 'RED'
        }),
      );
      if (response.statusCode == 200) {
        Common common = Common.fromJson(jsonDecode(response.body));
        print(response.body);
        if (common.meta!.code.toString() == 200.toString()) {
          return common;
        } else {
          throw Exception(common.meta!.message);
        }
      } else {
        throw Exception('No Internet');
      }
    } catch (e) {
      throw Exception('No Internet');
    }
  }



}
