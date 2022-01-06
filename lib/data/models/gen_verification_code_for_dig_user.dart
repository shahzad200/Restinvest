class GenVerificationCodeForDigUser {
  GenVerificationCodeForDigUser({
     this.action,
     this.meta,
     this.response,
  });
   String? action;
   Meta? meta;
   Response? response;

  GenVerificationCodeForDigUser.fromJson(Map<String, dynamic> json){
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
     this.verCodeExpiryInMinutes,
  });
   int? verCodeExpiryInMinutes;

  Response.fromJson(Map<String, dynamic> json){
    verCodeExpiryInMinutes = json['verCodeExpiryInMinutes'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['verCodeExpiryInMinutes'] = verCodeExpiryInMinutes;
    return _data;
  }
}