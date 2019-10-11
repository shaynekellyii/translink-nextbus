import 'package:flutter/material.dart';
import 'package:artemis/artemis.dart';
import 'package:next_bus/select_stop_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final client = ArtemisClient('https://translink-graphql.herokuapp.com/');
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Next bus'),
        ),
        body: SelectStopScreen(client: client),
      ),
    );
  }
}
