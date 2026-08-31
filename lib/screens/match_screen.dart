import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/content_card.dart';
import '../models/destination.dart';
import 'destination_detail_screen.dart';

class MatchScreen extends StatelessWidget {
  const MatchScreen({super.key});

  Color _medalColor(int index) {
    switch (index) {
      case 0:
        return AppColors.amarelo;
      case 1:
        return AppColors.turquesa;
      default:
        return AppColors.coral;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.turquesa,
      appBar: AppBar(title: const Text('seu travel match')),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(20),
          itemCount: mockDestinations.length,
          separatorBuilder: (_, __) => const SizedBox(height: 14),
          itemBuilder: (context, index) {
            final destino = mockDestinations[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => DestinationDetailScreen(destino: destino),
                  ),
                );
              },
              child: ContentCard(
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: _medalColor(index),
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          color: AppColors.azulMarinho,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            destino.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.azulMarinho,
                            ),
                          ),
                          Text(
                            '${destino.category} · ${destino.state}',
                            style: const TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '${destino.matchPercent}%',
                      style: const TextStyle(
                        color: AppColors.verdePetroleo,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
