
class NewUserRegister {
  NewUserRegister({
     this.action,
     this.meta,
     this.response,
  });
   String? action;
   Meta? meta;
   Response? response;

  NewUserRegister.fromJson(Map<String, dynamic> json){
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
     this.birthDate,
     this.cell,
    this.city,
     this.cnic,
     this.cnicExpiryDate,
     this.cnicIsueDate,
     this.country,
     this.email,
     this.fatherOrHusbandName,
     this.fax,
     this.filerNonFiler,
     this.gender,
     this.incomeBracket,
     this.incomeSource,
     this.maritalStatus,
     this.name,
     this.ntn,
     this.occupation,
     this.otherCity,
     this.passport,
     this.phone,
     this.pinCode,
     this.pinCodeExpiryConfigID,
     this.religion,
     this.sector,
     this.title,
  });
   String? address;
   String? birthDate;
   String? cell;
   String? city;
   String? cnic;
   String? cnicExpiryDate;
   String? cnicIsueDate;
   String? country;
   String? email;
   String? fatherOrHusbandName;
   String? fax;
   String? filerNonFiler;
   String? gender;
   String? incomeBracket;
   String? incomeSource;
   String? maritalStatus;
   String? name;
   String? ntn;
   String? occupation;
   String? otherCity;
   String? passport;
   String? phone;
   String? pinCode;
   int? pinCodeExpiryConfigID;
   String? religion;
   String? sector;
   String? title;

  Response.fromJson(Map<String, dynamic> json){
    address = json['address'];
    birthDate = json['birthDate'];
    cell = json['cell'];
    city = json['city'];
    cnic = json['cnic'];
    cnicExpiryDate = json['cnicExpiryDate'];
    cnicIsueDate = json['cnicIsueDate'];
    country = json['country'];
    email = json['email'];
    fatherOrHusbandName = json['fatherOrHusbandName'];
    fax = json['fax'];
    filerNonFiler = json['filerNonFiler'];
    gender = json['gender'];
    incomeBracket = json['incomeBracket'];
    incomeSource = json['incomeSource'];
    maritalStatus = json['maritalStatus'];
    name = json['name'];
    ntn = json['ntn'];
    occupation = json['occupation'];
    otherCity = json['otherCity'];
    passport = json['passport'];
    phone = json['phone'];
    pinCode = json['pinCode'];
    pinCodeExpiryConfigID = json['pinCodeExpiryConfigID'];
    religion = json['religion'];
    sector = json['sector'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['address'] = address;
    _data['birthDate'] = birthDate;
    _data['cell'] = cell;
    _data['city'] = city;
    _data['cnic'] = cnic;
    _data['cnicExpiryDate'] = cnicExpiryDate;
    _data['cnicIsueDate'] = cnicIsueDate;
    _data['country'] = country;
    _data['email'] = email;
    _data['fatherOrHusbandName'] = fatherOrHusbandName;
    _data['fax'] = fax;
    _data['filerNonFiler'] = filerNonFiler;
    _data['gender'] = gender;
    _data['incomeBracket'] = incomeBracket;
    _data['incomeSource'] = incomeSource;
    _data['maritalStatus'] = maritalStatus;
    _data['name'] = name;
    _data['ntn'] = ntn;
    _data['occupation'] = occupation;
    _data['otherCity'] = otherCity;
    _data['passport'] = passport;
    _data['phone'] = phone;
    _data['pinCode'] = pinCode;
    _data['pinCodeExpiryConfigID'] = pinCodeExpiryConfigID;
    _data['religion'] = religion;
    _data['sector'] = sector;
    _data['title'] = title;
    return _data;
  }
}