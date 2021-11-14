import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_application/Models/Appconstants.dart';
import 'package:rental_application/Views/TextWidget.dart';
import 'package:url_launcher/url_launcher.dart';


class utilityPage extends StatefulWidget {

  static final String routeName='/utilityPageRoute';

  utilityPage({Key key}) : super(key: key);

  @override
  _utilityPageState createState() => _utilityPageState();
}

class _utilityPageState extends State<utilityPage> {

  Future <dynamic> _elcURL() async{

      const url = 'https://energy.finder.com.au/?rc=45056&utm_source=google&utm_medium=cpc&gclid=Cj0KCQjwwNWKBhDAARIsAJ8HkhfV6HA9_CgSbl7pM-WRC4FXa38ivhecSge8kihhjqZ53FHWO4rp0_saAgDUEALw_wcB';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
  }
  Future <dynamic> _gasURL() async{

    const url = 'https://energy.finder.com.au/?rc=45056&utm_source=google&utm_medium=cpc&gclid=Cj0KCQjwwNWKBhDAARIsAJ8HkhfV6HA9_CgSbl7pM-WRC4FXa38ivhecSge8kihhjqZ53FHWO4rp0_saAgDUEALw_wcB';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  Future <dynamic> _utilityURL() async{

    const url = 'https://www.finder.com.au/broadband-plans?futm_medium=cpc&futm_source=google&futm_campaign=6525225547~82102519807&futm_term=internet%20comparison~e~g~kwd-96068036&futm_content=~~CjwKCAjw2P-KBhByEiwADBYWCp1pwGCtoAuoNudpsTlmM8JDlPtE8DZhD3P4KrLU552Cl1STLHZIBxoCrRYQAvD_BwE&gclid=CjwKCAjw2P-KBhByEiwADBYWCp1pwGCtoAuoNudpsTlmM8JDlPtE8DZhD3P4KrLU552Cl1STLHZIBxoCrRYQAvD_BwE';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  Future <dynamic> _maintenanceURL() async{

    const url = 'https://www.airtasker.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }




  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20,0, 0),
      child: Column(
        children: <Widget>[
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  height: MediaQuery.of(context).size.height/10.0,
                  onPressed: _elcURL,

                  child: UtilityPageListViewItem( text: 'Electricity',iconData: Icons.electrical_services_sharp

                  ),

                ),
              ),
            ],

          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              onPressed: _gasURL,
              child: UtilityPageListViewItem(text:'gas', iconData: Icons.local_gas_station,),

            ),
          ),
         Padding(
          padding: const EdgeInsets.all(8.0),
             child: MaterialButton(
            onPressed: _utilityURL,
                 child: UtilityPageListViewItem(text:'Water', iconData: Icons.local_drink_sharp,),
                )
                ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: _maintenanceURL,
                child: UtilityPageListViewItem(text:'Maintenance', iconData: Icons.home_repair_service,),
              )
          ),

        ],
      ),
    );

  }

}
class UtilityPageListViewItem extends StatelessWidget{
  final String text;
  final IconData iconData;
  UtilityPageListViewItem({Key key, this.text, this.iconData}): super(key: key);

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