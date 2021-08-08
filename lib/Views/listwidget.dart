import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_application/Screens/Profile.dart';

class ConversationListtile extends StatefulWidget{

  ConversationListtile({Key key}): super(key:key);

  @override
  _ConversationlistTileState createState() => _ConversationlistTileState();

}
class _ConversationlistTileState extends State<ConversationListtile>{
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
              context,
            profilePage.routeName,
          );
        },
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/image/2042468.jpg'),
          radius: MediaQuery.of(context).size.width/14.0,
        ),
      ),
      title: Text(
          'Aruna',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.5,
          )
      ),
      subtitle: Text(
          'Hi!!',
          style: TextStyle(
            fontSize: 20,
          )
      ),
      trailing: Text(
        'july2',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      contentPadding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0)
    );
  }
}
class MessageListTile extends StatelessWidget{
  MessageListTile({Key key}): super(key: key);

  @override
  Widget build(BuildContext  context) {
   /* return Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 35, 15),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                  context,
                  profilePage.routeName,
              );
            },
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/image/2042468.jpg'),
              radius: MediaQuery.of(context).size.width/20,
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        'Hi how are you?this is a message to test my program message functiona;ity and make sure everything is fine.',
                            textWidthBasis: TextWidthBasis.parent,
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    Align(

                      alignment: Alignment.bottomRight,
                      child: Text(
                          'Aug 3',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),

                      ),
                    )

                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );*/

    return Padding(
        padding: const EdgeInsets.fromLTRB(35, 15, 15, 15),

    child: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: <Widget>[

    Flexible(
    child: Padding(
    padding: const EdgeInsets.only(right: 10),
    child: Container(
    padding: EdgeInsets.all(15.0),
    decoration: BoxDecoration(
    color: Colors.blueAccent,
    borderRadius: BorderRadius.circular(10)
    ),
    child: Column(
    mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
    Padding(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: Text(
    'Hi how are you?this is a message to test my program message functiona;ity and make sure everything is fine.',
    textWidthBasis: TextWidthBasis.parent,
    style: TextStyle(
    fontSize: 18.0,
    ),
    ),
    ),
    Align(

    alignment: Alignment.bottomRight,
    child: Text(
    'Aug 3',
    style: TextStyle(
    fontSize: 18.0,
    ),

    ),
    )

    ],
    ),
    ),
    ),
    ),
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            profilePage.routeName,
          );
        },
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/image/2042468.jpg'),
          radius: MediaQuery.of(context).size.width/20,
        ),
      ),
    ],
    ),
    );
  }


}
