import 'package:flutter/material.dart';
import 'dog_model.dart';
import 'dart:async';

class DogDetailPage extends StatefulWidget {
  final Dog dog;
  DogDetailPage(this.dog);

  @override
  _DogDetailPageState createState() => new _DogDetailPageState();
}

class _DogDetailPageState extends State<DogDetailPage> {
  final double dogAvarterSize = 150.0;
  double _sliderValue = 5.0;

  Widget get addYourRating {
    return new Column(
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Flexible(
                flex: 1,
                child: new Slider(
                  activeColor: Colors.blueGrey,
                  min: 0.0,
                  max: 10.0,
                  value: _sliderValue,
                  onChanged: (newRating) {
                    setState(() {
                      _sliderValue = newRating;
                    });
                  },
                ),
              ),
              new Container(
                width: 50.0,
                alignment: Alignment.center,
                child: new Text('${_sliderValue.toInt()}',
                    style: Theme.of(context).textTheme.display1),
              ),
            ],
          ),
        ),
        submitRatingButton,
      ],
    );
  }

  var color_icon;
  void updateRating() {
    setState(() {
      widget.dog.rating = _sliderValue.toInt();
    });
    if (widget.dog.rating <= 3) {
      color_icon = Colors.red;
    } else if (widget.dog.rating >= 4 && widget.dog.rating < 6) {
      color_icon = Colors.orange;
    } else if (widget.dog.rating >= 6 && widget.dog.rating <= 7) {
      color_icon = Colors.yellow;
    } else {
      color_icon = Colors.green;
    }
  }

  Widget get submitRatingButton {
    return new RaisedButton(
      onPressed: () => updateRating(),
      child: new Text('Submit'),
      color: Colors.blueGrey,
    );
  }

  Widget get dogImage {
    return new Hero(
      tag: widget.dog,
      child: new Container(
        height: dogAvarterSize,
        width: dogAvarterSize,
        constraints: new BoxConstraints(),
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              const BoxShadow(
                  offset: const Offset(1.0, 2.0),
                  blurRadius: 2.0,
                  spreadRadius: -1.0,
                  color: const Color(0x33000000)),
              const BoxShadow(
                  offset: const Offset(2.0, 1.0),
                  blurRadius: 3.0,
                  spreadRadius: 0.0,
                  color: const Color(0x24000000)),
              const BoxShadow(
                  offset: const Offset(3.0, 1.0),
                  blurRadius: 4.0,
                  spreadRadius: 2.0,
                  color: const Color(0x1f000000))
            ],
            image: new DecorationImage(
                fit: BoxFit.cover,
                image: new NetworkImage(widget.dog.imageUrl ?? ''))),
      ),
    );
  }

  Widget get rating {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Icon(
          Icons.attach_money,
          color: color_icon,
          size: 40.0,
        ),
        new Text(
          '${widget.dog.rating}/10',
          style: Theme.of(context).textTheme.display2,
        )
      ],
    );
  }

  Widget get dogProfile {
    return new Container(
      padding: new EdgeInsets.symmetric(vertical: 32.0),
      decoration: new BoxDecoration(
          image: DecorationImage(
        image: new NetworkImage(
            "https://upload.wikimedia.org/wikipedia/commons/1/13/Peaky_Blinders_Logo.png"),
        fit: BoxFit.cover,
        colorFilter: new ColorFilter.mode(
            Colors.black.withOpacity(0.5), BlendMode.dstATop),
      )),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          dogImage,
          new Text(
            '${widget.dog.name}',
            style: TextStyle(fontSize: 32.0),
          ),
          new Text(
            widget.dog.location,
            style: TextStyle(fontSize: 20.0),
          ),
          new Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: new Text(widget.dog.description),
          ),
          rating
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black87,
      appBar: new AppBar(
        backgroundColor: Colors.black87,
        title: new Text('More about ${widget.dog.name}'),
      ),
      body: new ListView(
        children: <Widget>[dogProfile, addYourRating],
      ),
    );
  }
}
