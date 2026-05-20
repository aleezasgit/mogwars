import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mogwars/configs/configs.dart';


enum HeadingType { string, richText }

class AppHeadings extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? subtitleWidget;
  final HeadingType type;
  final TextStyle? subtitleStyle;
  final bool isCentered;
  final double? titleFontSize;
  final Color? textColor;
  final double? spacingBetweenTitleAndSubtitle;
  const AppHeadings({
    super.key,
    required this.title,
    this.subtitle,
    this.type = HeadingType.string,
    this.subtitleStyle,
    this.subtitleWidget,
    this.isCentered = true,
    this.titleFontSize,
    this.textColor,
    this.spacingBetweenTitleAndSubtitle,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Column(
      crossAxisAlignment: isCentered
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppText.h5bm!
              .s(titleFontSize ?? 20.sp)
              .cl(textColor ?? AppTheme.c.text.shade100!)
              .copyWith(letterSpacing: 0),
          textAlign: isCentered ? TextAlign.center : TextAlign.start,
        ),
        Space.yf(spacingBetweenTitleAndSubtitle ?? 8),
        if (type == HeadingType.richText && subtitle == null) ...[
          subtitleWidget ?? const SizedBox.shrink(),
        ],
        if (type == HeadingType.string && subtitle != null) ...[
          Text(
            subtitle!,
            style:
                subtitleStyle ??
                AppText.b1!.cl(textColor ?? AppTheme.c.text.main!),
            textAlign: isCentered ? TextAlign.center : TextAlign.start,
          ),
        ],
      ],
    );
  }
}
