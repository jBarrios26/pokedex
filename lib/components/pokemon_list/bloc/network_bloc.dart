import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pokedex/components/pokemon_list/bloc/network_event.dart';
import 'package:pokedex/components/pokemon_list/bloc/network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  StreamSubscription? _subscription;

  NetworkBloc() : super(NetworkConnectionInitial()) {
    on<NetworkListened>(_listenedConnection);
    on<NetworkChanged>(_onChangedConnection);
  }

  void _listenedConnection(NetworkListened event, Emitter<NetworkState> emit) {
    if (_subscription != null) _subscription!.cancel();
    _subscription = InternetConnectionChecker()
        .onStatusChange
        .listen((InternetConnectionStatus status) {
      if (status == InternetConnectionStatus.connected) {
        return add(NetworkChanged(NetworkConnectionSuccess()));
      } else {
        return add(NetworkChanged(NetworkConnectionFailure()));
      }
    });
  }

  void _onChangedConnection(NetworkChanged event, Emitter<NetworkState> emit) {
    emit(event.connection);
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
