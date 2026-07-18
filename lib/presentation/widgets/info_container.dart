import 'package:fluent_ui/fluent_ui.dart';

class InfoContainer extends StatelessWidget {
  final Widget? child;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  const InfoContainer({
    super.key,
    this.child,
    this.backgroundColor,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[50]),
        color: backgroundColor ?? Colors.transparent,
        borderRadius: BorderRadiusGeometry.circular(6),
      ),
      child: child,
    );
  }
}
