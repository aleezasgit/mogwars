import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mogwars/configs/configs.dart';


class AppCheckbox extends StatefulWidget {
  final String name;
  final Widget label;
  final bool initialValue;
  final bool? moveToTop;

  const AppCheckbox({
    super.key,
    required this.name,
    required this.label,
    this.initialValue = false,
    this.moveToTop = false,
  });

  @override
  State<AppCheckbox> createState() => _AppCheckboxState();
}

class _AppCheckboxState extends State<AppCheckbox> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return FormBuilderField<bool>(
      name: widget.name,
      initialValue: isChecked,
      builder: (FormFieldState<bool> field) {
        return InkWell(
          onTap: () => _toggle(field),
          borderRadius: BorderRadius.circular(6.r),
          child: Row(
            crossAxisAlignment: widget.moveToTop == true
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              _SquareCheckboxIcon(isChecked: isChecked),
              Space.xf(12),
              Expanded(child: widget.label),
            ],
          ),
        );
      },
    );
  }

  void _toggle(FormFieldState<bool> field) {
    setState(() => isChecked = !isChecked);
    field.didChange(isChecked);
  }
}

class _SquareCheckboxIcon extends StatelessWidget {
  final bool isChecked;

  const _SquareCheckboxIcon({required this.isChecked});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 150),
      child: SvgPicture.asset(
        isChecked
            ? 'assets/svgs/checkbox_s.svg'
            : 'assets/svgs/checkbox_us.svg',
        key: ValueKey(isChecked),
        height: 20.h,
        width: 20.w,
        fit: BoxFit.contain,
      ),
    );
  }
}
