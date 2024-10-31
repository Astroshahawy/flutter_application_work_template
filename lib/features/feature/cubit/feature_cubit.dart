import '../../../core/exceptions/error_model.dart';
import '../../../core/src/app_export.dart';
import '../data/models/user.dart';
import '../data/repository/feature_repository.dart';

part 'feature_state.dart';

class FeatureCubit extends Cubit<FeatureState> {
  final FeatureRepository _featureRepository;
  FeatureCubit(
    this._featureRepository,
  ) : super(FeatureState(status: FeatureStatus.initial));

  static FeatureCubit get(context) => BlocProvider.of<FeatureCubit>(context);

  void getData(int id) async {
    emit(FeatureState(status: FeatureStatus.loading));
    NetworkService<User> data = await _featureRepository.getData(id);

    switch (data) {
      case Success<User>(data: User userData):
        emit(
          FeatureState(
            status: FeatureStatus.success,
            user: userData,
          ),
        );

      case Failure<User>(errorModel: ApiErrorModel errorModel):
        emit(
          FeatureState(
            status: FeatureStatus.error,
            errorModel: errorModel,
          ),
        );
    }
    // switch (data) {
    //   case Succeed<User>(data: User userData):
    //     _user = userData;
    //     emit(FeatureSuccess());

    //   case Failure<User>(networkExceptions: NetworkExceptions error):
    //     emit(FeatureError(networkExceptions: error));
    // }
  }
}
