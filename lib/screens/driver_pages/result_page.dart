import 'package:drug_shipping/data/entity/teslimatBilgi.dart';
import 'package:drug_shipping/screens/cubit/homepage_cubit.dart';
import 'package:drug_shipping/screens/cubit/register_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultPage extends StatefulWidget {
  TeslimatBilgi teslimat;


  ResultPage({required this.teslimat});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  Future<bool> geriDonusTusu(BuildContext context) async{
    Navigator.pop(context);
    context.read<HomePageCubit>().sil(widget.teslimat.id);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Result Screen"),
      backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
            context.read<HomePageCubit>().sil(widget.teslimat.id);
          },
        ),
      ),
      body: WillPopScope(
        onWillPop: ()=> geriDonusTusu(context),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 400,height: 400,
                  child: Image.asset("images/kargo.jpg")),
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
                context.read<HomePageCubit>().sil(widget.teslimat.id);
        }, child: Text("Go To HomePage",style: TextStyle(color: Colors.black),)),


            ],
          ),

        ),
      ),
    );
  }
}
