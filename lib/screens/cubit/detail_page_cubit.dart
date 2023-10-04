import 'package:drug_shipping/data/repo/teslimatBilgi_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPageCubit extends Cubit<void>{
  DetailPageCubit():super(0);

  var trepo=TeslimatBilgiRepository();

  Future<void> guncelle(String id,String ad,String nereden,String nereye,int sure) async {
    await trepo.guncelle(id, ad, nereden, nereye, sure);
  }
}