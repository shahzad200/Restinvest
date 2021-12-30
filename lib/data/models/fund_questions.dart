class FundQuestions {
  FundQuestions({
     this.action,
     this.meta,
     this.response,
  });
   String? action;
   Meta? meta;
   Response? response;

  FundQuestions.fromJson(Map<String, dynamic> json){
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
     this.pickFundQuestions,
  });
   List<PickFundQuestions>? pickFundQuestions;

  Response.fromJson(Map<String, dynamic> json){
    pickFundQuestions = List.from(json['pickFundQuestions']).map((e)=>PickFundQuestions.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['pickFundQuestions'] = pickFundQuestions!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class PickFundQuestions {
  PickFundQuestions({
     this.questionDesc,
     this.questionId,
     this.questionOptions,
     this.questionPriority,
     this.selectedValueWeightage,
  });
   String? questionDesc;
   String? questionId;
   List<QuestionOptions>? questionOptions;
   String? questionPriority;
   String? selectedValueWeightage;

  PickFundQuestions.fromJson(Map<String, dynamic> json){
    questionDesc = json['questionDesc'];
    questionId = json['questionId'];
    questionOptions = List.from(json['questionOptions']).map((e)=>QuestionOptions.fromJson(e)).toList();
    questionPriority = json['questionPriority'];
    selectedValueWeightage = json['selectedValueWeightage'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['questionDesc'] = questionDesc;
    _data['questionId'] = questionId;
    _data['questionOptions'] = questionOptions!.map((e)=>e.toJson()).toList();
    _data['questionPriority'] = questionPriority;
    _data['selectedValueWeightage'] = selectedValueWeightage;
    return _data;
  }
}

class QuestionOptions {
  QuestionOptions({
     this.optionDesc,
     this.optionId,
     this.optionLetter,
     this.weightage,
  });
   String? optionDesc;
   String? optionId;
   String? optionLetter;
   String? weightage;

  QuestionOptions.fromJson(Map<String, dynamic> json){
    optionDesc = json['optionDesc'];
    optionId = json['optionId'];
    optionLetter = json['optionLetter'];
    weightage = json['weightage'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['optionDesc'] = optionDesc;
    _data['optionId'] = optionId;
    _data['optionLetter'] = optionLetter;
    _data['weightage'] = weightage;
    return _data;
  }
}