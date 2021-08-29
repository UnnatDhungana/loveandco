import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_application/Models/Appconstants.dart';
import 'package:rental_application/Models/messagingObjects.dart';
import 'package:rental_application/Models/postingObjects.dart';
import 'package:rental_application/Models/reviewObjects.dart';

class Contact {

  String firstName;
  String lastName;
  String imagePath;
  AssetImage displayImage;

  Contact({this.firstName="",this.lastName="", this.imagePath})
  {
    this.displayImage= AssetImage(this.imagePath);
  }
  String getFullName(){
    return this.firstName+" "+this.lastName;
  }

}

class User extends Contact {
  String id;
  String email;
  String contactNumber;
  String dob;
  String residentaladdress;
  String country;
  bool isHost;
  bool isCurrentlyHosting;

  List <Conversation> conversations;
  List<Review> reviews;
  List<Booking> bookings;
  List<Posting>savedPostings;

  User({
    String firstName="",String lastName="",String imagePath ="",
    this.email="", this.residentaladdress="",this.dob="", this.contactNumber="",this.country=""}):
      super(firstName: firstName, lastName: lastName, imagePath: imagePath){
    this.isHost = false;
    this.isCurrentlyHosting = false;
    this.conversations=[];
    this.bookings=[];
    this.reviews=[];
    this.savedPostings=[];


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
      firstName:this.firstName,
      lastName: this.lastName,
      imagePath: this.imagePath,

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