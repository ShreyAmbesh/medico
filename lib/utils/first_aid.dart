
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FirstAid extends StatefulWidget {
  int index;

  FirstAid(this.index);

  @override
  _FirstAidState createState() => _FirstAidState();
}

class _FirstAidState extends State<FirstAid> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List<String> precaution=['some','some','some','some','some','some','some','some','some','some',];

  List<String> symptoms=['some','some','some','some','some','some','some','some','some','some',];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Montserrat"),
      home: Scaffold(
        body: Container(
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: true,
                backgroundColor: Colors.purple,
                expandedHeight: MediaQuery.of(context).size.height / 2.5,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text('Dengue'),
                  background: Hero(
                      tag: '${widget.index}',
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: 'https://d3utvp06f2exxv.cloudfront.net/article/dengue-fever-do-not-panic-1518.jpg',
                        placeholder: CircularProgressIndicator(),
                        errorWidget: Icon(Icons.error),
                      )),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    elevation: 4.0,
                    margin:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 18.0,
                        ),
                        Text(
                          'Symptoms',
                          style: TextStyle(
                              fontSize: 28.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 18.0,
                        ),
                        Column(
                          children: getSymptoms(),
                        ),
                        SizedBox(
                          height: 18.0,
                        ),
                      ],
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    elevation: 4.0,
                    margin:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 18.0,
                        ),
                        Text(
                          'Precautions',
                          style: TextStyle(
                              fontSize: 28.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 18.0,
                        ),
                        Column(
                          children: getPrecautions(),
                        ),
                        SizedBox(
                          height: 18.0,
                        ),
                      ],
                    ),
                  ),

                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getSymptoms() {
    int index = 1;
    List<Widget> symps = [];
    while (index <= precaution.length) {
      symps.add(Padding(
        padding: const EdgeInsets.all(6.0),
        child: ListTile(
          dense: true,
          leading: CircleAvatar(
            radius: 11.0,
            backgroundColor: Colors.red,
            child: Text(
              '${index}',
              style: TextStyle(fontSize: 14),
            ),
          ),
          title: Text(precaution[index - 1],
              style: TextStyle(fontSize: 18, fontFamily: "Montserrat")),
        ),
      ));
      index++;
    }
    return symps;
  }


  List<Widget> getPrecautions() {
    int index = 1;
    List<Widget> precauts = [];
    while (index <= precaution.length) {
      precauts.add(Padding(
        padding: const EdgeInsets.all(6.0),
        child: ListTile(
          dense: true,
          leading: CircleAvatar(
            radius: 11.0,
            backgroundColor: Colors.green,
            child: Text(
              '${index}',
              style: TextStyle(fontSize: 14),
            ),
          ),
          title: Text(symptoms[index - 1],
              style: TextStyle(fontSize: 18, fontFamily: "Montserrat")),
        ),
      ));
      index++;
    }
    return precauts;
  }

}
