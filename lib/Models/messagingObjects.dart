import 'package:rental_application/Models/Appconstants.dart';
import 'package:rental_application/Models/userObjects.dart';

class Conversation{
  Contact otherContact;
  List<Message>messages;
  Message lastMessage;

  Conversation(){
    messages= [];
  }

  void createConverstation(Contact otherContact, List<Message> messages){
    this.otherContact =otherContact;
    this.messages=messages;
    if (messages.isNotEmpty){
      this.lastMessage=messages.last;
    }
  }
  String getLastMessageText(){
    if(messages.isEmpty){
      return"";
    }else{
      return messages.last.text;
    }

  }
  String getLastMessageDateTime(){
    if(messages.isEmpty){
      return "";
    }else{
      return messages.last.text;
    }
  }


}

class Message{
  Contact sender;
  String text;
  DateTime dateTime;

  Message();

  void createMessage (Contact sender, String text, DateTime dateTime, ){
    this.sender = sender;
    this.text = text;
    this.dateTime= dateTime;

  }

  String getMessageDateTime() {
    final DateTime now = DateTime.now();
    final int today = now.day;
    if (this.dateTime.day == today) {

    } else {

      return _getDate();

    }

    String _getTime(){
      String time = dateTime.toIso8601String().substring(11,16);
      String hours = time.substring(0,2);
      String minutes = time.substring(2);
      return hours+":"+minutes;
    }
  }

    String _getDate(){
      String date = dateTime.toIso8601String().substring(5,10);
      String month = date.substring(0,2);
      int monthInt =int.parse(month);
      String monthName = AppConstants.monthDict[monthInt];
      String day = date.substring(3,5);
      return monthName +"/"+day;

    }


}