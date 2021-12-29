
class ViewReport {
  ViewReport({
     this.action,
     this.meta,
     this.response,
  });
   String? action;
   Meta? meta;
   List<int>? response;

  ViewReport.fromJson(Map<String, dynamic> json){
    action = json['action'];
    meta = Meta.fromJson(json['meta']);
    response = List.castFrom<dynamic, int>(json['response']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['action'] = action;
    _data['meta'] = meta!.toJson();
    _data['response'] = response;
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