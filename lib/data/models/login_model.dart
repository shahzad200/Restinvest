

class LoginModel {
  LoginModel({
    this.action,
    this.meta,
    this.response,
  });

  String? action;
  Meta? meta;
  Response? response;

  LoginModel.fromJson(Map<String, dynamic> json) {
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

  Meta.fromJson(Map<String, dynamic> json) {
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
    this.accounts,
    this.umsAccountExists,
    this.user,
    this.vpsAccountExists,
  });

  List<Accounts>? accounts;
  bool? umsAccountExists;
  User? user;
  bool? vpsAccountExists;

  Response.fromJson(Map<String, dynamic> json) {
    accounts =
        List.from(json['accounts']).map((e) => Accounts.fromJson(e)).toList();
    umsAccountExists = json['umsAccountExists'];
    user = User.fromJson(json['user']);
    vpsAccountExists = json['vpsAccountExists'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['accounts'] = accounts!.map((e) => e.toJson()).toList();
    _data['umsAccountExists'] = umsAccountExists;
    _data['user'] = user!.toJson();
    _data['vpsAccountExists'] = vpsAccountExists;
    return _data;
  }
}

class Accounts {
  Accounts({
    this.bankDetails,
    this.folioNumber,
    this.fundNavPriceData,
    this.pensionFundList,
    this.portfolioAllocationData,
    this.portfolioAnalyPurchases,
    this.portfolioAnalyPurchasesMaxValue,
    this.portfolioAnalyPurchasesMinValue,
    this.portfolioAnalyRedemptions,
    this.portfolioAnalyRedemptionsMaxValue,
    this.portfolioAnalyRedemptionsMinValue,
    this.portfolioInvestmentValue,
    this.umsAccount,
    this.userFundBalances,
    this.vpsAccount,
  });
  Bank? bankDetails;
  String? folioNumber;
  List<FundNavPriceData>? fundNavPriceData;
  List<PensionFundList>? pensionFundList;
  List<PortfolioAllocationData>? portfolioAllocationData;
  List<PortfolioAnalyPurchases>? portfolioAnalyPurchases;
  String? portfolioAnalyPurchasesMaxValue;
  String? portfolioAnalyPurchasesMinValue;
  List<PortfolioAnalyRedemptions>? portfolioAnalyRedemptions;
  String? portfolioAnalyRedemptionsMaxValue;
  String? portfolioAnalyRedemptionsMinValue;
  String? portfolioInvestmentValue;
  bool? umsAccount;
  List<UserFundBalances>? userFundBalances;
  bool? vpsAccount;
  Accounts.fromJson(Map<String, dynamic> json) {
    bankDetails = Bank.fromJson(json['bankDetails']);
    folioNumber = json['folioNumber'];
    fundNavPriceData = List.from(json['fundNavPriceData'])
        .map((e) => FundNavPriceData.fromJson(e))
        .toList();
    pensionFundList = List.from(json['pensionFundList']).map((e)=>PensionFundList.fromJson(e)).toList();
    portfolioAllocationData = List.from(json['portfolioAllocationData']).map((e)=>PortfolioAllocationData.fromJson(e)).toList();
    portfolioAnalyPurchases = List.from(json['portfolioAnalyPurchases'])
        .map((e) => PortfolioAnalyPurchases.fromJson(e))
        .toList();
    portfolioAnalyPurchasesMaxValue = json['portfolioAnalyPurchasesMaxValue'];
    portfolioAnalyPurchasesMinValue = json['portfolioAnalyPurchasesMinValue'];
    portfolioAnalyRedemptions = List.from(json['portfolioAnalyRedemptions'])
        .map((e) => PortfolioAnalyRedemptions.fromJson(e))
        .toList();
    portfolioAnalyRedemptionsMaxValue =
        json['portfolioAnalyRedemptionsMaxValue'];
    portfolioAnalyRedemptionsMinValue =
        json['portfolioAnalyRedemptionsMinValue'];
    portfolioInvestmentValue = json['portfolioInvestmentValue'];
    umsAccount = json['umsAccount'];
    userFundBalances = List.from(json['userFundBalances'])
        .map((e) => UserFundBalances.fromJson(e))
        .toList();
    vpsAccount = json['vpsAccount'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['bankDetails'] = bankDetails!.toJson();
    _data['folioNumber'] = folioNumber;
    _data['fundNavPriceData'] =
        fundNavPriceData!.map((e) => e.toJson()).toList();
    _data['pensionFundList'] = pensionFundList!.map((e)=>e.toJson()).toList();
    _data['portfolioAllocationData'] = portfolioAllocationData!.map((e)=>e.toJson()).toList();
    _data['portfolioAnalyPurchases'] =
        portfolioAnalyPurchases!.map((e) => e.toJson()).toList();
    _data['portfolioAnalyPurchasesMaxValue'] = portfolioAnalyPurchasesMaxValue;
    _data['portfolioAnalyPurchasesMinValue'] = portfolioAnalyPurchasesMinValue;
    _data['portfolioAnalyRedemptions'] =
        portfolioAnalyRedemptions!.map((e) => e.toJson()).toList();
    _data['portfolioAnalyRedemptionsMaxValue'] =
        portfolioAnalyRedemptionsMaxValue;
    _data['portfolioAnalyRedemptionsMinValue'] =
        portfolioAnalyRedemptionsMinValue;
    _data['portfolioInvestmentValue'] = portfolioInvestmentValue;
    _data['umsAccount'] = umsAccount;
    _data['userFundBalances'] =
        userFundBalances!.map((e) => e.toJson()).toList();
    _data['vpsAccount'] = vpsAccount;
    return _data;
  }
}

class FundNavPriceData {
  FundNavPriceData({
    this.fundCode,
    this.fundName,
    this.fundPercent,
    this.fundRedPrice,
    this.fundSaleLoad,
    this.fundShort,
    this.fundUnits,
    this.fundvolume,
    this.offerPrice,
    this.priceDate,
  });

