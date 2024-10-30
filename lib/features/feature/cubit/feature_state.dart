part of 'feature_cubit.dart';

enum FeatureStatus {
  initial,
  loading,
  success,
  error,
}

class FeatureState {
  final FeatureStatus status;
  final User? user;
  final String? errorMessage;

  FeatureState({
    required this.status,
    this.user,
    this.errorMessage,
  });
}

extension FeatureStatusEx on FeatureState {
  bool get isInitial => status == FeatureStatus.initial;
  bool get isLoading => status == FeatureStatus.loading;
  bool get isSuccess => status == FeatureStatus.success;
  bool get isError => status == FeatureStatus.error;
}
