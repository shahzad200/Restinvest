import 'dart:convert';

import 'package:get/get_utils/src/extensions/dynamic_extensions.dart';
import 'package:http/http.dart' as http;
import 'package:investintrust/data/models/calculate_tax.dart';
import 'package:investintrust/data/models/city_data.dart';
import 'package:investintrust/data/models/common_model.dart';
import 'package:investintrust/data/models/daily_nav_prices.dart';
import 'package:investintrust/data/models/fund_questions.dart';
import 'package:investintrust/data/models/new_user_reg_data.dart';

import 'package:investintrust/data/models/social_media_links.dart';

import 'models/city_sector_model.dart';
import 'models/gen_verification_code_for_dig_user.dart';
import 'models/load_dashboard.dart';
import 'models/load_fund_plans.dart';
import 'models/login_model.dart';
import 'models/new_dig_user_reg_data_after_otp.dart';
import 'models/new_dig_user_reg_data_before_otp.dart';
import 'models/new_dig_user_reg_data_req_list.dart';
import 'models/new_notifications.dart';
import 'models/new_user_reg.dart';
import 'models/new_user_pin_gen.dart';
import 'models/view_reports.dart';

class ApiClient {
  static const _baseUrl =
      'http://192.168.0.86:8094/AssetConnectMobilePortal/UserService/';

  // 'https://investintrust.nit.com.pk:8443/AssetConnectMobilePortal/UserService/';
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

  static const _epNewDigUserRegDataBeforeOTP =
      _baseUrl + 'NewDigUserRegDataBeforeOTP';
  static const _epNewDigUserRegDataAfterOTP =
      _baseUrl + 'NewDigUserRegDataAfterOTP';
  static const _epNewDigUserRegDataRpqList =
      _baseUrl + 'NewDigUserRegDataRpqList';
  static const _epGenVerificationCodeForDigUser =
      _baseUrl + 'genVerificationCodeForDigUser';
  static const _epValidateVerificationCodeForDigUser =
      _baseUrl + 'validateVerificationCodeForDigUser';
  static const _epPartialSavingForDigUser =
      _baseUrl + 'partialSavingForDigUser';
  static const _epSaveDigUser = _baseUrl + 'saveDigUser';
  static const _epLoadDigUserMissingDetailLinkData =
      _baseUrl + 'loadDigUserMissingDetailLinkData';
  static const _epGenVerificationCodeForDigUserMissingDet =
      _baseUrl + 'genVerificationCodeForDigUserMissingDet';
  static const _epValidateVerificationCodeForDigUserMissingDet =
      _baseUrl + 'validateVerificationCodeForDigUserMissingDet';
  static const _epSaveDigUserMissingDet = _baseUrl + 'saveDigUserMissingDet';

