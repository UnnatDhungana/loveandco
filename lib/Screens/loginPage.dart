import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_application/Models/Appconstants.dart';
import 'package:rental_application/Models/data.dart';
import 'package:rental_application/Models/userObjects.dart';
import 'package:rental_application/Screens/guestHomePage.dart';

import 'signupPage.dart';


class LoginPage extends StatefulWidget {

  static final String routeName='/loginPageRoute';

  LoginPage({Key key}) : super(key: key);

  @override
_LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey =GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  void _signup(){
    Navigator.pushNamed(context, SignupPage.routeName);
  }

  void _login(){
    if(_formKey.currentState.validate()) {
      String email = _emailController.text;
      String password = _passwordController.text;
      FirebaseAuth.instance.signInWithEmailAndPassword
        (email: email,
        password: password,
      ).then((firebaseUser) {
        String userID = firebaseUser.uid;
        User user = User();
        user.id =userID;


        practiceData.populateFields();
        AppConstants.currentUser=practiceData.user[1];
        Navigator.pushNamed(context, guestHomePage.routeName);

      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(

        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 100, 50, 0),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                  'Welcome to ${AppConstants.appName}!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
                textAlign: TextAlign.center,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'EMAIL'
                        ),
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                        validator: (text){
                        if(!text.contains('@')){
                          return 'Please Enter A Vaild Email';
                        }
                        return null;
                      },
                        controller: _emailController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'PASSWORD'
                        ),
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                        obscureText: true,
                        validator: (text){
                          if (text.length<6){
                            return'Password must be atleast 6 characters';
                          }return null;
                        },
                        controller: _passwordController,
                      ),

                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35.0),
                child: MaterialButton(
                    onPressed: () {
                      _login();
                      },
                  child:Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Colors.white,
                  ),
                  ),
                color: Colors.blue,
                  height: MediaQuery.of(context).size.height/15,
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(15),
                ),
              ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: MaterialButton(
                  onPressed: () {
                    _signup();
                  },
                  child:Text(
                    'SignUp',
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                  ),
                color: Colors.grey,
                  height: MediaQuery.of(context).size.height/15,
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(15)
                  ),
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }

}