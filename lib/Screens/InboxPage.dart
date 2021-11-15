import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_application/Models/Appconstants.dart';
import 'package:rental_application/Models/messagingObjects.dart';
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
          itemCount: AppConstants.currentUser.conversations.length,
          itemExtent: MediaQuery
              .of(context)
              .size
              .height / 7,
          itemBuilder: (context, index) {
            Conversation currentConversation = AppConstants.currentUser.conversations[index];

            return InkResponse(
              child: ConversationListtile(conversation: currentConversation,),
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