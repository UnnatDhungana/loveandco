import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rental_application/Models/Appconstants.dart';
import 'package:rental_application/Screens/guestHomePage.dart';
import 'package:rental_application/Views/TextWidget.dart';


class PersonalInfoPage extends StatefulWidget {

  static final String routeName='/PersonalInfoPageRoute';

  PersonalInfoPage({Key key}) : super(key: key);

  @override
  _PersonalInfoPageState createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {

  TextEditingController _firstNameController;
  TextEditingController _lastNameController;
  TextEditingController _residentalAddressController;
  TextEditingController _emailController;
  TextEditingController _contactNumberController;
  TextEditingController _countryController;
  TextEditingController _dobController;

  File _newImageFile;

  void _chooseImage() async {
    var imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      _newImageFile = imageFile;
      setState(() {});
    }
  }
  void _saveinfo(){
    Navigator.pushNamed(context, guestHomePage.routeName);
  }

  @override
  void initState() {

    _firstNameController = TextEditingController( text: AppConstants.currentUser.firstName);
    _lastNameController = TextEditingController( text: AppConstants.currentUser.lastName);
    _residentalAddressController = TextEditingController( text: AppConstants.currentUser.residentaladdress);
    _emailController= TextEditingController( text: AppConstants.currentUser.email);
    _contactNumberController = TextEditingController( text: AppConstants.currentUser.contactNumber);
    _countryController = TextEditingController( text: AppConstants.currentUser.country);
    _dobController = TextEditingController( text: AppConstants.currentUser.dob);

    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
          title: AppBarText(text: 'Personal Information'),
        actions: <Widget>[

          IconButton(
            icon: Icon(Icons.save, color: Colors.white,),
            onPressed: _saveinfo,

          ),
        ],
      ),

      body: Center(
        child: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 25,25, 0),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Form(
                  child: Column(
                    children: <Widget>[


                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'First Name'
                          ),
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                          controller: _firstNameController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Last Name'
                          ),
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                          controller: _lastNameController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Residential Address'
                          ),
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                          maxLines: 2,
                          controller: _residentalAddressController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Email Address'
                          ),
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                          maxLines: 2,
                          enabled: false,
                          controller: _emailController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Contact Number'
                          ),
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                          enabled: false,
                          controller: _contactNumberController,

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Country'
                          ),
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                          enabled: false,
                          controller: _countryController,

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'D.O.B'
                          ),
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                          enabled: false,
                          controller: _dobController,

                        ),
                      ),
                    ],
                  ),
                ),




                Padding(
                  padding: const EdgeInsets.only(top: 40.0, bottom:35.0),
                  child:  MaterialButton(onPressed: (){},
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: MediaQuery.of(context).size.width/4.8,
                      child: CircleAvatar(
                        backgroundImage: AppConstants.currentUser.displayImage,
                        radius: MediaQuery.of(context).size.width/5,
                      ),
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }

}