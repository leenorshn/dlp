class transResult {
  String sId;
  int amount;
  String sender;
  String receiver;
  String currency;
  String provider;

  transResult(
      {this.sId,
      this.amount,
      this.sender,
      this.receiver,
      this.currency,
      this.provider});

  transResult.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    amount = json['amount'];
    sender = json['sender'];
    receiver = json['receiver'];
    currency = json['currency'];
    provider = json['provider'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['amount'] = this.amount;
    data['sender'] = this.sender;
    data['receiver'] = this.receiver;
    data['currency'] = this.currency;
    data['provider'] = this.provider;
    return data;
  }
}
