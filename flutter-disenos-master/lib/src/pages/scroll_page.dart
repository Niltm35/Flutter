import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        _pagina1(),
        _pagina2(context),
        _pagina3(context),
        _pagina4(context),
        _pagina5(context),
        _pagina6(context)
      ],
    ));
  }

  Widget _pagina1() {
    return Stack(
      children: <Widget>[
        _colorFondo(),
        _imagenFondo(),
        _textos(),
      ],
    );
  }

  Widget _colorFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1.0),
    );
  }

  Widget _imagenFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('assets/flutter_wallpaper.jpg'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _textos() {
    final estiloTexto = TextStyle(color: Colors.white, fontSize: 50.0);

    return SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          Text('11°', style: estiloTexto),
          Text('Miércoles', style: estiloTexto),
          Expanded(child: Container()),
          Icon(Icons.keyboard_arrow_down, size: 70.0, color: Colors.white)
        ],
      ),
    );
  }

  Widget _pagina2(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black,
      child: Center(
        child: RaisedButton(
          shape: StadiumBorder(),
          color: Colors.blue,
          textColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Text('Bienvenidos', style: TextStyle(fontSize: 20.0)),
          ),
          onPressed: () => Navigator.pushNamed(context, 'botones'),
        ),
      ),
    );
  }

  Widget _pagina3(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black,
      child: Center(
        child: RaisedButton(
          shape: StadiumBorder(),
          color: Colors.blue,
          textColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Text('Marcador', style: TextStyle(fontSize: 20.0)),
          ),
          onPressed: () => Navigator.pushNamed(context, 'boton1'),
        ),
      ),
    );
  }
}

Widget _pagina4(BuildContext context) {
  return Container(
    width: double.infinity,
    height: double.infinity,
    color: Colors.black,
    child: Center(
      child: RaisedButton(
        shape: StadiumBorder(),
        color: Colors.blue,
        textColor: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          child: Text('Settings', style: TextStyle(fontSize: 20.0)),
        ),
        onPressed: () => Navigator.pushNamed(context, 'boton2'),
      ),
    ),
  );
}

Widget _pagina5(BuildContext context) {
  return Container(
    width: double.infinity,
    height: double.infinity,
    color: Colors.black,
    child: Center(
      child: RaisedButton(
        shape: StadiumBorder(),
        color: Colors.blue,
        textColor: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          child: Text('Advanced Settings', style: TextStyle(fontSize: 20.0)),
        ),
        onPressed: () => Navigator.pushNamed(context, 'boton5'),
      ),
    ),
  );
}

Widget _pagina6(BuildContext context) {
  return Container(
    width: double.infinity,
    height: double.infinity,
    color: Colors.black,
    child: Center(
      child: RaisedButton(
        shape: StadiumBorder(),
        color: Colors.blue,
        textColor: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          child: Text('Flow', style: TextStyle(fontSize: 20.0)),
        ),
        onPressed: () => Navigator.pushNamed(context, 'boton6'),
      ),
    ),
  );
}
