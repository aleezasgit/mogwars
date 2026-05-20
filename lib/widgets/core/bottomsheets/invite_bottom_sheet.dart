import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mogwars/configs/configs.dart';
import 'package:mogwars/statics/app_statics.dart';
import 'package:mogwars/widgets/core/headers/bottomsheet_header.dart';
import 'package:mogwars/widgets/design/buttons/app_button/app_button.dart';
import 'package:mogwars/widgets/design/textfields/referral_textfield.dart';

// ─────────────────────────────────────────────────────────────────────────────
// InviteBottomSheet
// ─────────────────────────────────────────────────────────────────────────────

class InviteBottomSheet extends StatefulWidget {
  /// Optional real API handler. When null the mock flow is used:
  ///   attempt 1 → fail, attempt 2+ → success.
  final Future<bool> Function(String code)? onApply;

  /// Called after the success result sheet's "Continue to Sign Up" is tapped.
  final VoidCallback? onContinue;

  final BuildContext parentContext;

  const InviteBottomSheet({
    super.key,
    required this.parentContext,
    this.onApply,
    this.onContinue,
  });

  static void show(
    BuildContext context, {
    Future<bool> Function(String code)? onApply,
    VoidCallback? onContinue,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => InviteBottomSheet(
        parentContext: context, // stable context from the caller
        onApply: onApply,
        onContinue: onContinue,
      ),
    );
  }

  @override
  State<InviteBottomSheet> createState() => _InviteBottomSheetState();
}

class _InviteBottomSheetState extends State<InviteBottomSheet> {
  final TextEditingController _controller = TextEditingController();
  // Tracks mock attempts across re-opens:
  // attempt 1 → fail, attempt 2+ → success
  static int _mockAttempt = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleApply() {
    final code = _controller.text.trim();
    if (code.isEmpty) return;

    // Mock: attempt 1 -> fail, attempt 2+ -> success
    // Replace with: final success = await myApi.validate(code);
    _mockAttempt++;
    final success = widget.onApply != null ? true : _mockAttempt > 1;

    final parentCtx = widget.parentContext;
    final onContinue = widget.onContinue;
    Navigator.of(context).pop();

    Future.delayed(const Duration(milliseconds: 300), () {
      ReferralResultBottomSheet.show(
        parentCtx,
        code: code,
        isSuccess: success,
        onContinue: onContinue,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        margin: Space.all(
          10,
        ).copyWith(bottom: MediaQuery.of(context).padding.bottom + 10.h),
        decoration: BoxDecoration(
          color: AppTheme.c.background.shade100,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: AppTheme.c.lightGrey.main!, width: 1.w),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: Space.hf(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      margin: Space.only(top: 8),
                      width: 48.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                        color: AppTheme.c.white,
                        borderRadius: BorderRadius.circular(32.r),
                      ),
                    ),
                  ),
                  Space.yf(16),
                  BottomsheetHeader(
                    title: 'Do you have an Invite Code or Link?',
                  ),
                  Space.yf(16),
                  Text(
                    "Enter your referral code or link to unlock free rewards after account verification.",
                    textAlign: TextAlign.center,
                    style: AppText.b1?.cl(AppTheme.c.text.main!),
                  ),
                  Space.yf(24),
                  Text('Referral Code or Link', style: AppText.h6bm),
                  Space.yf(8),
                  ReferralTextField(
                    controller: _controller,
                    fieldState: ReferralFieldState.idle,
                    onChanged: (_) => setState(() {}),
                  ),
                  Space.yf(16),
                  const _LootBoxInfo(),
                  Space.yf(24),
                ],
              ),
            ),
            Padding(
              padding: Space.hf(8),
              child: AppButton(
                label: "Apply",
                onPressed: () {
                  if (_controller.text.trim().isEmpty) {
                    return;
                  }
                  _handleApply();
                },
                buttonType: ButtonType.primary,
              ),
            ),
            Space.yf(16),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Shared loot-box info banner
