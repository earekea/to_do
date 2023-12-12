
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/data/repo/yapilacaklardao_repository.dart';

class KayitSayfaCubit extends Cubit<void>{
  KayitSayfaCubit():super([]);
  var yrepo=YapilacaklarDaoRepository();

Future<void> kaydet(String yapilacaklar_gorev) async{
  await yrepo.kaydet(yapilacaklar_gorev);
}
}