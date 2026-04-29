import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';
import '../widgets/beauty_logo.dart';
import '../widgets/beauty_text_field.dart';
import '../widgets/beauty_button.dart';
import '../widgets/user_type_selector.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  bool _isProfessional = false;
  bool _isLoading = false;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleRegister() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);

    await Future.delayed(const Duration(seconds: 1));
    setState(() => _isLoading = false);

    if (mounted) Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: r.screenPadding,
              vertical: r.verticalPadding,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const BeautyLogo(subtitle: 'Únete a nuestra comunidad'),
                SizedBox(height: r.isMobile ? 28 : 36),
                _buildCard(r),
                SizedBox(height: r.isMobile ? 20 : 28),
                Text(
                  'Al continuar, aceptas nuestros Términos de Servicio y Política de Privacidad',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: r.isMobile ? 11 : 12,
                    color: AppTheme.textGrey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(Responsive r) {
    return Container(
      width: r.cardWidth,
      padding: EdgeInsets.all(r.cardPadding),
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// TITULO
            Text(
              'Crear Cuenta',
              style: TextStyle(
                fontSize: r.formTitleSize,
                fontWeight: FontWeight.bold,
                color: AppTheme.textDark,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Regístrate para comenzar',
              style: TextStyle(
                fontSize: r.isMobile ? 13 : 14,
                color: AppTheme.subtitleGrey,
              ),
            ),

            SizedBox(height: r.isMobile ? 20 : 24),

            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Center(
                child: UserTypeSelector(
                  isProfessional: _isProfessional,
                  onChanged: (val) =>
                      setState(() => _isProfessional = val),
                ),
              ),
            ),

            SizedBox(height: r.fieldGap + 4),

            /// CAMPOS
            if (r.isTablet || r.isDesktop)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: BeautyTextField(
                      label: 'Nombre completo',
                      hint: _isProfessional
                          ? 'Tu nombre profesional'
                          : 'Tu nombre',
                      prefixIcon: Icons.person_outline,
                      controller: _nameController,
                      validator: (v) =>
                          v == null || v.isEmpty ? 'Ingresa tu nombre' : null,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: BeautyTextField(
                      label: 'Correo electrónico',
                      hint: 'tu@email.com',
                      prefixIcon: Icons.mail_outline,
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      validator: (v) =>
                          v == null || !v.contains('@')
                              ? 'Email inválido'
                              : null,
                    ),
                  ),
                ],
              )
            else ...[
              BeautyTextField(
                label: 'Nombre completo',
                hint: _isProfessional
                    ? 'Tu nombre profesional'
                    : 'Tu nombre',
                prefixIcon: Icons.person_outline,
                controller: _nameController,
                validator: (v) =>
                    v == null || v.isEmpty ? 'Ingresa tu nombre' : null,
              ),
              SizedBox(height: r.fieldGap),
              BeautyTextField(
                label: 'Correo electrónico',
                hint: 'tu@email.com',
                prefixIcon: Icons.mail_outline,
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                validator: (v) =>
                    v == null || !v.contains('@')
                        ? 'Ingresa un email válido'
                        : null,
              ),
            ],

            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              switchInCurve: Curves.easeOut,
              switchOutCurve: Curves.easeIn,
              child: _isProfessional
                  ? Column(
                      key: const ValueKey('phone'),
                      children: [
                        SizedBox(height: r.fieldGap),
                        BeautyTextField(
                          label: 'Teléfono',
                          hint: '+1 234 567 8900',
                          prefixIcon: Icons.phone_outlined,
                          keyboardType: TextInputType.phone,
                          controller: _phoneController,
                          validator: (v) =>
                              v == null || v.isEmpty
                                  ? 'Ingresa tu teléfono'
                                  : null,
                        ),
                      ],
                    )
                  : const SizedBox.shrink(key: ValueKey('empty')),
            ),

            SizedBox(height: r.fieldGap),

            BeautyTextField(
              label: 'Contraseña',
              hint: '••••••••',
              prefixIcon: Icons.lock_outline,
              isPassword: true,
              controller: _passwordController,
              validator: (v) =>
                  v == null || v.length < 6
                      ? 'Mínimo 6 caracteres'
                      : null,
            ),

            SizedBox(height: r.isMobile ? 24 : 28),

            BeautyButton(
              label: _isProfessional
                  ? 'Crear Cuenta Profesional'
                  : 'Crear Cuenta',
              onPressed: _handleRegister,
              isLoading: _isLoading,
            ),

            SizedBox(height: r.isMobile ? 16 : 20),

            Center(
              child: GestureDetector(
                onTap: () =>
                    Navigator.pushReplacementNamed(context, '/login'),
                child: RichText(
                  text: TextSpan(
                    text: _isProfessional
                        ? '¿Ya tienes cuenta profesional? '
                        : '¿Ya tienes cuenta? ',
                    style: TextStyle(
                      fontSize: r.isMobile ? 13 : 14,
                      color: AppTheme.subtitleGrey,
                    ),
                    children: const [
                      TextSpan(
                        text: 'Inicia sesión',
                        style: TextStyle(
                          color: AppTheme.textDark,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}