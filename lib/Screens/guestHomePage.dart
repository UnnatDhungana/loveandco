import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_application/Models/Appconstants.dart';
import 'package:rental_application/Screens/InboxPage.dart';
import 'package:rental_application/Screens/Payment.dart';
import 'package:rental_application/Screens/Profile.dart';
import 'package:rental_application/Screens/Utility.dart';
import 'package:rental_application/Screens/council.dart';
import 'package:rental_application/Screens/leasedoucument.dart';
import 'package:rental_application/Views/TextWidget.dart';



class guestHomePage extends StatefulWidget {

  static final String routeName='/guestHomePage';

  guestHomePage({Key key}) : super(key: key);

  @override
  _guestHomePageState createState() => _guestHomePageState();
}

class _guestHomePageState extends State<guestHomePage> {

int _selectedindex = 0;
final List<String> _pageTitles=[
  'Profile',
  'Inbox',
  'Payment',
  'Council',
  'Utility',
  'Documents'
];

final List<Widget> _pages =[
  profilePage(),
  inboxPage(),
  paymentPage(),
  councilPage(),
  utilityPage(),
  leasedocumentPage(),

];
  BottomNavigationBarItem _buildNavigationItem(int index, IconData iconData,String text){
    return BottomNavigationBarItem(
        icon: Icon(iconData, color: AppConstants.nonselectedIconColor,),
      activeIcon: Icon(iconData, color:AppConstants.selectedIconColor),
      title: Text(
        text,
        style: TextStyle(
          color: _selectedindex == index ? AppConstants.selectedIconColor : AppConstants.nonselectedIconColor,

        ),
      )


    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarText(text: _pageTitles[_selectedindex]),
        automaticallyImplyLeading: false,
        
      ),
      body: _pages[_selectedindex],


      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            _selectedindex=index;

          });

        },
        currentIndex: _selectedindex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
        _buildNavigationItem(0, Icons.person_sharp, _pageTitles[0]),
        _buildNavigationItem(1, Icons.message_outlined,_pageTitles[1]),
          _buildNavigationItem(2, Icons.payment, _pageTitles[2]),
          _buildNavigationItem(3, Icons.admin_panel_settings_outlined, _pageTitles[3]),
          _buildNavigationItem(4, Icons.supervised_user_circle_sharp, _pageTitles[4]),
          _buildNavigationItem(5, Icons.source_sharp, _pageTitles[5]),
        ],
      ),
    );
  }

}
