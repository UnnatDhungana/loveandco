import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_application/Screens/Appconstants.dart';
import 'package:rental_application/Views/TextWidget.dart';


class profilePage extends StatefulWidget {

  static final String routeName='/profilePageRoute';

  profilePage({Key key}) : super(key: key);

  @override
  _profilePageState createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {



  @override
  Widget build(BuildContext context) {
   return Padding(
       padding: const EdgeInsets.fromLTRB(25, 50, 50, 0 ),
     child: Column(
       children: <Widget>[
         MaterialButton(onPressed: (){},
           child: CircleAvatar(
             backgroundImage: AssetImage('assets/image/2042468.jpg'),
               radius: MediaQuery.of(context).size.width/10,
             ),
           ),


         AutoSizeText('Unnat Dhungana',
         style: TextStyle(
         fontWeight: FontWeight.bold,
             fontSize:21
         ),
         ),
       ],
     ),
   );
  }

}