
class SocialMediaLink {
  String? action;
  Meta? meta;
  Response? response;

  SocialMediaLink({this.action, this.meta, this.response});

  SocialMediaLink.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action;
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    return data;
  }
}

class Meta {
  String? code;
  String? error;
  String? message;

  Meta({this.code, this.error, this.message});

  Meta.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['error'] = this.error;
    data['message'] = this.message;
    return data;
  }
}

class Response {
  Calculators? calculators;
  HomeLinks? homeLinks;

  Response({this.calculators, this.homeLinks});

  Response.fromJson(Map<String, dynamic> json) {
    calculators = json['calculators'] != null
        ? new Calculators.fromJson(json['calculators'])
        : null;
    homeLinks = json['homeLinks'] != null
        ? new HomeLinks.fromJson(json['homeLinks'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.calculators != null) {
      data['calculators'] = this.calculators!.toJson();
    }
    if (this.homeLinks != null) {
      data['homeLinks'] = this.homeLinks!.toJson();
    }
    return data;
  }
}

class Calculators {
  String? performanceAnalyzer;
  String? savingsCalculator;

  Calculators({this.performanceAnalyzer, this.savingsCalculator});

  Calculators.fromJson(Map<String, dynamic> json) {
    performanceAnalyzer = json['performanceAnalyzer'];
    savingsCalculator = json['savingsCalculator'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['performanceAnalyzer'] = this.performanceAnalyzer;
    data['savingsCalculator'] = this.savingsCalculator;
    return data;
  }
}

class HomeLinks {
  String? aboutUs;
  String? advisorEmail;
  String? advisorPhone;
  String? advisorSms;
  String? branchLocator;
  String? chatUrl;
  String? contactUs;
  String? facebook;
  String? followUs;
  String? latestNav;
  String? learning;
  String? market;
  String? products;
  String? reports;
  String? twitter;

  HomeLinks(
      {this.aboutUs,
        this.advisorEmail,
        this.advisorPhone,
        this.advisorSms,
        this.branchLocator,
        this.chatUrl,
        this.contactUs,
        this.facebook,
        this.followUs,
        this.latestNav,
        this.learning,
        this.market,
        this.products,
        this.reports,
        this.twitter});

  HomeLinks.fromJson(Map<String, dynamic> json) {
    aboutUs = json['aboutUs'];
    advisorEmail = json['advisorEmail'];
    advisorPhone = json['advisorPhone'];
    advisorSms = json['advisorSms'];
    branchLocator = json['branchLocator'];
    chatUrl = json['chatUrl'];
    contactUs = json['contactUs'];
    facebook = json['facebook'];
    followUs = json['followUs'];
    latestNav = json['latestNav'];
    learning = json['learning'];
    market = json['market'];
    products = json['products'];
    reports = json['reports'];
    twitter = json['twitter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['aboutUs'] = aboutUs;
    data['advisorEmail'] = advisorEmail;
    data['advisorPhone'] = advisorPhone;
    data['advisorSms'] = advisorSms;
    data['branchLocator'] = branchLocator;
    data['chatUrl'] = chatUrl;
    data['contactUs'] = contactUs;
    data['facebook'] = facebook;
    data['followUs'] = followUs;
    data['latestNav'] = latestNav;
    data['learning'] = learning;
    data['market'] = market;
    data['products'] = products;
    data['reports'] = reports;
    data['twitter'] = twitter;
    return data;
  }
}