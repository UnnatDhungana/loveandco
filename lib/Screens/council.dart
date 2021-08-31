import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_application/Models/Appconstants.dart';
import 'package:rental_application/Views/TextWidget.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';


class councilPage extends StatefulWidget {

  static final String routeName='/councilPageRoute';

  councilPage({Key key}) : super(key: key);

  @override
 _councilPageState createState() => _councilPageState();
}

class _councilPageState extends State<councilPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCalendar(

      ),
    );
  }
}
