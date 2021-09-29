import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rental_application/Models/Appconstants.dart';
import 'package:rental_application/Screens/BondDetails.dart';
import 'package:rental_application/Screens/ConversationPage.dart';
import 'package:rental_application/Screens/PersonalinfoPage.dart';
import 'package:rental_application/Screens/guestHomePage.dart';
import 'package:rental_application/Screens/loginPage.dart';
import 'package:rental_application/Screens/signupPage.dart';
import 'package:rental_application/Screens/viewProfilePage.dart';
import 'leaseAgreement.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: {
        LoginPage.routeName: (context)=> LoginPage(),
        SignupPage.routeName:(context)=> SignupPage(),
        guestHomePage.routeName:(context)=>guestHomePage(),
        ConversationPage.routeName:(context)=>ConversationPage(),
        PersonalInfoPage.routeName:(context)=>PersonalInfoPage(),
        ViewProfilePage.routeName:(context)=>ViewProfilePage(),
        //paymentMethodPage.routeName:(context)=>PaymentMethodPage(),
        BondDetailsPage.routeName:(context)=>BondDetailsPage(),
        LeaseAgreementPage.routeName: (context)=> LeaseAgreementPage(),

      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initState(){
    Timer(Duration(seconds: 2),(){
      Navigator.pushNamed(context, LoginPage.routeName);
    });

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.home,
              size: 80,

            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'Welcome to ${AppConstants.appName}!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
                textAlign: TextAlign.center,

              ),
            ),
          ],
        ),
      ),

    );
  }
}