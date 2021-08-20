
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_application/Screens/Appconstants.dart';
import 'package:rental_application/Screens/PersonalinfoPage.dart';
import 'package:rental_application/Screens/loginPage.dart';
import 'package:rental_application/Views/TextWidget.dart';
import 'package:rental_application/Views/listwidget.dart';


class profilePage extends StatefulWidget {



  static final String routeName='/profilePageRoute';

  profilePage({Key key}) : super(key: key);

  @override
  _profilePageState createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {

  void _logout(){
    Navigator.pushNamed(context, LoginPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
   return Padding(
       padding: const EdgeInsets.fromLTRB(20, 50, 50, 0 ),
     child: Column(
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: Row(
            children:<Widget> [
              MaterialButton(onPressed: (){},
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: MediaQuery.of(context).size.width/9.5,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/image/2042468.jpg'),
                    radius: MediaQuery.of(context).size.width/10,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AutoSizeText(
                      'Unnat Dhungana',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:21
                      ),
                    ),
                    AutoSizeText(
                      'unnatdhungana@gmail.com',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.5,
                      ),
                    ),
                  ],
                ),
              ),

            ],

          ),
        ),
         ListView(
           shrinkWrap: true,
           children: <Widget>[
             MaterialButton(
               height: MediaQuery.of(context).size.height/9.0,
               onPressed: (){
                 Navigator.pushNamed(context, PersonalInfoPage.routeName);
               },
               child: ProfilePageListViewItem(text:'Personal Information',iconData: Icons.person_sharp,),
             ),


           ],
         ),
         Padding(
           padding:const EdgeInsets.only(top: 15.0),
           child: Text(
             'Reviews',
             style: TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 25.0,

             ),
           ),
         ),
         Padding(
           padding: const EdgeInsets.only(top: 15.0),
           child: ListView.builder(
               itemCount: 2,
               shrinkWrap: true,
               itemBuilder: (
                   context,index){
                 return ReviewListTile();
               }
           ),

         ),
         MaterialButton(
           height: MediaQuery.of(context).size.height/9.0,
           onPressed: _logout,
           child: ProfilePageListViewItem(text:'Logout',iconData: Icons.logout,),
         ),

       ],
     ),

   );



  }

}
class ProfilePageListViewItem extends StatelessWidget{

  final String text;
  final IconData iconData;
  ProfilePageListViewItem({Key key, this.text, this.iconData}): super(key: key);

  @override
  Widget build(BuildContext context) {
   return ListTile(
     contentPadding: EdgeInsets.all(0.0),
     leading: Text (
       this.text,
       style: TextStyle(
         fontSize: 20.0,
         fontWeight: FontWeight.normal,
       ),
     ),
     trailing: Icon(
       this.iconData,
       size: 30.0,
     ),
   );


  }

}