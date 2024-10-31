import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../src/app_export.dart';
part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  late StreamSubscription<List<ConnectivityResult>> _subscription;

  InternetCubit() : super(InternetState(status: InternetStatus.initial)) {
    _subscription =
        Connectivity().onConnectivityChanged.listen(_handleConnectivityChange);
  }

  void _handleConnectivityChange(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.wifi) ||
        result.contains(ConnectivityResult.mobile)) {
      connected();
    } else {
      notConnected();
    }
  }

  void connected() {
    emit(InternetState(
      status: InternetStatus.connected,
      message: 'Connected',
    ));
  }

  void notConnected() {
    emit(InternetState(
      status: InternetStatus.notConnected,
      message: 'Not Connected',
    ));
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
