class ValidateVerificationCodeForDigUser {
  ValidateVerificationCodeForDigUser({
    this.action,
    this.meta,
    this.response,
  });
  String? action;
  Meta?meta;
  Response? response;

  ValidateVerificationCodeForDigUser.fromJson(Map<String, dynamic> json){
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
    code = json['code'].toString();
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
    this.accountTypeToBeOpened,
    this.cnic,
    this.email,
    this.mobile,
    this.mobileRegisteredWith,
    this.sessionID,
    this.verificationCode,
  });
  String? accountTypeToBeOpened;
  String? cnic;
  String? email;
  String? mobile;
  String? mobileRegisteredWith;
  String? sessionID;
  String? verificationCode;

  Response.fromJson(Map<String, dynamic> json){
    accountTypeToBeOpened = json['accountTypeToBeOpened'];
    cnic = json['cnic'];
    email = json['email'];
    mobile = json['mobile'];
    mobileRegisteredWith = json['mobileRegisteredWith'];
    sessionID = json['sessionID'];
    verificationCode = json['verificationCode'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['accountTypeToBeOpened'] = accountTypeToBeOpened;
    _data['cnic'] = cnic;
    _data['email'] = email;
    _data['mobile'] = mobile;
    _data['mobileRegisteredWith'] = mobileRegisteredWith;
    _data['sessionID'] = sessionID;
    _data['verificationCode'] = verificationCode;
    return _data;
  }
}