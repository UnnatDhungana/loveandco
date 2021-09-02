import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_application/Models/Appconstants.dart';
import 'package:rental_application/Views/TextWidget.dart';

import 'PaymentMethodPage.dart';


class LeaseAgreementPage extends StatefulWidget {

  static final String routeName='/leasedocumentPageRoute';

  LeaseAgreementPage({Key key}) : super(key: key);

  @override
  _LeaseAgreementPageState createState() => _LeaseAgreementPageState();
}

class _LeaseAgreementPageState extends State<LeaseAgreementPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
        title: AppBarText(text: 'Lease Agreement',)
    ),
    );
  }
}