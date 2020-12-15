import 'package:disenos/src/pages/scroll_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Boton6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeInRight(
            delay: Duration(milliseconds: 500), child: Text('Animate_do')),
        backgroundColor: Colors.grey[850],
        actions: <Widget>[
          IconButton(
            icon: FadeInRight(
                delay: Duration(milliseconds: 700),
                child: FaIcon(FontAwesomeIcons.android)),
            onPressed: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (BuildContext context) => ScrollPage()));
            },
          ),
          IconButton(
            icon: FadeInRight(
              delay: Duration(milliseconds: 800),
              child: Icon(Icons.navigate_next),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (BuildContext context) => Boton6()));
            },
          ),
        ],
      ),
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
          child: FaIcon(FontAwesomeIcons.play), onPressed: () {}),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElasticIn(
              delay: Duration(milliseconds: 800),
              child: Icon(Icons.phone_android, color: Colors.blue, size: 40),
            ),
            FadeInLeft(
              delay: Duration(milliseconds: 500),
              child: Text('New Entries',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w200,
                      color: Colors.white)),
            ),
            FadeInRight(
              delay: Duration(milliseconds: 400),
              child: Text('Message From...',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white)),
            ),
            FadeInUp(
                delay: Duration(milliseconds: 800),
                child: Container(
                  width: 220,
                  height: 2,
                  color: Colors.blue,
                ))
          ],
        ),
      ),
    );
  }
}
