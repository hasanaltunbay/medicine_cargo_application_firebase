import 'package:drug_shipping/data/entity/teslimatBilgi.dart';
import 'package:drug_shipping/screens/cubit/homepage_cubit.dart';
import 'package:drug_shipping/screens/driver_pages/detail_page.dart';
import 'package:drug_shipping/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  AuthService firebaseAuth=AuthService();

  @override
  void initState() {
    super.initState();
    context.read<HomePageCubit>().teslimatlariYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red,
        actions: [
          IconButton(onPressed: (){
          firebaseAuth.signOut();
          Navigator.of(context).popUntil((route) => route.isFirst);
          }, icon: Text("Log Out")),
        ],

        title:Text("Deliveries"),
      ),
      body: BlocBuilder<HomePageCubit,List<TeslimatBilgi>>(
        builder: (context,kargoListesi){
          if(kargoListesi.isNotEmpty){
            return ListView.builder(
              itemCount: kargoListesi.length,
              itemBuilder: (context,indeks){
                var teslimat=kargoListesi[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(teslimat: teslimat)))
                        .then((value) {
                      context.read<HomePageCubit>().teslimatlariYukle();
                    });
                  },
                  child: SizedBox(height: 100,
                    child: Card(
                      child: SizedBox(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(teslimat.ad,style: TextStyle(fontSize: 20),),
                                  Text(teslimat.nereden,style: TextStyle(fontSize: 15),),
                                  Text(teslimat.nereye,style: TextStyle(fontSize: 15),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }else{
            return Center();
          }
        },
      ),
    );
  }
  }

