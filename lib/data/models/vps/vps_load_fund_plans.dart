

class VpsLoadFundPlan {
  VpsLoadFundPlan({
     this.action,
     this.meta,
     this.response,
  });
   String? action;
   Meta? meta;
   Response? response;

  VpsLoadFundPlan.fromJson(Map<String, dynamic> json){
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
     this.userFundBalances,
  });
   String? folioNumber;
   List<UserFundBalances>? userFundBalances;

  Response.fromJson(Map<String, dynamic> json){
    folioNumber = json['folioNumber'];
    userFundBalances = List.from(json['userFundBalances']).map((e)=>UserFundBalances.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['folioNumber'] = folioNumber;
    _data['userFundBalances'] = userFundBalances!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class UserFundBalances {
  UserFundBalances({
     this.fundCode,
     this.fundName,
     this.unitClassess,
  });
   String? fundCode;
   String? fundName;
   List<UnitClassess>? unitClassess;

  UserFundBalances.fromJson(Map<String, dynamic> json){
    fundCode = json['fundCode'];
    fundName = json['fundName'];
    unitClassess = List.from(json['unitClassess']).map((e)=>UnitClassess.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fundCode'] = fundCode;
    _data['fundName'] = fundName;
    _data['unitClassess'] = unitClassess!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class UnitClassess {
  UnitClassess({
    this.className,
  });
   String? className;

  UnitClassess.fromJson(Map<String, dynamic> json){
    className = json['className'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['className'] = className;
    return _data;
  }
}