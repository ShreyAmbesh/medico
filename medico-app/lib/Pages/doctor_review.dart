import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class DoctorReview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (ctx, i) {
          return i == 0 ? buildMedicineDescription() : buildReviews(context);
        },
      ),
    );
  }

  Card buildMedicineDescription() {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 50.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text("Title", style: TextStyle(fontSize: 18.0)),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text("Description"),
          )
        ]),
      ),
    );
  }

  ListTile buildReviews(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.add_alarm),
      title: Text("Name of Doctor"),
      subtitle: Text("Description"),
      trailing: SmoothStarRating(
        allowHalfRating: false,
        starCount: 5,
        rating: 3,
        size: 10.0,
        color: Colors.yellow,
        borderColor: Colors.grey,
      ),
    );
  }
}
