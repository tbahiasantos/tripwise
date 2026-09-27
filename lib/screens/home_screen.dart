import 'package:flutter/material.dart';

import '../app_routes.dart';
import '../models/destination.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../widgets/tw_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final proxima = mockDestinations.first;
    return Scaffold(
      bottomNavigationBar: const TwBottomNav(currentIndex: 0),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
          children: [
            Row(
              children: [
                Image.asset('assets/images/logo_mark.png', width: 44),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Olá, viajante',
                          style: TextStyle(
                              fontSize: 13, color: AppColors.textSecondary)),
                      Text('Marina',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
                TwIconButton(
                  icon: Icons.notifications_none_rounded,
                  tooltip: 'Notificações',
                  onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Nenhuma notificação nova.')),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            const _MatchHero(),
            const SizedBox(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('PRÓXIMA VIAGEM', style: AppText.display(26)),
                TextButton(
                  onPressed: () => Navigator.of(context)
                      .pushNamed(AppRoutes.itinerary, arguments: proxima),
                  child: const Text('Ver roteiro',
                      style: TextStyle(
                          color: AppColors.verdePetroleo,
                          fontWeight: FontWeight.w700)),
                ),
              ],
            ),
            const SizedBox(height: 6),
            _NextTripCard(destino: proxima),
            const SizedBox(height: 22),
            Text('INSPIRE-SE POR ESTILO', style: AppText.display(26)),
            const SizedBox(height: 12),
            const Row(
              children: [
                Expanded(
                    child: _StyleTile(
                        label: 'Praia',
                        icon: Icons.beach_access_outlined,
                        color: AppColors.turquesa)),
                SizedBox(width: 10),
                Expanded(
                    child: _StyleTile(
                        label: 'Montanha',
                        icon: Icons.landscape_outlined,
                        color: AppColors.creme)),
                SizedBox(width: 10),
                Expanded(
                    child: _StyleTile(
                        label: 'Cidade',
                        icon: Icons.location_city_outlined,
                        color: AppColors.rosa)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MatchHero extends StatelessWidget {
  const _MatchHero();

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.azulMarinho,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -30,
            top: -30,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.turquesa, width: 2),
              ),
              alignment: Alignment.center,
              child: const CircleAvatar(
                  radius: 34, backgroundColor: AppColors.amarelo),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Eyebrow('Travel Match', color: AppColors.turquesa),
                const SizedBox(height: 10),
                SizedBox(
                  width: 250,
                  child: Text('NÃO SABE PRA ONDE IR? MELHOR AINDA.',
                      style: AppText.display(38, color: AppColors.offWhite)
                          .copyWith(height: 0.95)),
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  width: 260,
                  child: Text(
                    'Responda poucas perguntas e receba os destinos que mais combinam com você.',
                    style: TextStyle(
                        fontSize: 14, height: 1.4, color: Color(0xFFD5E6EE)),
                  ),
                ),
                const SizedBox(height: 14),
                FilledButton.icon(
                  onPressed: () =>
                      AppRoutes.goToTab(context, 1),
                  icon: const Icon(Icons.arrow_forward_rounded),
                  iconAlignment: IconAlignment.end,
                  label: const Text('Fazer meu match'),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.amarelo,
                    foregroundColor: AppColors.azulMarinho,
                    minimumSize: const Size(0, 48),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: AppFonts.body),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NextTripCard extends StatelessWidget {
  final Destination destino;

  const _NextTripCard({required this.destino});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.branco,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: AppColors.borda),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => Navigator.of(context)
            .pushNamed(AppRoutes.itinerary, arguments: destino),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18, 16, 12, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('CNF',
                              style: AppText.mono(13,
                                  color: AppColors.textSecondary)),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Icon(Icons.flight_takeoff_rounded,
                                size: 18, color: AppColors.coral),
                          ),
                          Text('BPS',
                              style: AppText.mono(13,
                                  color: AppColors.textSecondary)),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                          '${destino.name.toUpperCase()} · ${destino.state}',
                          style: AppText.display(28)),
                      const SizedBox(height: 4),
                      const Text('12 – 16 nov · 2 pessoas · 5 dias',
                          style: TextStyle(
                              fontSize: 13, color: AppColors.textSecondary)),
                    ],
                  ),
                ),
              ),
              Container(
                width: 92,
                color: AppColors.creme,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${destino.matchPercent}%',
                        style: AppText.display(30,
                            color: AppColors.verdePetroleo)),
                    const SizedBox(height: 2),
                    Text('MATCH', style: AppText.mono(11)),
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

class _StyleTile extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const _StyleTile(
      {required this.label, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () => AppRoutes.goToTab(context, 1),
        child: SizedBox(
          height: 92,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: AppColors.azulMarinho),
                Text(label,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w700)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
