part of 'internet_cubit.dart';

enum InternetStatus {
  initial,
  connected,
  notConnected,
}

class InternetState {
  final InternetStatus status;
  final String? message;

  InternetState({
    required this.status,
    this.message,
  });
}

extension InternetStatusEx on InternetState {
  bool get isInitial => status == InternetStatus.initial;
  bool get isConnected => status == InternetStatus.connected;
  bool get isNotConnected => status == InternetStatus.notConnected;
}
