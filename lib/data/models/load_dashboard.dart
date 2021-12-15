class LoadDashboard {
  LoadDashboard({
     this.action,
     this.meta,
     this.response,
  });
   String? action;
   Meta? meta;
   Response? response;

  LoadDashboard.fromJson(Map<String, dynamic> json){
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
     this.folioNumber,
     this.portfolioSummary,
     this.portfolioSummaryMaxValue,
     this.portfolioSummaryMinValue,
  });
   String? folioNumber;
   List<PortfolioSummary>? portfolioSummary;
   String? portfolioSummaryMaxValue;
   String? portfolioSummaryMinValue;

  Response.fromJson(Map<String, dynamic> json){
    folioNumber = json['folioNumber'];
    portfolioSummary = List.from(json['portfolioSummary']).map((e)=>PortfolioSummary.fromJson(e)).toList();
    portfolioSummaryMaxValue = json['portfolioSummaryMaxValue'];
    portfolioSummaryMinValue = json['portfolioSummaryMinValue'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['folioNumber'] = folioNumber;
    _data['portfolioSummary'] = portfolioSummary!.map((e)=>e.toJson()).toList();
    _data['portfolioSummaryMaxValue'] = portfolioSummaryMaxValue;
    _data['portfolioSummaryMinValue'] = portfolioSummaryMinValue;
    return _data;
  }
}

class PortfolioSummary {
  PortfolioSummary({
     this.scaleValueYaxis,
     this.transMonthXaxis,
  });
   String? scaleValueYaxis;
   String? transMonthXaxis;

  PortfolioSummary.fromJson(Map<String, dynamic> json){
    scaleValueYaxis = json['scaleValueYaxis'];
    transMonthXaxis = json['transMonthXaxis'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['scaleValueYaxis'] = scaleValueYaxis;
    _data['transMonthXaxis'] = transMonthXaxis;
    return _data;
  }
}