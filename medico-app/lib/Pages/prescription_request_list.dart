import 'package:flutter/material.dart';
import 'package:medico/Pages/appointment_form.dart';

class OpinioRequestList extends StatefulWidget {
  @override
  OpinioRequestListState createState() {
    return new OpinioRequestListState();
  }
}

class OpinioRequestListState extends State<OpinioRequestList> {
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
              return AppointmentForm();
            }));
          },
        ),
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
