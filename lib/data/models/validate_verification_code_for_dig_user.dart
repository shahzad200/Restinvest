import 'dart:typed_data';

class ValidateVerificationCodeForDigUser {
  ValidateVerificationCodeForDigUser({
    this.action,
    this.meta,
    this.response,
  });
  String? action;
  Meta?meta;
  Response? response;

  ValidateVerificationCodeForDigUser.fromJson(Map<dynamic, dynamic> json){
    action = json['action'];
    meta = Meta.fromJson(json['meta']);
    response = Response.fromJson(json['response']);
  }

  Map<dynamic, dynamic> toJson() {
    final _data = <dynamic, dynamic>{};
    _data['action'] = action;
    _data['meta'] = meta!.toJson();
    _data['response'] = response!.toJson();
    return _data;
  }
}

class Meta {
  Meta({
    this.code,
    this.error,
    this.message,
  });
  String? code;
  String? error;
  String? message;

  Meta.fromJson(Map<dynamic, dynamic> json){
    code = json['code'].toString();
    error = json['error'];
    message = json['message'];
  }

  Map<dynamic, dynamic> toJson() {
    final _data = <dynamic, dynamic>{};
    _data['code'] = code;
    _data['error'] = error;
    _data['message'] = message;
    return _data;
  }
}

class Response {
  Response({
    this.accountTypeToBeOpened,
    this.cnic,
    this.email,
    this.mobile,
    this.mobileRegisteredWith,
    this.sessionID,
    this.verificationCode,
    this.title,
    this.customerName,
    this.fatherSpouseName,
    this.mothersMaidenName,
    this.cnicIssueDate,
    this.cnicExpiryDate,
    this.dateOfBirth,
    this.maritalStatus,
    this.nationalityCode,
    this.pakResident,
    this.lifetimeCnicExpiry,
    this.mailingAddress,
    this.mailingCountryCode,
    this.mailingOtherCity,
    this.otherCity,
    this.branchCity,
    this.city,
    this.country,
    this.mailingCity,
    this.phoneOne,
    this.phoneTwo,
    this.prevSessionDataFoundForUserFillingForm,
    this.religion,
    this.bankName,
    this.branchName,
    this.residentialAddress,
    this.retirementAge,
    this.zakatExempt,
    this.dividendMandate,
    this.bankBranchAddress,
    this.bankAccountNo,
    this.nominees,
    this.basicInfoDisclaimerChecked,
    this.occupation,
    this.sourceOfIncome,
    this.preferedModeOfTrans,
    this.expTurnoverInAccAmount,
    this.expTurnoverInAccType,
    this.expectedInvestmentAmount,
    this.annualIncome,
    this.pepsInfo,
    this.employerName,
    this.employerDesignation,
    this.employerNatureOfBusiness,
    this.employerProfession,
    this.domesticGeographies,
    this.internationalGeographies,
    this.domesticCounterParties,
    this.internationalCounterParties,
    this.kycDisclaimerChecked,
    this.birthCountryCode,
    this.birthCityCode,
    this.birthStateCode,
    this.crsDisclaimerChecked,
    this.fatcaDisclaimerChecked,
    this.taxPaidCountry,
    this.taxResCountryOtherThanPak,
    this.otherTaxResCountry,
    this.titleOfAccount,
    this.fatcaInfo,
    this.taxIdentificationNumber,
    this.rpqAge,
    this.rpqDisclaimerChecked,
    this.rpqFinacialPosition,
    this.rpqInvestmentHorizon,
    this.rpqInvestmentKnowledge,
    this.rpqInvestmentObjective,
    this.rpqMaritalStatus,
    this.rpqNoOfDependants,
    this.rpqOccupation,
    this.rpqQualification,
    this.rpqRiskAppetite,
    this.rpqTotalScore,
    this.docUploadDisclaimerChecked,
    this.cnicBackDoc,
    this.cnicFrontDoc,
    this.signatureDoc,
    this.incomeProofDoc,
    this.zakatDeclarationDoc,
    this.mobileNoProofDoc,
    this.requiredDocs,
  });
  String? accountTypeToBeOpened;
  String? cnic;
  String? email;
  String? mobile;
  String? mobileRegisteredWith;
  String? sessionID;
  String? verificationCode;
  String? title;
  String? customerName;
  String? fatherSpouseName;
  String? mothersMaidenName;
  Map<String , dynamic>? cnicIssueDate;
  Map<String , dynamic>? cnicExpiryDate;
  Map<String , dynamic>? dateOfBirth;
  String? maritalStatus;
  String? nationalityCode;
  String? pakResident;
  bool? lifetimeCnicExpiry;
  String? mailingAddress;
  String? mailingCountryCode;
  String? mailingOtherCity;
  String? otherCity;
  String? branchCity;
  String? city;
  String? country;
  String? mailingCity;
  String? phoneOne;
  String? phoneTwo;
  bool? prevSessionDataFoundForUserFillingForm;
  String? religion;
  String? bankName;
  String? branchName;
  String? residentialAddress;
  int? retirementAge;
  bool? zakatExempt;
  String? dividendMandate;
  String? bankBranchAddress;
  String? bankAccountNo;
  List<Nominees>? nominees;
  bool? basicInfoDisclaimerChecked;
  String? occupation;
  String? sourceOfIncome;
  String? preferedModeOfTrans;
  int? expTurnoverInAccAmount;
  String? expTurnoverInAccType;
  String? expectedInvestmentAmount;
  String? annualIncome;
  List<PepsInfoList>? pepsInfo;
  String? employerName;
  String? employerDesignation;
  String? employerNatureOfBusiness;
  String? employerProfession;
  String? domesticGeographies;
  String? internationalGeographies;
  String? domesticCounterParties;
  String? internationalCounterParties;
  bool? kycDisclaimerChecked;
  String? birthCountryCode;
  String? birthCityCode;
  String? birthStateCode;
  bool? crsDisclaimerChecked;
  bool? fatcaDisclaimerChecked;
  String? taxPaidCountry;
  String? taxResCountryOtherThanPak;
  String? otherTaxResCountry;
  String? titleOfAccount;
  List<FatcaInfoList>? fatcaInfo;
  String? taxIdentificationNumber;
  int? rpqAge;
  bool? rpqDisclaimerChecked;
  int? rpqFinacialPosition;
  int? rpqInvestmentHorizon;
  int? rpqInvestmentKnowledge;
  int? rpqInvestmentObjective;
  int? rpqMaritalStatus;
  int? rpqNoOfDependants;
  int? rpqOccupation;
  int? rpqQualification;
  int? rpqRiskAppetite;
  int? rpqTotalScore;
  bool? docUploadDisclaimerChecked;
  Map<String , dynamic>? cnicBackDoc;
  Map<String , dynamic>? cnicFrontDoc;
  Map<String , dynamic>? signatureDoc;
  Map<String , dynamic>? incomeProofDoc;
  Map<String , dynamic>? zakatDeclarationDoc;
  Map<String , dynamic>? mobileNoProofDoc;
  List<RedDocs>? requiredDocs;
  Response.fromJson(Map<dynamic, dynamic> json){
    accountTypeToBeOpened = json['accountTypeToBeOpened'];
    cnic = json['cnic'];
    email = json['email'];
    mobile = json['mobile'];
    mobileRegisteredWith = json['mobileRegisteredWith'];
    sessionID = json['sessionID'];
    verificationCode = json['verificationCode'];
    title = json['title'] ?? '';
    customerName = json['customerName'] ?? '';
    fatherSpouseName = json['fatherSpouseName'] ?? '';
    mothersMaidenName = json['mothersMaidenName'] ?? '';
    cnicIssueDate = (json['cnicIssueDate'] ?? null);
    cnicExpiryDate = (json['cnicExpiryDate'] ?? null);
    dateOfBirth = (json['dateOfBirth'] ?? null);
    maritalStatus = json['maritalStatus'] ?? '';
    nationalityCode = json['nationalityCode'] ?? '';
    pakResident = json['pakResident'] ?? '';
    lifetimeCnicExpiry = json['lifetimeCnicExpiry'] ?? false;
    mailingAddress = json['mailingAddress'] ?? '';
    mailingCountryCode = json['mailingCountryCode'] ?? '';
    mailingOtherCity = json['mailingOtherCity'] ?? '';
    otherCity = json['otherCity'] ?? '';
    branchCity = json['branchCity'] ?? '';
    city = json['city'] ?? '';
    country = json['country'] ?? '';
    mailingCity = json['mailingCity'] ?? '';
    phoneOne = json['phoneOne'] ?? '';
    phoneTwo = json['phoneTwo'] ?? '';
    prevSessionDataFoundForUserFillingForm = json['prevSessionDataFoundForUserFillingForm'] ?? false;
    religion = json['religion'] ?? '';
    bankName = json['bankName'] ?? '';
    branchName = json['branchName'] ?? '';
    residentialAddress = json['residentialAddress'] ?? '';
    retirementAge = json['retirementAge'] ?? 0;
    zakatExempt = json['zakatExempt'] ?? false;
    dividendMandate = json['dividendMandate'] ?? '';
    bankBranchAddress = json['bankBranchAddress'] ?? '';
    bankAccountNo = json['bankAccountNo'] ?? '';
    nominees = List.from(json['nominees'] ?? []).map((e)=>Nominees.fromJson(e)).toList();
    basicInfoDisclaimerChecked = json['basicInfoDisclaimerChecked'] ?? false;
    occupation = json['occupation'] ?? '';
    sourceOfIncome = json['sourceOfIncome'] ?? '';
    preferedModeOfTrans = json['preferedModeOfTrans'] ?? '';
    expTurnoverInAccAmount = json['expTurnoverInAccAmount'] ?? 0;
    expTurnoverInAccType = json['expTurnoverInAccType'] ?? '';
    expectedInvestmentAmount = json['expectedInvestmentAmount'] ?? '';
    annualIncome = json['annualIncome'] ?? '';
    pepsInfo = List.from(json['pepsInfo']).map((e)=>PepsInfoList.fromJson(e)).toList();
    // pepsInfo = json['pepsInfo'] == null ? null : List.from(json['pepsInfo']).map((e)=>PepsInfoList.fromJson(e)).toList();
    employerName = json['employerName'] ?? '';
    employerDesignation = json['employerDesignation'] ?? '';
    employerNatureOfBusiness = json['employerNatureOfBusiness'] ?? '';
    employerProfession = json['employerProfession'] ?? '';
    domesticGeographies = json['domesticGeographies'] ?? '';
    internationalGeographies = json['internationalGeographies'] ?? '';
    domesticCounterParties = json['domesticCounterParties'] ?? '';
    internationalCounterParties = json['internationalCounterParties'] ?? '';
    kycDisclaimerChecked = json['kycDisclaimerChecked'] ?? false;
    birthCountryCode = json['birthCountryCode'] ?? '';
    birthCityCode = json['birthCityCode'] ?? '';
    birthStateCode = json['birthStateCode'] ?? '';
    crsDisclaimerChecked = json['crsDisclaimerChecked'] ?? false;
    fatcaDisclaimerChecked = json['fatcaDisclaimerChecked'] ?? false;
    taxPaidCountry = json['taxPaidCountry'] ?? '';
    taxResCountryOtherThanPak = json['taxResCountryOtherThanPak'] ?? '';
    otherTaxResCountry = json['otherTaxResCountry'] ?? '';
    titleOfAccount = json['titleOfAccount'] ?? '';
    fatcaInfo = List.from(json['fatcaInfo']).map((e)=>FatcaInfoList.fromJson(e)).toList();
    taxIdentificationNumber = json['taxIdentificationNumber'] ?? '';
    rpqAge = json['rpqAge'] ?? 0;
    rpqDisclaimerChecked = json['rpqDisclaimerChecked'] ?? false;
    rpqFinacialPosition = json['rpqFinacialPosition'] ?? 0;
    rpqInvestmentHorizon = json['rpqInvestmentHorizon'] ?? 0;
    rpqInvestmentKnowledge = json['rpqInvestmentKnowledge'] ?? 0;
    rpqInvestmentObjective = json['rpqInvestmentObjective'] ?? 0;
    rpqMaritalStatus = json['rpqMaritalStatus'] ?? 0;
    rpqNoOfDependants = json['rpqNoOfDependants'] ?? 0;
    rpqOccupation = json['rpqOccupation'] ?? 0;
    rpqQualification = json['rpqQualification'] ?? 0;
    rpqRiskAppetite = json['rpqRiskAppetite'] ?? 0;
    rpqTotalScore = json['rpqTotalScore'] ?? 0;
    docUploadDisclaimerChecked = json['docUploadDisclaimerChecked'] ?? false;
    cnicBackDoc = json['cnicBackDoc'] ?? null;
    cnicFrontDoc = json['cnicFrontDoc'] ?? null;
    signatureDoc = json['signatureDoc'] ?? null;
    incomeProofDoc = json['incomeProofDoc'] ?? null;
    zakatDeclarationDoc = json['zakatDeclarationDoc'] ?? null;
    mobileNoProofDoc = json['mobileNoProofDoc'] ?? null;
    requiredDocs = List.from(json['requiredDocs']).map((e)=>RedDocs.fromJson(e)).toList();
  }

