import 'package:drug_shipping/data/repo/teslimatBilgi_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPageCubit extends Cubit<void>{
  RegisterPageCubit():super(0);

  var trepo=TeslimatBilgiRepository();

  Future<void> kaydet(String ad,String nereden,String nereye,int sure) async {
    await trepo.kaydet(ad, nereden, nereye, sure);
  }
}