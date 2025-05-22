import 'package:bloc/bloc.dart';
import 'package:learnblocprovider/helper/print_text.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    printLog('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    printLog('onEvent -- ${bloc.runtimeType}, $event');
  }
// to Blocs-----------------------------
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    printLog('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    printLog('onTransition -- ${bloc.runtimeType}, $transition');
  }
//----------------------------------------
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    printLog('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    printLog('onClose -- ${bloc.runtimeType}');
  }
}