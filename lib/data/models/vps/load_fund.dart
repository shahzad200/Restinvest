class VpsLoadFolioFunds {
  VpsLoadFolioFunds({
     this.action,
     this.meta,
     this.response,
  });
   String? action;
   Meta? meta;
   Response? response;

  VpsLoadFolioFunds.fromJson(Map<String, dynamic> json){
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
     this.funds,
  });
   List<Funds>? funds;

  Response.fromJson(Map<String, dynamic> json){
    funds = List.from(json['funds']).map((e)=>Funds.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['funds'] = funds!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Funds {
  Funds({
     this.fundBankAccounts,
     this.fundCode,
     this.fundName,
     this.fundShort,
  });
   List<FundBankAccounts>? fundBankAccounts;
   String? fundCode;
   String? fundName;
   String? fundShort = '';

  Funds.fromJson(Map<String, dynamic> json){
    fundBankAccounts = List.from(json['fundBankAccounts']).map((e)=>FundBankAccounts.fromJson(e)).toList();
    fundCode = json['fundCode'];
    fundName = json['fundName'];
    fundShort = json['fundShort'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fundBankAccounts'] = fundBankAccounts!.map((e)=>e.toJson()).toList();
    _data['fundCode'] = fundCode;
    _data['fundName'] = fundName;
    _data['fundShort'] = fundShort;
    return _data;
  }
}

class FundBankAccounts {
  FundBankAccounts({
     this.accountNo,
     this.bankCode,
     this.bankName,
     this.iban,
  });
   String? accountNo;
   String? bankCode;
   String? bankName;
   String? iban;

  FundBankAccounts.fromJson(Map<String, dynamic> json){
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