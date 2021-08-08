import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_application/Screens/Appconstants.dart';
import  'package:rental_application/Views/TextWidget.dart';


class inboxPage extends StatefulWidget {

  static final String routeName='/indoxPageRoute';

  inboxPage({Key key}) : super(key: key);

  @override
  _inboxPageState createState() => _inboxPageState();
}

class _inboxPageState extends State<inboxPage> {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Inbox'),
    );
  }
}