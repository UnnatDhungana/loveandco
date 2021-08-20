import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_application/Models/Appconstants.dart';
import 'package:rental_application/Views/TextWidget.dart';


class paymentPage extends StatefulWidget {

  static final String routeName='/paymentPageRoute';

  paymentPage({Key key}) : super(key: key);

  @override
  _paymentPageState createState() => _paymentPageState();
}

class _paymentPageState extends State<paymentPage> {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Payment'),
    );
  }




}
