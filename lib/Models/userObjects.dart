import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_application/Models/Appconstants.dart';
import 'package:rental_application/Models/messagingObjects.dart';
import 'package:rental_application/Models/postingObjects.dart';
import 'package:rental_application/Models/reviewObjects.dart';
import 'dart:io';
class Contact {
  String id;
  String firstName;
  String lastName;
  //String imagePath;
  MemoryImage displayImage;

  Contact({this.id="",this.firstName="",this.lastName="", this.displayImage});


 Future<void> getContactInfoFromFirestore()async{
    DocumentSnapshot snapshot = await Firestore.instance.collection('users')
        .document(this.id)
        .get();
    this.firstName = snapshot['firstName']??"";
    this.lastName =snapshot['lastName']??"";

  }
  Future<MemoryImage> getImageFromFirestorage() async{
   if(displayImage != null){ return displayImage;}
    final String imagePath ="userImages/${this.id}/profile_pic.jpg";
   final imageData =await FirebaseStorage.instance.ref().child(imagePath).getData(1024*1024);
   this.displayImage = MemoryImage(imageData);
   return this.displayImage;
  }



  String getFullName(){
    return this.firstName+" "+this.lastName;
  }

  User createUsersFromContact(){
   return User(
     id: this.id,
     firstName: firstName,
     lastName: lastName,
     displayImage: displayImage,
   );
}

}

class User extends Contact {


  DocumentSnapshot snapshot;
  String email;
  String contactNumber;
  String dob;
  String residentaladdress;
  String country;
  bool isHost;
  bool isCurrentlyHosting;
  String password;
  String Rent;
  String DueDays;
  String DueAmount;
  String LastPaid;
  String PaidTo;
  String RentDue;


  List <Conversation> conversations;
  List<Review> reviews;
  List<Booking> bookings;
  List<Posting>savedPostings;

  User({
    String id="" ,String firstName="",String lastName="",MemoryImage displayImage,
    this.email="", this.residentaladdress="",this.dob="", this.contactNumber="",this.country=""}):
      super(id:id, firstName: firstName, lastName: lastName, displayImage: displayImage){
    this.isHost = false;
    this.isCurrentlyHosting = false;
    this.conversations=[];
    this.bookings=[];
    this.reviews=[];
    this.savedPostings=[];


  }



  Future<void> getUserInfoFromFirestore()async {
    DocumentSnapshot snapshot = await Firestore.instance.collection('users')
        .document(this.id)
        .get();
    this.snapshot=snapshot;
    this.firstName = snapshot['firstName']??"";
    this.lastName = snapshot['lastName']??"";
    this.email=snapshot['email']??"";
    this.country=snapshot['country']??"";
    this.residentaladdress=snapshot['residentaladdress']??"";
    this.dob=snapshot['dob']??"";
    this.contactNumber=snapshot['contactNumber']??"";
    this.isHost=snapshot['isHost']??"";
    List<String> converstionIDs=List<String>.from(snapshot['conversationIDs'])??[];
    List<String> myPostingIDs=List<String>.from(snapshot['myPostingIDs'])??[];
    List<String> savedPostingIDs=List<String>.from(snapshot['savedPostingIDs'])??[];
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

  }

  
  void changeCurrentlyHosting(bool isHosting){
    this.isCurrentlyHosting= isHosting;
  }
  void becomeHost(){
    this.isHost=true;
    this.changeCurrentlyHosting(true);
  }
  Contact createContactFromUser(){
    return Contact(
      id: this.id,
      firstName:this.firstName,
      lastName: this.lastName,
      displayImage: displayImage,


    );
  }
  void makeNewBooking(Booking booking) {
    this.bookings.add(booking);
  }

  void addSavePossting(Posting posting){
    this.savedPostings.add(posting);
  }
  void removeSavedPosting(Posting posting){
    for (int i=0; i< this.savedPostings.length; i++){
      if (this.savedPostings[i].name == posting.name){
        this.savedPostings.removeAt(i);
      }
    }
  }

  double getCurrentRating(){
    if (this.reviews.length==0){return 4;}
    double rating =0;
    this.reviews.forEach((review) {
      rating += review.rating;
    });
    rating /= this.reviews.length;
    return rating;
  }




  void postNewReview(String text, double rating){
    Review newReview = Review();
    newReview.createReview(
      AppConstants.currentUser.createContactFromUser(),
      text,
      rating,
      DateTime.now(),
    );
    this.reviews.add(newReview);
  }

}