import 'package:drug_shipping/data/entity/teslimatBilgi.dart';
import 'package:drug_shipping/screens/cubit/detail_page_cubit.dart';
import 'package:drug_shipping/screens/driver_pages/location_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatefulWidget {
  TeslimatBilgi teslimat;


  DetailPage({required this.teslimat});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  var tfTeslimatAdi = TextEditingController();
  var tfTeslimatNereden = TextEditingController();
  var tfTeslimatNereye = TextEditingController();
  var tfTeslimatSure = TextEditingController();

  @override
  void initState() {
    super.initState();

    var teslimat=widget.teslimat;
    tfTeslimatAdi.text=teslimat.ad;
    tfTeslimatNereden.text=teslimat.nereden;
    tfTeslimatNereye.text=teslimat.nereye;
    tfTeslimatSure.text=teslimat.sure.toString();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Delivery Detail"),
      backgroundColor: Colors.red,),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfTeslimatAdi,decoration: const InputDecoration(labelText: "İlaç Firma Adı"),enabled: false,),
              TextField(controller: tfTeslimatNereden,decoration: const InputDecoration(labelText: "Teslimat Başlangıç"),enabled: false,),
              TextField(controller: tfTeslimatNereye,decoration: const InputDecoration(labelText: "Teslimat Bitiş"),enabled: false,),
              TextField(controller: tfTeslimatSure,decoration: const InputDecoration(labelText: "Teslimat Süre(Saat Cinsinden Yazınız)"),enabled: false,),
              ElevatedButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LocationPage(teslimatBilgi: widget.teslimat,)));
              }, child: const Text("Go To Location",style: TextStyle(color: Colors.black),))
            ],
          ),
        ),
      ),
    );
  }
}
