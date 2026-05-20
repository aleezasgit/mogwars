import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBackground extends StatelessWidget {
  final Widget child;
  final String? backgroundImage;
  final double? horizontalPadding;
  final double? verticalPadding;
  final bool includeTopPadding;
  final bool includeBottomPadding;

  const AppBackground({
    super.key,
    required this.child,
    this.horizontalPadding,
    this.verticalPadding,
    this.includeTopPadding = false, // default: false
    this.includeBottomPadding = true,
    this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    final mediaPadding = MediaQuery.of(context).padding;

    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            backgroundImage ?? 'assets/pngs/onBoarding_bg.png',
            fit: BoxFit.cover,
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(minHeight: 0.8.sh),
          child: Padding(
            padding: EdgeInsetsGeometry.only(
              left: horizontalPadding ?? 24.w,
              right: horizontalPadding ?? 24.w,
              top: includeTopPadding ? mediaPadding.top : 0,
            ),
            child: child,
          ),
        ),
      ],
    );
  }
}
