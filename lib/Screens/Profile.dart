
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_application/Models/Appconstants.dart';
import 'package:rental_application/Screens/HostHomePage.dart';
import 'package:rental_application/Screens/PersonalinfoPage.dart';
import 'package:rental_application/Screens/guestHomePage.dart';
import 'package:rental_application/Screens/loginPage.dart';
import 'package:rental_application/Screens/viewProfilePage.dart';
import 'package:rental_application/Views/TextWidget.dart';
import 'package:rental_application/Views/listwidget.dart';


class profilePage extends StatefulWidget {



  static final String routeName='/profilePageRoute';

  profilePage({Key key}) : super(key: key);

  @override
  _profilePageState createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {

  String _hostingTitle ='To Host Dashboard';

  void  _changeHosting() {
    if (
    AppConstants.currentUser.isCurrentlyHosting) {
      AppConstants.currentUser.isCurrentlyHosting = false;
      Navigator.pushNamed(context,
          guestHomePage.routeName
      );
    } else {
      AppConstants.currentUser.isCurrentlyHosting = true;
      Navigator.pushNamed(
        context,
        guestHomePage.routeName,
      ); //instead of host home page
    }
  }

  void _logout(){
    Navigator.pushNamed(context, LoginPage.routeName);
  }
  void initState() {
    if (AppConstants.currentUser.isCurrentlyHosting) {
      _hostingTitle = 'To Guest Dashboard';
    }else
      {
        _hostingTitle ='To Host Dashboard';
      }

  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
      
      
      
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Row(
                children: <Widget>[
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                      MaterialPageRoute(
                          builder: (context)=> ViewProfilePage(contact: AppConstants.currentUser.createContactFromUser(),),
                      ),
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: MediaQuery
                          .of(context)
                          .size
                          .width / 9.5,
                      child: CircleAvatar(
                        backgroundImage: AppConstants.currentUser.displayImage,
                        radius: MediaQuery
                            .of(context)
                            .size
                            .width / 10,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AutoSizeText(
                          AppConstants.currentUser.getFullName(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 21
                          ),
                        ),
                        AutoSizeText(
                          AppConstants.currentUser.email,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10.5,
                          ),
                          maxLines: 2,
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
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 9.0,
                  onPressed: () {
                    Navigator.pushNamed(context, PersonalInfoPage.routeName);
                  },
                  child: ProfilePageListViewItem(
                    text: 'Personal Information', iconData: Icons.person_sharp,),
                ),


              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                'Reviews',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ReviewListTile();
                  }
              ),

            ),
            MaterialButton(
                height:MediaQuery
                  .of(context)
                    .size
                    .height/9.0,
                onPressed: _changeHosting,
                child: ProfilePageListViewItem(
                  text: 'Change Host',iconData: Icons.more,
                ),),


            MaterialButton(
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 9.0,
              onPressed: _logout,
              child: ProfilePageListViewItem(
                text: 'Logout', iconData: Icons.logout,),
            ),

          ],
        ),
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