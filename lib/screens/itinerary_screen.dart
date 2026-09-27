import 'package:flutter/material.dart';

import '../app_routes.dart';
import '../models/destination.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../widgets/primary_button.dart';
import '../widgets/tw_widgets.dart';

/// Roteiro sugerido, dia a dia, para o destino escolhido.
class ItineraryScreen extends StatelessWidget {
  final Destination destino;

  const ItineraryScreen({super.key, required this.destino});

  static const _cores = [
    AppColors.coral,
    AppColors.amarelo,
    AppColors.turquesa,
    AppColors.verdePetroleo,
    AppColors.azulMarinho,
  ];
  static const _textoClaro = [true, false, false, true, true];

  @override
  Widget build(BuildContext context) {
    final dias = destino.itinerary;
    final veioDaAba = !Navigator.of(context).canPop() ||
        ModalRoute.of(context)?.settings.arguments == null;

    return Scaffold(
      bottomNavigationBar: const TwBottomNav(currentIndex: 2),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TwBackButton(
                  onPressed: veioDaAba
                      ? () => AppRoutes.goToTab(context, 0)
                      : null,
                ),
                Row(
                  children: [
                    Text('CNF',
                        style:
                            AppText.mono(13, color: AppColors.textSecondary)),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      child: Icon(Icons.flight_takeoff_rounded,
                          size: 16, color: AppColors.coral),
                    ),
                    Text('BPS · 12–16 NOV',
                        style:
                            AppText.mono(13, color: AppColors.textSecondary)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 14),
            Eyebrow('Roteiro sugerido · ${dias.length} dias'),
            const SizedBox(height: 2),
            Text(destino.name.toUpperCase(), style: AppText.display(44)),
            const SizedBox(height: 14),
            for (var i = 0; i < dias.length; i++)
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      width: 40,
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundColor: _cores[i % _cores.length],
                            child: Text(
                              '${i + 1}',
                              style: AppText.display(20,
                                  color: _textoClaro[i % _cores.length]
                                      ? AppColors.branco
                                      : AppColors.azulMarinho),
                            ),
                          ),
                          if (i < dias.length - 1)
                            const Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 2),
                                child: VerticalDivider(
                                  width: 2,
                                  thickness: 2,
                                  color: Color(0xFFC9BBA6),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: TwCard(
                          radius: 16,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(dias[i].dia,
                                  style: AppText.mono(12,
                                      color: AppColors.textSecondary)),
                              const SizedBox(height: 2),
                              Text(dias[i].titulo,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700)),
                              const SizedBox(height: 2),
                              Text(dias[i].descricao,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      color: AppColors.textSecondary)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 14),
            PrimaryButton(
              label: 'Salvar viagem',
              icon: Icons.bookmark_add_outlined,
              iconLeading: true,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(
                          'Viagem para ${destino.name} salva!')),
                );
                AppRoutes.goToTab(context, 0);
              },
            ),
          ],
        ),
      ),
    );
  }
}
