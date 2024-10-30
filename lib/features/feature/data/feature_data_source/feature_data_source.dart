import '../../../../core/network/dio_helper.dart';
import '../../../../core/src/app_export.dart';

class FeatureDataSource {
  final BaseDioHelper _baseDioHelper;

  FeatureDataSource(this._baseDioHelper);

  Future getData(int id) async {
    final Response response = await _baseDioHelper.get(
      endPoint: AppEndPoints.getUsers(id),
    );
    return response.data;
  }
}
