import '../../src/app_export.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100.w,
        height: 90.h,
        color: AppLightColors.black.withOpacity(0.2),
        child: Image.asset(
          GifConstants.gifExample,
        ),
      ),
    );
  }
}

class LoadingOverlayServices {
  OverlayEntry? _overlayEntry;

  void showLoadingOverlay(BuildContext context) {
    if (_overlayEntry == null) {
      OverlayState overlayState = Overlay.of(context);
      _overlayEntry = OverlayEntry(
        builder: (context) => const Material(
          color: Colors.transparent,
          child: Center(
            child: LoadingOverlay(),
          ),
        ),
      );
      overlayState.insert(_overlayEntry!);
    }
  }

  void hideLoadingOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
