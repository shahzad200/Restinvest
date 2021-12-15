class DailyNavPrices {
  DailyNavPrices({
     this.action,
     this.meta,
     this.response,
  });
   String? action;
   Meta? meta;
   Response? response;

  DailyNavPrices.fromJson(Map<String, dynamic> json){
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
     this.dailyExchangeFundNavList,
     this.dailyMutualFundNavList,
     this.dailyPensionFundNavList,
     this.navHistoryLink,
  });
   List<DailyExchangeFundNavList>? dailyExchangeFundNavList;
   List<DailyMutualFundNavList>? dailyMutualFundNavList;
   List<DailyPensionFundNavList>? dailyPensionFundNavList;
   String? navHistoryLink;

  Response.fromJson(Map<String, dynamic> json){
    dailyExchangeFundNavList = List.from(json['dailyExchangeFundNavList']).map((e)=>DailyExchangeFundNavList.fromJson(e)).toList();
    dailyMutualFundNavList = List.from(json['dailyMutualFundNavList']).map((e)=>DailyMutualFundNavList.fromJson(e)).toList();
    dailyPensionFundNavList = List.from(json['dailyPensionFundNavList']).map((e)=>DailyPensionFundNavList.fromJson(e)).toList();
    navHistoryLink = json['navHistoryLink'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dailyExchangeFundNavList'] = dailyExchangeFundNavList!.map((e)=>e.toJson()).toList();
    _data['dailyMutualFundNavList'] = dailyMutualFundNavList!.map((e)=>e.toJson()).toList();
    _data['dailyPensionFundNavList'] = dailyPensionFundNavList!.map((e)=>e.toJson()).toList();
    _data['navHistoryLink'] = navHistoryLink;
    return _data;
  }
}

class DailyExchangeFundNavList {
  DailyExchangeFundNavList({
     this.fundCode,
     this.fundRepurchase,
     this.fundSale,
     this.fundType,
     this.funddate,
  });
   String? fundCode;
   double? fundRepurchase;
   double? fundSale;
   String? fundType;
   String? funddate;

  DailyExchangeFundNavList.fromJson(Map<String, dynamic> json){
    fundCode = json['fundCode'];
    fundRepurchase = json['fundRepurchase'];
    fundSale = json['fundSale'];
    fundType = json['fundType'];
    funddate = json['funddate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fundCode'] = fundCode;
    _data['fundRepurchase'] = fundRepurchase;
    _data['fundSale'] = fundSale;
    _data['fundType'] = fundType;
    _data['funddate'] = funddate;
    return _data;
  }
}

class DailyMutualFundNavList {
  DailyMutualFundNavList({
     this.fundCode,
     this.fundRepurchase,
     this.fundSale,
     this.fundType,
     this.funddate,
  });
   String? fundCode;
   double? fundRepurchase;
   double? fundSale;
   String? fundType;
   String? funddate;

  DailyMutualFundNavList.fromJson(Map<String, dynamic> json){
    fundCode = json['fundCode'];
    fundRepurchase = json['fundRepurchase'];
    fundSale = json['fundSale'];
    fundType = json['fundType'];
    funddate = json['funddate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fundCode'] = fundCode;
    _data['fundRepurchase'] = fundRepurchase;
    _data['fundSale'] = fundSale;
    _data['fundType'] = fundType;
    _data['funddate'] = funddate;
    return _data;
  }
}

class DailyPensionFundNavList {
  DailyPensionFundNavList({
     this.fundCode,
     this.fundRepurchase,
     this.fundSale,
     this.fundType,
     this.funddate,
  });
   String? fundCode;
   double? fundRepurchase;
   double? fundSale;
   String? fundType;
   String? funddate;

  DailyPensionFundNavList.fromJson(Map<String, dynamic> json){
    fundCode = json['fundCode'];
    fundRepurchase = json['fundRepurchase'];
    fundSale = json['fundSale'];
    fundType = json['fundType'];
    funddate = json['funddate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fundCode'] = fundCode;
    _data['fundRepurchase'] = fundRepurchase;
    _data['fundSale'] = fundSale;
    _data['fundType'] = fundType;
    _data['funddate'] = funddate;
    return _data;
  }
}