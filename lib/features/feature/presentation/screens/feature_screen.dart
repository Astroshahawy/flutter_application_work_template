import '../../../../core/src/app_export.dart';
import '../../cubit/feature_cubit.dart';
import '../widgets/get_user_data_button.dart';

class FeatureScreen extends StatelessWidget {
  const FeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<FeatureCubit, FeatureState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const CircularProgressIndicator.adaptive();
            } else if (state.isSuccess) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Name:'),
                      Gap(5.h),
                      Text(state.user!.name),
                    ],
                  ),
                  Gap(5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('User name:'),
                      Gap(5.h),
                      Text(state.user!.username),
                    ],
                  ),
                  Gap(5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Email:'),
                      Gap(5.h),
                      Text(state.user!.email),
                    ],
                  ),
                  Gap(5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Phone:'),
                      Gap(5.h),
                      Text(state.user!.phone),
                    ],
                  ),
                  Gap(5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Website:'),
                      Gap(5.h),
                      Text(state.user!.website),
                    ],
                  ),
                ],
              );
            } else if (state.isError) {
              return Center(
                child: Text(
                  state.errorMessage!,
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
        Gap(50.h),
        const GetUserDataButton(),
      ],
    ));
  }
}
