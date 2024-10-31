import '../../../../core/src/app_export.dart';
import '../../cubit/feature_cubit.dart';

class GetUserDataButton extends StatelessWidget {
  const GetUserDataButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => FeatureCubit.get(context).getData(1),
        child: const Text('Get user'),
      ),
    );
  }
}
