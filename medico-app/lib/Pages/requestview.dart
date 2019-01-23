import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class PatientRequest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Center(
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 4,
          itemBuilder: (ctx, i) {
            return
              i==0?buildRequest():buildReview()
              ;
          }),
    ));
  }

  Card buildRequest() {
    return Card(
      child: Column(
        children: <Widget>[
          Text(
            "Your Illness",
            style: TextStyle(fontSize: 18.0,color: Colors.lightBlue),
          ),
          Text("Description"),
                    
        ],
      ),
    );
  }

  DecoratedBox buildImage() {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('./1.jpg')
        )
      ),
    );
  }

  Card buildReview() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "Doctor Name",
                  style: TextStyle(fontSize: 18.0),
                ),
                Spacer(),
                SmoothStarRating(
                  allowHalfRating: false,
                  starCount: 5,
                  rating: 3,
                  size: 10.0,
                  color: Colors.yellow,
                  borderColor: Colors.grey,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text("Ths is the review and best plan"),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                FlatButton(
                  child: const Text("Book Appointment"),
                  onPressed: () {},
                ),
                Spacer(),
                FlatButton(
                  child: const Text("Chat"),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
