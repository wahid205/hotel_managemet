import 'package:flutter/material.dart';
import 'package:hotel_reservation/model/data.dart';
import 'package:hotel_reservation/model/datamanage.dart';
import 'package:hotel_reservation/model/personal.dart';
import 'package:hotel_reservation/view/home.dart';
import 'package:hotel_reservation/view/signup.dart';
import 'package:hotel_reservation/widget/google_signin.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(  providers: [
        ChangeNotifierProvider(
      create: (context) {
        return HotelData();
      },),
      ChangeNotifierProvider(
      create: (context) {
        return PersonalData();
      },),
      ChangeNotifierProvider(
      create: (context) {
        return GoogleSignInProvider();
      },),
      ChangeNotifierProvider(
      create: (context) {
        return DataManagement();
      },)
      ],
      child: const MyApp(),
      ),
    
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      home: Signup(),
    );
  }
}
