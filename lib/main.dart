import 'package:flutter/material.dart';
import 'listViewExample.dart';
void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final materialApp = new MaterialApp(
      title: '',
      home: new ListViewExample(),
    );
    return materialApp;
//    return MaterialApp(
//      title: 'Flutter Demo',
//    );
  }
}
