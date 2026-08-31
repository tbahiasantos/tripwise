import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/primary_button.dart';
import '../models/destination.dart';
import 'budget_estimate_screen.dart';

class DestinationDetailScreen extends StatelessWidget {
  final Destination destino;

  const DestinationDetailScreen({super.key, required this.destino});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.turquesa,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.creme,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.photo,
                  size: 48,
                  color: AppColors.verdePetroleo,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          destino.name,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AppColors.azulMarinho,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColors.amarelo,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            '${destino.matchPercent}% match',
                            style: const TextStyle(
                              color: AppColors.azulMarinho,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      destino.state,
                      style: const TextStyle(color: AppColors.textSecondary),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      destino.description,
                      style: const TextStyle(
                        color: AppColors.azulMarinho,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 24),
                    PrimaryButton(
                      label: 'ver estimativa de gastos',
                      icon: Icons.calculate_outlined,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) =>
                                BudgetEstimateScreen(destino: destino),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
