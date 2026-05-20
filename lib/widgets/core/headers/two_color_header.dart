import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mogwars/configs/configs.dart';


enum HighlightPosition { first, second }

class TwoColorHeading extends StatelessWidget {
  final String firstText;
  final String secondText;
  final HighlightPosition highlightPosition;
  final String? subtitle;
  final Widget? subtitleWidget;
  final bool isCentered;
  final double? titleFontSize;
  final Color? highlightColor;
  final Color? defaultColor;
  final double? spacingBetweenTitleAndSubtitle;

  const TwoColorHeading({
    super.key,
    required this.firstText,
    required this.secondText,
    this.highlightPosition = HighlightPosition.second,
    this.subtitle,
    this.subtitleWidget,
    this.isCentered = true,
    this.titleFontSize,
    this.highlightColor,
    this.defaultColor,
    this.spacingBetweenTitleAndSubtitle,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);

    final baseStyle = AppText.h5bm!
        .s(titleFontSize ?? 20.sp)
        .copyWith(letterSpacing: 0);

    final Color primary = highlightColor ?? AppTheme.c.primary.main!;
    final Color normal = defaultColor ?? AppTheme.c.text.shade100!;

    final Color firstColor = highlightPosition == HighlightPosition.first
        ? primary
        : normal;
    final Color secondColor = highlightPosition == HighlightPosition.second
        ? primary
        : normal;

    return Column(
      crossAxisAlignment: isCentered
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: isCentered ? TextAlign.center : TextAlign.start,
          text: TextSpan(
            style: baseStyle,
            children: [
              TextSpan(
                text: firstText,
                style: baseStyle.copyWith(color: firstColor),
              ),
              TextSpan(
                text: ' $secondText',
                style: baseStyle.copyWith(color: secondColor),
              ),
            ],
          ),
        ),
        Space.yf(spacingBetweenTitleAndSubtitle ?? 8),
        if (subtitle != null)
          Text(
            subtitle!,
            style: AppText.b1!.cl(AppTheme.c.text.main!),
            textAlign: isCentered ? TextAlign.center : TextAlign.start,
          ),
        ?subtitleWidget,
      ],
    );
  }
}
