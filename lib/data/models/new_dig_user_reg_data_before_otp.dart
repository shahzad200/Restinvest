class NewDigUserRegDataBeforeOTP {
  NewDigUserRegDataBeforeOTP({
     this.action,
     this.meta,
     this.response,
  });
   String? action;
   Meta? meta;
   Response? response;

  NewDigUserRegDataBeforeOTP.fromJson(Map<String, dynamic> json){
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
     this.mobileRegisteredWithList,
  });
   List<AccountTypeList>? accountTypeList;
   List<MobileRegisteredWithList>? mobileRegisteredWithList;

  Response.fromJson(Map<String, dynamic> json){
    accountTypeList = List.from(json['accountTypeList']).map((e)=>AccountTypeList.fromJson(e)).toList();
    mobileRegisteredWithList = List.from(json['mobileRegisteredWithList']).map((e)=>MobileRegisteredWithList.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['accountTypeList'] = accountTypeList!.map((e)=>e.toJson()).toList();
    _data['mobileRegisteredWithList'] = mobileRegisteredWithList!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class AccountTypeList {
  AccountTypeList({
     this.code,
     this.description,
  });
   String? code;
   String? description;

  AccountTypeList.fromJson(Map<String, dynamic> json){
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

class MobileRegisteredWithList {
  MobileRegisteredWithList({
     this.code,
     this.description,
  });
   String? code;
   String? description;

  MobileRegisteredWithList.fromJson(Map<String, dynamic> json){
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