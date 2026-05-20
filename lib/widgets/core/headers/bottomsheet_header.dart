import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mogwars/configs/configs.dart';
import 'package:mogwars/statics/app_statics.dart';


class BottomsheetHeader extends StatelessWidget {
  final String? title;
  final bool hasBackAction;
  final VoidCallback? onBackPressed;
  const BottomsheetHeader({
    super.key,
    this.title,
    this.hasBackAction = true,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Row(
      mainAxisAlignment: hasBackAction
          ? MainAxisAlignment.start
          : MainAxisAlignment.spaceBetween,
      children: [
        if (hasBackAction) ...[
          GestureDetector(
            onTap: onBackPressed ?? () => Navigator.pop(context),
            child: SvgPicture.asset(
              AppStaticData.backArrow,
              width: 20.w,
              height: 20.h,
            ),
          ),
          Space.xf(10),
        ],
        if (title != null)
          Text(title!, style: AppText.h6bm!.copyWith(height: 1.0)),
      ],
    );
  }
}
