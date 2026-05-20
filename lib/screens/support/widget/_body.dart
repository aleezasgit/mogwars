part of '../support.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Scaffold(
      appBar: CustomAppBar(title: 'Support'),
      extendBodyBehindAppBar: true,
      body: Padding(
        padding:Space.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //do i have to add space, alreday did padding, icon color and contact tile icon
           Space.yf(16),
        
            _SupportTile(
              iconPath: 'assets/svgs/sms.svg',
              iconBgColor: AppTheme.c.background.shade200!,
              title: 'Email Address',
              subtitle: 'info@gmail.com',
              onTap: () {},
            ),
            Space.yf(6),
            _SupportTile(
              iconPath: 'assets/svgs/sms.svg',
              iconBgColor: AppTheme.c.background.shade200!,
              title: 'Phone number',
              subtitle: '00-123-456-789',
              onTap: () {},
            ),
            Space.yf(6),
            _SupportTile(
              iconPath: 'assets/svgs/global.svg',
              iconBgColor: AppTheme.c.background.shade200!,
              title: 'Website',
              subtitle: 'assets/svgs/global.svg',
              onTap: () {},
            ),
            Space.yf(6),
               _SupportTile(
              iconPath: 'assets/svgs/sms.svg',
              iconBgColor: AppTheme.c.background.shade200!,
              title: 'Contact',
              subtitle: 'info@gmail.com',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Support Tile
// ─────────────────────────────────────────────────────────────────────────────

class _SupportTile extends StatelessWidget {
  final String iconPath;
  final Color iconBgColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _SupportTile({
    required this.iconPath,
    required this.iconBgColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: Space.all(16),
        decoration: BoxDecoration(
          color: AppTheme.c.background.shade100,
          borderRadius: BorderRadius.circular(24.r),
       
        ),
        child: Row(
          children: [
            Container(
             // padding: Space.all(8),
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: iconBgColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  iconPath,
                  width: 20.w,
                  height: 20.h,
               
                ),
              ),
            ),
            Space.xf(12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppText.b1b),
                Space.yf(2),
                Text(
                  subtitle,
                  style: AppText.b1?.w(4).cl(AppTheme.c.text.main!),
                ),
              ],
            ),
            Spacer(),
               SvgPicture.asset(
                 'assets/svgs/Arrow Right.svg',
                 width: 18.w,
                 height: 18.h,
               ),
          ],

       
        ),
      ),
    );
  }
}