  String? fundCode;
  String? fundName;
  String? fundPercent;
  String? fundRedPrice;
  String? fundSaleLoad;
  String? fundShort;
  String? fundUnits;
  String? fundvolume;
  String? offerPrice;
  String? priceDate;

  FundNavPriceData.fromJson(Map<String, dynamic> json) {
    fundCode = json['fundCode'];
    fundName = json['fundName'];
    fundPercent = json['fundPercent'];
    fundRedPrice = json['fundRedPrice'];
    fundSaleLoad = json['fundSaleLoad'];
    fundShort = json['fundShort'];
    fundUnits = json['fundUnits'];
    fundvolume = json['fundvolume'];
    offerPrice = json['offerPrice'];
    priceDate = json['priceDate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fundCode'] = fundCode;
    _data['fundName'] = fundName;
    _data['fundPercent'] = fundPercent;
    _data['fundRedPrice'] = fundRedPrice;
    _data['fundSaleLoad'] = fundSaleLoad;
    _data['fundShort'] = fundShort;
    _data['fundUnits'] = fundUnits;
    _data['fundvolume'] = fundvolume;
    _data['offerPrice'] = offerPrice;
    _data['priceDate'] = priceDate;
    return _data;
  }
}

class PortfolioAnalyPurchases {
  PortfolioAnalyPurchases({
     this.amountYaxis,
     this.fundShortXaxis,
  });

   String? amountYaxis;
   String? fundShortXaxis;

  PortfolioAnalyPurchases.fromJson(Map<String, dynamic> json) {
    amountYaxis = json['amountYaxis'];
    fundShortXaxis = json['fundShortXaxis'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['amountYaxis'] = amountYaxis;
    _data['fundShortXaxis'] = fundShortXaxis;
    return _data;
  }
}

class PortfolioAnalyRedemptions {
  PortfolioAnalyRedemptions({
    this.amountYaxis,
    this.fundShortXaxis,
  });

  String? amountYaxis;
  String? fundShortXaxis;

