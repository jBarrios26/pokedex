import 'package:equatable/equatable.dart';

abstract class NetworkState extends Equatable {
  @override
  List<Object> get props => [];
}

class NetworkConnectionInitial extends NetworkState {}

class NetworkConnectionSuccess extends NetworkState {}

class NetworkConnectionFailure extends NetworkState {}
