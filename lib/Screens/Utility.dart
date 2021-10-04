import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_application/Models/Appconstants.dart';
import 'package:rental_application/Views/TextWidget.dart';


class utilityPage extends StatefulWidget {

  static final String routeName='/utilityPageRoute';

  utilityPage({Key key}) : super(key: key);

  @override
  _utilityPageState createState() => _utilityPageState();
}

class _utilityPageState extends State<utilityPage> {


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
                  onPressed: (){
                  },
                  child: UtilityPageListViewItem( text: 'Electricity',iconData: Icons.electrical_services_sharp

                  ),
                ),
              ),
            ],

          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              onPressed: (){},
              child: UtilityPageListViewItem(text:'gas', iconData: Icons.local_gas_station,),

            ),
          ),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: MaterialButton(
    onPressed: (){},
    child: UtilityPageListViewItem(text:'Water', iconData: Icons.water,),
    )
    ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: (){},
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