  PortfolioAnalyRedemptions.fromJson(Map<String, dynamic> json) {
    amountYaxis = json['amountYaxis'];
    fundShortXaxis = json['fundShortXaxis'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['amountYaxis'] = amountYaxis;
    _data['fundShortXaxis'] = fundShortXaxis;
    return _data;
  }
}

class UserFundBalances {
  UserFundBalances({
    this.fundCode,
    this.fundName,
    this.fundPercent,
    this.fundRedPrice,
    this.fundSaleLoad,
    this.fundShort,
    this.fundUnits,
    this.fundvolume,
    this.offerPrice,
    this.priceDate,
    this.unitClassess,
  });

  String? fundCode;
  String? fundName;
  String? fundPercent;
  String? fundRedPrice;
  String? fundSaleLoad;
  String? fundShort;
  String? fundUnits;
  String? fundvolume;
  String? offerPrice;
  String? priceDate;
  List<dynamic>? unitClassess;

  UserFundBalances.fromJson(Map<String, dynamic> json) {
    fundCode = json['fundCode'];
    fundName = json['fundName'];
    fundPercent = json['fundPercent'];
    fundRedPrice = json['fundRedPrice'];
    fundSaleLoad = json['fundSaleLoad'];
    fundShort = json['fundShort'];
    fundUnits = json['fundUnits'];
    fundvolume = json['fundvolume'];
    offerPrice = json['offerPrice'];
    priceDate = json['priceDate'];
    unitClassess = List.castFrom<dynamic, dynamic>(json['unitClassess']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fundCode'] = fundCode;
    _data['fundName'] = fundName;
    _data['fundPercent'] = fundPercent;
    _data['fundRedPrice'] = fundRedPrice;
    _data['fundSaleLoad'] = fundSaleLoad;
    _data['fundShort'] = fundShort;
    _data['fundUnits'] = fundUnits;
    _data['fundvolume'] = fundvolume;
    _data['offerPrice'] = offerPrice;
    _data['priceDate'] = priceDate;
    _data['unitClassess'] = unitClassess;
    return _data;
  }
}


class Bank{
  String? accountNumber;
  String? bankAccTitle;
  String? bankAddress;
  String? bankName;
  Bank({
    this.accountNumber,
    this.bankAccTitle,
    this.bankAddress,
    this.bankName,
  });
  Bank.fromJson(Map<String, dynamic> json) {
    accountNumber = json['accountNumber'];
    bankAccTitle = json['bankAccTitle'];
    bankAddress = json['bankAddress'];
    bankName = json['bankName'];
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['accountNumber'] = accountNumber;
    _data['bankAccTitle'] = bankAccTitle;
    _data['bankAddress'] = bankAddress;
    _data['bankName'] = bankName;
    return _data;
  }
}

class User {
  User({
    this.authorization,
    this.cell,
    this.clientCode,
    this.cnic,
    this.cnicExpiryDate,
    this.email,
    this.lastLogin,
    this.localAddress,
    this.name,
    this.ntnNo,
    this.phoneOne,
    this.phoneTwo,
    this.registeredAddress,
    this.sessionAccessCode,
    this.sessionDateTime,
    this.sessionId,
    this.title,
    this.userType,
    this.userid,
    this.accountType,
    this.fatherName,
    this.wht,
    this.zakatStatus
  });
  String? authorization;
  String? cell;
  String? clientCode;
  String? cnic;
  String? cnicExpiryDate;
  String? email;
  String? lastLogin;
  String? localAddress;
  String? name;
  String? ntnNo;
  String? phoneOne;
  String? phoneTwo;
  String? registeredAddress;
  String? sessionAccessCode;
  String? sessionDateTime;
  String? sessionId;
  String? title;
  String? userType;
  String? userid;
  String? accountType;
  String? fatherName;
  String? wht;
  String? zakatStatus;
  User.fromJson(Map<String, dynamic> json) {
    authorization = json['authorization'];
    cell = json['cell'];
    clientCode = json['clientCode'];
    cnic = json['cnic'];
    cnicExpiryDate = json['cnicExpiryDate'];
    email = json['email'];
    lastLogin = json['lastLogin'];
    localAddress = json['localAddress'];
    name = json['name'];
    ntnNo = json['ntnNo'];
    phoneOne = json['phoneOne'];
    phoneTwo = json['phoneTwo'];
    registeredAddress = json['registeredAddress'];
    sessionAccessCode = json['sessionAccessCode'];
    sessionDateTime = json['sessionDateTime'];
    sessionId = json['sessionId'];
    title = json['title'];
    userType = json['userType'];
    userid = json['userid'];
    accountType = json['accountType'];
    fatherName = json['fatherName'];
    wht = json['wht'];
    zakatStatus = json['zakatStatus'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['authorization'] = authorization;
    _data['cell'] = cell;
    _data['clientCode'] = clientCode;
    _data['cnic'] = cnic;
    _data['cnicExpiryDate'] = cnicExpiryDate;
    _data['email'] = email;
    _data['lastLogin'] = lastLogin;
    _data['localAddress'] = localAddress;
    _data['name'] = name;
    _data['ntnNo'] = ntnNo;
    _data['phoneOne'] = phoneOne;
    _data['phoneTwo'] = phoneTwo;
    _data['registeredAddress'] = registeredAddress;
    _data['sessionAccessCode'] = sessionAccessCode;
    _data['sessionDateTime'] = sessionDateTime;
    _data['sessionId'] = sessionId;
    _data['title'] = title;
    _data['userType'] = userType;
    _data['userid'] = userid;
    _data['zakatStatus'] = zakatStatus;

    // "accountType": "INDIVIDUAL",
    // "fatherName": "SAJID MUQEEM ANSARI",
    // "wht": "APPLICABLE",
    // "zakatStatus": "EXEMPT"
    return _data;
  }
}


class PensionFundList {
  PensionFundList({
     this.emplyerId,
     this.emplyerName,
     this.fundCode,
     this.fundName,
     this.fundShort,
     this.isPlanEnable,
    this.minSaleAmount,
     this.salesLoad,
  });
   String? emplyerId;
   String? emplyerName;
   String? fundCode;
   String? fundName;
   String? fundShort;
   String? isPlanEnable;
   String? minSaleAmount;
   int? salesLoad;

