import 'dart:convert';
import 'dart:typed_data';

import 'package:get/get_utils/src/extensions/dynamic_extensions.dart';
import 'package:http/http.dart' as http;
import 'package:nit/data/models/calculate_tax.dart';
import 'package:nit/data/models/city_data.dart';
import 'package:nit/data/models/common_model.dart';
import 'package:nit/data/models/daily_nav_prices.dart';
import 'package:nit/data/models/fund_questions.dart';
import 'package:nit/data/models/new_user_reg_data.dart';

import 'package:nit/data/models/social_media_links.dart';
import 'package:nit/data/models/vps/load_existing_schema_data.dart';

import 'models/city_sector_model.dart';

import 'models/load_dashboard.dart';
import 'models/load_fund_plans.dart';
import 'models/load_fund_plans_p.dart';
import 'models/login_model.dart';
import 'models/new_dig_user_reg_data_after_otp.dart';
import 'models/new_dig_user_reg_data_before_otp.dart';
import 'models/new_dig_user_reg_data_req_list.dart';
import 'models/new_notifications.dart';
import 'models/new_user_reg.dart';
import 'models/new_user_pin_gen.dart';
import 'models/state_data.dart';
import 'models/validate_verification_code_for_dig_user.dart';
import 'models/view_reports.dart';
import 'models/vps/load_balance_for_vps_redemption.dart';
import 'models/vps/load_fund.dart';
import 'models/vps/load_schema_allocation.dart';
import 'models/vps/vps_load_fund_plans.dart';
import 'models/vps/load_schema_allocation.dart' as pension;
import 'models/vps/vps_view_report.dart';

class ApiClient {
  // VDA3927
  // 0
  static const _baseUrl =
      // 'http://192.168.0.106:8094/AssetConnectMobilePortal/UserService/';
      // 'http://210.2.139.99:8094/AssetConnectMobilePortal/UserService/';
      //  'https://investintrust.nit.com.pk:8443/AssetConnectMobilePortal/UserService/';
      'https://investintrust.nit.com.pk:8443/AssetConnectMobilePortal/UserService/';
      // 'http://192.168.0.99:8094/AssetConnectMobilePortal/UserService/';
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

  // DIGITAL ACCOUNT
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
  static const _epStateData = _baseUrl + 'StateData';
  static const _epSaveDigUser = _baseUrl + 'saveDigUser';
  static const _epLoadDigUserMissingDetailLinkData =
      _baseUrl + 'loadDigUserMissingDetailLinkData';
  static const _epGenVerificationCodeForDigUserMissingDet =
      _baseUrl + 'genVerificationCodeForDigUserMissingDet';
  static const _epValidateVerificationCodeForDigUserMissingDet =
      _baseUrl + 'validateVerificationCodeForDigUserMissingDet';
  static const _epSaveDigUserMissingDet = _baseUrl + 'saveDigUserMissingDet';

