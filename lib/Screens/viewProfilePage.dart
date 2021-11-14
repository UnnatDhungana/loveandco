import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_application/Models/Appconstants.dart';
import 'package:rental_application/Models/userObjects.dart';
import 'package:rental_application/Screens/guestHomePage.dart';
import 'package:rental_application/Views/TextWidget.dart';
import 'package:rental_application/Views/listwidget.dart';


class ViewProfilePage extends StatefulWidget {

  static final String routeName='/viewProfilePageRoute';

  final Contact contact;

  ViewProfilePage({this.contact,Key key}) : super(key: key);

  @override
  _ViewProfilePageState createState() => _ViewProfilePageState();
}

class _ViewProfilePageState extends State<ViewProfilePage> {

  User _user;

  @override
  void initState(){
    //this.user=widget.contact.createUserFromContact();
    //_loadUser();

    if(widget.contact.id ==AppConstants.currentUser.id){
      _user = AppConstants.currentUser;
    }else{
      this._user=widget.contact.createUsersFromContact();
      this._user.getUserInfoFromFirestore().whenComplete(() {
       setState(() {

       });
      });
    }

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
          title: AppBarText(text: 'Profile',),

      ),

      body: Center(
        child: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.fromLTRB(50, 20,50, 0),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 3/6,
                      child: AutoSizeText(
                       'Hi! My name is ${_user.firstName}!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                          fontSize:30,
                      ),
                      ),

                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        backgroundImage: _user.displayImage,
                        radius: MediaQuery.of(context).size.width/10,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Text(
                    'About Me:',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: AutoSizeText(
                    _user.email,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.home),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: AutoSizeText(
                          'Lives in ${_user.country},${_user.residentaladdress}',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top : 20.0),
                  child: Text(
                    'Reviews:',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ReviewListTile(),
                ),
              ]
                  ),
                ),

            ),
          ),
        );

  }

}