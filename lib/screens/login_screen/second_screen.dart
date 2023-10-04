import 'package:drug_shipping/screens/company_pages/company_homepage.dart';
import 'package:drug_shipping/screens/driver_pages/homepage.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanyHomePage()));
            }, child: Text("Pharmaceutical Company Login",style: TextStyle(fontSize: 30,),textAlign: TextAlign.center,)),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
            }, child: Text("Driver Login",style: TextStyle(fontSize: 30),textAlign: TextAlign.center,)),
          ],
        ),
      ),
    );
  }
}
