class NewsNotification {
  NewsNotification({
     this.action,
     this.meta,
     this.response,
  });
   String? action;
   Meta? meta;
   List<Response>? response;

  NewsNotification.fromJson(Map<String, dynamic> json){
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
     this.id,
     this.newDescription,
     this.newsIssueDate,
     this.noOfHours,
     this.showNewsTimePassed,
  });
   String? id;
   String? newDescription;
   String? newsIssueDate;
   String? noOfHours;
   String? showNewsTimePassed;

  Response.fromJson(Map<String, dynamic> json){
    id = json['id'];
    newDescription = json['newDescription'];
    newsIssueDate = json['newsIssueDate'];
    noOfHours = json['noOfHours'];
    showNewsTimePassed = json['showNewsTimePassed'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['newDescription'] = newDescription;
    _data['newsIssueDate'] = newsIssueDate;
    _data['noOfHours'] = noOfHours;
    _data['showNewsTimePassed'] = showNewsTimePassed;
    return _data;
  }
}