// ─────────────────────────────────────────────────────────────────────────────

class _LootBoxInfo extends StatelessWidget {
  final String text;

  const _LootBoxInfo({
    this.text = "You and your friend will both receive a free loot box.",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Space.all(16),
      decoration: BoxDecoration(
        color: AppTheme.c.background.shade200,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          SvgPicture.asset('assets/svgs/Gift.svg', width: 24.w, height: 24.h),
          Space.xf(12),
          Expanded(
            child: Text(text, style: AppText.b1!.cl(AppTheme.c.text.main!)),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// ReferralResultBottomSheet  (success & error states)
// ─────────────────────────────────────────────────────────────────────────────

class ReferralResultBottomSheet extends StatelessWidget {
  final String code;
  final bool isSuccess;
  final VoidCallback? onContinue;
  final BuildContext parentContext;

  const ReferralResultBottomSheet({
    super.key,
    required this.code,
    required this.isSuccess,
    required this.parentContext,
    this.onContinue,
  });

  static void show(
    BuildContext context, {
    required String code,
    required bool isSuccess,
    VoidCallback? onContinue,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => ReferralResultBottomSheet(
        code: code,
        isSuccess: isSuccess,
        parentContext: context,
        onContinue: onContinue,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);

    final String statusTitle = isSuccess
        ? 'Applied Successfully !'
        : 'Ooops ! Try Again.';
    final String lootText = isSuccess
        ? "You and your friend will both receive a free loot box."
        : "You and your friend will both receive a free loot box, after sign up.";
    final String buttonLabel = isSuccess
        ? 'Continue to Sign Up'
        : 'Go Back to Sign Up';

    return Container(
      margin: Space.all(
        10,
      ).copyWith(bottom: MediaQuery.of(context).padding.bottom + 10.h),
      decoration: BoxDecoration(
        color: AppTheme.c.background.shade100,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppTheme.c.lightGrey.main!, width: 1.w),
      ),
      padding: Space.hf(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: Space.only(top: 8),
            width: 48.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: AppTheme.c.white,
              borderRadius: BorderRadius.circular(32.r),
            ),
          ),
          Space.yf(16),
          Align(
            alignment: Alignment.centerLeft,
            child: BottomsheetHeader(
              onBackPressed: () {
                Navigator.of(context).pop();
                Future.delayed(const Duration(milliseconds: 300), () {
                  InviteBottomSheet.show(parentContext, onContinue: onContinue);
                });
              },
            ),
          ),
          Space.yf(16),
          Center(
            child: Image.asset(
              isSuccess ? 'assets/pngs/tick.png' : 'assets/pngs/cross.png',
              width: 92.r,
              height: 92.r,
            ),
          ),
          Space.yf(16),
          Text(
            statusTitle,
            style: AppText.h6bm?.cl(AppTheme.c.text.shade100!),
            textAlign: TextAlign.center,
          ),
          Space.yf(16),
          ReferralTextField(
            controller: TextEditingController(text: code),
            fieldState: isSuccess
                ? ReferralFieldState.success
                : ReferralFieldState.error,
          ),
          Space.yf(24),
          _LootBoxInfo(text: lootText),
          Space.yf(16),
          AppButton(
            label: buttonLabel,
            onPressed: () {
              // Pop this sheet first using its own context
              Navigator.of(context).pop();

              // Then act on the stable parentContext after a short delay
              Future.delayed(const Duration(milliseconds: 400), () {
                if (isSuccess) {
                  // TODO: swap with your real navigation
                  // e.g. Navigator.pushNamed(parentContext, '/signup')
                  onContinue?.call();
                } else {
                  // Re-open invite sheet; mock succeeds on next attempt
                  InviteBottomSheet.show(parentContext, onContinue: onContinue);
                }
              });
            },
            buttonType: ButtonType.outlinedWithIconRight,
            iconPath: AppStaticData.arrowRight,
          ),
          Space.yf(16),
        ],
      ),
    );
  }
}
