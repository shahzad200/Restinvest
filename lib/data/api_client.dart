import 'dart:convert';

import 'package:get/get_utils/src/extensions/dynamic_extensions.dart';
import 'package:http/http.dart' as http;
import 'package:investintrust/data/models/calculate_tax.dart';
import 'package:investintrust/data/models/city_data.dart';
import 'package:investintrust/data/models/common_model.dart';
import 'package:investintrust/data/models/daily_nav_prices.dart';
import 'package:investintrust/data/models/new_user_reg_data.dart';

import 'package:investintrust/data/models/social_media_links.dart';

import 'models/city_sector_model.dart';
import 'models/load_dashboard.dart';
import 'models/login_model.dart';
import 'models/new_user_reg.dart';
import 'models/new_user_pin_gen.dart';

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
  static const _epNewUserRegister = _baseUrl + 'newUserRegister';
  static const _epNewUserRegData = _baseUrl + 'NewUserRegData';
  static const _epCityData = _baseUrl + 'CityData';
  static const _epCitySectorData = _baseUrl + 'CitySectorData';
  static const _epNewUserPinGenration = _baseUrl + 'newUserPinGenration';
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

  Future<LoginModel> onLogin(String userId, String password) async {
    try {
      final response = await http.post(
        Uri.parse(_epLogin),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
            <String, String>{'userId': userId, 'password': password}),
      );
      if (response.statusCode == 200) {
        printInfo(info:response.body);
        LoginModel loginModel = LoginModel.fromJson(jsonDecode(response.body));
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

  Future<LoadDashboard> onLoadDashBoard(
      String userId, String folioNumber) async {
    print(userId + 'nkj' + folioNumber);
    try {
      final response = await http.post(
        Uri.parse(_epLoadDashBoard),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'userId': userId,
          'folioNumber': folioNumber,
          'reqType': 'MDBMPG'
        }),
      );
      if (response.statusCode == 200) {
        print(response.body);
        LoadDashboard loadDashboard =
            LoadDashboard.fromJson(jsonDecode(response.body));
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

  Future<CalculateTax> onCalculateTax(
      String salaried, String annualIncome) async {
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

  Future<Common> onResetPassword(String userId, String cNic) async {
    print(userId + 'nkj' + cNic);
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


  Future<Common> onLoadFundsPlans(String userId, String cNic) async {
    print(userId + 'nkj' + cNic);
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
          'requestType': 'RED'
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

  Future<NewUserRegData> onNewUserRegData()async{
    try {
      final response = await http.post(Uri.parse(_epNewUserRegData));
      if (response.statusCode == 200) {
        print("${response.body}");
        NewUserRegData newUserRegData =
        NewUserRegData.fromJson(jsonDecode(response.body));
        if (newUserRegData.meta!.code.toString() == 200.toString()) {
          return newUserRegData;
        } else {
          throw Exception(newUserRegData.meta!.message);
        }
      } else {
        throw Exception('No Internet');
      }
    } catch (e) {
      throw Exception('No Internet');
    }
  }

  Future<CityData> onCityData(String countryCode)async{
    try {
      final response = await http.post(
        Uri.parse(_epCityData),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'countryCode': countryCode
        }),
      );
      if (response.statusCode == 200) {
        CityData cityData =
        CityData.fromJson(jsonDecode(response.body));
        if (cityData.meta!.code.toString() == 200.toString()) {
          return cityData;
        } else {
          throw Exception(cityData.meta!.message);
        }
      } else {
        throw Exception('No Internet');
      }
    } catch (e) {
      throw Exception('No Internet');
    }
  }

  Future<CitySector> onCitySectorData(String cityCode)async{
    try {
      final response = await http.post(
        Uri.parse(_epCitySectorData),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'cityCode': cityCode
        }),
      );
      if (response.statusCode == 200) {
        print(response);
        CitySector citySector =
        CitySector.fromJson(jsonDecode(response.body));
        if (citySector.meta!.code.toString() == 200.toString()) {
          return citySector;
        } else {
          throw Exception(citySector.meta!.message);
        }
      } else {
        throw Exception('No Internet');
      }
    } catch (e) {
      throw Exception('No Internet');
    }
  }
  //
  // {"address":"dfsdf dfgdf dfbdf cfbd",
  // "cell":"+9879732323",
  // "cnic":"32233-3223232-3",
  // "email":"talhakhanxada@gmail.com",
  // "pinCodeConfigId":"3"}


  Future<NewUserPinGenration> onNewUserPinGenration(String address,
      String cell, String cNic, String email)async{
    try {
      final response = await http.post(
        Uri.parse(_epNewUserPinGenration),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          "address": address,
          "cell": cell,
          "cnic": cNic,
          "email": email,
          "pinCodeConfigId":"3"
        }),
      );
      if (response.statusCode == 200) {
        NewUserPinGenration newUserPinGenration =
        NewUserPinGenration.fromJson(jsonDecode(response.body));
        if (newUserPinGenration.meta!.code.toString() == 200.toString()) {
          return newUserPinGenration;
        } else {
          throw Exception(newUserPinGenration.meta!.message);
        }
      } else {
        throw Exception('No Internet');
      }
    } catch (e) {
      throw Exception('No Internet');
    }

  }


  // _epCityData


  Future<NewUserRegister> onRegNewUser(
      String title,
      String fatherOrHusbandName,
      String cnicIsueDate,
      String cNicExpiryDate,
      String address,
      String country,
      String phone,
      String cell,
      String email,
      String gender,
      String occupation,
      String incomeSource,
      String name,
      String cnic,
      String passport,
      String ntn,
      String city,
      String otherCity,
      String sector,
      String fax,
      String birthDate,
      String maritalStatus,
      String incomeBracket,
      String religion,
      String filerNonFiler,
      String pinCode,
      String pinCodeExpiryConfigID) async {
    print(title+fatherOrHusbandName+
        cnicIsueDate+cNicExpiryDate+
        address+country+phone+cell+email+gender+
        occupation+incomeSource+name+cnic+passport+
        ntn+city+otherCity+sector+fax+birthDate+
        maritalStatus+incomeBracket+religion+filerNonFiler+
        pinCode+pinCodeExpiryConfigID);
    try {
      final response = await http.post(
        Uri.parse(_epNewUserRegister),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'title': title,
          'fatherOrHusbandName': fatherOrHusbandName,
          'cnicIsueDate': cnicIsueDate,
          'cnicExpiryDate': cNicExpiryDate,
          'address': address,
          'country': country,
          'phone': phone,
          'cell': cell,
          'email': email,
          'gender': gender,
          'occupation': occupation,
          'incomeSource': incomeSource,
          'name': name,
          'cnic': cnic,
          'passport': passport,
          'ntn': ntn,
          'city': city,
          'otherCity': otherCity,
          'sector': sector,
          'fax': fax,
          'birthDate': birthDate,
          'maritalStatus': maritalStatus,
          'incomeBracket': incomeBracket,
          'religion': religion,
          'filerNonFiler': filerNonFiler,
          'pinCode': pinCode,
          'pinCodeExpiryConfigID': '3'
        }),
      );
      if (response.statusCode == 200) {
        NewUserRegister newUserRegister =
        NewUserRegister.fromJson(jsonDecode(response.body));
        print(response.body);
        if (newUserRegister.meta!.code.toString() == 200.toString()) {
          return newUserRegister;
        } else {
          throw Exception(newUserRegister.meta!.message);
        }
      } else {
        throw Exception('No Internet');
      }
    } catch (e) {
      throw Exception('No Internet');
    }
  }

  Future<Common> onGeneratePinCode(String userId, String folioNumber) async {
    try {
      final response = await http.post(
        Uri.parse(_epGeneratePinCode),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'pinCodeConfigId': '3',
          'folioNumber': folioNumber,
          'reqType': 'RED',
          'userId': userId
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

  Future<Common> onSaveRedemption(
      String accessCode,
      String authorizationPinCode,
      String folioNumber,
      String fundCode,
      String redTransType,
      String sessionId,
      String sessionStartDate,
      String totalUnits,
      String transactionValue,
      String unitClass,
      String unitPlan,
      String userId,
      String userType) async {
    try {
      final response = await http.post(
        Uri.parse(_epSaveRedemption),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'accessCode': accessCode,
          'authorizationPinCode': authorizationPinCode,
          'folioNumber': folioNumber,
          'fundCode': fundCode,
          'redTransType': redTransType,
          'sessionId': sessionId,
          'sessionStartDate': sessionStartDate,
          'totalUnits': totalUnits,
          'transactionValue': transactionValue,
          'unitClass': unitClass,
          'unitPlan': unitPlan,
          'userId': userId,
          'userType': userType
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

  Future<Common> onSaveFundTransfer(
      String accessCode,
      String authorizationPinCode,
      String folioNumber,
      String fundCode,
      String redTransType,
      String sessionId,
      String sessionStartDate,
      String totalUnits,
      String transactionValue,
      String unitClass,
      String unitPlan,
      String userId,
      String userType) async {
    try {
      final response = await http.post(
        Uri.parse(_epSaveFundTransfer),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'accessCode': accessCode,
          'authorizationPinCode': authorizationPinCode,
          'folioNumber': folioNumber,
          'toFolioNumber': fundCode,
          'fundCode': redTransType,
          'redTransType': sessionId,
          'sessionId': sessionStartDate,
          'sessionStartDate': totalUnits,
          'totalUnits': transactionValue,
          'transactionValue': unitClass,
          'unitClass': unitPlan,
          'unitPlan': userId,
          'userId': userType,
          'userType': unitClass,
          'toFundCode': unitPlan,
          'toFundUnitClass': userId,
          'toFundUnitPlan': userType
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
