import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_application/Models/Appconstants.dart';
import 'package:rental_application/Views/TextWidget.dart';


class leasedocumentPage extends StatefulWidget {

  static final String routeName='/leasedocumentPageRoute';

  leasedocumentPage({Key key}) : super(key: key);

  @override
  _leasedocumentPageState createState() => _leasedocumentPageState();
}

class _leasedocumentPageState extends State<leasedocumentPage> {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Lease Document'),
    );
  }
}