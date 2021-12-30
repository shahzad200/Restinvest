class LoadFundsPlans {
  LoadFundsPlans({
     this.action,
     this.meta,
     this.response,
  });
   String? action;
   Meta? meta;
   Response? response;

  LoadFundsPlans.fromJson(Map<String, dynamic> json){
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
     this.folioNumber,
     this.portfolioAllocationData,
     this.portfolioInvestmentValue,
     this.toFunds,
     this.userFundBalances,
  });
   String? folioNumber;
   List<PortfolioAllocationData>? portfolioAllocationData;
   String? portfolioInvestmentValue;
   List<ToFunds>? toFunds;
   List<UserFundBalances>? userFundBalances;

  Response.fromJson(Map<String, dynamic> json){
    folioNumber = json['folioNumber'];
    portfolioAllocationData = List.from(json['portfolioAllocationData']).map((e)=>PortfolioAllocationData.fromJson(e)).toList();
    portfolioInvestmentValue = json['portfolioInvestmentValue'];
    toFunds = List.from(json['toFunds']).map((e)=>ToFunds.fromJson(e)).toList();
    userFundBalances = List.from(json['userFundBalances']).map((e)=>UserFundBalances.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['folioNumber'] = folioNumber;
    _data['portfolioAllocationData'] = portfolioAllocationData!.map((e)=>e.toJson()).toList();
    _data['portfolioInvestmentValue'] = portfolioInvestmentValue;
    _data['toFunds'] = toFunds!.map((e)=>e.toJson()).toList();
    _data['userFundBalances'] = userFundBalances!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class PortfolioAllocationData {
  PortfolioAllocationData({
     this.fundCode,
     this.fundName,
     this.fundPercent,
     this.fundRedPrice,
     this.fundShort,
     this.fundUnits,
     this.fundvolume,
  });
   String? fundCode;
   String? fundName;
   String? fundPercent;
   String? fundRedPrice;
   String? fundShort;
   String? fundUnits;
   String? fundvolume;

  PortfolioAllocationData.fromJson(Map<String, dynamic> json){
    fundCode = json['fundCode'];
    fundName = json['fundName'];
    fundPercent = json['fundPercent'];
    fundRedPrice = json['fundRedPrice'];
    fundShort = json['fundShort'];
    fundUnits = json['fundUnits'];
    fundvolume = json['fundvolume'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fundCode'] = fundCode;
    _data['fundName'] = fundName;
    _data['fundPercent'] = fundPercent;
    _data['fundRedPrice'] = fundRedPrice;
    _data['fundShort'] = fundShort;
    _data['fundUnits'] = fundUnits;
    _data['fundvolume'] = fundvolume;
    return _data;
  }
}

class ToFunds {
  ToFunds({
     this.fundBankAccountDetails,
     this.fundCode,
     this.fundName,
     this.fundPercent,
     this.fundRedPrice,
     this.fundSaleLoad,
     this.fundShort,
     this.fundUnits,
     this.fundvolume,
     this.offerPrice,
     this.priceDate,
     this.unitClassess,
  });
   List<FundBankAccountDetails>? fundBankAccountDetails;
   String? fundCode;
   String? fundName;
   String? fundPercent;
   String? fundRedPrice;
   String? fundSaleLoad;
   String? fundShort;
   String? fundUnits;
   String? fundvolume;
   String? offerPrice;
   String? priceDate;
   List<dynamic>? unitClassess;

  ToFunds.fromJson(Map<String, dynamic> json){
    fundBankAccountDetails = List.from(json['fundBankAccountDetails']).map((e)=>FundBankAccountDetails.fromJson(e)).toList();
    fundCode = json['fundCode'];
    fundName = json['fundName'];
    fundPercent = json['fundPercent'];
    fundRedPrice = json['fundRedPrice'];
    fundSaleLoad = json['fundSaleLoad'];
    fundShort = json['fundShort'];
    fundUnits = json['fundUnits'];
    fundvolume = json['fundvolume'];
    offerPrice = json['offerPrice'];
    priceDate = json['priceDate'];
    unitClassess = List.castFrom<dynamic, dynamic>(json['unitClassess']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fundBankAccountDetails'] = fundBankAccountDetails!.map((e)=>e.toJson()).toList();
    _data['fundCode'] = fundCode;
    _data['fundName'] = fundName;
    _data['fundPercent'] = fundPercent;
    _data['fundRedPrice'] = fundRedPrice;
    _data['fundSaleLoad'] = fundSaleLoad;
    _data['fundShort'] = fundShort;
    _data['fundUnits'] = fundUnits;
    _data['fundvolume'] = fundvolume;
    _data['offerPrice'] = offerPrice;
    _data['priceDate'] = priceDate;
    _data['unitClassess'] = unitClassess;
    return _data;
  }
}

class FundBankAccountDetails {
  FundBankAccountDetails({
     this.accountNo,
     this.bankCode,
     this.bankName,
     this.iban,
  });
   String? accountNo;
   String? bankCode;
   String? bankName;
   String? iban;

  FundBankAccountDetails.fromJson(Map<String, dynamic> json){
    accountNo = json['accountNo'];
    bankCode = json['bankCode'];
    bankName = json['bankName'];
    iban = json['iban'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['accountNo'] = accountNo;
    _data['bankCode'] = bankCode;
    _data['bankName'] = bankName;
    _data['iban'] = iban;
    return _data;
  }
}

class UserFundBalances {
  UserFundBalances({
     this.fundBankAccountDetails,
     this.fundCode,
     this.fundName,
     this.fundPercent,
     this.fundRedPrice,
     this.fundSaleLoad,
     this.fundShort,
     this.fundUnits,
     this.fundvolume,
     this.offerPrice,
     this.priceDate,
     this.unitClassess,
  });
   List<dynamic>? fundBankAccountDetails;
   String? fundCode;
   String? fundName;
   String? fundPercent;
   String? fundRedPrice;
   String? fundSaleLoad;
   String? fundShort;
   String? fundUnits;
   String? fundvolume;
   String? offerPrice;
   String? priceDate;
   List<dynamic>? unitClassess;

  UserFundBalances.fromJson(Map<String, dynamic> json){
    fundBankAccountDetails = List.castFrom<dynamic, dynamic>(json['fundBankAccountDetails']);
    fundCode = json['fundCode'];
    fundName = json['fundName'];
    fundPercent = json['fundPercent'];
    fundRedPrice = json['fundRedPrice'];
    fundSaleLoad = json['fundSaleLoad'];
    fundShort = json['fundShort'];
    fundUnits = json['fundUnits'];
    fundvolume = json['fundvolume'];
    offerPrice = json['offerPrice'];
    priceDate = json['priceDate'];
    unitClassess = List.castFrom<dynamic, dynamic>(json['unitClassess']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fundBankAccountDetails'] = fundBankAccountDetails;
    _data['fundCode'] = fundCode;
    _data['fundName'] = fundName;
    _data['fundPercent'] = fundPercent;
    _data['fundRedPrice'] = fundRedPrice;
    _data['fundSaleLoad'] = fundSaleLoad;
    _data['fundShort'] = fundShort;
    _data['fundUnits'] = fundUnits;
    _data['fundvolume'] = fundvolume;
    _data['offerPrice'] = offerPrice;
    _data['priceDate'] = priceDate;
    _data['unitClassess'] = unitClassess;
    return _data;
  }
}