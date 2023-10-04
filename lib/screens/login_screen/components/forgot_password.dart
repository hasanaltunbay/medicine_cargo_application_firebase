import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  var forgotPasswordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Forgot Password"),
      backgroundColor: Colors.blue),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(width: 400,height: 400,
                  child: Image.asset("images/sifre.jpg")),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                  controller: forgotPasswordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: "Email",
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 10,),

              ElevatedButton(onPressed: ()async{
                var forgotEmail=forgotPasswordController.text.trim();

                try{
                    await FirebaseAuth.instance.sendPasswordResetEmail(email: forgotEmail)
                        .then((value) => {
                          print("Email Sent!"),
                          Navigator.pop(context),
                    });
                }on FirebaseAuthException catch(e){
                  print("Error $e");
                }

              }, child: Text("Forgot Password")),

            ],
          ),
        ),
      ),
    );
  }
}
