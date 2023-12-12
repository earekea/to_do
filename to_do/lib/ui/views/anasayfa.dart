import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/data/entitiy/yapilacaklar.dart';
import 'package:to_do/ui/cubit/anasayfa_cubit.dart';
import 'package:to_do/ui/views/detay_sayfa.dart';
import 'package:to_do/ui/views/kayit_sayfa.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  bool aramaYapiliyorMu = false;


  @override
  void initState() {
    super.initState();
    context.read<AnaSayfaCubit>().yapilacaklariYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
flexibleSpace: Image(image: AssetImage('images/snow3.jpg'),fit: BoxFit.cover,),
        backgroundColor: Color(0xff071240).withOpacity(0.9),

        centerTitle: true,
        title: aramaYapiliyorMu
            ? TextField(

          cursorColor:Color(0xff9a4f3f),
                decoration: InputDecoration(hintText: 'Ara',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff9a4f3f))
                )),
          textAlign: TextAlign.center,
          onChanged: (aramaSonucu){
            context.read<AnaSayfaCubit>().ara(aramaSonucu);
          },
              )
            : Text("Yapılacaklar ",style: TextStyle(color:Color(0xffCFC7DC),fontFamily: 'Pacifico'),),
        actions: [
          aramaYapiliyorMu
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      aramaYapiliyorMu = false;
                    });
                    context.read<AnaSayfaCubit>().yapilacaklariYukle();
                  },
                  icon: Icon(Icons.clear),color: Color(0xffCFC7DC),)
              : IconButton(
                  onPressed: () {
                    setState(() {
                      aramaYapiliyorMu = true;
                    });
                  },
                  icon: Icon(Icons.search),color: Color(0xffCFC7DC),)
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/snow.jpg'),
              fit: BoxFit.cover
          ),

        ),
        child:  Padding(
          padding: const EdgeInsets.only(top: 30, left: 20.0, right: 20, bottom: 30),
          child: SizedBox(
            child: BlocBuilder<AnaSayfaCubit,List<Yapilacaklar>>(
              builder: (context, yapilacaklarListesi){
                if(yapilacaklarListesi.isNotEmpty){

                  return ListView.builder(
                    itemCount: yapilacaklarListesi.length,
                    itemBuilder: (context,indeks){
                      var yapilacak= yapilacaklarListesi[indeks];
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> DetaySayfa(yapilacak: yapilacak)))
                          .then((value) {
                            context.read<AnaSayfaCubit>().yapilacaklariYukle();
                          });
                        },
                        child: Card(
                          color: Color(0xff7895C4).withOpacity(0.5),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(yapilacak.yapilacak_gorev,style: TextStyle(fontSize: 20,color: Color(0xffCFC7DC),fontWeight: FontWeight.bold,fontFamily: 'Satisfy'),),


                                  ],
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Color(0xff565789).withOpacity(0.5) ,
                                        content: Text('${yapilacak.yapilacak_gorev} Silinsin mi?',style: TextStyle(color: Color(0xffCFC7DC),fontFamily: 'Satisfy'),),
                                        action: SnackBarAction(label: 'Evet',textColor: Color(0xffCFC7DC),
                                            onPressed: (){
                                              context.read<AnaSayfaCubit>().sil(yapilacak.yapilacak_id);
                                            }),
                                      )
                                  );
                                },
                                icon: Icon(Icons.clear),color: Colors.black87,),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else{
                  return Center();
                }
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(

          elevation: 2.0,
          backgroundColor: Color(0xff565789).withOpacity(0.5),
          shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
            ),
          ),
          child: Icon(Icons.add,
            size: 30,color: Color(0xffCFC7DC),),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> KayitSayfa()))
            .then((value) {
              context.read<AnaSayfaCubit>().yapilacaklariYukle();
            });
          }),
    );
  }
}
