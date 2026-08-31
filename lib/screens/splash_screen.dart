import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.turquesa,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 220,
            ),
            const SizedBox(height: 12),
            const Text(
              'planeje melhor. viaje mais.',
              style: TextStyle(
                color: AppColors.azulMarinho,
                fontSize: 14,
                letterSpacing: 1.1,
              ),
            ),
            const SizedBox(height: 40),
            const CircularProgressIndicator(
              color: AppColors.coral,
              strokeWidth: 3,
            ),
          ],
        ),
      ),
    );
  }
}
