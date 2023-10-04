class TeslimatBilgi {

  String id;
  String ad;
  String nereden;
  String nereye;
  int sure;

  TeslimatBilgi(
      {required this.id, required this.ad, required this.nereden, required this.nereye, required this.sure});

  factory TeslimatBilgi.fromJson(Map<dynamic, dynamic> json, String key){
    return TeslimatBilgi(id: key,
        ad: json["ad"] as String,
        nereden: json["nereden"] as String,
        nereye: json["nereye"] as String,
        sure: json["sure"] as int);
  }
}