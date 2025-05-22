import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  StreamSubscription? subscription;

  InternetCubit() : super(InternetInitial());

  Future<void> checkConnection() async {
    final initialResult = await Connectivity().checkConnectivity();
    handleConnectivityResult(initialResult);

    subscription = Connectivity().onConnectivityChanged.listen(
      (event) {
        handleConnectivityResult(event);
      },
    );
  }

  void handleConnectivityResult(ConnectivityResult result) {
    if (result == ConnectivityResult.wifi ||
        result == ConnectivityResult.mobile) {
      emit(ConnectedState(message: "Was connected"));
    } else {
      emit(NotConnectedState(message: "Was not connected"));
    }
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
