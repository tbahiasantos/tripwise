import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/content_card.dart';
import '../widgets/primary_button.dart';
import '../models/destination.dart';
import 'itinerary_screen.dart';

class BudgetEstimateScreen extends StatelessWidget {
  final Destination destino;

  const BudgetEstimateScreen({super.key, required this.destino});

  @override
  Widget build(BuildContext context) {
    final itens = [
      {'label': 'passagem (2px)', 'icon': Icons.flight, 'valor': 980.0},
      {'label': 'hospedagem', 'icon': Icons.bed, 'valor': 750.0},
      {'label': 'alimentação', 'icon': Icons.restaurant, 'valor': 420.0},
      {'label': 'passeios', 'icon': Icons.map, 'valor': 300.0},
    ];
    final total = itens.fold<double>(0, (soma, i) => soma + (i['valor'] as double));

    return Scaffold(
      backgroundColor: AppColors.turquesa,
      appBar: AppBar(title: Text('gastos em ${destino.name}')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ContentCard(
                child: Column(
                  children: [
                    for (final item in itens)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            Icon(item['icon'] as IconData,
                                color: AppColors.verdePetroleo, size: 20),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                item['label'] as String,
                                style: const TextStyle(
                                    color: AppColors.azulMarinho),
                              ),
                            ),
                            Text(
                              'R\$ ${(item['valor'] as double).toInt()}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.azulMarinho,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppColors.amarelo,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'total estimado',
                      style: TextStyle(
                        color: AppColors.azulMarinho,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'R\$ ${total.toInt()}',
                      style: const TextStyle(
                        color: AppColors.azulMarinho,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              PrimaryButton(
                label: 'montar roteiro',
                icon: Icons.route,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ItineraryScreen(destino: destino),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
