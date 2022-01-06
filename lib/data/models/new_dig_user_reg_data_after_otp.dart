class NewDigUserRegDataAfterOTP {
  NewDigUserRegDataAfterOTP({
     this.action,
     this.meta,
     this.response,
  });
   String? action;
   Meta? meta;
   Response? response;

  NewDigUserRegDataAfterOTP.fromJson(Map<String, dynamic> json){
    action = json['action'];
    meta = Meta.fromJson(json['meta']);
    response = Response.fromJson(json['response']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
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

  Meta.fromJson(Map<String, dynamic> json){
    code = json['code'];
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['error'] = error;
    _data['message'] = message;
    return _data;
  }
}

class Response {
  Response({
    this.accountTypeList,
     this.annualIncomeBrackets,
     this.banks,
     this.countries,
     this.dividendMandateList,
     this.expInvestAmountBrackets,
     this.expectedTurnoverInAccTypeList,
     this.fatcaInfoList,
     this.incomeSources,
     this.maritalStatusList,
     this.nationalities,
     this.occupations,
     this.pakCities,
     this.pepsInfoList,
     this.relationWithPrincipleList,
     this.religions,
     this.residentStatusList,
     this.retirementAgeList,
     this.taxResCountriesOtherThanPakList,
     this.titleList,
     this.transModeList,
     this.zakatExemptionList,
  });
  dynamic accountTypeList;
   List<AnnualIncomeBrackets>? annualIncomeBrackets;
   List<Banks>? banks;
   List<Countries>? countries;
   List<DividendMandateList>? dividendMandateList;
   List<ExpInvestAmountBrackets>? expInvestAmountBrackets;
   List<ExpectedTurnoverInAccTypeList>? expectedTurnoverInAccTypeList;
   List<FatcaInfoList>? fatcaInfoList;
   List<IncomeSources>? incomeSources;
   List<MaritalStatusList>? maritalStatusList;
   List<Nationalities>? nationalities;
   List<Occupations>? occupations;
   List<PakCities>? pakCities;
   List<PepsInfoList>? pepsInfoList;
   List<RelationWithPrincipleList>? relationWithPrincipleList;
   List<Religions>? religions;
   List<ResidentStatusList>? residentStatusList;
   List<RetirementAgeList>? retirementAgeList;
   List<TaxResCountriesOtherThanPakList>? taxResCountriesOtherThanPakList;
   List<TitleList>? titleList;
   List<TransModeList>? transModeList;
   List<ZakatExemptionList>? zakatExemptionList;

  Response.fromJson(Map<String, dynamic> json){
    accountTypeList = null;
    annualIncomeBrackets = List.from(json['annualIncomeBrackets']).map((e)=>AnnualIncomeBrackets.fromJson(e)).toList();
    banks = List.from(json['banks']).map((e)=>Banks.fromJson(e)).toList();
    countries = List.from(json['countries']).map((e)=>Countries.fromJson(e)).toList();
    dividendMandateList = List.from(json['dividendMandateList']).map((e)=>DividendMandateList.fromJson(e)).toList();
    expInvestAmountBrackets = List.from(json['expInvestAmountBrackets']).map((e)=>ExpInvestAmountBrackets.fromJson(e)).toList();
    expectedTurnoverInAccTypeList = List.from(json['expectedTurnoverInAccTypeList']).map((e)=>ExpectedTurnoverInAccTypeList.fromJson(e)).toList();
    fatcaInfoList = List.from(json['fatcaInfoList']).map((e)=>FatcaInfoList.fromJson(e)).toList();
    incomeSources = List.from(json['incomeSources']).map((e)=>IncomeSources.fromJson(e)).toList();
    maritalStatusList = List.from(json['maritalStatusList']).map((e)=>MaritalStatusList.fromJson(e)).toList();
    nationalities = List.from(json['nationalities']).map((e)=>Nationalities.fromJson(e)).toList();
    occupations = List.from(json['occupations']).map((e)=>Occupations.fromJson(e)).toList();
    pakCities = List.from(json['pakCities']).map((e)=>PakCities.fromJson(e)).toList();
    pepsInfoList = List.from(json['pepsInfoList']).map((e)=>PepsInfoList.fromJson(e)).toList();
    relationWithPrincipleList = List.from(json['relationWithPrincipleList']).map((e)=>RelationWithPrincipleList.fromJson(e)).toList();
    religions = List.from(json['religions']).map((e)=>Religions.fromJson(e)).toList();
    residentStatusList = List.from(json['residentStatusList']).map((e)=>ResidentStatusList.fromJson(e)).toList();
    retirementAgeList = List.from(json['retirementAgeList']).map((e)=>RetirementAgeList.fromJson(e)).toList();
    taxResCountriesOtherThanPakList = List.from(json['taxResCountriesOtherThanPakList']).map((e)=>TaxResCountriesOtherThanPakList.fromJson(e)).toList();
    titleList = List.from(json['titleList']).map((e)=>TitleList.fromJson(e)).toList();
    transModeList = List.from(json['transModeList']).map((e)=>TransModeList.fromJson(e)).toList();
    zakatExemptionList = List.from(json['zakatExemptionList']).map((e)=>ZakatExemptionList.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['accountTypeList'] = accountTypeList;
    _data['annualIncomeBrackets'] = annualIncomeBrackets!.map((e)=>e.toJson()).toList();
    _data['banks'] = banks!.map((e)=>e.toJson()).toList();
    _data['countries'] = countries!.map((e)=>e.toJson()).toList();
    _data['dividendMandateList'] = dividendMandateList!.map((e)=>e.toJson()).toList();
    _data['expInvestAmountBrackets'] = expInvestAmountBrackets!.map((e)=>e.toJson()).toList();
    _data['expectedTurnoverInAccTypeList'] = expectedTurnoverInAccTypeList!.map((e)=>e.toJson()).toList();
    _data['fatcaInfoList'] = fatcaInfoList!.map((e)=>e.toJson()).toList();
    _data['incomeSources'] = incomeSources!.map((e)=>e.toJson()).toList();
    _data['maritalStatusList'] = maritalStatusList!.map((e)=>e.toJson()).toList();
    _data['nationalities'] = nationalities!.map((e)=>e.toJson()).toList();
    _data['occupations'] = occupations!.map((e)=>e.toJson()).toList();
    _data['pakCities'] = pakCities!.map((e)=>e.toJson()).toList();
    _data['pepsInfoList'] = pepsInfoList!.map((e)=>e.toJson()).toList();
    _data['relationWithPrincipleList'] = relationWithPrincipleList!.map((e)=>e.toJson()).toList();
    _data['religions'] = religions!.map((e)=>e.toJson()).toList();
    _data['residentStatusList'] = residentStatusList!.map((e)=>e.toJson()).toList();
    _data['retirementAgeList'] = retirementAgeList!.map((e)=>e.toJson()).toList();
    _data['taxResCountriesOtherThanPakList'] = taxResCountriesOtherThanPakList!.map((e)=>e.toJson()).toList();
    _data['titleList'] = titleList!.map((e)=>e.toJson()).toList();
    _data['transModeList'] = transModeList!.map((e)=>e.toJson()).toList();
    _data['zakatExemptionList'] = zakatExemptionList!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class AnnualIncomeBrackets {
  AnnualIncomeBrackets({
     this.code,
     this.description,
  });
   String? code;
   String? description;

  AnnualIncomeBrackets.fromJson(Map<String, dynamic> json){
    code = json['code'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['description'] = description;
    return _data;
  }
}

class Banks {
  Banks({
     this.code,
     this.description,
  });
   String? code;
   String? description;

  Banks.fromJson(Map<String, dynamic> json){
    code = json['code'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['description'] = description;
    return _data;
  }
}

class Countries {
  Countries({
     this.countryCode,
     this.countryName,
    this.tooltip,
  });
   String? countryCode;
   String? countryName;
  dynamic tooltip;

  Countries.fromJson(Map<String, dynamic> json){
    countryCode = json['countryCode'];
    countryName = json['countryName'];
    tooltip = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['countryCode'] = countryCode;
    _data['countryName'] = countryName;
    _data['tooltip'] = tooltip;
    return _data;
  }
}

class DividendMandateList {
  DividendMandateList({
     this.code,
     this.description,
  });
   String? code;
   String? description;

  DividendMandateList.fromJson(Map<String, dynamic> json){
    code = json['code'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['description'] = description;
    return _data;
  }
}

class ExpInvestAmountBrackets {
  ExpInvestAmountBrackets({
     this.code,
     this.description,
  });
   String? code;
   String? description;

  ExpInvestAmountBrackets.fromJson(Map<String, dynamic> json){
    code = json['code'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['description'] = description;
    return _data;
  }
}

class ExpectedTurnoverInAccTypeList {
  ExpectedTurnoverInAccTypeList({
     this.code,
     this.description,
  });
   String? code;
   String? description;

  ExpectedTurnoverInAccTypeList.fromJson(Map<String, dynamic> json){
    code = json['code'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['description'] = description;
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

  FatcaInfoList.fromJson(Map<String, dynamic> json){
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

class IncomeSources {
  IncomeSources({
     this.incomeSourceId,
     this.incomeSourceName,
    this.tooltip,
  });
   String? incomeSourceId;
   String? incomeSourceName;
  dynamic tooltip;

  IncomeSources.fromJson(Map<String, dynamic> json){
    incomeSourceId = json['incomeSourceId'];
    incomeSourceName = json['incomeSourceName'];
    tooltip = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['incomeSourceId'] = incomeSourceId;
    _data['incomeSourceName'] = incomeSourceName;
    _data['tooltip'] = tooltip;
    return _data;
  }
}

class MaritalStatusList {
  MaritalStatusList({
     this.code,
     this.description,
  });
   String? code;
   String? description;

  MaritalStatusList.fromJson(Map<String, dynamic> json){
    code = json['code'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['description'] = description;
    return _data;
  }
}

class Nationalities {
  Nationalities({
     this.countryCode,
     this.countryName,
    this.tooltip,
  });
   String? countryCode;
   String? countryName;
  dynamic tooltip;

  Nationalities.fromJson(Map<String, dynamic> json){
    countryCode = json['countryCode'];
    countryName = json['countryName'];
    tooltip = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['countryCode'] = countryCode;
    _data['countryName'] = countryName;
    _data['tooltip'] = tooltip;
    return _data;
  }
}

class Occupations {
  Occupations({
     this.occupoationCode,
     this.occupoationName,
    this.tooltip,
  });
   String? occupoationCode;
   String? occupoationName;
  dynamic tooltip;

  Occupations.fromJson(Map<String, dynamic> json){
    occupoationCode = json['occupoationCode'];
    occupoationName = json['occupoationName'];
    tooltip = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['occupoationCode'] = occupoationCode;
    _data['occupoationName'] = occupoationName;
    _data['tooltip'] = tooltip;
    return _data;
  }
}

class PakCities {
  PakCities({
     this.cityCode,
     this.cityName,
    this.tooltip,
  });
   String? cityCode;
   String? cityName;
  dynamic tooltip;

  PakCities.fromJson(Map<String, dynamic> json){
    cityCode = json['cityCode'];
    cityName = json['cityName'];
    tooltip = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['cityCode'] = cityCode;
    _data['cityName'] = cityName;
    _data['tooltip'] = tooltip;
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

class RelationWithPrincipleList {
  RelationWithPrincipleList({
     this.code,
     this.description,
  });
   String? code;
   String? description;

  RelationWithPrincipleList.fromJson(Map<String, dynamic> json){
    code = json['code'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['description'] = description;
    return _data;
  }
}

class Religions {
  Religions({
     this.religionCode,
     this.religionName,
    this.tooltip,
  });
   String? religionCode;
   String? religionName;
  dynamic tooltip;

  Religions.fromJson(Map<String, dynamic> json){
    religionCode = json['religionCode'];
    religionName = json['religionName'];
    tooltip = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['religionCode'] = religionCode;
    _data['religionName'] = religionName;
    _data['tooltip'] = tooltip;
    return _data;
  }
}

class ResidentStatusList {
  ResidentStatusList({
     this.code,
     this.description,
  });
   String? code;
   String? description;

  ResidentStatusList.fromJson(Map<String, dynamic> json){
    code = json['code'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['description'] = description;
    return _data;
  }
}

class RetirementAgeList {
  RetirementAgeList({
     this.code,
     this.description,
  });
   String? code;
   String? description;

  RetirementAgeList.fromJson(Map<String, dynamic> json){
    code = json['code'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['description'] = description;
    return _data;
  }
}

class TaxResCountriesOtherThanPakList {
  TaxResCountriesOtherThanPakList({
     this.code,
     this.description,
  });
   String? code;
   String? description;

  TaxResCountriesOtherThanPakList.fromJson(Map<String, dynamic> json){
    code = json['code'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['description'] = description;
    return _data;
  }
}

class TitleList {
  TitleList({
     this.code,
     this.description,
  });
   String? code;
   String? description;

  TitleList.fromJson(Map<String, dynamic> json){
    code = json['code'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['description'] = description;
    return _data;
  }
}

class TransModeList {
  TransModeList({
     this.code,
     this.description,
  });
   String? code;
   String? description;

  TransModeList.fromJson(Map<String, dynamic> json){
    code = json['code'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['description'] = description;
    return _data;
  }
}

class ZakatExemptionList {
  ZakatExemptionList({
     this.code,
     this.description,
  });
   bool? code;
   String? description;

  ZakatExemptionList.fromJson(Map<String, dynamic> json){
    code = json['code'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['description'] = description;
    return _data;
  }
}