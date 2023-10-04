import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';

class TeslimatBilgiRepository{
  var collectionTeslimat = FirebaseFirestore.instance.collection("Teslimatlar");

  Future<void> kaydet(String ad,String nereden,String nereye,int sure) async {
    var yeniTeslimat = HashMap<String,dynamic>();
    yeniTeslimat["ad"] = ad;
    yeniTeslimat["nereden"] = nereden;
    yeniTeslimat["nereye"] = nereye;
    yeniTeslimat["sure"] = sure;
    collectionTeslimat.add(yeniTeslimat);
  }

  Future<void> guncelle(String id,String ad,String nereden,String nereye,int sure) async {
    var guncellenenTeslimat = HashMap<String,dynamic>();
    guncellenenTeslimat["ad"] = ad;
    guncellenenTeslimat["nereden"] = nereden;
    guncellenenTeslimat["nereye"] = nereye;
    guncellenenTeslimat["sure"] = sure;
    collectionTeslimat.doc(id).update(guncellenenTeslimat);
  }

  Future<void> sil(String id) async {
    collectionTeslimat.doc(id).delete();
  }
}