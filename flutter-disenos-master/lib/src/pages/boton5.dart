import 'package:flutter/material.dart';
import './checkbox.dart';

class Boton5 extends StatefulWidget {
  static final String path = "lib/src/pages/misc/form_elements.dart";
  @override
  _FormElementPageState createState() => _FormElementPageState();
}

class _FormElementPageState extends State<Boton5> {
  bool downloadOverWifi = false;
  bool downloadOverWifi1 = false;
  bool downloadOverWifi2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Elements')),
      backgroundColor: Colors.grey[700],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            PCheckboxListTile(
              title: "Download over wifi",
              color: Colors.blue,
              value: downloadOverWifi,
              onChanged: (value) {
                setState(() {
                  downloadOverWifi = value;
                });
              },
            ),
            Divider(),
            PCheckboxListTile(
                title: "Download over wifi",
                value: downloadOverWifi1,
                color: Colors.blue,
                onChanged: (value) {
                  setState(() {
                    downloadOverWifi1 = value;
                  });
                }),
            Divider(),
            PCheckboxListTile(
              title: "Download over wifi",
              value: downloadOverWifi2,
              color: Colors.blue,
              onChanged: (value) {
                setState(() {
                  downloadOverWifi2 = value;
                });
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
