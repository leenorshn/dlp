/// balance : 0
/// status : "Active"
/// _id : "5f4d0971e1ac8a2d20090d19"
/// owner : {"avatar":"https://avatar-url","role":"client","isVerified":false,"isAuthorized":true,"_id":"5f4d0971e1ac8a2d20090d18","name":"Mobile","phone":"+243978154329"}

class DlpAccount {
  int balance;
  String status;
  String sId;
  Owner owner;

  DlpAccount({this.balance, this.status, this.sId, this.owner});

  DlpAccount.fromJson(Map<String, dynamic> json) {
    balance = json['balance'];
    status = json['status'];
    sId = json['_id'];
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['balance'] = this.balance;
    data['status'] = this.status;
    data['_id'] = this.sId;
    if (this.owner != null) {
      data['owner'] = this.owner.toJson();
    }
    return data;
  }
}

class Owner {
  String avatar;
  String role;
  bool isVerified;
  bool isAuthorized;
  String sId;
  String name;
  String phone;

  Owner(
      {this.avatar,
      this.role,
      this.isVerified,
      this.isAuthorized,
      this.sId,
      this.name,
      this.phone});

  Owner.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    role = json['role'];
    isVerified = json['isVerified'];
    isAuthorized = json['isAuthorized'];
    sId = json['_id'];
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = this.avatar;
    data['role'] = this.role;
    data['isVerified'] = this.isVerified;
    data['isAuthorized'] = this.isAuthorized;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['phone'] = this.phone;
    return data;
  }
}
