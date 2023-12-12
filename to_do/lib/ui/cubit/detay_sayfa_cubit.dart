
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/data/repo/yapilacaklardao_repository.dart';

class DetaySayfaCubit extends Cubit<void>{
  DetaySayfaCubit():super(0);

  var yrepo= YapilacaklarDaoRepository();

Future<void> guncelle (int yapilacak_id,yapilacak_gorev) async{
  await yrepo.guncelle(yapilacak_id, yapilacak_gorev);
}
}