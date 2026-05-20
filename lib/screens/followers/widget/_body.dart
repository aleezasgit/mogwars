part of '../followers.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final state = context.watch<_ScreenState>();

    return Scaffold(
      backgroundColor: AppTheme.c.background.main,
      appBar: AppBar(
        backgroundColor: AppTheme.c.background.main,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: SvgPicture.asset(
            AppStaticData.backArrow,
            width: 20.w,
            height: 20.w,
            fit: BoxFit.scaleDown,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Followers',
          style: AppText.h6b!.cl(AppTheme.c.text.shade100!),
        ),
      ),
      body: Padding(
        padding: Space.hf(24),
        child: Column(
          children: [
            Space.yf(12),

            // ── Search field ─────────────────────────────────────────
            AppTextField(
              name: 'follower_search',
              hint: 'Search by name or username',
              type: TextFieldType.primary,
              prefixIcon: Padding(
                padding: Space.hf(12),
                child: SvgPicture.asset(
                  "sjhdg",
                  width: 16.w,
                  height: 16.w,
                  colorFilter: ColorFilter.mode(
                    AppTheme.c.text.main!,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              onChanged: state.onSearch,
            ),

            Space.yf(16),

            // ── Follower list ────────────────────────────────────────
            Expanded(
              child: ListView.separated(
                itemCount: state.followers.length,
                separatorBuilder: (_, __) => Space.yf(16),
                itemBuilder: (context, index) {
                  final follower = state.followers[index];
                  return FollowerTile(
                    follower: follower,
                    onFollowBack: () {},
                  );
                },
              ),
            ),

            Space.yf(16),
          ],
        ),
      ),
    );
  }
}





class FollowerTile extends StatelessWidget {
  final _Follower follower;
  final VoidCallback onFollowBack;

  const FollowerTile({
    super.key,
    required this.follower,
    required this.onFollowBack,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Row(
      children: [
        // ── Avatar with optional story ring + unseen badge ───────────
        Stack(
          clipBehavior: Clip.none,
          children: [
            // Story ring border
            Container(
              width: 52.w,
              height: 52.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: follower.hasStory
                    ? Border.all(
                        color: AppTheme.c.primary.main!,
                        width: 2.w,
                      )
                    : Border.all(
                        color: Colors.transparent,
                        width: 2.w,
                      ),
              ),
              padding: EdgeInsets.all(2.w),
              child: ClipOval(
                child: Image.asset(
                  follower.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Unseen badge (❌ SVG in container, bottom-left)
            if (follower.hasUnseenBadge)
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  width: 18.w,
                  height: 18.w,
                  decoration: BoxDecoration(
                    color: AppTheme.c.background.shade100,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppTheme.c.background.main!,
                      width: 1.5.w,
                    ),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      AppStaticData.cross,
                      width: 10.w,
                      height: 10.w,
                      colorFilter: ColorFilter.mode(
                        AppTheme.c.accent.red!,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),

        Space.xf(12),

        // ── Name + username ──────────────────────────────────────────
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                follower.name,
                style: AppText.b1b!.cl(AppTheme.c.text.shade100!),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Space.yf(2),
              Text(
                follower.username,
                style: AppText.l1!.cl(AppTheme.c.text.main!),
              ),
            ],
          ),
        ),

        Space.xf(12),

        // ── Follow Back button ───────────────────────────────────────
        GestureDetector(
          onTap: onFollowBack,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: AppTheme.c.primary.main,
              borderRadius: BorderRadius.circular(100.r),
            ),
            child: Text(
              'Follow Back',
              style: AppText.l1b!.cl(AppTheme.c.white!),
            ),
          ),
        ),
      ],
    );
  }
}