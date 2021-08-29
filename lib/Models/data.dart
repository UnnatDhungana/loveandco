import 'package:rental_application/Models/messagingObjects.dart';
import 'package:rental_application/Models/postingObjects.dart';
import 'package:rental_application/Models/reviewObjects.dart';
import 'package:rental_application/Models/userObjects.dart';

class practiceData {
  //user data

  static List <User> user=[];
  static List <Posting> posting=[];

  static populateFields() {
    User user1 = User(
      firstName: "Unnat",
      lastName: "Dhungana",
      imagePath: "assets/images/unnat.jpg",
      email: "un43676@student.vit.edu",
      dob: "1999-02-07",
      residentaladdress: "Harbord Street",
      contactNumber: "0411658730",
      country: "Australia",

    );

    user1.isHost = true;

    User user2 = User(
      firstName: "Aruna",
      lastName: "Acharya",
      imagePath: "assets/images/aruna.jpg",
      email: "ar41336@student.vit.edu.au",
      dob: "1999",
      residentaladdress: "sydney",
      contactNumber: "0411",
      country: "Australia",
    );
    user.add(user1);
    user.add(user2);

    Review review = Review();
    review.createReview(
      user2.createContactFromUser(),
      "Really Good house, would definitely recommend to others",
      4.5,
      DateTime.now(),
    );
    user1.reviews.add(review);

    Conversation conversation = Conversation();
    conversation.createConverstation(user2.createContactFromUser(), []);

    Message message1 = Message();
    message1.createMessage(
        user1.createContactFromUser(), //context
        "HELLO! How have you been?", //text
        DateTime.now() //date and time
    );

    Message message2 = Message();
    message2.createMessage(
        user2.createContactFromUser(), //context
        "Hi! I am good thank you. What about you?", //text
        DateTime.now() //date and time
    );
    conversation.messages.add(message1);
    conversation.messages.add(message2);

    user1.conversations.add(conversation);


    Posting posting1 = Posting(
      name: "BELMORE HOUSE",
      type: "House",
      price: 300,
      description: "Amazing Suburb & perfect Location",
      address: "Neutral Bay",
      city: "Sydney",
      country: "Australia",
      host: user1.createContactFromUser(),
    );
    posting1.setImage(
        ['assets/image/p1.jpg', 'assets/image/p2.jpg', 'assets/image/p3.jpg']);
    posting1.amenities = ['washer', 'dryer'];
    posting1.beds = {
      'small':0,
      'medium':2,
      'large':1,
    };
    posting1.bathrooms={
      'full':3,
      'half':1,
    };

    Posting posting2 = Posting(
      name: "Jays at Bays HOUSE",
      type: "House",
      price: 300,
      description: "Amazing Suburb & perfect Location",
      address: "Neutral Bay",
      city: "Sydney",
      country: "Australia",
      host: user2.createContactFromUser(),
    );
    posting1.setImage(
        ['assets/image/p1.jpg', 'assets/image/p2.jpg', 'assets/image/p3.jpg']);
    posting1.amenities = ['washer', 'dryer'];
    posting1.beds = {
      'small':0,
      'medium':2,
      'large':1,
    };
    posting1.bathrooms={
      'full':3,
      'half':1,
    };
    posting.add(posting1);
    posting.add(posting2);

    Booking booking1= Booking();
    booking1.createBooking(
      posting2,
      user1.createContactFromUser(),
      [DateTime(2019,10,10),DateTime(2019,08,11),],
    );
    Booking booking2=Booking();
    booking2.createBooking(posting2,
        user2.createContactFromUser(),
        [DateTime(2019,08,20),DateTime(2019,08,21)],);
    posting2.bookings.add(booking1);
    Review postingReview = Review();
    postingReview.createReview(
      user2.createContactFromUser(),
        "Pretty decent place to live with your family, very quiet and peacefull",
      3.5,
      DateTime(2019,08,08),
    );
    posting1.reviews.add(postingReview);
    user1.bookings.add(booking1);
    user2.bookings.add(booking2);

    user1.savedPostings.add(posting2);


  }

}