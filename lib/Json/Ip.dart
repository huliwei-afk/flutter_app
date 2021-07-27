class Ip{
  String reason;
  Ip(this.reason);
  Ip.fromJson(Map<String, dynamic> json) : reason = json['reason'];
  Map<String, dynamic> toJson() => {"reason" : reason };
}