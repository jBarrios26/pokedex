import 'package:equatable/equatable.dart';

import 'network_state.dart';

abstract class NetworkEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class NetworkListened extends NetworkEvent {}

class NetworkChanged extends NetworkEvent {
  NetworkState connection;
  NetworkChanged(this.connection);
}
