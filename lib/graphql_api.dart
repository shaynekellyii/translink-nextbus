// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'graphql_api.g.dart';

@JsonSerializable(explicitToJson: true)
class StopQuery with EquatableMixin {
  StopQuery();

  factory StopQuery.fromJson(Map<String, dynamic> json) =>
      _$StopQueryFromJson(json);

  Stop stop;

  @override
  List<Object> get props => [stop];
  Map<String, dynamic> toJson() => _$StopQueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Stop with EquatableMixin {
  Stop();

  factory Stop.fromJson(Map<String, dynamic> json) => _$StopFromJson(json);

  String num;

  String name;

  String bayNum;

  String city;

  String onStreet;

  String atStreet;

  double lat;

  double lon;

  bool isAccessible;

  int distance;

  List<String> routes;

  Estimate estimate;

  @override
  List<Object> get props => [
        num,
        name,
        bayNum,
        city,
        onStreet,
        atStreet,
        lat,
        lon,
        isAccessible,
        distance,
        routes,
        estimate
      ];
  Map<String, dynamic> toJson() => _$StopToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Estimate with EquatableMixin {
  Estimate();

  factory Estimate.fromJson(Map<String, dynamic> json) =>
      _$EstimateFromJson(json);

  List<RouteEstimate> routes;

  @override
  List<Object> get props => [routes];
  Map<String, dynamic> toJson() => _$EstimateToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RouteEstimate with EquatableMixin {
  RouteEstimate();

  factory RouteEstimate.fromJson(Map<String, dynamic> json) =>
      _$RouteEstimateFromJson(json);

  String routeNum;

  String routeName;

  String direction;

  List<Schedule> schedules;

  @override
  List<Object> get props => [routeNum, routeName, direction, schedules];
  Map<String, dynamic> toJson() => _$RouteEstimateToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Schedule with EquatableMixin {
  Schedule();

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);

  String pattern;

  String destination;

  String expectedLeaveTime;

  int expectedCountdown;

  String scheduleStatus;

  bool cancelledTrip;

  bool cancelledStop;

  String lastUpdate;

  @override
  List<Object> get props => [
        pattern,
        destination,
        expectedLeaveTime,
        expectedCountdown,
        scheduleStatus,
        cancelledTrip,
        cancelledStop,
        lastUpdate
      ];
  Map<String, dynamic> toJson() => _$ScheduleToJson(this);
}

@JsonSerializable(explicitToJson: true)
class StopQueryArguments extends JsonSerializable with EquatableMixin {
  StopQueryArguments({this.stop_id});

  factory StopQueryArguments.fromJson(Map<String, dynamic> json) =>
      _$StopQueryArgumentsFromJson(json);

  final int stop_id;

  @override
  List<Object> get props => [stop_id];
  Map<String, dynamic> toJson() => _$StopQueryArgumentsToJson(this);
}

class StopQueryQuery extends GraphQLQuery<StopQuery, StopQueryArguments> {
  StopQueryQuery({this.variables});

  @override
  final String query =
      'query stop_query(\$stop_id: Int!) { stop(id: \$stop_id) { num name bayNum city onStreet atStreet lat lon isAccessible distance routes estimate { routes { routeNum routeName direction schedules { pattern destination expectedLeaveTime expectedCountdown scheduleStatus cancelledTrip cancelledStop lastUpdate } } } } }';

  @override
  final String operationName = 'stop_query';

  @override
  final StopQueryArguments variables;

  @override
  List<Object> get props => [query, operationName, variables];
  @override
  StopQuery parse(Map<String, dynamic> json) => StopQuery.fromJson(json);
}
