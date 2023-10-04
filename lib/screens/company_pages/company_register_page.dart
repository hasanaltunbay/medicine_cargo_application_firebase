import 'package:drug_shipping/screens/company_pages/company_homepage.dart';
import 'package:drug_shipping/screens/cubit/homepage_cubit.dart';
import 'package:drug_shipping/screens/cubit/register_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyRegisterPage extends StatefulWidget {
  const CompanyRegisterPage({super.key});

  @override
  State<CompanyRegisterPage> createState() => _CompanyRegisterPageState();
}

class _CompanyRegisterPageState extends State<CompanyRegisterPage> {
  var tfTeslimatAdi = TextEditingController();
  var tfTeslimatNereden = TextEditingController();
  var tfTeslimatNereye = TextEditingController();
  var tfTeslimatSure = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("New Delivery"),
      backgroundColor: Colors.green),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfTeslimatAdi,decoration: const InputDecoration(hintText:"Şirket Adı",labelText: "İlaç Firma Adı"),),
              TextField(controller: tfTeslimatNereden,decoration: const InputDecoration(hintText: "Teslimatın Alınacağı Adres",labelText: "Teslimat Başlangıç"),),
              TextField(controller: tfTeslimatNereye,decoration: const InputDecoration(hintText: "Teslimatın Bırakılacağı Adres",labelText: "Teslimat Bitiş"),),
              TextField(controller: tfTeslimatSure,decoration: const InputDecoration(labelText: "Teslimat Süre(Saat Cinsinden Yazınız)",hintText: "0"),keyboardType: TextInputType.number,),
              ElevatedButton(onPressed: (){
                context.read<RegisterPageCubit>().kaydet(tfTeslimatAdi.text, tfTeslimatNereden.text, tfTeslimatNereye.text, int.parse(tfTeslimatSure.text));
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CompanyHomePage())).then((value){
                  context.read<HomePageCubit>().teslimatlariYukle();
                });
              }, child: const Text("SAVE"))
            ],
          ),
        ),
      ),
    );
  }
}
