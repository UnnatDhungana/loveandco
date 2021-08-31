import 'package:flutter/material.dart';
import 'package:rental_application/Views/TextWidget.dart';
//import 'package:stripe_payment/stripe_payment.dart';

class PaymentMethodPage extends StatefulWidget {

  static final String routeName='/paymentPageRoute';

  PaymentMethodPage({Key key}) : super(key: key);

  @override
  _PaymentMethodPage createState() => _PaymentMethodPage();
}

class _PaymentMethodPage extends State<PaymentMethodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
          title: AppBarText(text: 'Payment Methods'),


      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
            'Please select a payment method:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
            ),
            textAlign: TextAlign.center,
        ),
          ),
        ],
        ),
      )

    );



  }
}
