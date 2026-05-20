part of '../splash.dart';

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  void _navigateToOnBoarding() {
    AppRoutes.onboarding.pushReplace(context);
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    _controller.forward();

    Future.delayed(const Duration(milliseconds: 5000), _navigateToOnBoarding);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.c.background.main,
      extendBody: false,
      body: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          bottom: MediaQuery.of(context).padding.bottom + 23.h,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/pngs/Splash_BG.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Space.ym!,
            ScaleTransition(
              scale: _scaleAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppStaticData.textLogo,
                    height: 43.h,
                    width: 170.w,
                  ),
                  Space.yf(28),
                  SvgPicture.asset(
                    AppStaticData.splashLogo,
                    width: 29.w,
                    height: 24.h,
                  ),
                ],
              ),
            ),
            Space.ym!,
            SizedBox(width: double.infinity),
          ],
        ),
      ),
    );
  }
}
