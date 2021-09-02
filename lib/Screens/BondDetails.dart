import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_application/Models/Appconstants.dart';
import 'package:rental_application/Views/TextWidget.dart';

import 'PaymentMethodPage.dart';


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
        title: AppBarText(text: 'Bond Details',)
    ),
    );
  }
}