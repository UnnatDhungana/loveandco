



import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_plugin.dart';
import 'package:rental_application/Models/Appconstants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class LeaseAgreementPage extends StatefulWidget {



  static final String routeName='/LeaseAgreementPageRoute';


  LeaseAgreementPage({Key key}) : super(key: key);
  @override
  _LeaseAgreementPageState createState() => _LeaseAgreementPageState();
}

class _LeaseAgreementPageState extends State<LeaseAgreementPage> {
  
  get userleasedouments => FirebaseStorage();
  Future userDocuments() async{
    Firestore.instance
        .document('userleasedouments/${AppConstants.currentUser}/Lda.pdf')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${userleasedouments/AppConstants.currentUser}/Lda.pdf');
      }
    });
  }
  Future <void>_viewPDF()async {

    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: MaterialButton(

          onPressed: (){
            _viewPDF();
            },
          child:Row(
            children: <Widget>[
              Text('View Pdf',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),),
              Icon(Icons.view_agenda),

            ],
          ),



        ),
      ),


    );
  }
}