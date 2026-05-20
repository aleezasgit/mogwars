part of '../faq.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final state = context.watch<_ScreenState>();

    return Scaffold(
      appBar: CustomAppBar(title: 'FAQs'),
    //  extendBodyBehindAppBar: true,
    
      body: SingleChildScrollView(
        child: Padding(
          padding: Space.all(16),
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Space.yf(28),
                
              // ─── FAQ Cards ───────────────────────────────────────
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _faqs.length,
                separatorBuilder: (_, __) => Space.yf(6),
                itemBuilder: (context, index) {
                  return _FaqCard(
                    question: _faqs[index]['question']!,
                    answer: _faqs[index]['answer']!,
                    isExpanded: state.expandedIndices.contains(index),
                    onTap: () => state.onTileToggled(index),
                  );
                },
              ),
                
              Space.yf(32),
            ],
          ),
        ),
      ),
    );
  }
}

class _FaqCard extends StatelessWidget {
  final String question;
  final String answer;
  final bool isExpanded;
  final VoidCallback onTap;

  const _FaqCard({
    required this.question,
    required this.answer,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: UIProps.duration,
        curve: Curves.easeInOut,
        width: double.infinity,
        padding: Space.all(12),
        decoration: BoxDecoration(
          color: AppTheme.c.lightGrey.shade100,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─── Question row ─────────────────────────────────────
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(question, style: AppText.b1b?.w(7)),
                ),
                Space.xf(22),
                AnimatedRotation(
                  turns: isExpanded ? 0.0 : 0.25,
                  duration: UIProps.duration,
                  curve: Curves.easeInOut,
                  child: SvgPicture.asset(
                    AppStaticData.upwardArrow,
                    height: 18.h,
                    width: 18.w,
                  ),
                ),
              ],
            ),

        Space.yf(12),

            // ─── Answer (animated expand) ─────────────────────────
            AnimatedCrossFade(
              firstChild: const SizedBox.shrink(),
              secondChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                      Container(
              width: double.infinity,
              height: 1.h,
              color: AppTheme.c.lightGrey.main,
            ),
                  Space.yf(8),
                  Text(
                    answer,
                    style: AppText.b1?.w(4).cl(AppTheme.c.text.main!),
                  ),
                ],
              ),
              crossFadeState: isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: UIProps.duration,
              sizeCurve: Curves.easeInOut,
            ),
          ],
        ),
      ),
    );
  }
}