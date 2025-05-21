part of 'internet_bloc.dart';

@immutable
sealed class InternetState {}

final class ConnectionInitial extends InternetState {}

class ConnectedState extends InternetState {
  final String message;

  ConnectedState({required this.message});
}

class NotConnectedState extends InternetState {
  final String message;

  NotConnectedState({required this.message});
}
