class LoadFundsPlansP {
  LoadFundsPlansP({
     this.action,
     this.meta,
     this.response,
  });
   String? action;
   Meta? meta;
   Response? response;

  LoadFundsPlansP.fromJson(Map<String, dynamic> json){
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
     this.classCode,
     this.folioNumber,
     this.fundClasswisePlans,
     this.fundCode,
  });
   String? classCode;
   String? folioNumber;
   List<FundClasswisePlans>? fundClasswisePlans;
   String? fundCode;

  Response.fromJson(Map<String, dynamic> json){
    classCode = json['classCode'];
    folioNumber = json['folioNumber'];
    fundClasswisePlans = List.from(json['fundClasswisePlans']).map((e)=>FundClasswisePlans.fromJson(e)).toList();
    fundCode = json['fundCode'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['classCode'] = classCode;
    _data['folioNumber'] = folioNumber;
    _data['fundClasswisePlans'] = fundClasswisePlans!.map((e)=>e.toJson()).toList();
    _data['fundCode'] = fundCode;
    return _data;
  }
}

class FundClasswisePlans {
  FundClasswisePlans({
     this.planId,
     this.planName,
     this.totalAmount,
     this.totalUnits,
  });
   String? planId;
   String? planName;
   String? totalAmount;
   String? totalUnits;

  FundClasswisePlans.fromJson(Map<String, dynamic> json){
    planId = json['planId'];
    planName = json['planName'];
    totalAmount = json['totalAmount'];
    totalUnits = json['totalUnits'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['planId'] = planId;
    _data['planName'] = planName;
    _data['totalAmount'] = totalAmount;
    _data['totalUnits'] = totalUnits;
    return _data;
  }
}