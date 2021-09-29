
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_application/Models/Appconstants.dart';
import 'package:rental_application/Screens/BondDetails.dart';
import 'package:rental_application/Screens/leaseAgreement.dart';
import 'package:rental_application/Views/TextWidget.dart';
import 'package:rental_application/file/viewer.dart';


class leasedocumentPage extends StatefulWidget {

  static final String routeName='/leasedocumentPageRoute';

  leasedocumentPage({Key key}) : super(key: key);

  @override
  _leasedocumentPageState createState() => _leasedocumentPageState();
}

class _leasedocumentPageState extends State<leasedocumentPage> {


  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Column(
          children: <Widget>[
            ListView(

              shrinkWrap: true,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 10.0,
                    onPressed: () {
                      Navigator.pushNamed(context,LeaseAgreementPage.routeName );
                    },
                    child: leasedocumentPagelistviewitem(
                        text: 'Lease Agreement', iconData: Icons.picture_as_pdf,

                    ),
                  ),
                ),
              ],

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, BondDetailsPage.routeName);
                },
                child: leasedocumentPagelistviewitem(
                  text: 'Bond Details', iconData: Icons.credit_card_sharp,),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () {},
                child: leasedocumentPagelistviewitem(
                  text: 'Photos', iconData: Icons.photo,),

              ),
            )
          ],


        ),
      );
    }
  }



  class leasedocumentPagelistviewitem extends StatelessWidget{
  final String text;
  final IconData iconData;
  leasedocumentPagelistviewitem({Key key, this.text, this.iconData}): super(key: key);

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