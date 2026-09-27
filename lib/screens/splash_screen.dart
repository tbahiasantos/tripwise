import 'package:flutter/material.dart';

import '../app_routes.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';

/// Abertura do app: logo por 2 segundos e segue para a tela inicial.
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
      Navigator.of(context).pushReplacementNamed(AppRoutes.welcome);
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
            Image.asset('assets/images/logo.png', width: 240),
            const SizedBox(height: 40),
            const SizedBox(
              width: 28,
              height: 28,
              child: CircularProgressIndicator(
                color: AppColors.coral,
                strokeWidth: 3,
              ),
            ),
            const SizedBox(height: 16),
            Text('PREPARANDO SUA VIAGEM…',
                style: AppText.eyebrow(color: AppColors.azulMarinho)),
          ],
        ),
      ),
    );
  }
}
