import 'package:flutter/material.dart';
import 'package:medico/Pages/medicine_review.dart';

class MedicineReview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (ctx, i) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                return MedicineReview();
              }));
            },
            child: ListTile(
              leading: Icon(Icons.add_alarm),
              title: Text("Name of Medicine"),
              subtitle: Text("Description"),
            ),
          );
        },
      ),
    );
  }
}
