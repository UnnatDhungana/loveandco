import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_application/Models/Appconstants.dart';
import 'package:rental_application/Views/TextWidget.dart';


class utilityPage extends StatefulWidget {

  static final String routeName='/utilityPageRoute';

  utilityPage({Key key}) : super(key: key);

  @override
  _utilityPageState createState() => _utilityPageState();
}

class _utilityPageState extends State<utilityPage> {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Utility'),
    );
  }
}
