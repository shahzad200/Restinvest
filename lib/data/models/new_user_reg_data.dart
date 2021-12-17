class NewUserRegData {
  NewUserRegData({
     this.action,
     this.meta,
     this.response,
  });
   String? action;
   Meta? meta;
   Response? response;

  NewUserRegData.fromJson(Map<String, dynamic> json){
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
     this.countries,
     this.incomeBrackets,
     this.incomeSources,
     this.occupations,
     this.religions,
  });
   List<Countries>? countries;
   List<IncomeBrackets>? incomeBrackets;
   List<IncomeSources>? incomeSources;
   List<Occupations>? occupations;
   List<Religions>? religions;

  Response.fromJson(Map<String, dynamic> json){
    countries = List.from(json['countries']).map((e)=>Countries.fromJson(e)).toList();
    incomeBrackets = List.from(json['incomeBrackets']).map((e)=>IncomeBrackets.fromJson(e)).toList();
    incomeSources = List.from(json['incomeSources']).map((e)=>IncomeSources.fromJson(e)).toList();
    occupations = List.from(json['occupations']).map((e)=>Occupations.fromJson(e)).toList();
    religions = List.from(json['religions']).map((e)=>Religions.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['countries'] = countries!.map((e)=>e.toJson()).toList();
    _data['incomeBrackets'] = incomeBrackets!.map((e)=>e.toJson()).toList();
    _data['incomeSources'] = incomeSources!.map((e)=>e.toJson()).toList();
    _data['occupations'] = occupations!.map((e)=>e.toJson()).toList();
    _data['religions'] = religions!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Countries {
  Countries({
     this.countryCode,
     this.countryName,
    this.tooltip,
  });
   String? countryCode;
   String? countryName;
  String? tooltip;

  Countries.fromJson(Map<String, dynamic> json){
    countryCode = json['countryCode'];
    countryName = json['countryName'];
    tooltip = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['countryCode'] = countryCode;
    _data['countryName'] = countryName;
    _data['tooltip'] = tooltip;
    return _data;
  }
}

class IncomeBrackets {
  IncomeBrackets({
     this.incomeBracketId,
     this.incomeBracketName,
    this.tooltip,
  });
   String? incomeBracketId;
   String? incomeBracketName;
   String? tooltip;

  IncomeBrackets.fromJson(Map<String, dynamic> json){
    incomeBracketId = json['incomeBracketId'];
    incomeBracketName = json['incomeBracketName'];
    tooltip = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['incomeBracketId'] = incomeBracketId;
    _data['incomeBracketName'] = incomeBracketName;
    _data['tooltip'] = tooltip;
    return _data;
  }
}

class IncomeSources {
  IncomeSources({
     this.incomeSourceId,
    this.incomeSourceName,
    this.tooltip,
  });
  String? incomeSourceId;
  String? incomeSourceName;
  String? tooltip;

  IncomeSources.fromJson(Map<String, dynamic> json){
    incomeSourceId = json['incomeSourceId'];
    incomeSourceName = json['incomeSourceName'];
    tooltip = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['incomeSourceId'] = incomeSourceId;
    _data['incomeSourceName'] = incomeSourceName;
    _data['tooltip'] = tooltip;
    return _data;
  }
}

class Occupations {
  Occupations({
     this.occupoationCode,
     this.occupoationName,
    this.tooltip,
  });
  String? occupoationCode;
  String? occupoationName;
  String? tooltip;

  Occupations.fromJson(Map<String, dynamic> json){
    occupoationCode = json['occupoationCode'];
    occupoationName = json['occupoationName'];
    tooltip = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['occupoationCode'] = occupoationCode;
    _data['occupoationName'] = occupoationName;
    _data['tooltip'] = tooltip;
    return _data;
  }
}

class Religions {
  Religions({
     this.religionCode,
     this.religionName,
    this.tooltip,
  });
  String? religionCode;
  String? religionName;
  String? tooltip;

  Religions.fromJson(Map<String, dynamic> json){
    religionCode = json['religionCode'];
    religionName = json['religionName'];
    tooltip = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['religionCode'] = religionCode;
    _data['religionName'] = religionName;
    _data['tooltip'] = tooltip;
    return _data;
  }
}