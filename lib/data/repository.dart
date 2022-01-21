import 'dart:typed_data';

import 'package:investintrust/data/models/calculate_tax.dart';
import 'package:investintrust/data/models/daily_nav_prices.dart';
import 'package:investintrust/data/models/load_dashboard.dart';
import 'package:investintrust/data/models/load_fund_plans.dart';
import 'package:investintrust/data/models/login_model.dart';
import 'package:investintrust/data/models/new_user_reg_data.dart';
import 'package:investintrust/data/models/social_media_links.dart';
import 'package:investintrust/data/models/view_reports.dart';
import 'package:investintrust/utils/constants.dart';
import 'package:investintrust/utils/strings.dart';
import 'api_client.dart';
import 'models/city_data.dart';
import 'models/city_sector_model.dart';
import 'models/common_model.dart';
import 'models/gen_verification_code_for_dig_user.dart';
import 'models/load_fund_plans_p.dart';
import 'models/new_dig_user_reg_data_after_otp.dart';
import 'models/new_dig_user_reg_data_before_otp.dart';
import 'models/new_dig_user_reg_data_req_list.dart';
import 'models/new_user_pin_gen.dart';
import 'models/new_user_reg.dart';
import 'models/state_data.dart';
import 'models/validate_verification_code_for_dig_user.dart';

class Repository {
  final _apiClient = ApiClient();

  Future<SocialMediaLink> socialMediaLinks() => _apiClient.socialMediaLinks();

  Future<LoginModel> onLogin(String name, String password) =>
      _apiClient.onLogin(name, password);

  Future<Common> onResetPassword(String userId, String cNic) =>
      _apiClient.onResetPassword(userId, cNic);

  Future<LoadFundsPlans> onLoadFundsPlans(
          String fundCode, String folioNumber, String requestType) =>
      _apiClient.onLoadFundsPlans(
          Constant.userId, fundCode, folioNumber, requestType);


  Future<LoadFundsPlansP> onLoadFundsPlansP(
      String fundCode, String folioNumber, String requestType,String classCode) =>
      _apiClient.onLoadFundsPlansP(
          Constant.userId, fundCode, folioNumber, requestType,classCode);

  Future<LoadDashboard> onLoadDashBoard(String folioNumber) =>
      _apiClient.onLoadDashBoard(Strings.userId, folioNumber);

  Future<CalculateTax> onCalculateTax(String salaried, String annualIncome) =>
      _apiClient.onCalculateTax(salaried, annualIncome);

  Future<DailyNavPrices> onLoadDailyNavPrices() =>
      _apiClient.onLoadDailyNavPrices();

  Future<NewUserRegData> onNewUserRegData() => _apiClient.onNewUserRegData();

  Future<CityData> onCityData(String countryCode) =>
      _apiClient.onCityData(countryCode);

  Future<StateData> onStateData(String countryCode) =>
      _apiClient.onStateData(countryCode);
  Future<CitySector> onCitySectorData(String cityCode) =>
      _apiClient.onCitySectorData(cityCode);

  Future<NewUserPinGenration> onNewUserPinGenration(
          String address, String cell, String cNic, String email) =>
      _apiClient.onNewUserPinGenration(address, cell, cNic, email);

