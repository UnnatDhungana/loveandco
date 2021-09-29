import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class BondDetailsPage extends StatefulWidget {



  static final String routeName='/BondDetailsPageRoute';

  BondDetailsPage({Key key}) : super(key: key);


  @override
  _BondDetailsPageState createState() => _BondDetailsPageState();
}

class _BondDetailsPageState extends State<BondDetailsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('BOND DETAILS'),
      ),

    );
  }
}
