import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

class Payment{
  String id;
  String Rent;
  String DueDays;
  String DueAmount;
  Timestamp LastPaid;
  Timestamp PaidTo;
  Timestamp RentDue;
  DocumentSnapshot snapshot;


  Payment.fromMap(Map<String, dynamic>data){
    Rent=data['Rent'];
    DueDays=data['DueDays'];
    DueAmount=data['DueAmount'];
    LastPaid=data['LastPaid'];
    PaidTo=data['PaidTo'];
    RentDue=data['RentDue'];
  }

  Future<void> getPaymentinfoFirestore()async {
    DocumentSnapshot snapshot = await Firestore.instance.collection('users')
        .document(this.id)
        .get();
    this.snapshot=snapshot;
    this.Rent = snapshot['Rent']??"";
    this.DueDays = snapshot['DueDays']??"";
    this.DueAmount=snapshot['DueAmount']??"";
    this.LastPaid=snapshot['LastPaid']??"";
    this.PaidTo=snapshot['PaidTo']??"";
    this.RentDue=snapshot['RentDue']??"";
    List<String> converstionIDs=List<String>.from(snapshot['conversationIDs'])??[];
    List<String> myPostingIDs=List<String>.from(snapshot['myPostingIDs'])??[];
    List<String> savedPostingIDs=List<String>.from(snapshot['savedPostingIDs'])??[];
  }
}