  Future<ViewReport> onViewReport(String fromDate, String toDate,
          String fundCode, String reportType, String folioNumber) =>
      _apiClient.onViewReport(
          fromDate, toDate, fundCode, reportType, folioNumber, Constant.userId);

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
          String pinCodeExpiryConfigID) =>
      _apiClient.onRegNewUser(
          title,
          fatherOrHusbandName,
          cnicIsueDate,
          cNicExpiryDate,
          address,
          country,
          phone,
          cell,
          email,
          gender,
          occupation,
          incomeSource,
          name,
          cnic,
          passport,
          ntn,
          city,
          otherCity,
          sector,
          fax,
          birthDate,
          maritalStatus,
          incomeBracket,
          religion,
          filerNonFiler,
          pinCode,
          pinCodeExpiryConfigID);

  Future<Common> onGeneratePinCode(String folioNumber, String req) async =>
      _apiClient.onGeneratePinCode(Constant.userId, folioNumber, req);

  // Future<Common> onSaveRedemption(String accessCode,String authorizationPinCode,
  //     String folioNumber,String fundCode,
  //     String redTransType,String sessionId,
  //     String sessionStartDate,String totalUnits,
  //     String transactionValue,String unitClass,
  //     String unitPlan,String userId,
  //     String userType
  //     ) => _apiClient.onSaveRedemption(accessCode, authorizationPinCode,
  //     folioNumber, fundCode, redTransType, sessionId,
  //     sessionStartDate, totalUnits, transactionValue,
  //     unitClass, unitPlan, userId, userType);

  Future<Common> onSaveFundTransfer(
    String authorizationPinCode,
    String folioNumber,
    String toFolioNumber,
    String fundCode,
    String redTransType,
    String totalUnits,
    String transactionValue,
    String toFundCode,
  ) =>
      _apiClient.onSaveFundTransfer(
          Constant.loginModel!.response!.user!.sessionAccessCode ?? '',
          authorizationPinCode,
          folioNumber,
          toFolioNumber,
          fundCode,
          redTransType,
          Constant.loginModel!.response!.user!.sessionId ?? '',
          Constant.loginModel!.response!.user!.sessionDateTime ?? '',
          totalUnits,
          transactionValue,
          'XX',
          '0',
          Constant.loginModel!.response!.user!.userid ?? '',
          Constant.loginModel!.response!.user!.userType ?? '',
          toFundCode,
          'XX',
          '0');
  Future<Common> onSaveRedemption(
    String authorizationPinCode,
    String folioNumber,
    // String toFolioNumber,
    String fundCode,
    String redTransType,
    String totalUnits,
    String transactionValue,
    // String toFundCode,
  ) =>
      _apiClient.onSaveRedemption(
          Constant.loginModel!.response!.user!.sessionAccessCode ?? '',
          authorizationPinCode,
          folioNumber,
          fundCode,
          redTransType,
          Constant.loginModel!.response!.user!.sessionId!,
          Constant.loginModel!.response!.user!.sessionDateTime!,
          totalUnits,
          transactionValue,
          'XX',
          '0',
          Constant.loginModel!.response!.user!.userid ?? '',
          Constant.loginModel!.response!.user!.userType ?? '');

  Future<NewDigUserRegDataBeforeOTP> onNewDigUserRegDataBeforeOTP() =>
      _apiClient.onNewDigUserRegDataBeforeOTP();

  Future<Common> onGenVerificationCodeForDigUser(
    String cNic,
    String email,
    String mobile,
  ) =>
      _apiClient.onGenVerificationCodeForDigUser(cNic, email, mobile);

  Future<ValidateVerificationCodeForDigUser>
      onValidateVerificationCodeForDigUser(
    String cNic,
    String email,
    String mobile,
    String mobileRegisteredWith,
    String accountTypeToBeOpened,
    String verificationCode,
  ) =>
          _apiClient.onValidateVerificationCodeForDigUser(cNic, email, mobile,
              mobileRegisteredWith, accountTypeToBeOpened, verificationCode);

  Future<Common> onFatcaScreenForDigUser(
          String birthCitycode,
          String birthCountrycode,
          String birthStatecode,
          bool disclamierCheck,
          bool fatcaDisclamierCheck,
          String otherTaxResCountry,
          String taxPaidCountry,
          String taxResCountryOtherThanPak,
          String titleOfAccount,
          list) =>
      _apiClient.onFatcaScreenForDigUser(
          birthCitycode,
          birthCountrycode,
          birthStatecode,
          disclamierCheck,
          fatcaDisclamierCheck,
          otherTaxResCountry,
          taxPaidCountry,
          taxResCountryOtherThanPak,
          titleOfAccount,
          list,Constant.cNic,Constant.sessionID);

  Future<NewDigUserRegDataAfterOTP> onNewDigUserRegDataAfterOTP() =>
      _apiClient.onNewDigUserRegDataAfterOTP();


  Future<Common> onPartialSavingForDigUser(
      String email,String mobile,String mobileRegWith,String accountTypeOpened,
      String bankAccountNo,String bankBranchAddress,String bankName,bool basicInfoDisclaimerChecked,
      String bankCityCode,String city,String cNicExpiryDate,String cNicIssueDate,String country,
      String customerName,String dateOfBirth,String dividendMandate,String fatherSpouseName,
      String mailingAddress,String mailingCountryCode,String mailingCity,String maritalStatus,
      String mothersMaidenName,String nationalityCode,String pakResident,String religion,String residentialAddress,
      int retirementAge,String title,bool zaKatExempt,String noMName,String noMcNic,
      String noMRelation,String noMMobile,
      ) =>
      _apiClient.onPartialSavingForDigUser(email, mobile,
          mobileRegWith, accountTypeOpened, bankAccountNo,
          bankBranchAddress, bankName, basicInfoDisclaimerChecked,
          bankCityCode, city, cNicExpiryDate, cNicIssueDate, country,
          customerName, dateOfBirth, dividendMandate, fatherSpouseName,
          mailingAddress, mailingCountryCode, mailingCity, maritalStatus,
          mothersMaidenName, nationalityCode, pakResident, religion ,residentialAddress,
          retirementAge, title, zaKatExempt, noMName, noMcNic, noMRelation, noMMobile,
          Constant.cNic,Constant.sessionID
      );




  Future<Common> onPartialSavingForDigUserScreen3(
      String domesticCounterParties,String domesticGeographies,String internationalCounterParties,String internationalGeographies,
      String employerDesignation,
      String employerName,
      String employerNatureOfBusiness,String employerProfession,
      String preferedModeOfTrans,int expTurnoverInAccAmount,String expTurnoverInAccType,int expectedInvestmentAmount,
      int annualIncome,
      bool kycDisclaimerChecked,String occupation,String sourceOfIncome,
      bool oneAns,int qOne,bool twoAns,int qTwo,bool threeAns,int qThree,bool fourAns,int qFour,bool fiveAns,int qFive
      ) =>
      _apiClient.onPartialSavingForDigUserScreen3(domesticCounterParties, domesticGeographies,
          internationalCounterParties, internationalGeographies, employerDesignation, employerName,
          employerNatureOfBusiness, employerProfession, preferedModeOfTrans, expTurnoverInAccAmount,
          expTurnoverInAccType, expectedInvestmentAmount, annualIncome, kycDisclaimerChecked, occupation,
          sourceOfIncome, oneAns, qOne, twoAns, qTwo, threeAns, qThree, fourAns, qFour, fiveAns, qFive,
          Constant.cNic,Constant.sessionID
      );


  Future<Common> onPartialSavingForDigUserScreen5(
      int rpqAge,
      bool rpqDisclaimerChecked, int rpqFinacialPosition,
      int rpqInvestmentHorizon,int rpqInvestmentKnowledge,
      int rpqInvestmentObjective, int rpqMaritalStatus,
      int rpqNoOfDependants,int rpqOccupation,
      int rpqQualification,int rpqRiskAppetite,
      int rpqTotalScore,
      ) =>
      _apiClient.onPartialSavingForDigUserScreen5(rpqAge,
          rpqDisclaimerChecked, rpqFinacialPosition, rpqInvestmentHorizon,
          rpqInvestmentKnowledge, rpqInvestmentObjective, rpqMaritalStatus,
          rpqNoOfDependants, rpqOccupation, rpqQualification,
          rpqRiskAppetite, rpqTotalScore,Constant.cNic,Constant.sessionID);



  Future<NewDigUserRegDataRpqList> onNewDigUserRegDataRpqList() =>
      _apiClient.onNewDigUserRegDataRpqList();


  Future<Common> onPartialSavingForDigUserScreen6(
      Uint8List? cNicBack,
      Uint8List? cNicFront,
      Uint8List? incomeProof,
      Uint8List? sigPaper,
      ) =>
      _apiClient.onPartialSavingForDigUserScreen6(cNicBack,
          cNicFront, incomeProof,
          sigPaper,Constant.cNic,Constant.sessionID);


  Future<Common> onSaveDigUser(
      ) =>
      _apiClient.onSaveDigUser(Constant.cNic, Constant.sessionID);


  Future<Common> onSavePurchase(
      String fundCode,
      String folioNumber,
      String transactionValue,
      String chequeNo,
      String chequeDate,
      String bankName,
      String bankAccountNo,
      String pinCode,
      String paymentMode,
      String collectionBankAccount,
      String collectionBankCode,
      String fundSaleLoad,
      String paymentProof,
      String paymentExtension,
      String depositProof,
      String depositExtension,
      ) => _apiClient.onSavePurchase(Constant.loginModel!.response!.user!.userid ?? '',
      fundCode, folioNumber,
      transactionValue, chequeNo, chequeDate, bankName, bankAccountNo,
      Constant.loginModel!.response!.user!.sessionAccessCode ?? '',
      pinCode, Constant.loginModel!.response!.user!.authorization ?? '',
      Constant.loginModel!.response!.user!.sessionDateTime ?? '',
      Constant.loginModel!.response!.user!.userType ?? '',
      paymentMode, collectionBankAccount, collectionBankCode, fundSaleLoad,
      paymentProof, paymentExtension, depositProof, depositExtension);


}
