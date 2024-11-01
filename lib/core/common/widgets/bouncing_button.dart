import '../../src/app_export.dart';

class BouncingButton extends StatefulWidget {
  final double? height;
  final double? width;
  final Color? color;
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final Function onPress;
  final bool applyShadow;

  const BouncingButton({
    super.key,
    this.height,
    this.width,
    this.color,
    required this.child,
    this.margin,
    required this.onPress,
    this.applyShadow = false,
  });

  @override
  State<BouncingButton> createState() => _BouncingButtonState();
}

class _BouncingButtonState extends State<BouncingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _scale = Tween<double>(begin: 1.0, end: 0.9)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _controller
          .forward()
          .then(
            (value) => _controller.reverse(),
          )
          .then(
            (value) => Future.delayed(
              const Duration(milliseconds: 100),
            ).then(
              (value) => widget.onPress(),
            ),
          ),
      child: ScaleTransition(
        scale: _scale,
        child: Container(
          margin: widget.margin,
          height: widget.height ?? 0.057.sh,
          width: widget.width ?? double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: widget.color ?? AppLightColors.primary,
            boxShadow: widget.applyShadow
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10.0,
                      offset: const Offset(0.0, 7.0),
                    ),
                  ]
                : null,
          ),
          child: Center(
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
