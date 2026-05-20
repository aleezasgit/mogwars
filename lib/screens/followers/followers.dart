import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mogwars/configs/configs.dart';
import 'package:mogwars/statics/app_statics.dart';
import 'package:mogwars/widgets/design/textfields/app_textfield/app_textfield.dart';
import 'package:provider/provider.dart';


part 'widget/_body.dart';

part '_state.dart';
part 'data.dart';

class FollowersScreen extends StatelessWidget {
  const FollowersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}