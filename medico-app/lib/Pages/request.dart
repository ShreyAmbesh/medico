import 'package:flutter/material.dart';
import './appointments.dart';

class Request extends StatefulWidget {
  @override
  RequestState createState() {
    return new RequestState();
  }
}

class RequestState extends State<Request> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 3,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: buildCard(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
            return Appointment();
          }));
        },
      ),
    );
  }

  Card buildCard() {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.assignment_ind),
            title: Text("widget.title"),
            subtitle: Text("widget.subtitle"),
          ),
          Row(
            children: <Widget>[
              FlatButton(
                child: const Text("Request 2nd Opinions"),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    ); 
  }
}
