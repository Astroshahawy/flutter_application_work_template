import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../src/app_export.dart';
part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  late StreamSubscription<List<ConnectivityResult>> _subscription;

  InternetCubit() : super(InternetInitial()) {
    _subscription =
        Connectivity().onConnectivityChanged.listen(_handleConnectivityChange);
    checkConnection();
  }

  void _handleConnectivityChange(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.wifi) ||
        result.contains(ConnectivityResult.mobile)) {
      connected();
    } else {
      notConnected();
    }
  }

  void checkConnection() {
    Connectivity().checkConnectivity().then(_handleConnectivityChange);
  }

  void connected() {
    emit(ConnectedState(message: 'Connected'));
  }

  void notConnected() {
    emit(NotConnectedState(message: 'Not Connected'));
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
