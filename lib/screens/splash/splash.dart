import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mogwars/configs/configs.dart';
import 'package:mogwars/router/routes.dart';
import 'package:mogwars/statics/app_statics.dart';


part 'widgets/_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return _Body();
  }
}
