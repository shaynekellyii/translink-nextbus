import 'package:next_bus/graphql_api.dart';

class SelectStopState {}

class SelectStopLoading extends SelectStopState {}

class SelectStopError extends SelectStopState {}

class SelectStopNoStop extends SelectStopState {}

class SelectStopEmpty extends SelectStopState {}

class SelectStopPopulated extends SelectStopState {
  SelectStopPopulated(this.stop);
  final Stop stop;
}
