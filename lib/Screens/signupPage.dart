import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_application/Screens/Appconstants.dart';
import 'package:rental_application/Screens/guestHomePage.dart';
import 'package:rental_application/Views/TextWidget.dart';


class SignupPage extends StatefulWidget {

  static final String routeName='/signupPageRoute';

  SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

void _signup(){
  Navigator.pushNamed(context, guestHomePage.routeName);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: AppBarText(text: 'SignUp Page',)
      ),

      body: Center(
        child: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 50,50, 0),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Please enter following information:',
                style: TextStyle(
                  fontSize: 30.0,
                ),
                textAlign: TextAlign.center,
              ),
              Form(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'First Name'
                        ),
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Last Name'
                        ),
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Residential Address'
                        ),
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                        maxLines: 2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Email Address'
                        ),
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                        maxLines: 2,
                      ),
                    ),
                     Padding(
                       padding: const EdgeInsets.only(top: 25.0),
                       child: TextFormField(
                         decoration: InputDecoration(
                           labelText: 'Contact Number'
                         ),
                         style: TextStyle(
                           fontSize: 25.0,
                         ),
                       ),
                     ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom:35.0),
                child: MaterialButton(
                  onPressed: () {
                    _signup();
                  },
                  child:Text(
                    'Submit',
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


            ],
          ),
        ),
      ),
      ),
    );
  }

}