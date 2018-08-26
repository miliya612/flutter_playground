import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _SettingsPageState createState() => new _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String result = "Settings";

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text(
        result,
        style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
