import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_application/Screens/Appconstants.dart';
import 'package:rental_application/Screens/guestHomePage.dart';
import 'package:rental_application/Views/TextWidget.dart';


class PersonalInfoPage extends StatefulWidget {

  static final String routeName='/PersonalInfoPageRoute';

  PersonalInfoPage({Key key}) : super(key: key);

  @override
  _PersonalInfoPageState createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {

  void _saveinfo(){
    Navigator.pushNamed(context, guestHomePage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
          title: AppBarText(text: 'Personal Information'),
        actions: <Widget>[

          IconButton(
            icon: Icon(Icons.save, color: Colors.white,),
            onPressed: _saveinfo,

          ),
        ],
      ),

      body: Center(
        child: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 25,25, 0),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
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
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Password'
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
                  child:  MaterialButton(onPressed: (){},
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: MediaQuery.of(context).size.width/4.8,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/image/2042468.jpg'),
                        radius: MediaQuery.of(context).size.width/5,
                      ),
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