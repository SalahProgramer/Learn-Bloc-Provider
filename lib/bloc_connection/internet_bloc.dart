import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'internet_event.dart';

part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  StreamSubscription? subscription;

  InternetBloc() : super(ConnectionInitial()) {
    on<InternetEvent>((event, emit) {
      if (event is ConnectedEvent) {
        emit(ConnectedState(message: "Was connected"));
      } else if (event is NotConnectedEvent) {
        emit(NotConnectedState(message: "Was not connected"));
      }
    });

    subscription = Connectivity().onConnectivityChanged.listen(
      (event) {
        if (event == ConnectivityResult.wifi ||
            event == ConnectivityResult.mobile) {
          add(ConnectedEvent());
        } else {
          add(NotConnectedEvent());
        }
      },
    );
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