  Map<dynamic, dynamic> toJson() {
    final _data = <dynamic, dynamic>{};
    _data['accountTypeToBeOpened'] = accountTypeToBeOpened;
    _data['cnic'] = cnic;
    _data['email'] = email;
    _data['mobile'] = mobile;
    _data['mobileRegisteredWith'] = mobileRegisteredWith;
    _data['sessionID'] = sessionID;
    _data['title'] = title;
    _data['customerName'] = customerName;
    _data['verificationCode'] = verificationCode;
    _data['fatherSpouseName'] = fatherSpouseName;
    _data['mothersMaidenName'] = mothersMaidenName;
    _data['cnicIssueDate'] = cnicIssueDate;
    _data['cnicExpiryDate'] = cnicExpiryDate;
    _data['dateOfBirth'] = dateOfBirth;
    _data['maritalStatus'] = maritalStatus;
    _data['nationalityCode'] = nationalityCode;
    _data['pakResident'] = pakResident;
    _data['lifetimeCnicExpiry'] = lifetimeCnicExpiry;
    _data['mailingAddress'] = mailingAddress;
    _data['mailingCountryCode'] = mailingCountryCode;
    _data['mailingOtherCity'] = mailingOtherCity;
    _data['otherCity'] = otherCity;
    _data['branchCity'] = branchCity;
    _data['city'] = city;
    _data['country'] = country;
    _data['mailingCity'] = mailingCity;
    _data['phoneOne'] = phoneOne;
    _data['phoneTwo'] = phoneTwo;
    _data['prevSessionDataFoundForUserFillingForm'] = prevSessionDataFoundForUserFillingForm;
    _data['religion'] = religion;
    _data['bankName'] = bankName;
    _data['branchName'] = branchName;
    _data['residentialAddress'] = residentialAddress;
    _data['retirementAge'] = retirementAge;
    _data['zakatExempt'] = zakatExempt;
    _data['dividendMandate'] = dividendMandate;
    _data['bankBranchAddress'] = bankBranchAddress;
    _data['bankAccountNo'] = bankAccountNo;
    _data['nominees'] = nominees!.map((e)=>e.toJson()).toList();
    _data['basicInfoDisclaimerChecked'] = basicInfoDisclaimerChecked;
    _data['occupation'] = occupation;
    _data['sourceOfIncome'] = sourceOfIncome;
    _data['preferedModeOfTrans'] = preferedModeOfTrans;
    _data['expTurnoverInAccAmount'] = expTurnoverInAccAmount;
    _data['expTurnoverInAccType'] = expTurnoverInAccType;
    _data['expectedInvestmentAmount'] = expectedInvestmentAmount;
    _data['annualIncome'] = annualIncome;
    _data['pepsInfo'] = pepsInfo!.map((e)=>e.toJson()).toList();
    _data['employerName'] = employerName;
    _data['employerDesignation'] = employerDesignation;
    _data['kycDisclaimerChecked'] = kycDisclaimerChecked;
    _data['employerProfession'] = employerProfession;
    _data['employerNatureOfBusiness'] = employerNatureOfBusiness;
    _data['domesticGeographies'] = domesticGeographies;
    _data['internationalGeographies'] = internationalGeographies;
    _data['domesticCounterParties'] = domesticCounterParties;
    _data['internationalCounterParties'] = internationalCounterParties;
    _data['birthCountryCode'] = birthCountryCode;
    _data['birthCityCode'] = birthCityCode;
    _data['birthStateCode'] = birthStateCode;
    _data['crsDisclaimerChecked'] = crsDisclaimerChecked;
    _data['fatcaDisclaimerChecked'] = fatcaDisclaimerChecked;
    _data['taxPaidCountry'] = taxPaidCountry;
    _data['taxResCountryOtherThanPak'] = taxResCountryOtherThanPak;
    _data['otherTaxResCountry'] = otherTaxResCountry;
    _data['titleOfAccount'] = titleOfAccount;
    _data['fatcaInfo'] = fatcaInfo!.map((e)=>e.toJson()).toList();
    _data['taxIdentificationNumber'] = taxIdentificationNumber;
    _data['rpqAge'] = rpqAge;
    _data['rpqDisclaimerChecked'] = rpqDisclaimerChecked;
    _data['rpqInvestmentKnowledge'] = rpqInvestmentKnowledge;
    _data['rpqInvestmentObjective'] = rpqInvestmentObjective;
    _data['rpqMaritalStatus'] = rpqMaritalStatus;
    _data['rpqNoOfDependants'] = rpqNoOfDependants;
    _data['rpqOccupation'] = rpqOccupation;
    _data['rpqQualification'] = rpqQualification;
    _data['rpqRiskAppetite'] = rpqRiskAppetite;
    _data['rpqTotalScore'] = rpqTotalScore;
    _data['docUploadDisclaimerChecked'] = docUploadDisclaimerChecked;
    _data['cnicBackDoc'] = cnicBackDoc;
    _data['cnicFrontDoc'] = cnicFrontDoc;
    _data['signatureDoc'] = signatureDoc;
    _data['incomeProofDoc'] = incomeProofDoc;
    _data['zakatDeclarationDoc'] = zakatDeclarationDoc;
    _data['mobileNoProofDoc'] = mobileNoProofDoc;
    _data['requiredDocs'] = requiredDocs!.map((e)=>e.toJson()).toList();
    return _data;
  }
}


