import 'package:flutter/material.dart';
import 'dart:async';

import 'dog_model.dart';
import 'dog_list.dart';
import 'new_dog_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peaky Blinders',
      theme: ThemeData(brightness: Brightness.dark),
      home: MyHomePage(
        title: 'Peaky Blinders',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Dog> initialDoggos = []
    ..add(Dog(
        'Thomas Shelby',
        'Small Heath, Birmingham, England',
        'Thomas Michael Shelby is the leader of the Birmingham criminal gang, the Peaky Blinders and the patriarch of the Shelby Family. Tommy served in World War I with the rank of Sergeant Major and was decorated for bravery. His experiences in World War I left him disillusioned and beset with ongoing nightmares, and he becomes determined to move his family up in the world.',
        'https://i.guim.co.uk/img/media/64c687b75da57f3e82d9fcfd019a4103ce81db15/0_143_4284_2570/master/4284.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=b03ca8f1265401501deb033c7481740e'))
    ..add(Dog(
        'Grace Shelby',
        'Galway, Ireland',
        'Grace Helen Shelby was an Irish barmaid who took up employment at The Garrison Pub, and secretly operated as an undercover agent for the Birmingham Police. Her mission involved getting close to Thomas Shelby whom she fell in love with. He too returned the sentiment but was heartbroken when he discovered her treachery.',
        'https://static.wikia.nocookie.net/peaky-blinders/images/3/3b/Grace_Shelby.jpg/revision/latest/top-crop/width/360/height/360?cb=20171228170507'))
    ..add(Dog(
        'Arthur Shelby',
        'Small Heath, Birmingham, England',
        'Arthur is the eldest of the Shelby siblings and a tough member of the Peaky Blinders. He is also Deputy Vice President of Shelby Company Limited and member of the ICA, acting as his brother Tommy Shelby\'s right-hand man.',
        'https://assets.tonica.la/__export/1572554677926/sites/debate/img/2019/10/31/peaky_blinders_17_1.jpeg_1359985867.jpeg'))
    ..add(Dog(
        'John Shelby',
        'Small Heath, Birmingham, England',
        'John Michael Shelby, also known as Johnny or John Boy, was the third of Shelby siblings and a high ranking member of the Peaky Blinders. He was also a 1/3 shareholder in the Shelby Family business, Shelby Company Limited. He was the husband of Esme Shelby and therefore related to the Lee Family through marriage. After the Peaky Blinders get mixed up with the Changretta Family, John receives the Black Hand from them, but is slow to react and misses a warning from his brother Tommy, and is shot to death in his family estate.',
        'https://static.wikia.nocookie.net/peaky-blinders/images/0/0b/Johns3.jpg/revision/latest/top-crop/width/360/height/360?cb=20190715140143'))
    ..add(Dog('Michael Gray', 'Sheffield, England', 'Michael Gray, introduced in the second season, is the son of Polly Shelby, the cousin of the Shelby siblings, and a powerful and high ranking member of the Peaky Blinders. He is the Chief Accountant of Shelby Company Limited, a position that causes tensions with John Shelby. After being wounded by Luca Chaingretta\'s men at the end of Series 4, Michael leaves for America where he leads the Shelby Company Limited in New York. ', 'https://images-na.ssl-images-amazon.com/images/I/51lqvtcyfFL._AC_.jpg'));

  Future _showNewDogForm() async {
    Dog newDog = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return AddDogFormPage();
    }));
    if (newDog != null) {
      initialDoggos.add(newDog);
    }
  }

  @override
  Widget build(BuildContext context) {
    var key = new GlobalKey<ScaffoldState>();
    return new Scaffold(
      key: key,
      appBar: new AppBar(
        title: new Text(widget.title),
        backgroundColor: Colors.black87,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add),
            onPressed: _showNewDogForm,
          ),
        ],
      ),
      body: new Container(
          decoration: new BoxDecoration(
              image: DecorationImage(
            image: new NetworkImage(
                "https://media.titanbooks.com/catalog/products/8081/AC6_SpecialEd_Slipcase_raUGABs.jpg"),
            fit: BoxFit.cover,
          )),
          child: new Center(
            child: new DogList(initialDoggos),
          )),
    );
  }
}
