import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mogwars/configs/configs.dart';
import 'package:mogwars/statics/app_statics.dart';
import 'package:mogwars/widgets/app_background.dart';
import 'package:mogwars/widgets/core/app_bar/app_bar.dart';
import 'package:provider/provider.dart';


part 'widget/_body.dart';
part '_state.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}