class Nominees {
  Nominees({
    this.address,
    this.cnic,
    this.email,
    this.fatherName,
    this.mobile,
    this.name,
    this.relation,
    this.sharePerc,
  });
  String? address;
  String? cnic;
  String? email;
  String? fatherName;
  String? mobile;
  String? name;
  String? relation;
  String? sharePerc;

  Nominees.fromJson(Map<dynamic, dynamic> json){
    address = json['address'] ?? '';
    cnic = json['cnic'] ?? '';
    email = json['email'] ?? '';
    fatherName = json[fatherName] ?? '';
    mobile = json['mobile'] ?? '';
    name = json['name'] ?? '';
    relation = json['relation'] ?? '';
    sharePerc = json['sharePerc'] ?? '';
  }

  Map<dynamic, dynamic> toJson() {
    final _data = <dynamic, dynamic>{};
    _data['address'] = address;
    _data['cnic'] = cnic;
    _data['email'] = email;
    _data['fatherName'] = fatherName;
    _data['mobile'] = mobile;
    _data['name'] = name;
    _data['relation'] = relation;
    _data['sharePerc'] = sharePerc;
    return _data;
  }
}
class DateForMate {
  DateForMate({
     this.day,
     this.month,
     this.year,
  });

   int? day;
   int? month;
   int? year;

  DateForMate.fromJson(Map<dynamic, dynamic> json){
    day = json['day'];
    month = json['month'];
    year = json['year'];
  }

  Map<dynamic, dynamic> toJson() {
    final _data = <dynamic, dynamic>{};
    _data['day'] = day;
    _data['month'] = month;
    _data['year'] = year;
    return _data;
  }
}