  // VPS
  static const _epVpsContribution = _baseUrl + 'saveContribution';
  static const _epVpsLoadFolioFunds = _baseUrl + 'loadFolioFunds';
  static const _epVpsGeneratePinCode = _baseUrl + 'generatePinCode';
  static const _epVpsLoadBalancesForVpsRedemption =
      _baseUrl + 'loadBalancesForVpsRedemption';
  static const _epVpsSaveVpsRedemption = _baseUrl + 'saveVpsRedemption';
  static const _epVpsLoadExistingSchemeData =
      _baseUrl + 'loadExistingSchemeData';
  static const _epVpsLoadSchemeAllocations = _baseUrl + 'loadSchemeAllocations';
  static const _epVpsSaveChangeScheme = _baseUrl + 'saveChangeScheme';
  static const _epVpsViewReport = _baseUrl + 'viewReport';

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
    ViewReport? viewReport;
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
        viewReport = ViewReport.fromJson(jsonDecode(response.body));
        if (viewReport.meta!.code.toString() == 200.toString()) {
          return viewReport;
        } else {
          throw Exception(viewReport.meta!.message);
        }
      } else {
        throw Exception('No Internet');
      }
    } catch (e) {
      if (e.toString() ==
          'Exception: ' + viewReport!.meta!.message.toString()) {
        throw Exception(viewReport!.meta!.error.toString());
      } else {
        throw Exception('No Internet');
      }
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
    String fundCode,
    String folioNumber,
    String transactionValue,
    String chequeNo,
    String chequeDate,
    String bankName,
    String bankAccountNo,
    String accessCode,
    String pinCode,
    String sessionId,
    String sessionStartDate,
    String userType,
    String paymentMode,
    String collectionBankAccount,
    String collectionBankCode,
    String fundSaleLoad,
    Uint8List? paymentProof,
    String paymentExtension,
    Uint8List? depositProof,
    String depositExtension,
  ) async {
    Common? common;
    try {
      printInfo(
          info: jsonEncode(<String, dynamic>{
        'userId': userId,
        'unitPlan': "0",
        'fundCode': fundCode,
        'unitClass': "XX",
        'folioNumber': folioNumber,
        'transactionValue': transactionValue,
        'chequeNo': chequeNo,
        'chequeDate': chequeDate,
        'bankBranch': bankName,
        'bankAccountNo': bankAccountNo,
        'paymentMode': paymentMode,
        'paymentProof': paymentProof ?? "",
        'paymentExtension': paymentExtension ?? "",
        'depositProof': depositProof ?? "",
        'depositExtension': depositExtension ?? "",
        'accessCode': accessCode,
        'authorizationPinCode': pinCode,
        'sessionId': sessionId,
        'sessionStartDate': sessionStartDate,
        'userType': userType,
        'collectionBankAccount': collectionBankAccount,
        'collectionBankCode': collectionBankCode,
        'fundSaleLoad': fundSaleLoad
      }.toString()));
      final response = await http.post(Uri.parse(_epSavePurchase),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode(<String, dynamic>{
            'userId': userId,
            'unitPlan': "0",
            'fundCode': fundCode,
            'unitClass': "XX",
            'folioNumber': folioNumber,
            'transactionValue': transactionValue,
            'chequeNo': chequeNo,
            'chequeDate': chequeDate,
            'bankBranch': bankName,
            'bankAccountNo': bankAccountNo,
            'paymentMode': paymentMode,
            'paymentProof': paymentProof ?? "",
            'paymentExtension': paymentExtension ?? "",
            'depositProof': depositProof ?? "",
            'depositExtension': depositExtension ?? "",
            'accessCode': accessCode,
            'authorizationPinCode': pinCode,
            'sessionId': sessionId,
            'sessionStartDate': sessionStartDate,
            'userType': userType,
            'collectionBankAccount': collectionBankAccount,
            'collectionBankCode': collectionBankCode,
            'fundSaleLoad': fundSaleLoad
          }));
      print(response.body.toString());
      if (response.statusCode == 200) {
        // print(response.body);
        common = Common.fromJson(jsonDecode(response.body));
        if (common.meta!.code.toString() == 200.toString()) {
          return common;
        } else {
          throw Exception(common.meta!.error);
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

  Future<Common> onRegisteredUser(
      String accountNo, String cnic, String email, String cell) async {
    Common? common;
    try {

      print(cell.toString());
      print(email.toString());
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
        common = Common.fromJson(jsonDecode(response.body));
        if (common.meta!.code.toString() == 200.toString()) {
          return common;
        } else {
          throw Exception(common.meta!.error);
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
    LoginModel? loginModel;
    try {
      printInfo(
          info: jsonEncode(
                  <String, String>{'userId': userId, 'password': password})
              .toString());
      final response = await http.post(
        Uri.parse(_epLogin),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
            <String, String>{'userId': userId, 'password': password}),
      );
      printInfo(info: response.body.toString());
      if (response.statusCode == 200) {
        loginModel = LoginModel.fromJson(jsonDecode(response.body));
        if (loginModel.meta!.code.toString() == 200.toString()) {
          return loginModel;
        } else {
          throw Exception(loginModel.meta!.error);
        }
      } else {
        throw Exception('No Internet');
      }
    } catch (e) {
      printInfo(info: e.toString());
      if (e.toString() == 'Exception: ' + loginModel!.meta!.error.toString()) {
        throw Exception(loginModel!.meta!.error.toString());
      } else {
        throw Exception('No Internet');
      }
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
    print(userId + cNic);
    Common? common;
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
        common = Common.fromJson(jsonDecode(response.body));
        print(response.body);
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

  Future<LoadFundsPlans> onLoadFundsPlans(String userId, String fundCode,
      String folioNumber, String requestType) async {
    printInfo(
        info: jsonEncode(<String, String>{
      'userId': userId,
      'fundCode': fundCode,
      'folioNumber': folioNumber,
      'requestType': requestType
    }).toString());
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

  Future<LoadFundsPlansP> onLoadFundsPlansP(String userId, String fundCode,
      String folioNumber, String requestType, String classCode) async {
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
          'classCode': classCode,
          'requestType': requestType
        }),
      );
      if (response.statusCode == 200) {
        LoadFundsPlansP loadFundsPlans =
            LoadFundsPlansP.fromJson(jsonDecode(response.body));
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

  Future<StateData> onStateData(String countryCode) async {
    try {
      final response = await http.post(
        Uri.parse(_epStateData),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{'countryCode': countryCode}),
      );
      if (response.statusCode == 200) {
        StateData stateData = StateData.fromJson(jsonDecode(response.body));
        if (stateData.meta!.code.toString() == 200.toString()) {
          return stateData;
        } else {
          throw Exception(stateData.meta!.message);
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
    Common? common;
    try {
      printInfo(
          info: jsonEncode(<String, String>{
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
      }.toString()));
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
        printInfo(info: response.body);
        common = Common.fromJson(jsonDecode(response.body));
        if (common.meta!.code.toString() == 200.toString()) {
          return common;
        } else {
          throw Exception(common.meta!.error);
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
    Common? common;
    try {
      printInfo(
          info: jsonEncode(<String, String>{
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
      }.toString()));
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
        printInfo(info: response.body);
        common = Common.fromJson(jsonDecode(response.body));
        if (common.meta!.code.toString() == 200.toString()) {
          return common;
        } else {
          throw Exception(common.meta!.error);
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
        // NewDigUserRegDataBeforeOTP newDigUserRegDataBeforeOTP =
        //     NewDigUserRegDataBeforeOTP.fromJson(jsonDecode(response.body));
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

  Future<Common> onGenVerificationCodeForDigUser(
    String cNic,
    String email,
    String mobile,
  ) async {
    Common? genVerificationCodeForDigUser;
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
        printInfo(info: response.body);
        genVerificationCodeForDigUser =
            Common.fromJson(jsonDecode(response.body));
        if (genVerificationCodeForDigUser.meta!.code.toString() ==
            200.toString()) {
          return genVerificationCodeForDigUser;
        } else {
          throw Exception(genVerificationCodeForDigUser.meta!.error.toString());
        }
      } else {
        throw Exception('No Internet');
      }
    } catch (e) {
      if (e.toString() ==
          'Exception: ' +
              genVerificationCodeForDigUser!.meta!.error.toString()) {
        throw Exception(genVerificationCodeForDigUser!.meta!.error.toString());
      } else {
        throw Exception('No Internet');
      }
    }
  }

  Future<ValidateVerificationCodeForDigUser>
      onValidateVerificationCodeForDigUser(
    String cNic,
    String email,
    String mobile,
    String mobileRegisteredWith,
    String accountTypeToBeOpened,
    String verificationCode,
  ) async {
    ValidateVerificationCodeForDigUser? common;
    try {
      print(jsonEncode(<String, String>{
        'cnic': cNic,
        'email': email,
        'mobile': mobile,
        'mobileRegisteredWith': mobileRegisteredWith,
        'accountTypeToBeOpened': accountTypeToBeOpened,
        'verificationCode': verificationCode
      }).toString());
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
      printInfo(info: response.body);
      if (response.statusCode == 200) {
        // printInfo(info: response.body);
        try {
          common = ValidateVerificationCodeForDigUser.fromJson(
              jsonDecode(response.body));
        } catch (e) {
          printInfo(info: e.toString());
        }
        if (common!.meta!.code == 200.toString()) {
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

  Future<Common> onFatcaScreenForDigUser(
      String birthCitycode,
      String birthCountrycode,
      String birthStatecode,
      bool disclamierCheck,
      bool fatcaDisclamierCheck,
      String otherTaxResCountry,
      String taxPaidCountry,
      String taxResCountryOtherThanPak,
      String? taxResCountryOther,
      String titleOfAccount,
      list,
      String taxIdNumber,
      String cNic,
      String sessionID) async {
    Common? common;

    try {
      printInfo(
          info: jsonEncode(<String, dynamic>{
        "requestFromScreenNo": 4,
        "cnic": cNic,
        "sessionID": sessionID,
        "birthCityCode": "$birthCitycode",
        "birthCountryCode": "$birthCountrycode",
        "birthStateCode": "$birthStatecode",
        "crsDisclaimerChecked": disclamierCheck,
        "fatcaDisclaimerChecked": fatcaDisclamierCheck,
        "otherTaxResCountry": taxResCountryOther,
        "taxIdentificationNumber": taxIdNumber,
        "taxPaidCountry": "$taxPaidCountry",
        "taxResCountryOtherThanPak": "$taxResCountryOtherThanPak",
        "titleOfAccount": "$titleOfAccount",
        "fatcaInfo": list
      }.toString()));
      final response = await http.post(
        Uri.parse(_epPartialSavingForDigUser),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          "requestFromScreenNo": 4,
          "cnic": cNic,
          "sessionID": sessionID,
          "birthCityCode": "$birthCitycode",
          "birthCountryCode": "$birthCountrycode",
          "birthStateCode": "$birthStatecode",
          "crsDisclaimerChecked": disclamierCheck,
          "fatcaDisclaimerChecked": fatcaDisclamierCheck,
          "otherTaxResCountry": taxResCountryOther,
          "taxIdentificationNumber": taxIdNumber,
          "taxPaidCountry": "$taxPaidCountry",
          "taxResCountryOtherThanPak": "$taxResCountryOtherThanPak",
          "titleOfAccount": "$titleOfAccount",
          "fatcaInfo": list
        }),
      );
      if (response.statusCode == 200) {
        printInfo(info: response.body);
        common = Common.fromJson(jsonDecode(response.body));
        if (common.meta!.code == 200.toString()) {
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

  Future<Common> onPartialSavingForDigUser(
      String? otherMailingCity,
      String? otherCity,
      String email,
      String mobile,
      String mobileRegWith,
      String accountTypeOpened,
      String bankAccountNo,
      String bankBranchAddress,
      String bankName,
      String branchName,
      bool basicInfoDisclaimerChecked,
      bool lifeTimeCheck,
      String bankCityCode,
      String city,
      String cNicExpiryDate,
      String cNicIssueDate,
      String country,
      String customerName,
      String dateOfBirth,
      String dividendMandate,
      String fatherSpouseName,
      String mailingAddress,
      String mailingCountryCode,
      String mailingCity,
      String maritalStatus,
      String mothersMaidenName,
      String nationalityCode,
      String pakResident,
      String phoneOne,
      String phoneTwo,
      String religion,
      String residentialAddress,
      int retirementAge,
      String title,
      bool zaKatExempt,
      String noMName,
      String noMcNic,
      String noMRelation,
      String noMMobile,
      String cNic,
      String sessionID) async {
    Common? common;
    try {
      printInfo(
          info: jsonEncode(<String, dynamic>{
        "requestFromScreenNo": 2,
        "cnic": cNic,
        "email": email,
        "mobile": mobile,
        "mobileRegisteredWith": mobileRegWith,
        "accountTypeToBeOpened": accountTypeOpened,
        "sessionID": "94",
        "bankAccountNo": bankAccountNo,
        "bankBranchAddress": bankBranchAddress,
        "bankName": bankName,
        "basicInfoDisclaimerChecked": basicInfoDisclaimerChecked,
        "branchCity": bankCityCode,
        "city": city,
        "cnicExpiryDate": cNicExpiryDate,
        "cnicIssueDate": cNicIssueDate,
        "country": country,
        "customerName": customerName,
        "dateOfBirth": dateOfBirth,
        "dividendMandate": dividendMandate,
        "fatherSpouseName": fatherSpouseName,
        "lifetimeCnicExpiry": lifeTimeCheck,
        "mailingAddress": mailingAddress,
        "mailingCountryCode": mailingCountryCode,
        "mailingCity": mailingCity,
        "mailingOtherCity": otherMailingCity,
        "maritalStatus": maritalStatus,
        "mothersMaidenName": mothersMaidenName,
        "nationalityCode": nationalityCode,
        "otherCity": otherCity,
        "pakResident": pakResident,
        "phoneOne": phoneOne,
        "phoneTwo": phoneTwo,
        "religion": religion,
        "residentialAddress": residentialAddress,
        "retirementAge": retirementAge,
        "title": title,
        "zakatExempt": zaKatExempt,
        "nominees": [
          {
            "name": noMName,
            "cnic": noMcNic,
            "relation": noMRelation,
            "mobile": noMMobile
          },
        ],
      }.toString()));
      final response = await http.post(
        Uri.parse(_epPartialSavingForDigUser),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          "requestFromScreenNo": 2,
          "cnic": cNic,
          "email": email,
          "mobile": mobile,
          "mobileRegisteredWith": mobileRegWith,
          "accountTypeToBeOpened": accountTypeOpened,
          "sessionID": sessionID,
          "bankAccountNo": bankAccountNo,
          "bankBranchAddress": bankBranchAddress,
          "bankName": bankName,
          "branchName": branchName,
          "basicInfoDisclaimerChecked": basicInfoDisclaimerChecked,
          "branchCity": bankCityCode,
          "city": city,
          "cnicExpiryDate": cNicExpiryDate,
          "cnicIssueDate": cNicIssueDate,
          "country": country,
          "customerName": customerName,
          "dateOfBirth": dateOfBirth,
          "dividendMandate": dividendMandate,
          "fatherSpouseName": fatherSpouseName,
          "lifetimeCnicExpiry": lifeTimeCheck,
          "mailingAddress": mailingAddress,
          "mailingCountryCode": mailingCountryCode,
          "mailingCity": mailingCity,
          "mailingOtherCity": otherMailingCity,
          "maritalStatus": maritalStatus,
          "mothersMaidenName": mothersMaidenName,
          "nationalityCode": nationalityCode,
          "otherCity": otherCity,
          "pakResident": pakResident,
          "phoneOne": phoneOne,
          "phoneTwo": phoneTwo,
          "religion": religion,
          "residentialAddress": residentialAddress,
          "retirementAge": retirementAge,
          "title": title,
          "zakatExempt": zaKatExempt,
          "nominees": [
            {
              "name": noMName,
              "cnic": noMcNic,
              "relation": noMRelation,
              "mobile": noMMobile
            },
          ],
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
        if (e.toString() == 'Exception: ' + common!.meta!.error.toString()) {
          throw Exception(common!.meta!.error.toString());
        } else {
          throw Exception('No Internet');
        }
      }
    }
  }

  Future<Common> onPartialSavingForDigUserScreen3(
      String domesticCounterParties,
      String domesticGeographies,
      String internationalCounterParties,
      String internationalGeographies,
      String employerDesignation,
      String employerName,
      String employerNatureOfBusiness,
      String employerProfession,
      String preferedModeOfTrans,
      int expTurnoverInAccAmount,
      String expTurnoverInAccType,
      int expectedInvestmentAmount,
      int annualIncome,
      bool kycDisclaimerChecked,
      String occupation,
      String sourceOfIncome,
      bool oneAns,
      int qOne,
      bool twoAns,
      int qTwo,
      bool threeAns,
      int qThree,
      bool fourAns,
      int qFour,
      bool fiveAns,
      int qFive,
      String cNic,
      String sessionID) async {
    Common? common;
    try {
      printInfo(
          info: jsonEncode(<String, dynamic>{
        "requestFromScreenNo": 3,
        "cnic": cNic,
        "sessionID": sessionID,
        "domesticCounterParties": domesticCounterParties,
        "domesticGeographies": domesticGeographies,
        "internationalCounterParties": internationalCounterParties,
        "internationalGeographies": internationalGeographies,
        "employerDesignation": employerDesignation,
        "employerName": employerName,
        "employerNatureOfBusiness": employerNatureOfBusiness,
        "employerProfession": employerProfession,
        "preferedModeOfTrans": preferedModeOfTrans,
        "expTurnoverInAccAmount": expTurnoverInAccAmount,
        "expTurnoverInAccType": expTurnoverInAccType,
        "expectedInvestmentAmount": expectedInvestmentAmount,
        "annualIncome": annualIncome,
        "kycDisclaimerChecked": kycDisclaimerChecked,
        "occupation": occupation,
        "otherOccupation": null,
        "otherSourceOfIncome": "test",
        "sourceOfIncome": sourceOfIncome,
        "pepsInfo": [
          {"answer": oneAns, "questionCode": qOne},
          {"answer": twoAns, "questionCode": qTwo},
          {"answer": threeAns, "questionCode": qThree},
          {"answer": fourAns, "questionCode": qFour},
          {"answer": fiveAns, "questionCode": qFive}
        ]
      }.toString()));
      final response = await http.post(
        Uri.parse(_epPartialSavingForDigUser),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          "requestFromScreenNo": 3,
          "cnic": cNic,
          "sessionID": sessionID,
          "domesticCounterParties": domesticCounterParties,
          "domesticGeographies": domesticGeographies,
          "internationalCounterParties": internationalCounterParties,
          "internationalGeographies": internationalGeographies,
          "employerDesignation": employerDesignation,
          "employerName": employerName,
          "employerNatureOfBusiness": employerNatureOfBusiness,
          "employerProfession": employerProfession,
          "preferedModeOfTrans": preferedModeOfTrans,
          "expTurnoverInAccAmount": expTurnoverInAccAmount,
          "expTurnoverInAccType": expTurnoverInAccType,
          "expectedInvestmentAmount": expectedInvestmentAmount,
          "annualIncome": annualIncome,
          "kycDisclaimerChecked": kycDisclaimerChecked,
          "occupation": occupation,
          "otherOccupation": null,
          "otherSourceOfIncome": "test",
          "sourceOfIncome": sourceOfIncome,
          "pepsInfo": [
            {"answer": oneAns, "questionCode": qOne},
            {"answer": twoAns, "questionCode": qTwo},
            {"answer": threeAns, "questionCode": qThree},
            {"answer": fourAns, "questionCode": qFour},
            {"answer": fiveAns, "questionCode": qFive}
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
        if (e.toString() == 'Exception: ' + common!.meta!.error.toString()) {
          throw Exception(common!.meta!.error.toString());
        } else {
          throw Exception('No Internet');
        }
      }
    }
  }

  Future<Common> onPartialSavingForDigUserScreen5(
      int rpqAge,
      bool rpqDisclaimerChecked,
      int rpqFinacialPosition,
      int rpqInvestmentHorizon,
      int rpqInvestmentKnowledge,
      int rpqInvestmentObjective,
      int rpqMaritalStatus,
      int rpqNoOfDependants,
      int rpqOccupation,
      int rpqQualification,
      int rpqRiskAppetite,
      int rpqTotalScore,
      String cNic,
      String sessionID) async {
    Common? common;
    try {
      printInfo(
          info: jsonEncode(<String, dynamic>{
        "requestFromScreenNo": 5,
        "cnic": cNic,
        "sessionID": sessionID,
        "rpqAge": rpqAge,
        "rpqDisclaimerChecked": rpqDisclaimerChecked,
        "rpqFinacialPosition": rpqFinacialPosition,
        "rpqInvestmentHorizon": rpqInvestmentHorizon,
        "rpqInvestmentKnowledge": rpqInvestmentKnowledge,
        "rpqInvestmentObjective": rpqInvestmentObjective,
        "rpqMaritalStatus": rpqMaritalStatus,
        "rpqNoOfDependants": rpqNoOfDependants,
        "rpqOccupation": rpqOccupation,
        "rpqQualification": rpqQualification,
        "rpqRiskAppetite": rpqRiskAppetite,
        "rpqTotalScore": rpqTotalScore
      }.toString()));
      final response = await http.post(
        Uri.parse(_epPartialSavingForDigUser),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          "requestFromScreenNo": 5,
          "cnic": cNic,
          "sessionID": sessionID,
          "rpqAge": rpqAge,
          "rpqDisclaimerChecked": rpqDisclaimerChecked,
          "rpqFinacialPosition": rpqFinacialPosition,
          "rpqInvestmentHorizon": rpqInvestmentHorizon,
          "rpqInvestmentKnowledge": rpqInvestmentKnowledge,
          "rpqInvestmentObjective": rpqInvestmentObjective,
          "rpqMaritalStatus": rpqMaritalStatus,
          "rpqNoOfDependants": rpqNoOfDependants,
          "rpqOccupation": rpqOccupation,
          "rpqQualification": rpqQualification,
          "rpqRiskAppetite": rpqRiskAppetite,
          "rpqTotalScore": rpqTotalScore
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
        if (e.toString() == 'Exception: ' + common!.meta!.error.toString()) {
          throw Exception(common!.meta!.error.toString());
        } else {
          throw Exception('No Internet');
        }
      }
    }
  }

  Future<Common> onPartialSavingForDigUserScreen6(
      Uint8List? cNicBack,
      Uint8List? cNicFront,
      Uint8List? incomeProof,
      Uint8List? sigPaper,
      Uint8List? zaKat,
      Uint8List? mobileProof,
      Uint8List? nominee,
      bool disClaimer,
      String cNic,
      String sessionID) async {
    Common? common;
    try {
      printInfo(
          info: jsonEncode(<String, dynamic>{
        "requestFromScreenNo": 6,
        "cnic": cNic,
        "sessionID": sessionID,
        "cnicBackDoc": {
          "fileName": "cnicBack.jpg",
          "fileExtension": ".jpg",
          "fileContent": cNicBack
        },
        "cnicFrontDoc": {
          "fileName": "cnicFront.jpg",
          "fileExtension": ".jpg",
          "fileContent": cNicFront
        },
        "incomeProofDoc": {
          "fileName": "income.jpg",
          "fileExtension": ".jpg",
          "fileContent": incomeProof
        },
        "mobileNoProofDoc": {
          "fileName": "mobile.jpg",
          "fileExtension": ".jpg",
          "fileContent": mobileProof
        },
        "signatureDoc": {
          "fileName": "sig.jpg",
          "fileExtension": ".jpg",
          "fileContent": sigPaper
        },
        "zakatDeclarationDoc": zaKat != null
            ? {
                "fileName": "zakat.jpg",
                "fileExtension": ".jpg",
                "fileContent": zaKat
              }
            : null,
        "requiredDocs": [
          [
            nominee != null
                ? {
                    "documentName": "nomineeDoc",
                    "fileName": "nominee.jpg",
                    "fileExtension": ".jpg",
                    "fileContent": nominee
                  }
                : null
          ]
        ]
      }.toString()));
      final response = await http.post(
        Uri.parse(_epPartialSavingForDigUser),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          "requestFromScreenNo": 6,
          "cnic": cNic,
          "sessionID": sessionID,
          "cnicBackDoc": {
            "fileName": "cnicBack.jpg",
            "fileExtension": ".jpg",
            "fileContent": cNicBack
          },
          "cnicFrontDoc": {
            "fileName": "cnicFront.jpg",
            "fileExtension": ".jpg",
            "fileContent": cNicFront
          },
          "incomeProofDoc": {
            "fileName": "income.jpg",
            "fileExtension": ".jpg",
            "fileContent": incomeProof
          },
          "mobileNoProofDoc": mobileProof != null
              ? {
                  "fileName": "mobile.jpg",
                  "fileExtension": ".jpg",
                  "fileContent": mobileProof
                }
              : null,
          "signatureDoc": {
            "fileName": "sig.jpg",
            "fileExtension": ".jpg",
            "fileContent": sigPaper
          },
          "zakatDeclarationDoc": zaKat != null
              ? {
                  "fileName": "zakat.jpg",
                  "fileExtension": ".jpg",
                  "fileContent": zaKat
                }
              : null,
          "docUploadDisclaimerChecked": disClaimer,
          "requiredDocs": [
            nominee != null
                ? {
                    "fileName": "nominee.jpg",
                    "fileExtension": ".jpg",
                    "fileContent": nominee
                  }
                : null
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
        if (e.toString() == 'Exception: ' + common!.meta!.error.toString()) {
          throw Exception(common!.meta!.error.toString());
        } else {
          throw Exception('No Internet');
        }
      }
    }
  }

  Future<Common> onSaveDigUser(String cNic, String sessionID) async {
    Common? common;
    try {
      printInfo(
          info: jsonEncode(<String, dynamic>{
        "cnic": cNic,
        "sessionID": sessionID
      }.toString()));
      final response = await http.post(
        Uri.parse(_epSaveDigUser),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body:
            jsonEncode(<String, dynamic>{"cnic": cNic, "sessionID": sessionID}),
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
        if (e.toString() == 'Exception: ' + common!.meta!.error.toString()) {
          throw Exception(common!.meta!.error.toString());
        } else {
          throw Exception('No Internet');
        }
      }
    }
  }

  Future<Common> onVpsContribution(
      String userId,
      String userType,
      String sessionId,
      String accessCode,
      String sessionStartDate,
      String transactionValue,
      String fundCode,
      String bankBranch,
      String folioNumber,
      String paymentMode,
      String chequeDate,
      String chequeNo,
      String paymentExtension,
      Uint8List? paymentProof,
      String depositExtension,
      Uint8List? depositProof,
      String authorizationPinCode,
      String bankAccountNo,
      String collectionBankCode,
      String collectionBankAccount) async {
    Common? common;
    try {
      printInfo(
          info: jsonEncode(<String, dynamic>{
        "userId": userId,
        "userType": userType,
        "sessionId": sessionId,
        "accessCode": accessCode,
        "sessionStartDate": sessionStartDate,
        "transactionValue": transactionValue,
        "fundCode": fundCode,
        "bankBranch": bankBranch,
        "folioNumber": folioNumber,
        "paymentMode": paymentMode,
        "chequeDate": chequeDate,
        "chequeNo": chequeNo,
        "paymentExtension": paymentExtension,
        "paymentProof": paymentProof,
        "depositExtension": depositExtension,
        "depositProof": depositProof,
        "authorizationPinCode": authorizationPinCode,
        "bankAccountNo": bankAccountNo,
        "collectionBankCode": collectionBankCode,
        "collectionBankAccount": collectionBankAccount
      }.toString()));
      final response = await http.post(
        Uri.parse(_epVpsContribution),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          "userId": userId,
          "userType": userType,
          "sessionId": sessionId,
          "accessCode": accessCode,
          "sessionStartDate": sessionStartDate,
          "transactionValue": transactionValue,
          "fundCode": fundCode,
          "bankBranch": bankBranch,
          "folioNumber": folioNumber,
          "paymentMode": paymentMode,
          "chequeDate": chequeDate,
          "chequeNo": chequeNo,
          "paymentExtension": paymentExtension,
          "paymentProof": paymentProof,
          "depositExtension": depositExtension,
          "depositProof": depositProof,
          "authorizationPinCode": authorizationPinCode,
          "bankAccountNo": bankAccountNo,
          "collectionBankCode": collectionBankCode,
          "collectionBankAccount": collectionBankAccount
        }),
      );
      if (response.statusCode == 200) {
        printInfo(info: response.body.toString());
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
        if (e.toString() == 'Exception: ' + common!.meta!.error.toString()) {
          throw Exception(common!.meta!.error.toString());
        } else {
          throw Exception('No Internet');
        }
      }
    }
  }

  Future<VpsLoadFolioFunds> onVpsLoadFolioFunds(
      String folioNumber, String requestType) async {
    printInfo(
        info: jsonEncode(<String, String>{
      'folioNumber': folioNumber,
      'requestType': requestType
    }).toString());
    try {
      final response = await http.post(
        Uri.parse(_epVpsLoadFolioFunds),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'folioNumber': folioNumber,
          'requestType': requestType
        }),
      );
      printInfo(info: response.body.toString());
      if (response.statusCode == 200) {
        VpsLoadFolioFunds loadFundsPlans =
            VpsLoadFolioFunds.fromJson(jsonDecode(response.body));
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

  Future<VpsLoadFundPlan> onVpsRedLoadFolioFunds(
      String folioNumber, String requestType, String userId) async {
    printInfo(
        info: jsonEncode(<String, String>{
      'userId': userId,
      'folioNumber': folioNumber,
      'requestType': requestType
    }).toString());
    try {
      final response = await http.post(
        Uri.parse(_epLoadFundsPlans),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'userId': userId,
          'folioNumber': folioNumber,
          'requestType': requestType
        }),
      );
      printInfo(info: response.body.toString());
      if (response.statusCode == 200) {
        VpsLoadFundPlan loadFundsPlans =
            VpsLoadFundPlan.fromJson(jsonDecode(response.body));
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

  Future<Common> onVpsGeneratePinCode(
      String userId, String folioNumber, String req) async {
    try {
      final response = await http.post(
        Uri.parse(_epVpsGeneratePinCode),
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

  Future<LoadBalancesForVpsRedemption> onVpsLoadBalancesForVpsRedemption(
      String folioNumber, String fundCode, String? classCode) async {
    try {
      LoadBalancesForVpsRedemption? loadBalancesForVpsRedemption;
      printInfo(
          info: jsonEncode(<String, String>{
        "folioNumber": folioNumber,
        "fundCode": fundCode,
        "classCode": classCode!
      }).toString());
      final response = await http.post(
        Uri.parse(_epVpsLoadBalancesForVpsRedemption),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          "folioNumber": folioNumber,
          "fundCode": fundCode,
          "classCode": classCode!
        }),
      );
      if (response.statusCode == 200) {
        printInfo(info: response.body.toString());
        loadBalancesForVpsRedemption =
            LoadBalancesForVpsRedemption.fromJson(jsonDecode(response.body));
        if (loadBalancesForVpsRedemption.meta!.code.toString() ==
            200.toString()) {
          return loadBalancesForVpsRedemption;
        } else {
          throw Exception(loadBalancesForVpsRedemption.meta!.message);
        }
      } else {
        throw Exception('No Internet');
      }
    } catch (e) {
      throw Exception('No Internet');
    }
  }

  Future<Common> onSaveVpsRedemption(
    String userId,
    String userType,
    String sessionId,
    String accessCode,
    String sessionStartDate,
    String redTransType,
    String transactionValue,
    String availableBalance,
    String maturity,
    String afterRetirement,
    String fundCode,
    String unitClass,
    String folioNumber,
    String authorizationPinCode,
    String yearOne,
    String taxPaidOne,
    String taxableSalaryOne,
    Uint8List? taxOne,
    String taxExtOne,
    String yearTwo,
    String taxPaidTwo,
    String taxableSalaryTwo,
    Uint8List? taxTwo,
    String taxExtTwo,
    String yearThree,
    String taxPaidThree,
    String taxableSalaryThree,
    Uint8List? taxThree,
    String taxExtThree,
  ) async {
    Common? common;
    try {
      printInfo(
          info: jsonEncode(<String, dynamic>{
        "userId": userId,
        "userType": userType,
        "sessionId": sessionId,
        "accessCode": accessCode,
        "sessionStartDate": sessionStartDate,
        "redTransType": redTransType,
        "transactionValue": transactionValue,
        "availableBalance": availableBalance,
        "maturity": maturity,
        "afterRetirement": afterRetirement,
        "fundCode": fundCode,
        "unitClass": unitClass,
        "folioNumber": folioNumber,
        "authorizationPinCode": authorizationPinCode,
        "taxDetails": [
          {
            "year": yearOne,
            "taxPaid": taxPaidOne,
            "taxableSalary": taxableSalaryOne,
            "paidTaxProof": {
              "fileName": "tax1.jpg",
              "fileExtension": taxExtOne,
              "fileContent": taxOne
            }
          },
          {
            "year": yearTwo,
            "taxPaid": taxPaidTwo,
            "taxableSalary": taxableSalaryTwo,
            "paidTaxProof": {
              "fileName": "tax2.pdf",
              "fileExtension": taxExtTwo,
              "fileContent": taxTwo
            }
          },
          {
            "year": yearThree,
            "taxPaid": taxPaidThree,
            "taxableSalary": taxableSalaryThree,
            "paidTaxProof": {
              "fileName": "tax3.jpg",
              "fileExtension": taxExtThree,
              "fileContent": taxThree
            }
          }
        ]
      }.toString()));
      final response = await http.post(
        Uri.parse(_epVpsSaveVpsRedemption),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          "userId": userId,
          "userType": userType,
          "sessionId": sessionId,
          "accessCode": accessCode,
          "sessionStartDate": sessionStartDate,
          "redTransType": redTransType,
          "transactionValue": transactionValue,
          "availableBalance": availableBalance,
          "maturity": maturity,
          "afterRetirement": afterRetirement,
          "fundCode": fundCode,
          "unitClass": unitClass,
          "folioNumber": folioNumber,
          "authorizationPinCode": authorizationPinCode,
          "taxDetails": [
            {
              "year": yearOne,
              "taxPaid": taxPaidOne,
              "taxableSalary": taxableSalaryOne,
              "paidTaxProof": {
                "fileName": "tax1.jpg",
                "fileExtension": taxExtOne,
                "fileContent": taxOne
              }
            },
            {
              "year": yearTwo,
              "taxPaid": taxPaidTwo,
              "taxableSalary": taxableSalaryTwo,
              "paidTaxProof": {
                "fileName": "tax2.pdf",
                "fileExtension": taxExtTwo,
                "fileContent": taxTwo
              }
            },
            {
              "year": yearThree,
              "taxPaid": taxPaidThree,
              "taxableSalary": taxableSalaryThree,
              "paidTaxProof": {
                "fileName": "tax3.jpg",
                "fileExtension": taxExtThree,
                "fileContent": taxThree
              }
            }
          ]
        }),
      );
      if (response.statusCode == 200) {
        printInfo(info: response.body.toString());
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
        if (e.toString() == 'Exception: ' + common!.meta!.error.toString()) {
          throw Exception(common!.meta!.error.toString());
        } else {
          throw Exception('No Internet');
        }
      }
    }
  }

  Future<LoadExistingSchemeData> onVpsLoadExistingSchemaData(
      String folioNumber) async {
    try {
      LoadExistingSchemeData? loadExistingSchemeData;
      printInfo(
          info: jsonEncode(<String, String>{
        "folioNumber": folioNumber,
      }).toString());
      final response = await http.post(
        Uri.parse(_epVpsLoadExistingSchemeData),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          "folioNumber": folioNumber,
        }),
      );
      if (response.statusCode == 200) {
        printInfo(info: response.body.toString());
        loadExistingSchemeData =
            LoadExistingSchemeData.fromJson(jsonDecode(response.body));
        if (loadExistingSchemeData.meta!.code.toString() == 200.toString()) {
          return loadExistingSchemeData;
        } else {
          throw Exception(loadExistingSchemeData.meta!.message);
        }
      } else {
        throw Exception('No Internet');
      }
    } catch (e) {
      throw Exception('No Internet');
    }
  }

  Future<LoadSchemeAllocations> onVpsLoadSchemeAllocations(String folioNumber,
      String fundCode, String schemeCode, String previousSchemeCode) async {
    try {
      LoadSchemeAllocations? loadSchemeAllocations;
      printInfo(
          info: jsonEncode(<String, String>{
        "folioNumber": folioNumber,
        "fundCode": fundCode,
        "schemeCode": schemeCode,
        "previousSchemeCode": previousSchemeCode
      }).toString());
      final response = await http.post(
        Uri.parse(_epVpsLoadSchemeAllocations),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          "folioNumber": folioNumber,
          "fundCode": fundCode,
          "schemeCode": schemeCode,
          "previousSchemeCode": previousSchemeCode
        }),
      );
      if (response.statusCode == 200) {
        printInfo(info: response.body.toString());
        loadSchemeAllocations =
            LoadSchemeAllocations.fromJson(jsonDecode(response.body));
        if (loadSchemeAllocations.meta!.code.toString() == 200.toString()) {
          return loadSchemeAllocations;
        } else {
          throw Exception(loadSchemeAllocations.meta!.message);
        }
      } else {
        throw Exception('No Internet');
      }
    } catch (e) {
      throw Exception('No Internet');
    }
  }

  Future<Common> onSaveChangeScheme(
      String userId,
      String userType,
      String sessionId,
      String accessCode,
      String sessionStartDate,
      String fundCode,
      String folioNumber,
      String schemeCode,
      String previousSchemeCode,
      String authorizationPinCode,
      List<pension.PensionSubFunds>? list) async {
    Common? common;
    try {
      printInfo(
          info: jsonEncode(<String, dynamic>{
        "userId": userId,
        "userType": userType,
        "sessionId": sessionId,
        "accessCode": accessCode,
        "sessionStartDate": sessionStartDate,
        "fundCode": fundCode,
        "folioNumber": folioNumber,
        "schemeCode": schemeCode,
        "previousSchemeCode":
            previousSchemeCode, //value obtained from "loadExistingSchemeData" api call
        "authorizationPinCode": authorizationPinCode,
        "pensionSubfunds": list
      }.toString()));
      final response = await http.post(
        Uri.parse(_epVpsSaveChangeScheme),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          "userId": userId,
          "userType": userType,
          "sessionId": sessionId,
          "accessCode": accessCode,
          "sessionStartDate": sessionStartDate,
          "fundCode": fundCode,
          "folioNumber": folioNumber,
          "schemeCode": schemeCode,
          "previousSchemeCode":
              previousSchemeCode, //value obtained from "loadExistingSchemeData" api call
          "authorizationPinCode": authorizationPinCode,
          "pensionSubfunds": list
        }),
      );
      if (response.statusCode == 200) {
        printInfo(info: response.body.toString());
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
        if (e.toString() == 'Exception: ' + common!.meta!.error.toString()) {
          throw Exception(common!.meta!.error.toString());
        } else {
          throw Exception('No Internet');
        }
      }
    }
  }

  // "01/01/2021"
  Future<VpsViewReport> onVpsViewReport(String accountValue, String fromDate,
      String toDate, String pensionFund, String reportType) async {
    VpsViewReport? vpsViewReport;
    try {
      printInfo(
          info: jsonEncode(<String, dynamic>{
        "folioNumber": accountValue,
        "fromDate": fromDate,
        "toDate": toDate,
        "corporatePrt": "",
        /*pass "1" for corporate account type otherwise ""*/
        "individualPrt": "",
        /*pass "1" for individual account type otherwise ""*/
        "allOption": "ALL",
        /*pass "ALL" for all account type otherwise ""*/
        "pensionFund": pensionFund,
        /*ALL in case of all funds*/
        "reportType": reportType
      }.toString()));
      final response = await http.post(
        Uri.parse(_epVpsViewReport),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          "folioNumber": accountValue,
          "fromDate": fromDate,
          "toDate": toDate,
          "corporatePrt": "",
          /*pass "1" for corporate account type otherwise ""*/
          "individualPrt": "",
          /*pass "1" for individual account type otherwise ""*/
          "allOption": "ALL",
          /*pass "ALL" for all account type otherwise ""*/
          "pensionFund": pensionFund,
          /*ALL in case of all funds*/
          "reportType": reportType
        }),
      );
      if (response.statusCode == 200) {
        printInfo(info: response.body.toString());
        vpsViewReport = VpsViewReport.fromJson(jsonDecode(response.body));
        if (vpsViewReport.meta!.code.toString() == 200.toString()) {
          return vpsViewReport;
        } else {
          throw Exception(vpsViewReport.meta!.error.toString());
        }
      } else {
        throw Exception('No Internet');
      }
    } catch (e) {
      if (e.toString() ==
          'Exception: ' + vpsViewReport!.meta!.error.toString()) {
        throw Exception(vpsViewReport!.meta!.error.toString());
      } else {
        if (e.toString() ==
            'Exception: ' + vpsViewReport!.meta!.error.toString()) {
          throw Exception(vpsViewReport!.meta!.error.toString());
        } else {
          throw Exception('No Internet');
        }
      }
    }
  }
}
