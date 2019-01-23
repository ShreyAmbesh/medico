import 'package:flutter/material.dart';
import 'package:medico/UI/fancy_tab_bar.dart';
import 'package:medico/utils/auth.dart';
import 'package:flutter/services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:medico/utils/first_aid.dart';

class MyApp extends StatelessWidget {
  String _userId;
  BaseAuth _auth;
  VoidCallback _onSignedOut;
  MyApp(this._userId, this._auth, this._onSignedOut) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      statusBarBrightness:
      Brightness.light, //or set color with: Color(0xFF0000FF)
    ));
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Montserrat'
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  PageController _pageController;

  FancyTabBar tabBar;

  void pageChanged(int pos)
  {
    _pageController.animateToPage(pos, duration: Duration(milliseconds: 300), curve: Curves.linear);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 1,keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    tabBar = FancyTabBar(pageChanged);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          PageView(physics: BouncingScrollPhysics(),controller: _pageController,
            onPageChanged: (index){
            tabBar.changePage(index);
            },
            children: <Widget>[
            Container(
              color: Colors.pink,
            ),
            Container(
              color: Colors.cyan,
            ),
            ListView.builder(physics: BouncingScrollPhysics(),itemBuilder: (ctx,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx){return FirstAid(index);}));
                  },
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                      child: Stack(fit: StackFit.expand,children: <Widget>[
                        ClipRRect(borderRadius: BorderRadius.circular(12.0),child: Hero(tag: '${index}',child: Image(fit: BoxFit.fill,image: CachedNetworkImageProvider('https://d3utvp06f2exxv.cloudfront.net/article/dengue-fever-do-not-panic-1518.jpg'),))),
                        Align(alignment: Alignment.bottomLeft,child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Dengue',style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.bold),),
                        ),)
                      ],),
                    ),
                  ),
                ),
              );
            }),
          ],),
          Align(alignment: Alignment.bottomCenter,
          child: tabBar,)
        ],
      )
    );
  }
}