//
// class ValidateVerificationCodeForDigUser {
//   ValidateVerificationCodeForDigUser({
//      this.action,
//      this.meta,
//      this.response,
//   });
//    String? action;
//    Meta? meta;
//    Response? response;
//
//   ValidateVerificationCodeForDigUser.fromJson(Map<String, dynamic> json){
//     action = json['action'];
//     meta = Meta.fromJson(json['meta']);
//     response = Response.fromJson(json['response']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['action'] = action;
//     _data['meta'] = meta!.toJson();
//     _data['response'] = response!.toJson();
//     return _data;
//   }
// }
//
// class Meta {
//   Meta({
//      this.code,
//      this.error,
//      this.message,
//   });
//    String? code;
//    String? error;
//    String? message;
//
//   Meta.fromJson(Map<String, dynamic> json){
//     code = json['code'];
//     error = json['error'];
//     message = json['message'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['code'] = code;
//     _data['error'] = error;
//     _data['message'] = message;
//     return _data;
//   }
// }
//
// class Response {
//   Response({
//      this.accountTypeToBeOpened,
//      this.annualIncome,
//     this.attachementsPath,
//      this.bankAccountNo,
//      this.bankBranchAddress,
//      this.bankName,
//      this.basicInfoDisclaimerChecked,
//      this.birthCityCode,
//      this.birthCountryCode,
//      this.birthStateCode,
//      this.branchCity,
//     this.branchName,
//      this.city,
//     this.clientID,
//      this.cnic,
//      this.cnicBackDoc,
//      this.cnicExpiryDate,
//      this.cnicFrontDoc,
//      this.cnicIssueDate,
//      this.country,
//      this.crsDisclaimerChecked,
//     this.customerCategory,
//      this.customerName,
//      this.dateOfBirth,
//     this.district,
//      this.dividendMandate,
//      this.docUploadDisclaimerChecked,
//     this.domesticCounterParties,
//     this.domesticGeographies,
//     this.email,
//      this.employerDesignation,
//      this.employerName,
//     this.employerNatureOfBusiness,
//      this.employerProfession,
//     this.expTurnoverInAccAmount,
//      this.expTurnoverInAccType,
//      this.expectedInvestmentAmount,
//      this.fatcaDisclaimerChecked,
//      this.fatcaInfo,
//      this.fatherSpouseName,
//     this.incomeBracket,
//      this.incomeProofDoc,
//     this.internationalCounterParties,
//     this.internationalGeographies,
//     this.interviewSchedule,
//      this.interviewScheduleConfirmation,
//      this.interviewScheduleNotfSent,
//      this.kycDisclaimerChecked,
//      this.lifetimeCnicExpiry,
//     this.linkForMissingDetails,
//      this.mailingAddress,
//      this.mailingCity,
//     this.mailingCountryCode,
//      this.mailingOtherCity,
//      this.maritalStatus,
//      this.mobRegWthHisHerName,
//      this.mobile,
//      this.mobileNoProofDoc,
//      this.mobileRegisteredWith,
//      this.moreThanOneTaxCountries,
//      this.mothersMaidenName,
//      this.nationalityCode,
//      this.nominees,
//      this.occupation,
//      this.otherCity,
//     this.otherOccupation,
//      this.otherSourceOfIncome,
//      this.otherTaxResCountry,
//      this.pakResident,
//      this.pepsInfo,
//     this.phoneOne,
//     this.phoneTwo,
//     this.pinCodeExpiry,
//      this.preferedModeOfTrans,
//      this.prevSessionDataFoundForUserFillingForm,
//      this.religion,
//     this.requestFromScreenNo,
//      this.requestToLoadLink,
//      this.requestToValidateVerificationCodes,
//      this.requiredDocs,
//      this.residentialAddress,
//      this.retirementAge,
//     this.rpqAge,
//      this.rpqDisclaimerChecked,
//     this.rpqFinacialPosition,
//     this.rpqInvestmentHorizon,
//     this.rpqInvestmentKnowledge,
//     this.rpqInvestmentObjective,
//     this.rpqMaritalStatus,
//     this.rpqNoOfDependants,
//     this.rpqOccupation,
//     this.rpqQualification,
//     this.rpqRiskAppetite,
//     this.rpqTotalScore,
//      this.savedSessionExpiryInDays,
//      this.sessionID,
//      this.signatureDoc,
//      this.sourceOfIncome,
//     this.stmtRequest,
//     this.taxIdentificationNumber,
//      this.taxPaidCountry,
//      this.taxResCountryOtherThanPak,
//      this.title,
//      this.titleOfAccount,
//     this.verCodeExpiryInMinutes,
//      this.verificationCode,
//     this.vpsOrUmsCall,
//     this.zakatDeclarationDoc,
//      this.zakatExempt,
//   });
//    String? accountTypeToBeOpened;
//    String? annualIncome;
//    Null? attachementsPath;
//    String? bankAccountNo;
//    String? bankBranchAddress;
//    String? bankName;
//    bool? basicInfoDisclaimerChecked;
//    String? birthCityCode;
//    String? birthCountryCode;
//    String? birthStateCode;
//    String? branchCity;
//    Null? branchName;
//    String? city;
//    Null? clientID;
//    String? cnic;
//    CnicBackDoc? cnicBackDoc;
//    CnicExpiryDate? cnicExpiryDate;
//    CnicFrontDoc? cnicFrontDoc;
//    CnicIssueDate? cnicIssueDate;
//    String? country;
//    bool? crsDisclaimerChecked;
//    Null? customerCategory;
//    String? customerName;
//    DateOfBirth? dateOfBirth;
//    Null? district;
//    String? dividendMandate;
//    bool? docUploadDisclaimerChecked;
//    Null? domesticCounterParties;
//    Null? domesticGeographies;
//    String? email;
//    String? employerDesignation;
//    String? employerName;
//    String? employerNatureOfBusiness;
//    String? employerProfession;
//    int? expTurnoverInAccAmount;
//    String? expTurnoverInAccType;
//    String? expectedInvestmentAmount;
//    bool? fatcaDisclaimerChecked;
//    List<FatcaInfo>? fatcaInfo;
//    String? fatherSpouseName;
//    Null? incomeBracket;
//    IncomeProofDoc? incomeProofDoc;
//    Null? internationalCounterParties;
//    Null? internationalGeographies;
//    Null? interviewSchedule;
//    bool? interviewScheduleConfirmation;
//    bool? interviewScheduleNotfSent;
//    bool? kycDisclaimerChecked;
//    bool? lifetimeCnicExpiry;
//    Null? linkForMissingDetails;
//    String? mailingAddress;
//    String? mailingCity;
//    String? mailingCountryCode;
//    String? mailingOtherCity;
//    String? maritalStatus;
//    bool? mobRegWthHisHerName;
//    String? mobile;
//    MobileNoProofDoc? mobileNoProofDoc;
//    String? mobileRegisteredWith;
//    bool? moreThanOneTaxCountries;
//    String? mothersMaidenName;
//    String? nationalityCode;
//    List<Nominees>? nominees;
//    String? occupation;
//    String? otherCity;
//    Null? otherOccupation;
//    String? otherSourceOfIncome;
//    String? otherTaxResCountry;
//    String? pakResident;
//    List<PepsInfo>? pepsInfo;
//    Null? phoneOne;
//    Null? phoneTwo;
//    Null? pinCodeExpiry;
//    String? preferedModeOfTrans;
//    bool? prevSessionDataFoundForUserFillingForm;
//    String? religion;
//    Null? requestFromScreenNo;
//    bool? requestToLoadLink;
//    bool? requestToValidateVerificationCodes;
//    List<dynamic>? requiredDocs;
//    String? residentialAddress;
//    int? retirementAge;
//    Null? rpqAge;
//    bool? rpqDisclaimerChecked;
//    Null? rpqFinacialPosition;
//    Null? rpqInvestmentHorizon;
//    Null? rpqInvestmentKnowledge;
//    Null? rpqInvestmentObjective;
//    Null? rpqMaritalStatus;
//    Null? rpqNoOfDependants;
//    Null? rpqOccupation;
//    Null? rpqQualification;
//    Null? rpqRiskAppetite;
//    Null? rpqTotalScore;
//    int? savedSessionExpiryInDays;
//    String? sessionID;
//    SignatureDoc? signatureDoc;
//    String? sourceOfIncome;
//    Null? stmtRequest;
//    Null? taxIdentificationNumber;
//    String? taxPaidCountry;
//    String? taxResCountryOtherThanPak;
//    String? title;
//    String? titleOfAccount;
//    Null? verCodeExpiryInMinutes;
//    String? verificationCode;
//    Null? vpsOrUmsCall;
//    Null? zakatDeclarationDoc;
//    bool? zakatExempt;
//
//   Response.fromJson(Map<dynamic, dynamic> json){
//     accountTypeToBeOpened = json['accountTypeToBeOpened'] ?? '';
//     annualIncome = json['annualIncome'] ?? '';
//     attachementsPath = null;
//     bankAccountNo = json['bankAccountNo'] ?? '';
//     bankBranchAddress = json['bankBranchAddress'] ?? '';
//     bankName = json['bankName'] ?? '';
//     basicInfoDisclaimerChecked = json['basicInfoDisclaimerChecked'] ?? '';
//     birthCityCode = json['birthCityCode'] ?? '';
//     birthCountryCode = json['birthCountryCode'] ?? '';
//     birthStateCode = json['birthStateCode'] ?? '';
//     branchCity = json['branchCity'] ?? '';
//     branchName = null;
//     city = json['city'] ?? '';
//     clientID = null;
//     cnic = json['cnic'] ?? '';
//     cnicBackDoc = CnicBackDoc.fromJson(json['cnicBackDoc'] ?? '');
//     cnicExpiryDate = CnicExpiryDate.fromJson(json['cnicExpiryDate'] ?? '');
//     cnicFrontDoc = CnicFrontDoc.fromJson(json['cnicFrontDoc'] ?? '');
//     cnicIssueDate = CnicIssueDate.fromJson(json['cnicIssueDate'] ?? '');
//     country = json['country'] ?? '';
//     crsDisclaimerChecked = json['crsDisclaimerChecked'] ?? '';
//     customerCategory = null;
//     customerName = json['customerName'] ?? '';
//     dateOfBirth = DateOfBirth.fromJson(json['dateOfBirth'] ?? '');
//     district = null;
//     dividendMandate = json['dividendMandate'] ?? '';
//     docUploadDisclaimerChecked = json['docUploadDisclaimerChecked'] ?? '';
//     domesticCounterParties = null;
//     domesticGeographies = null;
//     email = json['email'] ?? '';
//     employerDesignation = json['employerDesignation'] ?? '';
//     employerName = json['employerName'] ?? '';
//     employerNatureOfBusiness = json['employerNatureOfBusiness'] ?? '';
//     employerProfession = json['employerProfession'] ?? '';
//     expTurnoverInAccAmount = json['expTurnoverInAccAmount'] ?? '';
//     expTurnoverInAccType = json['expTurnoverInAccType'] ?? '';
//     expectedInvestmentAmount = json['expectedInvestmentAmount'] ?? '';
//     fatcaDisclaimerChecked = json['fatcaDisclaimerChecked'] ?? '';
//     fatcaInfo = List.from(json['fatcaInfo']).map((e)=>FatcaInfo.fromJson(e)).toList();
//     fatherSpouseName = json['fatherSpouseName'] ?? '';
//     incomeBracket = null;
//     incomeProofDoc = IncomeProofDoc.fromJson(json['incomeProofDoc'] ?? '');
//     internationalCounterParties = null;
//     internationalGeographies = null;
//     interviewSchedule = null;
//     interviewScheduleConfirmation = json['interviewScheduleConfirmation'] ?? '';
//     interviewScheduleNotfSent = json['interviewScheduleNotfSent'] ?? '';
//     kycDisclaimerChecked = json['kycDisclaimerChecked'] ?? '';
//     lifetimeCnicExpiry = json['lifetimeCnicExpiry'] ?? '';
//     linkForMissingDetails = null;
//     mailingAddress = json['mailingAddress'] ?? '';
//     mailingCity = json['mailingCity'] ?? '';
//     mailingCountryCode = json['mailingCountryCode'] ?? '';
//     mailingOtherCity = json['mailingOtherCity'] ?? '';
//     maritalStatus = json['maritalStatus'] ?? '';
//     mobRegWthHisHerName = json['mobRegWthHisHerName'] ?? '';
//     mobile = json['mobile'] ?? '';
//     mobileNoProofDoc = MobileNoProofDoc.fromJson(json['mobileNoProofDoc'] ?? '');
//     mobileRegisteredWith = json['mobileRegisteredWith'] ?? '';
//     moreThanOneTaxCountries = json['moreThanOneTaxCountries'] ?? '';
//     mothersMaidenName = json['mothersMaidenName'] ?? '';
//     nationalityCode = json['nationalityCode'] ?? '';
//     nominees = List.from(json['nominees'] ?? []).map((e)=>Nominees.fromJson(e)).toList();
//     occupation = json['occupation'] ?? '';
//     otherCity = json['otherCity'] ?? '';
//     otherOccupation = null;
//     otherSourceOfIncome = json['otherSourceOfIncome'] ?? '';
//     otherTaxResCountry = json['otherTaxResCountry'] ?? '';
//     pakResident = json['pakResident'] ?? '';
//     pepsInfo = List.from(json['pepsInfo'] ?? []).map((e)=>PepsInfo.fromJson(e)).toList();
//     phoneOne = null;
//     phoneTwo = null;
//     pinCodeExpiry = null;
//     preferedModeOfTrans = json['preferedModeOfTrans'] ?? '';
//     prevSessionDataFoundForUserFillingForm = json['prevSessionDataFoundForUserFillingForm'] ?? '';
//     religion = json['religion'] ?? '';
//     requestFromScreenNo = null;
//     requestToLoadLink = json['requestToLoadLink'] ?? '';
//     requestToValidateVerificationCodes = json['requestToValidateVerificationCodes'] ?? '';
//     requiredDocs = List.castFrom<dynamic, dynamic>(json['requiredDocs'] ?? []);
//     residentialAddress = json['residentialAddress'] ?? '';
//     retirementAge = json['retirementAge'] ?? '';
//     rpqAge = null;
//     rpqDisclaimerChecked = json['rpqDisclaimerChecked'] ?? '';
//     rpqFinacialPosition = null;
//     rpqInvestmentHorizon = null;
//     rpqInvestmentKnowledge = null;
//     rpqInvestmentObjective = null;
//     rpqMaritalStatus = null;
//     rpqNoOfDependants = null;
//     rpqOccupation = null;
//     rpqQualification = null;
//     rpqRiskAppetite = null;
//     rpqTotalScore = null;
//     savedSessionExpiryInDays = json['savedSessionExpiryInDays'] ?? '';
//     sessionID = json['sessionID'] ?? '';
//     signatureDoc = SignatureDoc.fromJson(json['signatureDoc'] ?? []);
//     sourceOfIncome = json['sourceOfIncome'] ?? '';
//     stmtRequest = null;
//     taxIdentificationNumber = null;
//     taxPaidCountry = json['taxPaidCountry'] ?? '';
//     taxResCountryOtherThanPak = json['taxResCountryOtherThanPak'] ?? '';
//     title = json['title'] ?? '';
//     titleOfAccount = json['titleOfAccount'] ?? '';
//     verCodeExpiryInMinutes = null;
//     verificationCode = json['verificationCode'] ?? '';
//     vpsOrUmsCall = null;
//     zakatDeclarationDoc = null;
//     zakatExempt = json['zakatExempt'] ?? '';
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['accountTypeToBeOpened'] = accountTypeToBeOpened;
//     _data['annualIncome'] = annualIncome;
//     _data['attachementsPath'] = attachementsPath;
//     _data['bankAccountNo'] = bankAccountNo;
//     _data['bankBranchAddress'] = bankBranchAddress;
//     _data['bankName'] = bankName;
//     _data['basicInfoDisclaimerChecked'] = basicInfoDisclaimerChecked;
//     _data['birthCityCode'] = birthCityCode;
//     _data['birthCountryCode'] = birthCountryCode;
//     _data['birthStateCode'] = birthStateCode;
//     _data['branchCity'] = branchCity;
//     _data['branchName'] = branchName;
//     _data['city'] = city;
//     _data['clientID'] = clientID;
//     _data['cnic'] = cnic;
//     _data['cnicBackDoc'] = cnicBackDoc!.toJson();
//     _data['cnicExpiryDate'] = cnicExpiryDate!.toJson();
//     _data['cnicFrontDoc'] = cnicFrontDoc!.toJson();
//     _data['cnicIssueDate'] = cnicIssueDate!.toJson();
//     _data['country'] = country;
//     _data['crsDisclaimerChecked'] = crsDisclaimerChecked;
//     _data['customerCategory'] = customerCategory;
//     _data['customerName'] = customerName;
//     _data['dateOfBirth'] = dateOfBirth!.toJson();
//     _data['district'] = district;
//     _data['dividendMandate'] = dividendMandate;
//     _data['docUploadDisclaimerChecked'] = docUploadDisclaimerChecked;
//     _data['domesticCounterParties'] = domesticCounterParties;
//     _data['domesticGeographies'] = domesticGeographies;
//     _data['email'] = email;
//     _data['employerDesignation'] = employerDesignation;
//     _data['employerName'] = employerName;
//     _data['employerNatureOfBusiness'] = employerNatureOfBusiness;
//     _data['employerProfession'] = employerProfession;
//     _data['expTurnoverInAccAmount'] = expTurnoverInAccAmount;
//     _data['expTurnoverInAccType'] = expTurnoverInAccType;
//     _data['expectedInvestmentAmount'] = expectedInvestmentAmount;
//     _data['fatcaDisclaimerChecked'] = fatcaDisclaimerChecked;
//     _data['fatcaInfo'] = fatcaInfo!.map((e)=>e.toJson()).toList();
//     _data['fatherSpouseName'] = fatherSpouseName;
//     _data['incomeBracket'] = incomeBracket;
//     _data['incomeProofDoc'] = incomeProofDoc!.toJson();
//     _data['internationalCounterParties'] = internationalCounterParties;
//     _data['internationalGeographies'] = internationalGeographies;
//     _data['interviewSchedule'] = interviewSchedule;
//     _data['interviewScheduleConfirmation'] = interviewScheduleConfirmation;
//     _data['interviewScheduleNotfSent'] = interviewScheduleNotfSent;
//     _data['kycDisclaimerChecked'] = kycDisclaimerChecked;
//     _data['lifetimeCnicExpiry'] = lifetimeCnicExpiry;
//     _data['linkForMissingDetails'] = linkForMissingDetails;
//     _data['mailingAddress'] = mailingAddress;
//     _data['mailingCity'] = mailingCity;
//     _data['mailingCountryCode'] = mailingCountryCode;
//     _data['mailingOtherCity'] = mailingOtherCity;
//     _data['maritalStatus'] = maritalStatus;
//     _data['mobRegWthHisHerName'] = mobRegWthHisHerName;
//     _data['mobile'] = mobile;
//     _data['mobileNoProofDoc'] = mobileNoProofDoc!.toJson();
//     _data['mobileRegisteredWith'] = mobileRegisteredWith;
//     _data['moreThanOneTaxCountries'] = moreThanOneTaxCountries;
//     _data['mothersMaidenName'] = mothersMaidenName;
//     _data['nationalityCode'] = nationalityCode;
//     _data['nominees'] = nominees!.map((e)=>e.toJson()).toList();
//     _data['occupation'] = occupation;
//     _data['otherCity'] = otherCity;
//     _data['otherOccupation'] = otherOccupation;
//     _data['otherSourceOfIncome'] = otherSourceOfIncome;
//     _data['otherTaxResCountry'] = otherTaxResCountry;
//     _data['pakResident'] = pakResident;
//     _data['pepsInfo'] = pepsInfo!.map((e)=>e.toJson()).toList();
//     _data['phoneOne'] = phoneOne;
//     _data['phoneTwo'] = phoneTwo;
//     _data['pinCodeExpiry'] = pinCodeExpiry;
//     _data['preferedModeOfTrans'] = preferedModeOfTrans;
//     _data['prevSessionDataFoundForUserFillingForm'] = prevSessionDataFoundForUserFillingForm;
//     _data['religion'] = religion;
//     _data['requestFromScreenNo'] = requestFromScreenNo;
//     _data['requestToLoadLink'] = requestToLoadLink;
//     _data['requestToValidateVerificationCodes'] = requestToValidateVerificationCodes;
//     _data['requiredDocs'] = requiredDocs;
//     _data['residentialAddress'] = residentialAddress;
//     _data['retirementAge'] = retirementAge;
//     _data['rpqAge'] = rpqAge;
//     _data['rpqDisclaimerChecked'] = rpqDisclaimerChecked;
//     _data['rpqFinacialPosition'] = rpqFinacialPosition;
//     _data['rpqInvestmentHorizon'] = rpqInvestmentHorizon;
//     _data['rpqInvestmentKnowledge'] = rpqInvestmentKnowledge;
//     _data['rpqInvestmentObjective'] = rpqInvestmentObjective;
//     _data['rpqMaritalStatus'] = rpqMaritalStatus;
//     _data['rpqNoOfDependants'] = rpqNoOfDependants;
//     _data['rpqOccupation'] = rpqOccupation;
//     _data['rpqQualification'] = rpqQualification;
//     _data['rpqRiskAppetite'] = rpqRiskAppetite;
//     _data['rpqTotalScore'] = rpqTotalScore;
//     _data['savedSessionExpiryInDays'] = savedSessionExpiryInDays;
//     _data['sessionID'] = sessionID;
//     _data['signatureDoc'] = signatureDoc!.toJson();
//     _data['sourceOfIncome'] = sourceOfIncome;
//     _data['stmtRequest'] = stmtRequest;
//     _data['taxIdentificationNumber'] = taxIdentificationNumber;
//     _data['taxPaidCountry'] = taxPaidCountry;
//     _data['taxResCountryOtherThanPak'] = taxResCountryOtherThanPak;
//     _data['title'] = title;
//     _data['titleOfAccount'] = titleOfAccount;
//     _data['verCodeExpiryInMinutes'] = verCodeExpiryInMinutes;
//     _data['verificationCode'] = verificationCode;
//     _data['vpsOrUmsCall'] = vpsOrUmsCall;
//     _data['zakatDeclarationDoc'] = zakatDeclarationDoc;
//     _data['zakatExempt'] = zakatExempt;
//     return _data;
//   }
// }
//
class Document {
  Document({
     this.fileContent,
     this.fileExtension,
     this.fileName,
  });
  List<int>? fileContent;
   String? fileExtension;
   String? fileName;

