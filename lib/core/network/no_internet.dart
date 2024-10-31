import '../src/app_export.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const Text(
          'No internet',
        ).exBold(),
      ),
    );
  }
}
