import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../models/destination.dart';

class ItineraryScreen extends StatelessWidget {
  final Destination destino;

  const ItineraryScreen({super.key, required this.destino});

  @override
  Widget build(BuildContext context) {
    final passos = [
      {'titulo': 'chegada + passeio livre', 'sub': 'check-in e orla à noite'},
      {'titulo': 'praia + restaurante', 'sub': 'dia livre na orla'},
      {'titulo': 'passeio de barco', 'sub': 'pôr do sol incluso'},
      {'titulo': 'centro histórico', 'sub': 'atrações locais'},
      {'titulo': 'retorno', 'sub': 'embarque pela manhã'},
    ];

    return Scaffold(
      backgroundColor: AppColors.turquesa,
      appBar: AppBar(title: Text('roteiro · ${destino.name}')),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(24),
          itemCount: passos.length,
          itemBuilder: (context, index) {
            final passo = passos[index];
            final ultimo = index == passos.length - 1;
            return IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 14,
                        backgroundColor: AppColors.coral,
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            color: AppColors.branco,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      if (!ultimo)
                        Expanded(
                          child: Container(
                            width: 2,
                            color: AppColors.verdePetroleo.withOpacity(0.4),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            passo['titulo']!,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.azulMarinho,
                            ),
                          ),
                          Text(
                            passo['sub']!,
                            style: const TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
