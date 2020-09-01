/// balance : 0
/// status : "Active"
/// _id : "5f4d0971e1ac8a2d20090d19"
/// owner : {"avatar":"https://avatar-url","role":"client","isVerified":false,"isAuthorized":true,"_id":"5f4d0971e1ac8a2d20090d18","name":"Mobile","phone":"+243978154329"}

class AccountInfo {
  int balance;
  String status;
  String id;
  Owner owner;

  AccountInfo({this.balance, this.status, this.id, this.owner});

  AccountInfo.fromJson(dynamic json) {
    balance = int.parser(json["balance"]);
    status = json["status"];
    id = json["Id"];
    owner = json["owner"] != null ? Owner.fromJson(json["owner"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["balance"] = balance;
    map["status"] = status;
    map["Id"] = id;
    if (owner != null) {
      map["owner"] = owner.toJson();
    }
    return map;
  }
}

/// avatar : "https://avatar-url"
/// role : "client"
/// isVerified : false
/// isAuthorized : true
/// _id : "5f4d0971e1ac8a2d20090d18"
/// name : "Mobile"
/// phone : "+243978154329"

class Owner {
  String avatar;
  String role;
  bool isVerified;
  bool isAuthorized;
  String id;
  String name;
  String phone;

  Owner(
      {this.avatar,
      this.role,
      this.isVerified,
      this.isAuthorized,
      this.id,
      this.name,
      this.phone});

  Owner.fromJson(dynamic json) {
    avatar = json["avatar"];
    role = json["role"];
    isVerified = json["isVerified"];
    isAuthorized = json["isAuthorized"];
    id = json["Id"];
    name = json["name"];
    phone = json["phone"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["avatar"] = avatar;
    map["role"] = role;
    map["isVerified"] = isVerified;
    map["isAuthorized"] = isAuthorized;
    map["Id"] = id;
    map["name"] = name;
    map["phone"] = phone;
    return map;
  }
}
