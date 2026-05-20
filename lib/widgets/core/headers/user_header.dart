import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mogwars/configs/configs.dart';


class UserHeader extends StatelessWidget {
  final VoidCallback? onTapNotifications;
  final VoidCallback? onTapFeatured;
  final bool hasHorizontalPadding;
  const UserHeader({
    super.key,
    this.onTapNotifications,
    this.onTapFeatured,
    this.hasHorizontalPadding = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: hasHorizontalPadding ? Space.hf(24) : Space.hf(0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 43.w,
                height: 43.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/pngs/pp.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Space.xf(12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome Back,', style: AppText.l1),
                  Text('Corey Anderson', style: AppText.h5b),
                ],
              ),

              Space.xm!,
              _buildCircleAvatar(
                'assets/svgs/star.svg',
                onTapFeatured ??
                    () {
                      // AppRoutes.notification.push(context);
                    },
              ),

              Space.xf(8.5),
              _buildCircleAvatar(
                'assets/svgs/notification-bing.svg',
                onTapNotifications ??
                    () {
                      // AppRoutes.notification.push(context);
                    },
              ),
            ],
          ),
          Space.yf(16),
          // AppDivider(dividerColor: AppTheme.c.background.main),
        ],
      ),
    );
  }

  Widget _buildCircleAvatar(
    String assetPath,
    VoidCallback onTap, {
    double? iconSize,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: 43.w,
        height: 43.h,
        decoration: BoxDecoration(
          color: AppTheme.c.background.main,
          shape: BoxShape.circle,
          border: Border.all(color: AppTheme.c.lightGrey.main!, width: 1.w),
        ),
        alignment: AlignmentDirectional.center,
        child: SvgPicture.asset(
          assetPath,
          width: iconSize ?? 24.w,
          height: iconSize ?? 24.h,
        ),
      ),
    );
  }
}
