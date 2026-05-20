import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mogwars/configs/configs.dart';


class CircleIcon extends StatelessWidget {
  final String iconPath;
  final double? size;
  final double? iconSize;

  const CircleIcon({
    super.key,
    required this.iconPath,
    this.size,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 50.w,
      height: size ?? 50.h,
      decoration: BoxDecoration(
        gradient: UIProps.primaryGradient,
        shape: BoxShape.circle,
      ),
      alignment: AlignmentGeometry.center,
      child: SvgPicture.asset(
        iconPath,
        width: iconSize ?? 24.w,
        height: iconSize ?? 24.h,
      ),
    );
  }
}
