import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';

class UserTypeSelector extends StatelessWidget {
  final bool isProfessional;
  final ValueChanged<bool> onChanged;

  const UserTypeSelector({
    super.key,
    required this.isProfessional,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);

    return Container(
      height: r.isMobile ? 40 : 44,
      decoration: BoxDecoration(
        color: AppTheme.lightGrey,
        borderRadius: BorderRadius.circular(50), // 
      ),
      padding: const EdgeInsets.all(4),
      child: Stack(
        children: [
          AnimatedAlign(
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeOutCubic,
            alignment: isProfessional
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: FractionallySizedBox(
              widthFactor: 0.5, // mitad exacta
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),

          Row(
            children: [
              _label(
                label: 'Cliente',
                selected: !isProfessional,
                onTap: () => onChanged(false),
                r: r,
              ),
              _label(
                label: 'Profesional',
                selected: isProfessional,
                onTap: () => onChanged(true),
                r: r,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _label({
    required String label,
    required bool selected,
    required VoidCallback onTap,
    required Responsive r,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            style: TextStyle(
              fontSize: r.isMobile ? 13 : 14,
              fontWeight: FontWeight.w500,
              color: selected
                  ? AppTheme.textDark
                  : AppTheme.subtitleGrey,
            ),
            child: Text(label),
          ),
        ),
      ),
    );
  }
}