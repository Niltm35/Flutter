import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:disenos/src/pages/basico_page.dart';
import 'package:disenos/src/pages/scroll_page.dart';
import 'package:disenos/src/pages/botones_page.dart';
import 'package:disenos/src/pages/boton1.dart';
import 'package:disenos/src/pages/boton2.dart';
import 'package:disenos/src/pages/boton5.dart';
import 'package:disenos/src/pages/boton6.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños',
      initialRoute: 'basico',
      routes: {
        'basico': (BuildContext context) => BasicoPage(),
        'scroll': (BuildContext context) => ScrollPage(),
        'botones': (BuildContext context) => BotonesPage(),
        'boton1': (BuildContext context) => Boton1(),
        'boton2': (BuildContext context) => Boton2(),
        'boton5': (BuildContext context) => Boton5(),
        'boton6': (BuildContext context) => Boton6(),
      },
    );
  }
}
