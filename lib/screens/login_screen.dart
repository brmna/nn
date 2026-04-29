import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';
import '../widgets/beauty_logo.dart';
import '../widgets/beauty_text_field.dart';
import '../widgets/beauty_button.dart';
import '../widgets/user_type_selector.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isProfessional = false;
  bool _isLoading = false;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);

    // Implementar lógica de login con backend
    // final result = await AuthService.login(
    //   email: _emailController.text,
    //   password: _passwordController.text,
    //   isProfessional: _isProfessional,
    // );
    // if (result.success) Navigator.pushReplacementNamed(context, '/home');

    await Future.delayed(const Duration(seconds: 1));
    setState(() => _isLoading = false);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login exitoso — conectar backend')),
      );
    }
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
                const BeautyLogo(subtitle: 'Tu plataforma de belleza profesional'),
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
            Text(
              'Iniciar Sesión',
              style: TextStyle(
                fontSize: r.formTitleSize,
                fontWeight: FontWeight.bold,
                color: AppTheme.textDark,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Accede a tu cuenta para continuar',
              style: TextStyle(
                fontSize: r.isMobile ? 13 : 14,
                color: AppTheme.subtitleGrey,
              ),
            ),
            SizedBox(height: r.isMobile ? 20 : 24),
            UserTypeSelector(
              isProfessional: _isProfessional,
              onChanged: (val) => setState(() => _isProfessional = val),
            ),
            SizedBox(height: r.fieldGap + 4),
            BeautyTextField(
              label: 'Correo electrónico',
              hint: 'tu@email.com',
              prefixIcon: Icons.mail_outline,
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              validator: (v) =>
                  v == null || !v.contains('@') ? 'Ingresa un email válido' : null,
            ),
            SizedBox(height: r.fieldGap),
            BeautyTextField(
              label: 'Contraseña',
              hint: '••••••••',
              prefixIcon: Icons.lock_outline,
              isPassword: true,
              controller: _passwordController,
              validator: (v) =>
                  v == null || v.isEmpty ? 'Ingresa tu contraseña' : null,
            ),
            SizedBox(height: r.isMobile ? 24 : 28),
            BeautyButton(
              label: 'Iniciar Sesión',
              onPressed: _handleLogin,
              isLoading: _isLoading,
            ),
            SizedBox(height: r.isMobile ? 16 : 20),
            Center(
              child: GestureDetector(
                onTap: () => Navigator.pushReplacementNamed(context, '/register'),
                child: RichText(
                  text: TextSpan(
                    text: _isProfessional
                        ? '¿No tienes cuenta profesional? '
                        : '¿No tienes cuenta? ',
                    style: TextStyle(
                      fontSize: r.isMobile ? 13 : 14,
                      color: AppTheme.subtitleGrey,
                    ),
                    children: [
                      TextSpan(
                        text: _isProfessional ? 'Únete como profesional' : 'Regístrate',
                        style: const TextStyle(
                          color: AppTheme.textDark,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: Text(
                'Demo: Usa cualquier email y contraseña para acceder',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: r.isMobile ? 11 : 12,
                  color: AppTheme.textGrey.withOpacity(0.8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
