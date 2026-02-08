import 'package:flutter/widgets.dart';
import 'package:test_flutter_bnj/core/constants/breakpoints.dart';

class PageContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double? maxWidth;

  const PageContainer({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 0),
    this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    double contentWidth = screenWidth >= Breakpoints.desktop
        ? screenWidth * 0.75
        : screenWidth >= Breakpoints.mobile
            ? screenWidth * 0.9
            : screenWidth;

    if (maxWidth != null) {
      contentWidth = contentWidth.clamp(0, maxWidth!);
    }

    return Padding(
      padding: padding,
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: contentWidth,
          child: child,
        ),
      ),
    );
  }
}