  Future<ViewReport> onViewReport(
    String fromDate,
    String toDate,
    String fundCode,
    String reportType,
    String folioNumber,
    String userId,
  ) async {
    printInfo(
        info: fromDate + toDate + fundCode + reportType + folioNumber + userId);
    try {
      final response = await http.post(
        Uri.parse(_epViewReport),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'fromDate': fromDate,
          'toDate': toDate,
          'folioNumber': folioNumber,
          'reportType': reportType,
          'fundCode': fundCode,
          'userId': userId
        }),
      );
      if (response.statusCode == 200) {
        printInfo(info: response.body);
        ViewReport viewReport = ViewReport.fromJson(jsonDecode(response.body));
        if (viewReport.meta!.code.toString() == 200.toString()) {
          return viewReport;
        } else {
          throw Exception(viewReport.meta!.message);
        }
      } else {
        throw Exception('No Internet');
      }
    } catch (e) {
      throw Exception('No Internet');
    }
  }

  Future<Common> onTaxCalculator(
    String userId,
    String unitPlan,
    String fundCode,
    String unitClass,
    String folioNumber,
    String transactionValue,
  ) async {
    try {
      final response = await http.post(
        Uri.parse(_epTaxCalculator),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'monthlyTaxableIncome': userId,
          'incomeType': unitPlan,
          'investmentIn': fundCode,
          'age': unitClass,
          'mutualFundInvestAmount': folioNumber,
          'pensionFundInvestAmount': transactionValue
        }),
      );
      if (response.statusCode == 200) {
        print(response.body);
        Common common = Common.fromJson(jsonDecode(response.body));
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

  Future<Common> onSavePurchase(
      String userId,
      String unitPlan,
      String fundCode,
      String unitClass,
      String folioNumber,
      String transactionValue,
      String chequeNo,
      String chequeDate,
      String bankName,
      String bankAccountNo,
      String paymentMode) async {
    try {
      final response = await http.post(
        Uri.parse(_epSavePurchase),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'userId': userId,
          'unitPlan': unitPlan,
          'fundCode': fundCode,
          'unitClass': unitClass,
          'folioNumber': folioNumber,
          'transactionValue': transactionValue,
          'chequeNo': chequeNo,
          'chequeDate': chequeDate,
          'bankBranch': bankName,
          'bankAccountNo': bankAccountNo,
          'paymentMode': paymentMode
        }),
      );
      if (response.statusCode == 200) {
        print(response.body);
        Common common = Common.fromJson(jsonDecode(response.body));
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

  Future<Common> onRegisteredUser(
      String accountNo, String cnic, String email, String cell) async {
    try {
      final response = await http.post(
        Uri.parse(_epRegisteredUser),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'folioNumber': accountNo,
          'cnic': cnic,
          'registeredEmail': email,
          'registeredCellNo': cell,
        }),
      );
      if (response.statusCode == 200) {
        print(response.body);
        Common common = Common.fromJson(jsonDecode(response.body));
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

  Future<Common> onRegisteredUserPin(String accountNo, String cNic,
      String email, String cell, String pinCode) async {
    try {
      final response = await http.post(
        Uri.parse(_epRegisteredUser),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'folioNumber': accountNo,
          'cnic': cNic,
          'registeredEmail': email,
          'registeredCellNo': cell,
          'securePinCode': pinCode
        }),
      );
      if (response.statusCode == 200) {
        print(response.body);
        Common common = Common.fromJson(jsonDecode(response.body));
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

  Future<FundQuestions> onPickFundQuestions() async {
    try {
      final response = await http.post(Uri.parse(_epPickFundQuestions));
      if (response.statusCode == 200) {
        FundQuestions fundQuestions =
            FundQuestions.fromJson(jsonDecode(response.body));
        if (fundQuestions.meta!.code.toString() == 200.toString()) {
          return fundQuestions;
        } else {
          throw Exception(fundQuestions.meta!.message);
        }
      } else {
        throw Exception('No Internet');
      }
    } catch (e) {
      throw Exception('No Internet');
    }
  }

  Future<Common> onGetExpectedFund() async {
    try {
      final response = await http.post(Uri.parse(_epGetExpectedFund));
      if (response.statusCode == 200) {
        Common common = Common.fromJson(jsonDecode(response.body));
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

  Future<NewsNotification> onNewsNotification() async {
    try {
      final response = await http.post(Uri.parse(_epNewsNotification));
      if (response.statusCode == 200) {
        NewsNotification newsNotification =
            NewsNotification.fromJson(jsonDecode(response.body));
        if (newsNotification.meta!.code.toString() == 200.toString()) {
          return newsNotification;
        } else {
          throw Exception(newsNotification.meta!.message);
        }
      } else {
        throw Exception('No Internet');
      }
    } catch (e) {
      throw Exception('No Internet');
    }
  }

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
      printInfo(info: password);
      if (response.statusCode == 200) {
        printInfo(info: response.body);
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
        printInfo(info: response.body);
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

  Future<LoadFundsPlans> onLoadFundsPlans(String userId, String fundCode,
      String folioNumber, String requestType) async {
    print(
        userId + 'nkj' + fundCode + 'nkj' + folioNumber + 'nkj' + requestType);
    try {
      final response = await http.post(
        Uri.parse(_epLoadFundsPlans),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'userId': userId,
          'fundCode': fundCode,
          'folioNumber': folioNumber,
          'requestType': requestType
        }),
      );
      if (response.statusCode == 200) {
        LoadFundsPlans loadFundsPlans =
            LoadFundsPlans.fromJson(jsonDecode(response.body));
        print(response.body);
        if (loadFundsPlans.meta!.code.toString() == 200.toString()) {
          return loadFundsPlans;
        } else {
          throw Exception(loadFundsPlans.meta!.message);
        }
      } else {
        throw Exception('No Internet');
      }
    } catch (e) {
      throw Exception('No Internet');
    }
  }

  Future<NewUserRegData> onNewUserRegData() async {
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

  Future<CityData> onCityData(String countryCode) async {
    try {
      final response = await http.post(
        Uri.parse(_epCityData),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{'countryCode': countryCode}),
      );
      if (response.statusCode == 200) {
        CityData cityData = CityData.fromJson(jsonDecode(response.body));
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

  Future<CitySector> onCitySectorData(String cityCode) async {
    try {
      final response = await http.post(
        Uri.parse(_epCitySectorData),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{'cityCode': cityCode}),
      );
      if (response.statusCode == 200) {
        print(response);
        CitySector citySector = CitySector.fromJson(jsonDecode(response.body));
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

  Future<NewUserPinGenration> onNewUserPinGenration(
      String address, String cell, String cNic, String email) async {
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
          "pinCodeConfigId": "3"
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
    print(title +
        fatherOrHusbandName +
        cnicIsueDate +
        cNicExpiryDate +
        address +
        country +
        phone +
        cell +
        email +
        gender +
        occupation +
        incomeSource +
        name +
        cnic +
        passport +
        ntn +
        city +
        otherCity +
        sector +
        fax +
        birthDate +
        maritalStatus +
        incomeBracket +
        religion +
        filerNonFiler +
        pinCode +
        pinCodeExpiryConfigID);
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

  Future<Common> onGeneratePinCode(
      String userId, String folioNumber, String req) async {
    try {
      final response = await http.post(
        Uri.parse(_epGeneratePinCode),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'pinCodeConfigId': '3',
          'folioNumber': folioNumber,
          'reqType': req,
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
      String toFolioNumber,
      String fundCode,
      String redTransType,
      String sessionId,
      String sessionStartDate,
      String totalUnits,
      String transactionValue,
      String unitClass,
      String unitPlan,
      String userId,
      String userType,
      String toFundCode,
      String toFundUnitClass,
      String toFundUnitPlan) async {
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
          'toFolioNumber': toFolioNumber,
          'fundCode': fundCode,
          'redTransType': redTransType,
          'sessionId': sessionId,
          'sessionStartDate': sessionStartDate,
          'totalUnits': totalUnits,
          'transactionValue': transactionValue,
          'unitClass': unitClass,
          'unitPlan': unitPlan,
          'userId': userId,
          'userType': userType,
          'toFundCode': toFundCode,
          'toFundUnitClass': toFundUnitClass,
          'toFundUnitPlan': toFundUnitPlan
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

  Future<NewDigUserRegDataBeforeOTP> onNewDigUserRegDataBeforeOTP() async {
    try {
      final response = await http.post(
        Uri.parse(_epNewDigUserRegDataBeforeOTP),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        printInfo(info: response.body);
        NewDigUserRegDataBeforeOTP newDigUserRegDataBeforeOTP =
            NewDigUserRegDataBeforeOTP.fromJson(jsonDecode(response.body));
        if (newDigUserRegDataBeforeOTP.meta!.code.toString() ==
            200.toString()) {
          return newDigUserRegDataBeforeOTP;
        } else {
          throw Exception(newDigUserRegDataBeforeOTP.meta!.message);
        }
      } else {
        throw Exception('No Internet');
      }
    } catch (e) {
      throw Exception('No Internet');
    }
  }

  Future<NewDigUserRegDataAfterOTP> onNewDigUserRegDataAfterOTP() async {
    try {
      final response = await http.post(
        Uri.parse(_epNewDigUserRegDataAfterOTP),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        printInfo(info: response.body);
        NewDigUserRegDataAfterOTP newDigUserRegDataAfterOTP =
            NewDigUserRegDataAfterOTP.fromJson(jsonDecode(response.body));
        if (newDigUserRegDataAfterOTP.meta!.code.toString() == 200.toString()) {
          return newDigUserRegDataAfterOTP;
        } else {
          throw Exception(newDigUserRegDataAfterOTP.meta!.message);
        }
      } else {
        throw Exception('No Internet');
      }
    } catch (e) {
      throw Exception('No Internet');
    }
  }

  Future<NewDigUserRegDataRpqList> onNewDigUserRegDataRpqList() async {
    try {
      final response = await http.post(
        Uri.parse(_epNewDigUserRegDataRpqList),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        NewDigUserRegDataRpqList newDigUserRegDataRpqList =
            NewDigUserRegDataRpqList.fromJson(jsonDecode(response.body));
        if (newDigUserRegDataRpqList.meta!.code.toString() == 200.toString()) {
          return newDigUserRegDataRpqList;
        } else {
          throw Exception(newDigUserRegDataRpqList.meta!.message);
        }
      } else {
        throw Exception('No Internet');
      }
    } catch (e) {
      throw Exception('No Internet');
    }
  }

  Future<GenVerificationCodeForDigUser> onGenVerificationCodeForDigUser(
    String cNic,
    String email,
    String mobile,
  ) async {
    try {
      final response = await http.post(
        Uri.parse(_epGenVerificationCodeForDigUser),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'cnic': cNic,
          'email': email,
          'mobile': mobile,
        }),
      );
      if (response.statusCode == 200) {
        GenVerificationCodeForDigUser genVerificationCodeForDigUser =
            GenVerificationCodeForDigUser.fromJson(jsonDecode(response.body));
        if (genVerificationCodeForDigUser.meta!.code.toString() ==
            200.toString()) {
          return genVerificationCodeForDigUser;
        } else {
          throw Exception(genVerificationCodeForDigUser.meta!.message);
        }
      } else {
        throw Exception('No Internet');
      }
    } catch (e) {
      throw Exception('No Internet');
    }
  }

  Future<Common> onValidateVerificationCodeForDigUser(
    String cNic,
    String email,
    String mobile,
    String mobileRegisteredWith,
    String accountTypeToBeOpened,
    String verificationCode,
  ) async {
    Common? common;
    try {
      final response = await http.post(
        Uri.parse(_epValidateVerificationCodeForDigUser),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'cnic': cNic,
          'email': email,
          'mobile': mobile,
          'mobileRegisteredWith': mobileRegisteredWith,
          'accountTypeToBeOpened': accountTypeToBeOpened,
          'verificationCode': verificationCode
        }),
      );
      if (response.statusCode == 200) {
        printInfo(info: response.body);
        common = Common.fromJson(jsonDecode(response.body));
        if (common.meta!.code.toString() == 200.toString()) {
          return common;
        } else {
          throw Exception(common.meta!.error.toString());
        }
      } else {
        throw Exception('No Internet');
      }
    } catch (e) {
      if (e.toString() == 'Exception: ' + common!.meta!.error.toString()) {
        throw Exception(common!.meta!.error.toString());
      } else {
        throw Exception('No Internet');
      }
    }
  }

  Future<Common> onPartialSavingForDigUser(// String cNic,
      // String email,
      // String mobile,
      // String mobileRegisteredWith,
      // String accountTypeToBeOpened,
      // String verificationCode,
      ) async {
    Common? common;
    try {
      final response = await http.post(
        Uri.parse(_epPartialSavingForDigUser),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          "cnic": "12776-1734567-3",
          "email": "talhakhanxada@gmail.com",
          "mobile": "+923154511100",
          "mobileRegisteredWith": "4",
          "accountTypeToBeOpened": "B",
          "sessionID": "72",
          "accountTypeToBeOpened": "B",
          "annualIncome": '3',
          "bankAccountNo": "123456789",
          "bankBranchAddress": "abl branch",
          "bankName": "00091",
          "basicInfoDisclaimerChecked": 'true',
          "birthCityCode": "000016",
          "birthCountryCode": "001",
          "birthStateCode": "3",
          "branchCity": "000016",
          "city": "000043",
          "cnicBackDoc": {
            "fileName": "cnicBack.jpg",
            "fileExtension": ".jpg",
            "fileContent": []
          },
          "cnicExpiryDate": "2075-12-31",
          "cnicFrontDoc": {
            "fileName": "cnicFront.jpg",
            "fileExtension": ".jpg",
            "fileContent": []
          },
          "cnicIssueDate": "2020-12-31",
          "country": "001",
          "crsDisclaimerChecked": true,
          "customerName": "test name",
          "dateOfBirth": "2000-04-03",
          "dividendMandate": "C",
          "docUploadDisclaimerChecked": true,
          "domesticCounterParties": "1",
          "domesticGeographies": "2",
          "employerDesignation": "3",
          "employerName": "4",
          "employerNatureOfBusiness": "5",
          "employerProfession": "6",
          "expTurnoverInAccAmount": 5555,
          "expTurnoverInAccType": "A",
          "expectedInvestmentAmount": 4,
          "fatcaDisclaimerChecked": true,
          "fatherSpouseName": "my father",
          "incomeProofDoc": {
            "fileName": "income.jpg",
            "fileExtension": ".jpg",
            "fileContent": []
          },
          "internationalCounterParties": "counter",
          "internationalGeographies": "abc",
          "kycDisclaimerChecked": true,
          "lifetimeCnicExpiry": true,
          "mailingAddress": "test mailing add",
          "mailingCountryCode": "001",
          "mailingCity": "other",
          "mailingOtherCity": "test mailing city",
          "maritalStatus": "S",
          "mobileNoProofDoc": {
            "fileName": "mobile.jpg",
            "fileExtension": ".jpg",
            "fileContent": []
          },
          "mothersMaidenName": "test mother maiden name",
          "nationalityCode": "001",
          "occupation": "013",
          "otherCity": "test other city",
          "otherOccupation": null,
          "otherSourceOfIncome": "test",
          "otherTaxResCountry": "test tax res country",
          "pakResident": "1",
          "phoneOne": null,
          "phoneTwo": null,
          "preferedModeOfTrans": "B",
          "religion": "02",
          "residentialAddress": "lahore",
          "retirementAge": 60,
          "rpqAge": 3,
          "rpqDisclaimerChecked": true,
          "rpqFinacialPosition": 38,
          "rpqInvestmentHorizon": 31,
          "rpqInvestmentKnowledge": 35,
          "rpqInvestmentObjective": 28,
          "rpqMaritalStatus": 6,
          "rpqNoOfDependants": 10,
          "rpqOccupation": 12,
          "rpqQualification": 18,
          "rpqRiskAppetite": 23,
          "rpqTotalScore": 31,
          "signatureDoc": {
            "fileName": "sig.jpg",
            "fileExtension": ".jpg",
            "fileContent": []
          },
          "sourceOfIncome": "5",
          "taxIdentificationNumber": null,
          "taxPaidCountry": "001",
          "taxResCountryOtherThanPak": "004",
          "title": "Dr",
          "titleOfAccount": "ABC title",
          "zakatDeclarationDoc": null,
          "zakatExempt": false,
          "requiredDocs": [],
          "nominees": [
            {
              "name": "nom 1",
              "cnic": "12345-1234567-1",
              "relation": "Father",
              "mobile": "+923374879673"
            },
            {
              "name": "nom 2",
              "cnic": "12345-1234567-3",
              "relation": "Mother",
              "mobile": "+923374879673"
            }
          ],
          "fatcaInfo": [
            {
              "answer": false,
              "questionCode": 1
            },
            {
              "answer": false,
              "questionCode": 2
            },
            {
              "answer": false,
              "questionCode": 3
            },
            {
              "answer": true,
              "questionCode": 5
            },
            {
              "answer": false,
              "questionCode": 6
            },
            {
              "answer": false,
              "questionCode": 7
            },
            {
              "answer": true,
              "questionCode": 8
            }
          ],
          "pepsInfo": [
            {
              "answer": false,
              "questionCode": 1
            },
            {
              "answer": false,
              "questionCode": 2
            },
            {
              "answer": false,
              "questionCode": 3
            },
            {
              "answer": true,
              "questionCode": 4
            },
            {
              "answer": false,
              "questionCode": 5
            }
          ]
        }),
      );
      if (response.statusCode == 200) {
        printInfo(info: response.body);
        common = Common.fromJson(jsonDecode(response.body));
        if (common.meta!.code.toString() == 200.toString()) {
          return common;
        } else {
          throw Exception(common.meta!.error.toString());
        }
      } else {
        throw Exception('No Internet');
      }
    } catch (e) {
      if (e.toString() == 'Exception: ' + common!.meta!.error.toString()) {
        throw Exception(common!.meta!.error.toString());
      } else {
        throw Exception('No Internet');
      }
    }
  }
}
