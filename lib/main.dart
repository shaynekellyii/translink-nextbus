import 'package:flutter/material.dart';
import 'package:artemis/artemis.dart';
import 'package:next_bus/graphql_api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final client = ArtemisClient('https://translink-graphql.herokuapp.com/');
    final query = client
        .execute(StopQueryQuery(variables: StopQueryArguments(stop_id: 55092)));

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Next bus'),
        ),
        body: Container(
          child: FutureBuilder<GraphQLResponse>(
            future: query,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              return Center(
                  child: Text(snapshot.data.data.toJson().toString()));
            },
          ),
        ),
      ),
    );
  }
}
