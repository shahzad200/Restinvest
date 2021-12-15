class CalculateTax {
  CalculateTax({
     this.action,
     this.meta,
     this.response,
  });
   String? action;
   Meta? meta;
   Response? response;

  CalculateTax.fromJson(Map<String, dynamic> json){
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
     this.annualIncome,
     this.incomeTaxAmount,
     this.investInMutualFund,
     this.investInPensionFund,
     this.salaried,
     this.taxCreditInMutualFund,
     this.taxCreditInPensionFund,
     this.taxPercent,
     this.totalTaxCredit,
  });
   dynamic annualIncome;
  dynamic incomeTaxAmount;
  dynamic investInMutualFund;
  dynamic investInPensionFund;
  dynamic salaried;
  dynamic taxCreditInMutualFund;
  dynamic taxCreditInPensionFund;
  dynamic taxPercent;
  dynamic totalTaxCredit;

  Response.fromJson(Map<String, dynamic> json){
    annualIncome = json['annualIncome'];
    incomeTaxAmount = json['incomeTaxAmount'];
    investInMutualFund = json['investInMutualFund'];
    investInPensionFund = json['investInPensionFund'];
    salaried = json['salaried'];
    taxCreditInMutualFund = json['taxCreditInMutualFund'];
    taxCreditInPensionFund = json['taxCreditInPensionFund'];
    taxPercent = json['taxPercent'];
    totalTaxCredit = json['totalTaxCredit'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['annualIncome'] = annualIncome;
    _data['incomeTaxAmount'] = incomeTaxAmount;
    _data['investInMutualFund'] = investInMutualFund;
    _data['investInPensionFund'] = investInPensionFund;
    _data['salaried'] = salaried;
    _data['taxCreditInMutualFund'] = taxCreditInMutualFund;
    _data['taxCreditInPensionFund'] = taxCreditInPensionFund;
    _data['taxPercent'] = taxPercent;
    _data['totalTaxCredit'] = totalTaxCredit;
    return _data;
  }
}