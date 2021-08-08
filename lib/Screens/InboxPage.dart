import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_application/Screens/Appconstants.dart';
import 'package:rental_application/Screens/ConversationPage.dart';
import 'package:rental_application/Views/TextWidget.dart';
import 'package:rental_application/Views/listwidget.dart';


class inboxPage extends StatefulWidget {

  static final String routeName='/indoxPageRoute';

  inboxPage({Key key}) : super(key: key);

  @override
  _inboxPageState createState() => _inboxPageState();
}
class _inboxPageState extends State<inboxPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: ListView.builder(
          itemCount: 2,
          itemExtent: MediaQuery
              .of(context)
              .size
              .height / 7,
          itemBuilder: (context, index) {
            return InkResponse(
              child: ConversationListtile(),
              onTap: () {
                Navigator.pushNamed(
                    context,
                    ConversationPage.routeName,
                );
              },
            );
          }
      ),
    );
  }
}