  Document.fromJson(Map<String, dynamic> json){
    fileContent = List.castFrom<dynamic, int>(json['fileContent'] ?? []);
    fileExtension = json['fileExtension'] ?? '';
    fileName = json['fileName'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fileContent'] = fileContent;
    _data['fileExtension'] = fileExtension;
    _data['fileName'] = fileName;
    return _data;
  }
}
//
// class CnicExpiryDate {
//   CnicExpiryDate({
//      this.xMLSchemaType,
//      this.day,
//      this.defaultLocale,
//     this.eon,
//     required this.eonAndYear,
//     this.fractionalSecond,
//      this.hour,
//      this.millisecond,
//      this.minute,
//     this.month,
//      this.second,
//     this.seconds,
//      this.timezone,
//      this.valid,
//     this.year,
//   });
//    XMLSchemaType? xMLSchemaType;
//    int? day;
//    DefaultLocale? defaultLocale;
//    Null? eon;
//    int? eonAndYear;
//    Null? fractionalSecond;
//    int? hour;
//    int? millisecond;
//    int? minute;
//    int? month;
//    int? second;
//    int? seconds;
//    int? timezone;
//    bool? valid;
//    int? year;
//
//   CnicExpiryDate.fromJson(Map<String, dynamic> json){
//     xMLSchemaType = XMLSchemaType.fromJson(json['XMLSchemaType'] ?? '');
//     day = json['day'] ?? '';
//     defaultLocale = DefaultLocale.fromJson(json['defaultLocale'] ?? '');
//     eon = null;
//     eonAndYear = json['eonAndYear'] ?? '';
//     fractionalSecond = null;
//     hour = json['hour'] ?? '';
//     millisecond = json['millisecond'] ?? '';
//     minute = json['minute'] ?? '';
//     month = json['month'] ?? '';
//     second = json['second'] ?? '';
//     seconds = json['seconds'] ?? '';
//     timezone = json['timezone'] ?? '';
//     valid = json['valid'] ?? '';
//     year = json['year'] ?? '';
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['XMLSchemaType'] = xMLSchemaType!.toJson();
//     _data['day'] = day;
//     _data['defaultLocale'] = defaultLocale!.toJson();
//     _data['eon'] = eon;
//     _data['eonAndYear'] = eonAndYear;
//     _data['fractionalSecond'] = fractionalSecond;
//     _data['hour'] = hour;
//     _data['millisecond'] = millisecond;
//     _data['minute'] = minute;
//     _data['month'] = month;
//     _data['second'] = second;
//     _data['seconds'] = seconds;
//     _data['timezone'] = timezone;
//     _data['valid'] = valid;
//     _data['year'] = year;
//     return _data;
//   }
// }
//
// class XMLSchemaType {
//   XMLSchemaType({
//      this.localPart,
//      this.namespaceURI,
//      this.prefix,
//   });
//    String? localPart;
//    String? namespaceURI;
//    String? prefix;
//
//   XMLSchemaType.fromJson(Map<String, dynamic> json){
//     localPart = json['localPart'] ?? '';
//     namespaceURI = json['namespaceURI'] ?? '';
//     prefix = json['prefix'] ?? '';
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['localPart'] = localPart;
//     _data['namespaceURI'] = namespaceURI;
//     _data['prefix'] = prefix;
//     return _data;
//   }
// }
//
// class DefaultLocale {
//   DefaultLocale({
//      this.ISO3Country,
//      this.ISO3Language,
//      this.baseLocale,
//      this.country,
//      this.displayCountry,
//      this.displayLanguage,
//      this.displayName,
//      this.displayScript,
//      this.displayVariant,
//      this.language,
//     this.localeExtensions,
//      this.script,
//      this.variant,
//   });
//    String? ISO3Country;
//    String? ISO3Language;
//    BaseLocale? baseLocale;
//    String? country;
//    String? displayCountry;
//    String? displayLanguage;
//    String? displayName;
//    String? displayScript;
//    String? displayVariant;
//    String? language;
//   String? localeExtensions;
//    String? script;
//    String? variant;
//
//   DefaultLocale.fromJson(Map<String, dynamic> json){
//     ISO3Country = json['ISO3Country'] ?? '';
//     ISO3Language = json['ISO3Language'] ?? '';
//     baseLocale = BaseLocale.fromJson(json['baseLocale'] ?? '');
//     country = json['country'] ?? '';
//     displayCountry = json['displayCountry'] ?? '';
//     displayLanguage = json['displayLanguage'] ?? '';
//     displayName = json['displayName'] ?? '';
//     displayScript = json['displayScript'] ?? '';
//     displayVariant = json['displayVariant'] ?? '';
//     language = json['language'] ?? '';
//     localeExtensions = null;
//     script = json['script'] ?? '';
//     variant = json['variant'] ?? '';
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['ISO3Country'] = ISO3Country;
//     _data['ISO3Language'] = ISO3Language;
//     _data['baseLocale'] = baseLocale!.toJson();
//     _data['country'] = country;
//     _data['displayCountry'] = displayCountry;
//     _data['displayLanguage'] = displayLanguage;
//     _data['displayName'] = displayName;
//     _data['displayScript'] = displayScript;
//     _data['displayVariant'] = displayVariant;
//     _data['language'] = language;
//     _data['localeExtensions'] = localeExtensions;
//     _data['script'] = script;
//     _data['variant'] = variant;
//     return _data;
//   }
// }
//
// class BaseLocale {
//   BaseLocale({
//      this.language,
//      this.region,
//      this.script,
//      this.variant,
//   });
//    String? language;
//    String? region;
//    String? script;
//    String? variant;
//
//   BaseLocale.fromJson(Map<String, dynamic> json){
//     language = json['language'] ?? '';
//     region = json['region'] ?? '';
//     script = json['script'] ?? '';
//     variant = json['variant'] ?? '';
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['language'] = language;
//     _data['region'] = region;
//     _data['script'] = script;
//     _data['variant'] = variant;
//     return _data;
//   }
// }
//
// class CnicFrontDoc {
//   CnicFrontDoc({
//     this.documentName,
//      this.fileContent,
//      this.fileExtension,
//      this.fileName,
//   });
//   String? documentName;
//    List<int>? fileContent;
//    String? fileExtension;
//    String? fileName;
//
//   CnicFrontDoc.fromJson(Map<String, dynamic> json){
//     documentName = null;
//     fileContent = List.castFrom<dynamic, int>(json['fileContent'] ?? '');
//     fileExtension = json['fileExtension'] ?? '';
//     fileName = json['fileName'] ?? '';
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['documentName'] = documentName;
//     _data['fileContent'] = fileContent;
//     _data['fileExtension'] = fileExtension;
//     _data['fileName'] = fileName;
//     return _data;
//   }
// }
//
// class CnicIssueDate {
//   CnicIssueDate({
//      this.xMLSchemaType,
//      this.day,
//      this.defaultLocale,
//     this.eon,
//      this.eonAndYear,
//     this.fractionalSecond,
//      this.hour,
//      this.millisecond,
//      this.minute,
//      this.month,
//      this.second,
//      this.seconds,
//      this.timezone,
//      this.valid,
//      this.year,
//   });
//    XMLSchemaType? xMLSchemaType;
//    int? day;
//    DefaultLocale? defaultLocale;
//    Null? eon;
//    int? eonAndYear;
//    Null? fractionalSecond;
//    int? hour;
//    int? millisecond;
//    int? minute;
//    int? month;
//    int? second;
//    int? seconds;
//    int? timezone;
//    bool? valid;
//    int? year;
//
//   CnicIssueDate.fromJson(Map<String, dynamic> json){
//     xMLSchemaType = XMLSchemaType.fromJson(json['XMLSchemaType'] ?? '');
//     day = json['day'] ?? '';
//     defaultLocale = DefaultLocale.fromJson(json['defaultLocale'] ?? '');
//     eon = null;
//     eonAndYear = json['eonAndYear'] ?? '';
//     fractionalSecond = null;
//     hour = json['hour'] ?? '';
//     millisecond = json['millisecond'] ?? '';
//     minute = json['minute'] ?? '';
//     month = json['month'] ?? '';
//     second = json['second'] ?? '';
//     seconds = json['seconds'] ?? '';
//     timezone = json['timezone'] ?? '';
//     valid = json['valid'] ?? '';
//     year = json['year'] ?? '';
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['XMLSchemaType'] = xMLSchemaType!.toJson();
//     _data['day'] = day;
//     _data['defaultLocale'] = defaultLocale!.toJson();
//     _data['eon'] = eon;
//     _data['eonAndYear'] = eonAndYear;
//     _data['fractionalSecond'] = fractionalSecond;
//     _data['hour'] = hour;
//     _data['millisecond'] = millisecond;
//     _data['minute'] = minute;
//     _data['month'] = month;
//     _data['second'] = second;
//     _data['seconds'] = seconds;
//     _data['timezone'] = timezone;
//     _data['valid'] = valid;
//     _data['year'] = year;
//     return _data;
//   }
// }
//
// class DateOfBirth {
//   DateOfBirth({
//      this.xMLSchemaType,
//      this.day,
//     this.defaultLocale,
//     this.eon,
//      this.eonAndYear,
//     this.fractionalSecond,
//      this.hour,
//      this.millisecond,
//      this.minute,
//      this.month,
//      this.second,
//      this.seconds,
//     this.timezone,
//      this.valid,
//      this.year,
//   });
//    XMLSchemaType? xMLSchemaType;
//    int? day;
//    DefaultLocale? defaultLocale;
//    Null? eon;
//    int? eonAndYear;
//    Null? fractionalSecond;
//    int? hour;
//    int? millisecond;
//    int? minute;
//    int? month;
//    int? second;
//    int? seconds;
//    int? timezone;
//   bool? valid;
//    int? year;
//   DateOfBirth.fromJson(Map<String, dynamic> json){
//     xMLSchemaType = XMLSchemaType.fromJson(json['XMLSchemaType'] ?? '');
//     day = json['day'] ?? '';
//     defaultLocale = DefaultLocale.fromJson(json['defaultLocale'] ?? '');
//     eon = null;
//     eonAndYear = json['eonAndYear'] ?? '';
//     fractionalSecond = null;
//     hour = json['hour'] ?? '';
//     millisecond = json['millisecond'] ?? '';
//     minute = json['minute'] ?? '';
//     month = json['month'] ?? '';
//     second = json['second'] ?? '';
//     seconds = json['seconds'] ?? '';
//     timezone = json['timezone'] ?? '';
//     valid = json['valid'] ?? '';
//     year = json['year'] ?? '';
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['XMLSchemaType'] = xMLSchemaType!.toJson();
//     _data['day'] = day;
//     _data['defaultLocale'] = defaultLocale!.toJson();
//     _data['eon'] = eon;
//     _data['eonAndYear'] = eonAndYear;
//     _data['fractionalSecond'] = fractionalSecond;
//     _data['hour'] = hour;
//     _data['millisecond'] = millisecond;
//     _data['minute'] = minute;
//     _data['month'] = month;
//     _data['second'] = second;
//     _data['seconds'] = seconds;
//     _data['timezone'] = timezone;
//     _data['valid'] = valid;
//     _data['year'] = year;
//     return _data;
//   }
// }
//

//
// class IncomeProofDoc {
//   IncomeProofDoc({
//     this.documentName,
//      this.fileContent,
//      this.fileExtension,
//     this.fileName,
//   });
//   String? documentName;
//    List<int>? fileContent;
//    String? fileExtension;
//    String? fileName;
//
//   IncomeProofDoc.fromJson(Map<dynamic, dynamic> json){
//     documentName = null;
//     fileContent = List.castFrom<dynamic, int>(json['fileContent'] ?? []);
//     fileExtension = (json['fileExtension'] ?? '').toString();
//     fileName = (json['fileName'] ?? '').toString();
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['documentName'] = documentName;
//     _data['fileContent'] = fileContent;
//     _data['fileExtension'] = fileExtension;
//     _data['fileName'] = fileName;
//     return _data;
//   }
// }
//
// class MobileNoProofDoc {
//   MobileNoProofDoc({
//     this.documentName,
//      this.fileContent,
//      this.fileExtension,
//      this.fileName,
//   });
//   String? documentName;
//    List<dynamic>? fileContent;
//    String? fileExtension;
//    String? fileName;
//
//   MobileNoProofDoc.fromJson(Map<dynamic, dynamic> json){
//     documentName = null;
//     fileContent = List.castFrom<dynamic, dynamic>(json['fileContent'] ?? '');
//     fileExtension = (json['fileExtension'] ?? '').toString();
//     fileName = (json['fileName'] ?? '').toString();
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['documentName'] = documentName;
//     _data['fileContent'] = fileContent;
//     _data['fileExtension'] = fileExtension;
//     _data['fileName'] = fileName;
//     return _data;
//   }
// }
class RedDocs {
  RedDocs({
    this.documentName,
    this.fileName,
    this.fileExtension,
    this.fileContent
  });
  String? documentName;
  String? fileName;
  String? fileExtension;
  List<dynamic>? fileContent;