  PensionFundList.fromJson(Map<String, dynamic> json){
    emplyerId = json['emplyerId'];
    emplyerName = json['emplyerName'];
    fundCode = json['fundCode'];
    fundName = json['fundName'];
    fundShort = json['fundShort'];
    isPlanEnable = json['isPlanEnable'];
    minSaleAmount = json['minSaleAmount'] ?? '';
    salesLoad = json['salesLoad'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['emplyerId'] = emplyerId;
    _data['emplyerName'] = emplyerName;
    _data['fundCode'] = fundCode;
    _data['fundName'] = fundName;
    _data['fundShort'] = fundShort;
    _data['isPlanEnable'] = isPlanEnable;
    _data['minSaleAmount'] = minSaleAmount;
    _data['salesLoad'] = salesLoad;
    return _data;
  }
}

class PortfolioAllocationData {
  PortfolioAllocationData({
     this.fundCode,
     this.fundName,
     this.fundPercent,
     this.fundRedPrice,
     this.fundShort,
     this.fundUnits,
     this.fundvolume,
  });
   String? fundCode;
   String? fundName;
   String? fundPercent;
   String? fundRedPrice;
   String? fundShort;
   String? fundUnits;
   String? fundvolume;

  PortfolioAllocationData.fromJson(Map<String, dynamic> json){
    fundCode = json['fundCode'];
    fundName = json['fundName'];
    fundPercent = json['fundPercent'];
    fundRedPrice = json['fundRedPrice'];
    fundShort = json['fundShort'];
    fundUnits = json['fundUnits'];
    fundvolume = json['fundvolume'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fundCode'] = fundCode;
    _data['fundName'] = fundName;
    _data['fundPercent'] = fundPercent;
    _data['fundRedPrice'] = fundRedPrice;
    _data['fundShort'] = fundShort;
    _data['fundUnits'] = fundUnits;
    _data['fundvolume'] = fundvolume;
    return _data;
  }
}

