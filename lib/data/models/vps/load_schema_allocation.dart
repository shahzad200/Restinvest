

class LoadSchemeAllocations {
  LoadSchemeAllocations({
     this.action,
     this.meta,
     this.response,
  });
   String? action;
   Meta? meta;
   Response? response;

  LoadSchemeAllocations.fromJson(Map<String, dynamic> json){
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
     this.PFund,
     this.editableAllocationPercentage,
     this.folioNo,
     this.pensionSubfunds,
     this.previousSchemeCode,
     this.schemeCode,
  });
   String? PFund;
   bool? editableAllocationPercentage;
   String? folioNo;
   List<PensionSubFunds>? pensionSubfunds;
   String? previousSchemeCode;
   String? schemeCode;

  Response.fromJson(Map<String, dynamic> json){
    PFund = json['PFund'];
    editableAllocationPercentage = json['editableAllocationPercentage'];
    folioNo = json['folioNo'];
    pensionSubfunds = List.from(json['pensionSubfunds']).map((e)=>PensionSubFunds.fromJson(e)).toList();
    previousSchemeCode = json['previousSchemeCode'];
    schemeCode = json['schemeCode'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['PFund'] = PFund;
    _data['editableAllocationPercentage'] = editableAllocationPercentage;
    _data['folioNo'] = folioNo;
    _data['pensionSubfunds'] = pensionSubfunds!.map((e)=>e.toJson()).toList();
    _data['previousSchemeCode'] = previousSchemeCode;
    _data['schemeCode'] = schemeCode;
    return _data;
  }
}

class PensionSubFunds {
  PensionSubFunds({
     this.fundCode,
     this.fundName,
     this.maxPercentage,
     this.minPercentage,
     this.percentage,
  });
   String? fundCode;
   String? fundName;
   String? maxPercentage;
   String? minPercentage;
   String? percentage;

  PensionSubFunds.fromJson(Map<String, dynamic> json){
    fundCode = json['fundCode'];
    fundName = json['fundName'];
    maxPercentage = json['maxPercentage'];
    minPercentage = json['minPercentage'];
    percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fundCode'] = fundCode;
    _data['fundName'] = fundName;
    _data['maxPercentage'] = maxPercentage;
    _data['minPercentage'] = minPercentage;
    _data['percentage'] = percentage;
    return _data;
  }
}