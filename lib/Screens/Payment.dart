import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_application/Models/Appconstants.dart';
import 'package:rental_application/Screens/PaymentMethodPage.dart';
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
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 20,0, 0),
      child: Column(
       children: <Widget>[
         Text(
         'Payment Options',
      style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 25.0,
    ),
    ),
         ListView(
             shrinkWrap: true,
             children: <Widget>[
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: MaterialButton(
           height: MediaQuery.of(context).size.height/10.0,
      onPressed: (){
        Navigator.pushNamed(context, PaymentMethodPage.routeName);
      },
      child: PaymentPageListViewItem( text: 'Payment Methods',iconData: Icons.payment

      ),
           ),
         ),
    ],

           ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: MaterialButton(
               onPressed: (){},
               child: PaymentPageListViewItem(text:'Payment History', iconData: Icons.payments_rounded,),

               ),
         )
    ],
    ),
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





