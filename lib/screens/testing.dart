import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mogwars/configs/configs.dart';
import 'package:mogwars/widgets/app_background.dart';
import 'package:mogwars/widgets/core/app_bar/app_bar.dart';
import 'package:mogwars/widgets/design/buttons/app_button/app_button.dart';
import 'package:mogwars/widgets/design/textfields/app_textfield/app_textfield.dart';
import 'package:mogwars/widgets/prefix_icon.dart';


class TestValidationScreen extends StatefulWidget {
  const TestValidationScreen({super.key});

  @override
  State<TestValidationScreen> createState() => _TestValidationScreenState();
}

class _TestValidationScreenState extends State<TestValidationScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: AppBackground(
        horizontalPadding: 16.w,
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              Space.yf(24),

              // ── 1. Via validator (form-driven) ──────────────────────────
              AppTextField(
                name: 'email',
                hint: 'Enter email',
                type: TextFieldType.withIcon,
                textInputType: TextInputType.emailAddress,
                prefixIcon: PrefixIcon(iconPath: 'assets/svgs/sms.svg'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                  if (!value.contains('@')) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),

              Space.yf(12),

              // ── 2. Via errorText (manual/static) ────────────────────────
              AppTextField(
                name: 'username',
                hint: 'Enter username',
                type: TextFieldType.withIcon,
                prefixIcon: PrefixIcon(iconPath: 'assets/svgs/user.svg'),
                errorText: 'This username is already taken', // always shown
              ),

              Space.yf(24),

              AppButton(
                label: 'Validate',
                onPressed: () {
                  // Triggers all validators and shows error text under fields
                  _formKey.currentState?.validate();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
