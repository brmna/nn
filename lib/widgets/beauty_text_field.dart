import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';

class BeautyTextField extends StatefulWidget {
  final String label;
  final String hint;
  final IconData prefixIcon;
  final bool isPassword;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const BeautyTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.prefixIcon,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.validator,
  });

  @override
  State<BeautyTextField> createState() => _BeautyTextFieldState();
}

class _BeautyTextFieldState extends State<BeautyTextField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);
    final fontSize = r.isMobile ? 14.0 : 15.0;
    final labelSize = r.isMobile ? 13.0 : 14.0;
    final iconSize = r.isMobile ? 18.0 : 20.0;
    final verticalPad = r.isMobile ? 14.0 : 16.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontSize: labelSize,
            fontWeight: FontWeight.w600,
            color: AppTheme.textDark,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.isPassword && _obscure,
          keyboardType: widget.keyboardType,
          validator: widget.validator,
          style: TextStyle(fontSize: fontSize, color: AppTheme.textDark),
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: TextStyle(color: AppTheme.textGrey, fontSize: fontSize),
            prefixIcon: Icon(widget.prefixIcon, color: AppTheme.textGrey, size: iconSize),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                      color: AppTheme.textGrey,
                      size: iconSize,
                    ),
                    onPressed: () => setState(() => _obscure = !_obscure),
                  )
                : null,
            filled: true,
            fillColor: AppTheme.white,
            contentPadding: EdgeInsets.symmetric(vertical: verticalPad, horizontal: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppTheme.borderGrey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppTheme.borderGrey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppTheme.black, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}
