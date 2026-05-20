import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mogwars/configs/configs.dart';


enum ReferralFieldState { idle, success, error }

class ReferralTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? hint;
  final ReferralFieldState fieldState;
  final void Function(String)? onChanged;

  const ReferralTextField({
    super.key,
    required this.controller,
    this.hint = 'Paste code or link here',
    this.fieldState = ReferralFieldState.idle,
    this.onChanged,
  });

  @override
  State<ReferralTextField> createState() => _ReferralTextFieldState();
}

class _ReferralTextFieldState extends State<ReferralTextField> {
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

  Color get _borderColor {
    switch (widget.fieldState) {
      case ReferralFieldState.success:
        return const Color(0xFF4CAF50);
      case ReferralFieldState.error:
        return AppTheme.c.error.main!;
      case ReferralFieldState.idle:
        return _focusNode.hasFocus
            ? AppTheme.c.primary.shade300!
            : AppTheme.c.lightGrey.main!;
    }
  }

  double get _borderWidth {
    switch (widget.fieldState) {
      case ReferralFieldState.success:
      case ReferralFieldState.error:
        return 1.w;
      case ReferralFieldState.idle:
        return _focusNode.hasFocus ? 1.w : 0.5.w;
    }
  }

  List<BoxShadow> get _boxShadow {
    switch (widget.fieldState) {
      case ReferralFieldState.error:
        return [
          BoxShadow(
            color: const Color(0x26DF1C41),
            blurRadius: 1,
            spreadRadius: 3,
          ),
        ];
      case ReferralFieldState.success:
        return [
          BoxShadow(
            color: const Color(0x264CAF50),
            blurRadius: 1,
            spreadRadius: 3,
          ),
        ];
      case ReferralFieldState.idle:
        return _focusNode.hasFocus
            ? [
                BoxShadow(
                  color: const Color(0xFF2E2423),
                  blurRadius: 1,
                  spreadRadius: 3,
                ),
              ]
            : [];
    }
  }

  Widget? get _suffixIcon {
    switch (widget.fieldState) {
      case ReferralFieldState.success:
        return Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: SvgPicture.asset(
            'assets/svgs/tick.svg',
            width: 16.w,
            height: 16.h,
          ),
        );
      case ReferralFieldState.error:
        return Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: SvgPicture.asset(
            'assets/svgs/cross.svg',
            width: 16.w,
            height: 16.h,
          ),
        );
      case ReferralFieldState.idle:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);

    final Color textColor = AppTheme.c.text.shade100!;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: _boxShadow,
      ),
      child: TextField(
        controller: widget.controller,
        focusNode: _focusNode,
        style: AppText.b1!.cl(textColor),
        cursorColor: AppTheme.c.primary.main!,
        onChanged: widget.onChanged,
        onTapOutside: (_) => FocusScope.of(context).unfocus(),
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: AppText.b1!.cl(AppTheme.c.text.shade800!),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: SvgPicture.asset(
              'assets/svgs/link2.svg',
              width: 16.w,
              height: 16.h,
              colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn),
            ),
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth: 40.w,
            minHeight: 16.h,
          ),
          suffixIcon: _suffixIcon,
          suffixIconConstraints: BoxConstraints(
            minWidth: 44.w,
            minHeight: 20.h,
          ),
          filled: true,
          fillColor: AppTheme.c.background.shade100,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: _borderColor, width: _borderWidth),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: _borderColor, width: _borderWidth),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: _borderColor, width: _borderWidth),
          ),
        ),
      ),
    );
  }
}
