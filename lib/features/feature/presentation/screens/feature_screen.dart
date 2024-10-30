import '../../../../core/src/app_export.dart';
import '../../cubit/feature_cubit.dart';

class FeatureScreen extends StatelessWidget {
  const FeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
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
                        const Gap(5),
                        Text(state.user!.name),
                      ],
                    ),
                    const SizedBox.square(dimension: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('User name:'),
                        const Gap(5),
                        Text(state.user!.username),
                      ],
                    ),
                    const Gap(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Email:'),
                        const Gap(5),
                        Text(state.user!.email),
                      ],
                    ),
                    const Gap(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Phone:'),
                        const Gap(5),
                        Text(state.user!.phone),
                      ],
                    ),
                    const Gap(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Website:'),
                        const Gap(5),
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
          const Gap(50),
          Center(
            child: ElevatedButton(
              onPressed: () => FeatureCubit.get(context).getData(1),
              child: const Text('Get user'),
            ),
          ),
        ],
      ),
    ));
  }
}
