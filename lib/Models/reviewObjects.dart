import 'package:flutter/material.dart';
import 'package:rental_application/Models/userObjects.dart';


class Review{

  Contact contact;
  String text;
  double rating;
  DateTime dateTime;

  Review();

  void createReview(Contact contact, String text,
      double rating, DateTime dateTime){
    this.contact= contact;
    this.text= text;
    this.dateTime=dateTime;
    this.rating=rating;

  }

}