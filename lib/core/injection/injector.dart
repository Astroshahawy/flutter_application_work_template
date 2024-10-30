import '../../features/feature/cubit/feature_cubit.dart';
import '../../features/feature/data/feature_data_source/feature_data_source.dart';
import '../../features/feature/data/repository/feature_repository.dart';
import '../network/dio_helper.dart';
import '../src/app_export.dart';

final getIt = GetIt.instance;

void initGetIt() {
  /// BLoC
  getIt.registerFactory<FeatureCubit>(() => FeatureCubit(getIt()));

  /// Data Sources
  getIt.registerLazySingleton<FeatureDataSource>(
      () => FeatureDataSource(getIt()));

  /// Repository
  getIt.registerLazySingleton<FeatureRepository>(
      () => FeatureRepository(getIt()));

  /// Dio
  getIt.registerLazySingleton<BaseDioHelper>(() => DioHelper());

  /// SharedPreferences
  getIt.registerLazySingletonAsync<SharedPreferences>(
    () async => await SharedPreferences.getInstance(),
  );

  /// FlutterSecureStorage
  getIt.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );
}
