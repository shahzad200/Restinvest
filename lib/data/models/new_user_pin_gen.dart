class NewUserPinGenration {
  NewUserPinGenration({
     this.action,
     this.meta,
     this.response,
  });
   String? action;
   Meta? meta;
   Response? response;

  NewUserPinGenration.fromJson(Map<String, dynamic> json){
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
     this.address,
     this.cell,
     this.cnic,
     this.email,
     this.pinCodeConfigId,
  });
   String? address;
   String? cell;
   String? cnic;
   String? email;
   int? pinCodeConfigId;

  Response.fromJson(Map<String, dynamic> json){
    address = json['address'];
    cell = json['cell'];
    cnic = json['cnic'];
    email = json['email'];
    pinCodeConfigId = json['pinCodeConfigId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['address'] = address;
    _data['cell'] = cell;
    _data['cnic'] = cnic;
    _data['email'] = email;
    _data['pinCodeConfigId'] = pinCodeConfigId;
    return _data;
  }
}