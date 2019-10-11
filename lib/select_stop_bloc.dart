import 'dart:async';

import 'package:artemis/artemis.dart';
import 'package:next_bus/graphql_api.dart';
import 'package:next_bus/select_stop_state.dart';
import 'package:rxdart/subjects.dart';
import 'package:rxdart/rxdart.dart';

class SelectStopBloc {
  factory SelectStopBloc(ArtemisClient client) {
    final onTextChanged = PublishSubject<String>();
    final state = onTextChanged
        .distinct()
        .debounceTime(const Duration(milliseconds: 250))
        .switchMap<SelectStopState>((String stop) => _fetchStop(stop, client))
        .startWith(SelectStopNoStop());

    return SelectStopBloc._(onTextChanged, state);
  }

  SelectStopBloc._(this.onTextChanged, this.state);

  final Sink<String> onTextChanged;
  final Stream<SelectStopState> state;

  void dispose() {
    onTextChanged.close();
  }

  static Stream<SelectStopState> _fetchStop(
      String term, ArtemisClient client) async* {
    if (term == null ||
        term.isEmpty ||
        term.length != 5 ||
        int.tryParse(term) == null) {
      yield SelectStopNoStop();
    } else {
      yield SelectStopLoading();

      try {
        final response = await client.execute(StopQueryQuery(
            variables: StopQueryArguments(stop_id: int.parse(term))));
            
        if (response.hasErrors) {
          yield SelectStopError();
        } else if (response.data?.stop == null) {
          yield SelectStopEmpty();
        } else {
          yield SelectStopPopulated(response.data.stop);
        }
      } catch (e) {
        yield SelectStopError();
      }
    }
  }
}
