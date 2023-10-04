import 'package:drug_shipping/locator.dart';
import 'package:drug_shipping/screens/cubit/detail_page_cubit.dart';
import 'package:drug_shipping/screens/cubit/homepage_cubit.dart';
import 'package:drug_shipping/screens/cubit/register_page_cubit.dart';
import 'package:drug_shipping/screens/login_screen/login_screen.dart';
import 'package:drug_shipping/services/provider/auth_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<AuthProvider>(create: (context) => locator.get<AuthProvider>(),)
  ], child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>HomePageCubit()),
        BlocProvider(create: (context)=>DetailPageCubit()),
        BlocProvider(create: (context)=>RegisterPageCubit()),
      ],
      child: MaterialApp(
        title: 'Drug Shipping',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
