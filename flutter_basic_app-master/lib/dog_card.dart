import 'package:basic_flutter_app/dog_model.dart';
import 'dog_detail_page.dart';
import 'package:flutter/material.dart';

class DogCard extends StatefulWidget {
  final Dog dog;

  DogCard(this.dog);

  @override
  _DogCardState createState() => _DogCardState(dog);
}

class _DogCardState extends State<DogCard> {
  Dog dog;
  String renderUrl;

  _DogCardState(this.dog);

  void initState() {
    super.initState();
    renderDogPic();
  }

  Widget get dogImage {
    var dogAvatar = new Hero(
      tag: dog,
      child: new Container(
        width: 100.0,
        height: 100.0,
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
                fit: BoxFit.cover, image: new NetworkImage(renderUrl ?? ''))),
      ),
    );

    var placeholder = new Container(
      width: 100.0,
      height: 100.0,
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          gradient: new LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.grey, Colors.grey, Colors.blueGrey[600]])),
      alignment: Alignment.center,
      child: new Text(
        'PEAKY BLINDERS',
        textAlign: TextAlign.center,
      ),
    );

    var crossFade = new AnimatedCrossFade(
      firstChild: placeholder,
      secondChild: dogAvatar,
      crossFadeState: renderUrl == null
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: new Duration(milliseconds: 1000),
    );

    return crossFade;
  }

  void renderDogPic() async {
    await dog.getImageUrl();
    if (mounted) {
      setState(() {
        renderUrl = dog.imageUrl;
      });
    }
  }

  var color_icon;
  showDogDetailPage() async {
    await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return new DogDetailPage(dog);
    }));
    if (widget.dog.rating <= 3) {
      color_icon = Colors.red;
    } else if (widget.dog.rating >= 4 && widget.dog.rating < 6) {
      color_icon = Colors.orange;
    } else if (widget.dog.rating >= 6 && widget.dog.rating <= 7) {
      color_icon = Colors.yellow;
    } else {
      color_icon = Colors.green;
    }
    setState(() {});
  }

  Widget get dogCard {
    return new Positioned(
      right: 5.0,
      child: new Container(
        width: 300,
        height: 125,
        child: new Card(
          color: Colors.grey,
          child: new Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8, left: 34),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Text(
                  widget.dog.name,
                  style: Theme.of(context).textTheme.headline,
                ),
                new Text(
                  widget.dog.location,
                  style: Theme.of(context).textTheme.subhead,
                ),
                new Row(
                  children: <Widget>[
                    new Icon(Icons.attach_money, color: color_icon),
                    new Text(': ${widget.dog.rating}/10')
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () => showDogDetailPage(),
      child: new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: new Container(
          height: 115.0,
          child: new Stack(
            children: <Widget>[
              dogCard,
              new Positioned(top: 7.5, child: dogImage),
            ],
          ),
        ),
      ),
    );
  }
}
