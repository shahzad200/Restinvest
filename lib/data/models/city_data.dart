class CityData {
  CityData({
     this.action,
     this.meta,
     this.response,
  });
   String? action;
   Meta? meta;
   List<Response>? response;

  CityData.fromJson(Map<String, dynamic> json){
    action = json['action'];
    meta = Meta.fromJson(json['meta']);
    response = List.from(json['response']).map((e)=>Response.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['action'] = action;
    _data['meta'] = meta!.toJson();
    _data['response'] = response!.map((e)=>e.toJson()).toList();
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
     this.cityCode,
     this.cityName,
    this.tooltip,
  });
  String? cityCode;
  String? cityName;
  String? tooltip;

  Response.fromJson(Map<String, dynamic> json){
    cityCode = json['cityCode'];
    cityName = json['cityName'];
    tooltip = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['cityCode'] = cityCode;
    _data['cityName'] = cityName;
    _data['tooltip'] = tooltip;
    return _data;
  }
}