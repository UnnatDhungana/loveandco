import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_application/Models/Appconstants.dart';
import 'package:rental_application/Views/TextWidget.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';


class councilPage extends StatefulWidget {

  static final String routeName='/councilPageRoute';

  councilPage({Key key}) : super(key: key);

  @override
 _councilPageState createState() => _councilPageState();
}

class _councilPageState extends State<councilPage> {


  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2010, 10,16),
      lastDay: DateTime.utc(2050, 12,29),
      focusedDay: DateTime.now(),
    );




  }
}
