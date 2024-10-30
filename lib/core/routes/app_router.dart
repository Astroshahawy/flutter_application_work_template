import '../../features/feature/cubit/feature_cubit.dart';
import '../../features/feature/presentation/screens/feature_screen.dart';
import '../common/widgets/no_route.dart';
import '../src/app_export.dart';

part 'app_routes.dart';

class AppRouter {
  static Route? generateRoutes(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) {
        return BlocBuilder<InternetCubit, InternetState>(
          builder: (context, state) {
            switch (settings.name) {
              case AppRoutes.initScreen:
                return BlocProvider(
                  create: (context) => getIt<FeatureCubit>(),
                  child: const FeatureScreen(),
                );
              default:
                return NoRouteScreen(routeName: settings.name!);
            }
          },
        );
      },
    );
  }
}
