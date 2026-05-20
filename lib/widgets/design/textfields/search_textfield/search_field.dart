import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:mogwars/configs/configs.dart';


part 'enums.dart';

class SearchField extends StatefulWidget {
  final String name;
  final TextEditingController? controller;
  final String? hint;
  final bool? enabled;
  final bool readOnly;
  final Widget? suffixIcon;
  final String? initialValue;
  final TextInputType? textInputType;
  final String? errorText;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputformatters;
  final SearchFieldType type;
  final VoidCallback? onTapAdd;
  final Color? textColor;
  final Color? fillColor;
  final Color? iconColor;
  final double? borderRadius;
  final Color? borderColor;
  final bool hasShadow;

  const SearchField({
    super.key,
    this.controller,
    this.enabled,
    this.initialValue,
    this.suffixIcon,
    required this.name,
    this.hint,
    this.readOnly = false,
    this.textInputType,
    this.inputformatters,
    this.errorText,
    this.validator,
    this.type = SearchFieldType.primary,
    this.onTapAdd,
    this.textColor,
    this.fillColor,
    this.iconColor,
    this.borderRadius,
    this.borderColor,
    this.hasShadow = false,
  });

  @override
  SearchFieldState createState() => SearchFieldState();
}

class SearchFieldState extends State<SearchField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    ScreenUtil.init(context, designSize: const Size(375, 812));

    final textColor = widget.textColor ?? AppTheme.c.text.main!;

    return IgnorePointer(
      ignoring: widget.enabled == false || widget.readOnly,
      child: Container(
        height: 52.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 16.r),
          border: _focusNode.hasFocus
              ? GradientBoxBorder(
                  gradient: LinearGradient(
                    colors: [
                      Color.lerp(
                        AppTheme.c.primaryGradient.startColor.withValues(
                          alpha: 0.8,
                        ),
                        AppTheme.c.primaryGradient.endColor,
                        0.5,
                      )!,
                      AppTheme.c.primaryGradient.endColor,
                    ],
                    stops: [0, 0.3],
                  ),
                  width: 1.w,
                )
              : null,
          boxShadow: _focusNode.hasFocus
              ? [
                  BoxShadow(
                    color: const Color(0x305988F4),
                    blurRadius: 1,
                    spreadRadius: 3,
                    offset: const Offset(0, 0),
                  ),
                  BoxShadow(
                    color: const Color(0x8F8E43EF),
                    blurRadius: 20.7,
                    offset: const Offset(0, 0),
                  ),
                ]
              : [],
        ),
        child: FormBuilderTextField(
          controller: widget.controller,
          inputFormatters: widget.inputformatters,
          focusNode: _focusNode,
          style: AppText.l1!.copyWith(color: AppTheme.c.text.shade800),
          cursorColor: textColor,
          enabled: widget.enabled ?? true,
          initialValue: widget.initialValue,
          name: widget.name,
          keyboardType: widget.textInputType,
          readOnly: widget.readOnly,
          onTapOutside: (_) {
            _focusNode.unfocus();
          },
          decoration: InputDecoration(
            errorText: widget.errorText,
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 16.w, right: 4.w),
              child:
                  widget.suffixIcon ??
                  SvgPicture.asset(
                    'assets/svgs/search-normal.svg',
                    width: 16.w,
                    height: 16.h,
                  ),
            ),
            suffixIconConstraints: BoxConstraints(
              minWidth: 16.w,
              minHeight: 16.h,
            ),
            prefixIconConstraints: BoxConstraints(
              minWidth: 16.w,
              minHeight: 16.h,
            ),
            filled: true,
            fillColor: widget.fillColor ?? AppTheme.c.background.main,

            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 17.h,
            ),
            hintText: widget.hint ?? 'Search',
            hintStyle: AppText.l1!.cl(textColor),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 16.r),
              borderSide: BorderSide(
                width: 1.w,
                color: widget.borderColor ?? AppTheme.c.lightGrey.main!,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 16.r),
              borderSide: BorderSide(
                width: 0.w,
                color: widget.borderColor ?? Colors.transparent,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 16.r),
              borderSide: BorderSide(
                color: Colors.red.withAlpha(200),
                width: AppDimensions.normalize(0.5),
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.r),
              borderSide: BorderSide(
                color: Colors.red.withAlpha(200),
                width: AppDimensions.normalize(0.5),
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.r),
              borderSide: BorderSide(
                width: AppDimensions.normalize(0.75),
                color: AppTheme.c.white!,
              ),
            ),
          ),
          validator: widget.validator,
        ),
      ),
    );
  }
}
