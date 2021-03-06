import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'data.dart';
import 'flower.dart';
class ListViewExample extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return new ListViewExampleState();
  }
}
class ListViewExampleState extends State<ListViewExample>{
  var selectedFlower = new Flower();
  List<GestureDetector> _buildListItemsFromFlowers(){
    int index = 0;
    return flowers.map((flower){
      var boxDecoration = index % 2 ==0 ?
      new BoxDecoration( color: Colors.yellow):
      new BoxDecoration(
          color: Colors.blue
      );
      if(selectedFlower == flower){
        boxDecoration = new BoxDecoration(
          color: Colors.deepOrangeAccent

        );
      }
      var container = Container(
        decoration : boxDecoration,
        child: new Row(
          children: <Widget>[
            new Container(
              margin: new EdgeInsets.all(10.0),
              child: new CachedNetworkImage(
                  imageUrl: flower.imageURL,
              width: 70.0,
              height: 70.0,
              fit: BoxFit.cover,),
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(bottom :10.0),
                  child: Text(
                    flower.flowerName,
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0
                    ),

                  ),
                ),
                new Container(
                  padding: const EdgeInsets.only(bottom :10.0),
                  child: Text(
                    flower.description,
                    style: new TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                      color: Colors.black
                    ),

                  ),
                )

              ],
            )
          ],
        ),
      );
      index = index +1;
      final gestureDetector = GestureDetector(
        child: container,
        onTap: (){
          print("You tapped to ${flower.flowerName}");
          setState(() {
            selectedFlower = flower;
          });

        },
      );
      return gestureDetector;
    }).toList();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new ListView(
      children: _buildListItemsFromFlowers(),

    );
  }
}