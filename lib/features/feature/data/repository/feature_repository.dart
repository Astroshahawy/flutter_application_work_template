
import '../../../../core/src/app_export.dart';
import '../feature_data_source/feature_data_source.dart';
import '../models/user.dart';

class FeatureRepository {
  final FeatureDataSource _featureDataSource;

  FeatureRepository(this._featureDataSource);

  Future<NetworkService<User>> getData(int id) async {
    try {
      return NetworkService.succeed(
        User.fromJson(await _featureDataSource.getData(id)),
      );
    } catch (error) {
      return NetworkService.failure(ErrorHandler.handle(error));
    }
  }
}
