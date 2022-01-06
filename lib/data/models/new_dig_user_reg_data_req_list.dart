class NewDigUserRegDataRpqList {
  NewDigUserRegDataRpqList({
     this.action,
     this.meta,
     this.response,
  });
   String? action;
   Meta? meta;
   Response? response;

  NewDigUserRegDataRpqList.fromJson(Map<String, dynamic> json){
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
     this.ageRpqList,
     this.financialPositionRpqList,
     this.investHorizonRpqList,
     this.investKnowledgeRpqList,
     this.investObjRpqList,
     this.maritalStatusRpqList,
     this.noOfDependentsRpqList,
     this.occupationRpqList,
     this.qualificationRpqList,
     this.riskAppetiteRpqList,
  });
   List<AgeRpqList>? ageRpqList;
   List<FinancialPositionRpqList>? financialPositionRpqList;
   List<InvestHorizonRpqList>? investHorizonRpqList;
   List<InvestKnowledgeRpqList>? investKnowledgeRpqList;
   List<InvestObjRpqList>? investObjRpqList;
   List<MaritalStatusRpqList>? maritalStatusRpqList;
   List<NoOfDependentsRpqList>? noOfDependentsRpqList;
   List<OccupationRpqList>? occupationRpqList;
   List<QualificationRpqList>? qualificationRpqList;
   List<RiskAppetiteRpqList>? riskAppetiteRpqList;

  Response.fromJson(Map<String, dynamic> json){
    ageRpqList = List.from(json['ageRpqList']).map((e)=>AgeRpqList.fromJson(e)).toList();
    financialPositionRpqList = List.from(json['financialPositionRpqList']).map((e)=>FinancialPositionRpqList.fromJson(e)).toList();
    investHorizonRpqList = List.from(json['investHorizonRpqList']).map((e)=>InvestHorizonRpqList.fromJson(e)).toList();
    investKnowledgeRpqList = List.from(json['investKnowledgeRpqList']).map((e)=>InvestKnowledgeRpqList.fromJson(e)).toList();
    investObjRpqList = List.from(json['investObjRpqList']).map((e)=>InvestObjRpqList.fromJson(e)).toList();
    maritalStatusRpqList = List.from(json['maritalStatusRpqList']).map((e)=>MaritalStatusRpqList.fromJson(e)).toList();
    noOfDependentsRpqList = List.from(json['noOfDependentsRpqList']).map((e)=>NoOfDependentsRpqList.fromJson(e)).toList();
    occupationRpqList = List.from(json['occupationRpqList']).map((e)=>OccupationRpqList.fromJson(e)).toList();
    qualificationRpqList = List.from(json['qualificationRpqList']).map((e)=>QualificationRpqList.fromJson(e)).toList();
    riskAppetiteRpqList = List.from(json['riskAppetiteRpqList']).map((e)=>RiskAppetiteRpqList.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ageRpqList'] = ageRpqList!.map((e)=>e.toJson()).toList();
    _data['financialPositionRpqList'] = financialPositionRpqList!.map((e)=>e.toJson()).toList();
    _data['investHorizonRpqList'] = investHorizonRpqList!.map((e)=>e.toJson()).toList();
    _data['investKnowledgeRpqList'] = investKnowledgeRpqList!.map((e)=>e.toJson()).toList();
    _data['investObjRpqList'] = investObjRpqList!.map((e)=>e.toJson()).toList();
    _data['maritalStatusRpqList'] = maritalStatusRpqList!.map((e)=>e.toJson()).toList();
    _data['noOfDependentsRpqList'] = noOfDependentsRpqList!.map((e)=>e.toJson()).toList();
    _data['occupationRpqList'] = occupationRpqList!.map((e)=>e.toJson()).toList();
    _data['qualificationRpqList'] = qualificationRpqList!.map((e)=>e.toJson()).toList();
    _data['riskAppetiteRpqList'] = riskAppetiteRpqList!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class AgeRpqList {
  AgeRpqList({
     this.code,
     this.desc,
     this.score,
     this.type,
  });
   int? code;
   String? desc;
   int? score;
   String? type;

  AgeRpqList.fromJson(Map<String, dynamic> json){
    code = json['code'];
    desc = json['desc'];
    score = json['score'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['desc'] = desc;
    _data['score'] = score;
    _data['type'] = type;
    return _data;
  }
}

class FinancialPositionRpqList {
  FinancialPositionRpqList({
     this.code,
     this.desc,
     this.score,
     this.type,
  });
   int? code;
   String? desc;
   int? score;
   String? type;

  FinancialPositionRpqList.fromJson(Map<String, dynamic> json){
    code = json['code'];
    desc = json['desc'];
    score = json['score'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['desc'] = desc;
    _data['score'] = score;
    _data['type'] = type;
    return _data;
  }
}

class InvestHorizonRpqList {
  InvestHorizonRpqList({
     this.code,
     this.desc,
     this.score,
     this.type,
  });
   int? code;
   String? desc;
   int? score;
   String? type;

  InvestHorizonRpqList.fromJson(Map<String, dynamic> json){
    code = json['code'];
    desc = json['desc'];
    score = json['score'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['desc'] = desc;
    _data['score'] = score;
    _data['type'] = type;
    return _data;
  }
}

class InvestKnowledgeRpqList {
  InvestKnowledgeRpqList({
     this.code,
     this.desc,
     this.score,
     this.type,
  });
   int? code;
   String? desc;
   int? score;
   String? type;

  InvestKnowledgeRpqList.fromJson(Map<String, dynamic> json){
    code = json['code'];
    desc = json['desc'];
    score = json['score'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['desc'] = desc;
    _data['score'] = score;
    _data['type'] = type;
    return _data;
  }
}

class InvestObjRpqList {
  InvestObjRpqList({
     this.code,
     this.desc,
     this.score,
     this.type,
  });
   int? code;
   String? desc;
   int? score;
   String? type;

  InvestObjRpqList.fromJson(Map<String, dynamic> json){
    code = json['code'];
    desc = json['desc'];
    score = json['score'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['desc'] = desc;
    _data['score'] = score;
    _data['type'] = type;
    return _data;
  }
}

class MaritalStatusRpqList {
  MaritalStatusRpqList({
     this.code,
     this.desc,
     this.score,
     this.type,
  });
   int? code;
   String? desc;
   int? score;
   String? type;

  MaritalStatusRpqList.fromJson(Map<String, dynamic> json){
    code = json['code'];
    desc = json['desc'];
    score = json['score'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['desc'] = desc;
    _data['score'] = score;
    _data['type'] = type;
    return _data;
  }
}

class NoOfDependentsRpqList {
  NoOfDependentsRpqList({
     this.code,
     this.desc,
     this.score,
     this.type,
  });
   int? code;
   String? desc;
   int? score;
   String? type;

  NoOfDependentsRpqList.fromJson(Map<String, dynamic> json){
    code = json['code'];
    desc = json['desc'];
    score = json['score'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['desc'] = desc;
    _data['score'] = score;
    _data['type'] = type;
    return _data;
  }
}

class OccupationRpqList {
  OccupationRpqList({
     this.code,
     this.desc,
     this.score,
     this.type,
  });
   int? code;
   String? desc;
   int? score;
   String? type;

  OccupationRpqList.fromJson(Map<String, dynamic> json){
    code = json['code'];
    desc = json['desc'];
    score = json['score'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['desc'] = desc;
    _data['score'] = score;
    _data['type'] = type;
    return _data;
  }
}

class QualificationRpqList {
  QualificationRpqList({
     this.code,
     this.desc,
     this.score,
     this.type,
  });
   int? code;
   String? desc;
   int? score;
   String? type;

  QualificationRpqList.fromJson(Map<String, dynamic> json){
    code = json['code'];
    desc = json['desc'];
    score = json['score'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['desc'] = desc;
    _data['score'] = score;
    _data['type'] = type;
    return _data;
  }
}

class RiskAppetiteRpqList {
  RiskAppetiteRpqList({
     this.code,
     this.desc,
     this.score,
     this.type,
  });
   int? code;
   String? desc;
   int? score;
   String? type;

  RiskAppetiteRpqList.fromJson(Map<String, dynamic> json){
    code = json['code'];
    desc = json['desc'];
    score = json['score'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['desc'] = desc;
    _data['score'] = score;
    _data['type'] = type;
    return _data;
  }
}