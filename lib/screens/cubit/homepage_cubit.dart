import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drug_shipping/data/entity/teslimatBilgi.dart';
import 'package:drug_shipping/data/repo/teslimatBilgi_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageCubit extends Cubit<List<TeslimatBilgi>>{
  HomePageCubit():super(<TeslimatBilgi>[]);

  var trepo=TeslimatBilgiRepository();

  var collectionTeslimat = FirebaseFirestore.instance.collection("Teslimatlar");

  Future<void> teslimatlariYukle() async {
    collectionTeslimat.snapshots().listen((event) {
      var teslimatListesi = <TeslimatBilgi>[];

      var documents = event.docs;
      for(var document in documents){
        var key = document.id;
        var data = document.data();
        var teslimat = TeslimatBilgi.fromJson(data, key);
        teslimatListesi.add(teslimat);
      }

      emit(teslimatListesi);
    });
  }

  Future<void> sil(String id) async {
    await trepo.sil(id);
  }

}