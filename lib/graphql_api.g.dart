// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graphql_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StopQuery _$StopQueryFromJson(Map<String, dynamic> json) {
  return StopQuery()
    ..stop = json['stop'] == null
        ? null
        : Stop.fromJson(json['stop'] as Map<String, dynamic>);
}

Map<String, dynamic> _$StopQueryToJson(StopQuery instance) => <String, dynamic>{
      'stop': instance.stop?.toJson(),
    };

Stop _$StopFromJson(Map<String, dynamic> json) {
  return Stop()
    ..num = json['num'] as String
    ..name = json['name'] as String
    ..bayNum = json['bayNum'] as String
    ..city = json['city'] as String
    ..onStreet = json['onStreet'] as String
    ..atStreet = json['atStreet'] as String
    ..lat = (json['lat'] as num)?.toDouble()
    ..lon = (json['lon'] as num)?.toDouble()
    ..isAccessible = json['isAccessible'] as bool
    ..distance = json['distance'] as int
    ..routes = (json['routes'] as List)?.map((e) => e as String)?.toList()
    ..estimate = json['estimate'] == null
        ? null
        : Estimate.fromJson(json['estimate'] as Map<String, dynamic>);
}

Map<String, dynamic> _$StopToJson(Stop instance) => <String, dynamic>{
      'num': instance.num,
      'name': instance.name,
      'bayNum': instance.bayNum,
      'city': instance.city,
      'onStreet': instance.onStreet,
      'atStreet': instance.atStreet,
      'lat': instance.lat,
      'lon': instance.lon,
      'isAccessible': instance.isAccessible,
      'distance': instance.distance,
      'routes': instance.routes,
      'estimate': instance.estimate?.toJson(),
    };

Estimate _$EstimateFromJson(Map<String, dynamic> json) {
  return Estimate()
    ..routes = (json['routes'] as List)
        ?.map((e) => e == null
            ? null
            : RouteEstimate.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$EstimateToJson(Estimate instance) => <String, dynamic>{
      'routes': instance.routes?.map((e) => e?.toJson())?.toList(),
    };

RouteEstimate _$RouteEstimateFromJson(Map<String, dynamic> json) {
  return RouteEstimate()
    ..routeNum = json['routeNum'] as String
    ..routeName = json['routeName'] as String
    ..direction = json['direction'] as String
    ..schedules = (json['schedules'] as List)
        ?.map((e) =>
            e == null ? null : Schedule.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$RouteEstimateToJson(RouteEstimate instance) =>
    <String, dynamic>{
      'routeNum': instance.routeNum,
      'routeName': instance.routeName,
      'direction': instance.direction,
      'schedules': instance.schedules?.map((e) => e?.toJson())?.toList(),
    };

Schedule _$ScheduleFromJson(Map<String, dynamic> json) {
  return Schedule()
    ..pattern = json['pattern'] as String
    ..destination = json['destination'] as String
    ..expectedLeaveTime = json['expectedLeaveTime'] as String
    ..expectedCountdown = json['expectedCountdown'] as int
    ..scheduleStatus = json['scheduleStatus'] as String
    ..cancelledTrip = json['cancelledTrip'] as bool
    ..cancelledStop = json['cancelledStop'] as bool
    ..lastUpdate = json['lastUpdate'] as String;
}

Map<String, dynamic> _$ScheduleToJson(Schedule instance) => <String, dynamic>{
      'pattern': instance.pattern,
      'destination': instance.destination,
      'expectedLeaveTime': instance.expectedLeaveTime,
      'expectedCountdown': instance.expectedCountdown,
      'scheduleStatus': instance.scheduleStatus,
      'cancelledTrip': instance.cancelledTrip,
      'cancelledStop': instance.cancelledStop,
      'lastUpdate': instance.lastUpdate,
    };

StopQueryArguments _$StopQueryArgumentsFromJson(Map<String, dynamic> json) {
  return StopQueryArguments(
    stop_id: json['stop_id'] as int,
  );
}

Map<String, dynamic> _$StopQueryArgumentsToJson(StopQueryArguments instance) =>
    <String, dynamic>{
      'stop_id': instance.stop_id,
    };
