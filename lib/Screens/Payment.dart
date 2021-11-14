

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:rental_application/Models/Appconstants.dart';
import 'package:rental_application/Screens/PaymentMethodPage.dart';



class paymentPage extends StatefulWidget {

  static final String routeName='/paymentPageRoute';

  paymentPage({Key key}) : super(key: key);

  @override
  _paymentPageState createState() => _paymentPageState();
}

class _paymentPageState extends State<paymentPage> {

  TextEditingController _RentController;
  TextEditingController _DueDaysController;
  TextEditingController _DueAmountController;
  TextEditingController _LastPaidController;
  TextEditingController _PaidToController;
  TextEditingController _RentDueController;

  @override
  void initState() {

    _RentController = TextEditingController(text: AppConstants.currentUser.Rent);
    _DueDaysController = TextEditingController( text: AppConstants.currentUser.DueDays);
    _DueAmountController = TextEditingController(text: AppConstants.currentUser.DueAmount);
    _LastPaidController = TextEditingController(text: AppConstants.currentUser.LastPaid);
    _PaidToController= TextEditingController( text: AppConstants.currentUser.PaidTo);
    _RentDueController = TextEditingController( text: AppConstants.currentUser.RentDue);

    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return

       Container(
              child:  SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 25,25, 0),
          child: Column(
          children: <Widget>[
            Form(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Rent Due'
                      ),
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                      maxLines: 2,
                      enabled: false,
                      controller: _RentController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Due Days'
                      ),
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                      maxLines: 2,
                      enabled: false,
                      controller: _DueDaysController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Due Amount'
                      ),
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                      maxLines: 2,
                      enabled: false,
                      controller: _DueAmountController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Last Paid'
                      ),
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                      maxLines: 2,
                      enabled: false,
                      controller: _LastPaidController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Paid to'
                      ),
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                      enabled: false,
                      controller: _PaidToController,

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Rent Due'
                      ),
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                      enabled: false,
                      controller: _RentDueController,

                    ),
                  ),

                ],
              ),
            ),




          ],
        ),
      ),
              )
    );





  }

}
class PaymentPageListViewItem extends StatelessWidget{
  final String text;
  final IconData iconData;
  PaymentPageListViewItem({Key key, this.text, this.iconData}): super(key: key);

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





