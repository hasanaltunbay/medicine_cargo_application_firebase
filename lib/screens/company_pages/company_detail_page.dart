import 'package:drug_shipping/data/entity/teslimatBilgi.dart';
import 'package:drug_shipping/screens/company_pages/company_homepage.dart';
import 'package:drug_shipping/screens/cubit/detail_page_cubit.dart';
import 'package:drug_shipping/screens/cubit/homepage_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyDetailPage extends StatefulWidget {
  TeslimatBilgi teslimat;


  CompanyDetailPage({required this.teslimat});

  @override
  State<CompanyDetailPage> createState() => _CompanyDetailPageState();
}

class _CompanyDetailPageState extends State<CompanyDetailPage> {
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
      backgroundColor: Colors.green,),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfTeslimatAdi,decoration: const InputDecoration(hintText: "Şirket Adı",labelText: "İlaç Firma Adı"),),
              TextField(controller: tfTeslimatNereden,decoration: const InputDecoration(hintText: "Teslimatın Alınacağı Adres",labelText: "Teslimat Başlangıç"),),
              TextField(controller: tfTeslimatNereye,decoration: const InputDecoration(hintText: "Teslimatın Bırakılacağı Adres",labelText: "Teslimat Bitiş"),),
              TextField(controller: tfTeslimatSure,decoration: const InputDecoration(labelText: "Teslimat Süre(Saat Cinsinden Yazınız)",hintText: "0"),keyboardType: TextInputType.number,),
              ElevatedButton(onPressed: (){
                context.read<DetailPageCubit>().guncelle(widget.teslimat.id, tfTeslimatAdi.text, tfTeslimatNereden.text, tfTeslimatNereye.text, int.parse(tfTeslimatSure.text));
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CompanyHomePage())).then((value){
                      context.read<HomePageCubit>().teslimatlariYukle();
                    });
              }, child: const Text("UPDATE"))
            ],
          ),
        ),
      ),
    );
  }
}
