import 'package:flutter/material.dart';
import 'package:artemis/artemis.dart';
import 'package:next_bus/graphql_api.dart';
import 'package:next_bus/select_stop_bloc.dart';
import 'package:next_bus/select_stop_state.dart';

class SelectStopScreen extends StatefulWidget {
  SelectStopScreen({Key key, this.client}) : super(key: key);

  final ArtemisClient client;

  @override
  _SelectStopScreenState createState() => _SelectStopScreenState();
}

class _SelectStopScreenState extends State<SelectStopScreen> {
  SelectStopBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = SelectStopBloc(widget.client);
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SelectStopState>(
      stream: bloc.state,
      initialData: SelectStopNoStop(),
      builder: (context, snapshot) => Column(
        children: <Widget>[
          StopSearch(onChanged: bloc.onTextChanged.add),
          Expanded(child: Container(child: _buildChild(snapshot.data))),
        ],
      ),
    );
  }
}

Widget _buildChild(SelectStopState state) {
  if (state is SelectStopNoStop) {
    return Center(child: Text('Please enter a 5-digit stop number'));
  } else if (state is SelectStopEmpty) {
    return Center(child: Text('Data not available'));
  } else if (state is SelectStopLoading) {
    return Center(child: CircularProgressIndicator());
  } else if (state is SelectStopError) {
    return Center(child: Text('Error'));
  } else if (state is SelectStopPopulated) {
    return StopResultsWidget(stop: state.stop);
  }

  throw Exception('${state.runtimeType} is not supported');
}

class StopSearch extends StatelessWidget {
  const StopSearch({Key key, this.onChanged}) : super(key: key);

  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(hintText: 'Enter a 5-digit stop number'),
        keyboardType: TextInputType.number,
        onChanged: onChanged,
      ),
    );
  }
}

class StopResultsWidget extends StatelessWidget {
  const StopResultsWidget({Key key, @required this.stop}) : super(key: key);

  final Stop stop;

  @override
  Widget build(BuildContext context) {
    final routes = stop?.estimate?.routes;
    if (routes == null) return Center(child: Text('No data available'));

    return ListView(
      children: [
        StopListHeader(stop: stop),
        ...routes.map((route) => StopListItem(route: route)).toList(),
      ],
    );
  }
}

class StopListHeader extends StatelessWidget {
  const StopListHeader({Key key, this.stop}) : super(key: key);

  final Stop stop;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Text(
        '#${stop.num}: ${stop.name}',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
    );
  }
}

class StopListItem extends StatelessWidget {
  const StopListItem({Key key, @required this.route}) : super(key: key);

  final RouteEstimate route;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Route: ${route.routeNum} ${route.routeName}'),
          Text(
              'in ${route.schedules.map((s) => s.expectedCountdown).join(',')}')
        ],
      ),
    );
  }
}
