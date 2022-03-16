class LoadBalancesForVpsRedemption {
  LoadBalancesForVpsRedemption({
     this.action,
     this.meta,
     this.response,
  });
   String? action;
   Meta? meta;
   Response? response;

  LoadBalancesForVpsRedemption.fromJson(Map<String, dynamic> json){
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
     this.afterRetirement,
     this.availableBalance,
     this.exemptedPercentage,
     this.maturity,
  });
   int? afterRetirement;
   double? availableBalance;
   int? exemptedPercentage;
   int? maturity;

  Response.fromJson(Map<String, dynamic> json){
    afterRetirement = json['afterRetirement'];
    availableBalance = json['availableBalance'];
    exemptedPercentage = json['exemptedPercentage'];
    maturity = json['maturity'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['afterRetirement'] = afterRetirement;
    _data['availableBalance'] = availableBalance;
    _data['exemptedPercentage'] = exemptedPercentage;
    _data['maturity'] = maturity;
    return _data;
  }

}