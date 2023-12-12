import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/data/entitiy/yapilacaklar.dart';
import 'package:to_do/data/repo/yapilacaklardao_repository.dart';

class AnaSayfaCubit extends Cubit<List<Yapilacaklar>> {
  AnaSayfaCubit(): super([]);
  var yrepo= YapilacaklarDaoRepository();

  Future<void> yapilacaklariYukle() async {
    var liste = await yrepo.yapilacaklariYukle();
    emit(liste);
  }
  Future<void> ara(String aramaKelimesi) async {
    var liste = await yrepo.ara(aramaKelimesi);
    emit(liste);
  }

  Future<void> sil(int yapilacak_id) async {
    await yrepo.sil(yapilacak_id);
    await yapilacaklariYukle();
  }
}