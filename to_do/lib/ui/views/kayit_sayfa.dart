import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/ui/cubit/kayit_sayfa_cubit.dart';

class KayitSayfa extends StatefulWidget {
  const KayitSayfa({super.key});

  @override
  State<KayitSayfa> createState() => _KayitSayfaState();
}

class _KayitSayfaState extends State<KayitSayfa> {
  var tfyapiacakGorev = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2A4F82),

      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/snow2.jpg'),
              fit: BoxFit.cover,
            ),
            boxShadow: [BoxShadow(blurRadius: 40.0)],
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(MediaQuery.of(context).size.width, 200),
              top: Radius.elliptical(MediaQuery.of(context).size.width, 200),
            )),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Görev Kayıt',textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'Pacifico',
                  color: Color(0xff9a4f3f),
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold),),
            Padding(
              padding: const EdgeInsets.only(bottom: 120.0),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextField(style: TextStyle(color: Color(0xffF5C58A), fontWeight: FontWeight.bold,fontSize: 25,fontFamily: 'Satisfy'),
                        cursorColor: Color(0xffF5C58A),
                        controller: tfyapiacakGorev,
                        decoration: const InputDecoration(

                            hintText: 'Yapılacaklar Ekle',
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xffF5C58A)))),

                        textAlign: TextAlign.center,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff9a4f3f)),
                          onPressed: () {
                            context
                                .read<KayitSayfaCubit>()
                                .kaydet(tfyapiacakGorev.text);
                            Navigator.pop(context);
                          },
                          child: Text(
                            'KAYDET',
                            style: TextStyle(color: Color(0xff3B2E30),fontFamily: 'Pacifico'),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
