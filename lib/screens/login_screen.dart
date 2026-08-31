import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/primary_button.dart';
import 'signup_screen.dart';
import 'preferences_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.turquesa,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/logo.png', width: 100),
              const SizedBox(height: 28),
              const Text(
                'bem-vinda de volta',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.azulMarinho,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'entre pra continuar planejando sua viagem',
                style: TextStyle(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 28),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'e-mail',
                  prefixIcon: Icon(Icons.mail_outline),
                ),
              ),
              const SizedBox(height: 14),
              TextField(
                controller: passwordController,
                obscureText: obscure,
                decoration: InputDecoration(
                  hintText: 'senha',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscure ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () => setState(() => obscure = !obscure),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'esqueci a senha',
                    style: TextStyle(color: AppColors.verdePetroleo),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              PrimaryButton(
                label: 'entrar',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const PreferencesScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const SignupScreen()),
                    );
                  },
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(color: AppColors.azulMarinho),
                      children: [
                        TextSpan(text: 'não tem conta? '),
                        TextSpan(
                          text: 'cadastre-se',
                          style: TextStyle(
                            color: AppColors.coral,
                            fontWeight: FontWeight.w600,
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
      ),
    );
  }
}
