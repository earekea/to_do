

import 'package:to_do/data/entitiy/yapilacaklar.dart';
import 'package:to_do/sqlite/veritabani_yardimcisi.dart';

class YapilacaklarDaoRepository{
 Future<void> kaydet(String yapilacak_gorev)async{
  var db = await VeritabaniYardimcisi.veritabaniErisim();
  var yeniGorev= Map<String,dynamic>();
  yeniGorev['yapilacak_gorev']=yapilacak_gorev;
  await db.insert('yapilacaklar', yeniGorev);
 }
 Future<void> guncelle(int yapilacak_id, String yapilacak_gorev)async{
  var db = await VeritabaniYardimcisi.veritabaniErisim();
  var  guncellenenGorev= Map<String,dynamic>();
  guncellenenGorev['yapilacak_gorev'] = yapilacak_gorev;

  await db.update('yapilacaklar', guncellenenGorev , where: 'yapilacak_id = ?', whereArgs: [yapilacak_id]);
 }
 Future<void> sil(int yapilacak_id) async {
  var db = await VeritabaniYardimcisi.veritabaniErisim();

  await db.delete('yapilacaklar', where: 'yapilacak_id = ?', whereArgs: [yapilacak_id]);
 }

 Future<List<Yapilacaklar>> yapilacaklariYukle() async {
  var db = await VeritabaniYardimcisi.veritabaniErisim();
  List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM yapilacaklar");

  return List.generate(maps.length, (i) {
   var satir = maps[i];
   return Yapilacaklar(yapilacak_id: satir['yapilacak_id'], yapilacak_gorev: satir['yapilacak_gorev']);
  });
 }
 Future<List<Yapilacaklar>> ara(String aramaKelimesi) async {
  var db = await VeritabaniYardimcisi.veritabaniErisim();
  List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM yapilacaklar WHERE yapilacak_gorev like '%$aramaKelimesi%'");

  return List.generate(maps.length, (i) {
   var satir = maps[i];
   return Yapilacaklar(yapilacak_id: satir['yapilacak_id'], yapilacak_gorev: satir['yapilacak_gorev']);
  });
 }
}