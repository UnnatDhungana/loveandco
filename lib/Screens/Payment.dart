
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_application/Screens/PaymentMethodPage.dart';
import 'package:table_calendar/table_calendar.dart';


class paymentPage extends StatefulWidget {

  static final String routeName='/paymentPageRoute';

  paymentPage({Key key}) : super(key: key);

  @override
  _paymentPageState createState() => _paymentPageState();
}

class _paymentPageState extends State<paymentPage> {
  Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsFromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: SingleChildScrollView(
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
                        Navigator.pushNamed(
                            context, PaymentMethodPage.routeName);
                      },
                      child: PaymentPageListViewItem(
                          text: 'Make a payment', iconData: Icons.payment

                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  onPressed: () {},
                  child: PaymentPageListViewItem(
                    text: 'Payment History', iconData: Icons.payments_rounded,
                  ),
                ),
              ),
              TableCalendar(
                focusedDay: selectedDay,
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2050, 12, 29),
                calendarFormat: format,
                onFormatChanged: (CalendarFormat _format) {
                  setState(() {
                    format = _format;
                  });
                },
                startingDayOfWeek: StartingDayOfWeek.sunday,
                daysOfWeekVisible: true,
                onDaySelected: (DateTime selectDay, DateTime focusDay) {
                  setState(() {
                    selectedDay = selectDay;
                    focusedDay = focusDay;
                  });
                },
                selectedDayPredicate: (DateTime date) {
                  return isSameDay(selectedDay, date);
                },

                eventLoader: _getEventsFromDay,

                calendarStyle: CalendarStyle(
                    isTodayHighlighted: true,
                    selectedDecoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    selectedTextStyle: TextStyle(color: Colors.white),
                    todayDecoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    )
                ),

                headerStyle: HeaderStyle(
                  formatButtonVisible: true,
                  titleCentered: true,
                  formatButtonShowsNext: false,

                ),
              ),
            ]
        ),
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





