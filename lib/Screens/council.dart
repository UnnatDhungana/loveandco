
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';


class councilPage extends StatefulWidget {
  static final String routeName='/councilPageRoute';
  const councilPage({Key key}) : super(key: key);

  @override
 _councilPageState createState() => _councilPageState();
}

class _councilPageState extends State<councilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCalendar(
        view: CalendarView.month,
        dataSource: MeetingDataSource(_getDataSource()),
        monthViewSettings: const MonthViewSettings(showAgenda: true,
            appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
      ));
  }
  List<Meeting> _getDataSource(){
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today= DateTime.now();
    final DateTime startTime=
    DateTime(today.year, today.month,today.day, 9,0,0);
    final DateTime endTime= startTime.add(const Duration(hours: 2));
    meetings.add(Meeting(
        'Rubbish removal', startTime, endTime, Colors.green, false,)
    );

    return meetings;
  }
}
class MeetingDataSource extends CalendarDataSource{
  MeetingDataSource(List<Meeting> source){
    appointments = source;
  }
  @override
  DateTime getStartTime(int index){
    return _getMeetingData(index).from;
  }
  @override
  DateTime getEndTime(int index){
    return _getMeetingData(index).to;
  }
  @override
  String getSubject(int index){
    return _getMeetingData(index).eventName;
  }
  @override
  Color getColor(int index){
    return _getMeetingData(index).background;
  }
  @override
  bool isAllDAy(int index){
    return _getMeetingData(index).isAllDay;
  }
  Meeting _getMeetingData(index) {
    final dynamic meeting = appointments[index];
     Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

class Meeting{
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);
  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;

}



/*child: TableCalendar(
        focusedDay: selectedDay,
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2050, 12, 29),
        calendarFormat: format,
        onFormatChanged: (CalendarFormat _format) {
          setState(() {
            format = _format;
          });
        },
        eventLoader: (day) {
          return _getEventsForDay(day);
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
      ),*/