  RedDocs.fromJson(Map<dynamic, dynamic> json){
    documentName = json['documentName'];
    fileName = (json['fileName'] ?? '').toString();
    fileExtension = (json['fileExtension'] ?? '').toString();
    fileContent = json['fileContent'] ?? [];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['documentName'] = documentName;
    _data['fileName'] = fileName;
    _data['fileExtension'] = fileExtension;
    _data['fileContent'] = fileContent;
    return _data;
  }

}


class FatcaInfoList {
  FatcaInfoList({
    this.answer,
    this.questionCode,
    this.questionDesc,
  });
  bool? answer;
  String? questionCode;
  String? questionDesc;

  FatcaInfoList.fromJson(Map<dynamic, dynamic> json){
    answer = json['answer'];
    questionCode = (json['questionCode'] ?? '').toString();
    questionDesc = (json['questionDesc'] ?? '').toString();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['answer'] = answer;
    _data['questionCode'] = questionCode;
    _data['questionDesc'] = questionDesc;
    return _data;
  }
}


class PepsInfoList {
  PepsInfoList({
    this.answer,
    this.questionCode,
    this.questionDesc,
  });
  bool? answer;
  String? questionCode;
  String? questionDesc;

  PepsInfoList.fromJson(Map<String, dynamic> json){
    answer = json['answer'];
    questionCode = json['questionCode'];
    questionDesc = json['questionDesc'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['answer'] = answer;
    _data['questionCode'] = questionCode;
    _data['questionDesc'] = questionDesc;
    return _data;
  }
}
//
// class SignatureDoc {
//   SignatureDoc({
//     this.documentName,
//      this.fileContent,
//      this.fileExtension,
//      this.fileName,
//   });
//    String? documentName;
//    List<int>? fileContent;
//    String? fileExtension;
//    String? fileName;
//
//   SignatureDoc.fromJson(Map<dynamic, dynamic> json){
//     documentName = null;
//     fileContent = List.castFrom<dynamic, int>(json['fileContent'] ?? []);
//     fileExtension = (json['fileExtension'] ?? '').toString();
//     fileName = (json['fileName'] ?? '').toString();
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['documentName'] = documentName;
//     _data['fileContent'] = fileContent;
//     _data['fileExtension'] = fileExtension;
//     _data['fileName'] = fileName;
//     return _data;
//   }
// }