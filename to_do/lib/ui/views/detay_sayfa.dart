import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/data/entitiy/yapilacaklar.dart';
import 'package:to_do/ui/cubit/detay_sayfa_cubit.dart';

class DetaySayfa extends StatefulWidget {
  Yapilacaklar yapilacak;

  DetaySayfa({required this.yapilacak});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  var tfYapilacakGorevi = TextEditingController();

  @override
  void initState() {
    super.initState();
    var yapilacak = widget.yapilacak;
    tfYapilacakGorevi.text = yapilacak.yapilacak_gorev;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2A4F82),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/snow2.jpg'), fit: BoxFit.fill),
            boxShadow: [BoxShadow(blurRadius: 40.0)],
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(MediaQuery.of(context).size.width, 200),
              top: Radius.elliptical(MediaQuery.of(context).size.width, 200),
            )),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Görev Detay',textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Pacifico',
                  color: Color(0xff9a4f3f),
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold),),
            Padding(
              padding: const EdgeInsets.only(bottom: 120.0),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 50.0,
                    right: 50.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextField(
                        cursorColor: Color(0xffF5C58A),
                        style: TextStyle(
                          fontFamily: 'Satisfy',
                            color: Color(0xffF5C58A),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        controller: tfYapilacakGorevi,
                        decoration: const InputDecoration(
                            hintText: 'Yapılacak görev',
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xffF5C58A)))),
                        textAlign: TextAlign.center,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff9a4f3f)),
                          onPressed: () {
                            context.read<DetaySayfaCubit>().guncelle(
                                widget.yapilacak.yapilacak_id,
                                tfYapilacakGorevi.text);
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Güncelle',
                            style: TextStyle(fontFamily: 'Pacifico',
                                color: Color(0xff3B2E30),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
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
