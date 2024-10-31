import '../../features/feature/cubit/feature_cubit.dart';
import '../../features/feature/data/feature_data_source/feature_data_source.dart';
import '../../features/feature/data/repository/feature_repository.dart';
import '../network/dio_helper.dart';
import '../src/app_export.dart';

final getIt = GetIt.instance;

Future<void> initGetIt() async {
  ///Essentials
  getIt.registerFactory<LocalizationBloc>(() => LocalizationBloc());
  getIt.registerFactory<InternetCubit>(() => InternetCubit());
  getIt.registerFactory<AppThemeCubit>(() => AppThemeCubit());

  /// Feature
  getIt.registerLazySingleton<FeatureDataSource>(
      () => FeatureDataSource(getIt()));
  getIt.registerFactory<FeatureCubit>(() => FeatureCubit(getIt()));
  getIt.registerLazySingleton<FeatureRepository>(
      () => FeatureRepository(getIt()));

  /// Dio
  getIt.registerLazySingleton<BaseDioHelper>(() => DioHelper());

  /// SharedPreferences
  getIt.registerLazySingletonAsync<SharedPreferences>(
    () async => await SharedPreferences.getInstance(),
  );
  await getIt.isReady<SharedPreferences>();

  /// FlutterSecureStorage
  getIt.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );
}
