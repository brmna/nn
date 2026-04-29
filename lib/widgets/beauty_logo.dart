import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';

class BeautyLogo extends StatelessWidget {
  final String subtitle;

  const BeautyLogo({
    super.key,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);
    return Column(
      children: [
        Container(
          width: r.logoSize,
          height: r.logoSize,
          decoration: const BoxDecoration(
            color: AppTheme.black,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.auto_awesome,
            color: AppTheme.white,
            size: r.logoSize * 0.5,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Beauty App',
          style: TextStyle(
            fontSize: r.appNameSize,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic,
            color: AppTheme.textDark,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: r.isMobile ? 13 : 15,
            color: AppTheme.subtitleGrey,
          ),
        ),
      ],
    );
  }
}
