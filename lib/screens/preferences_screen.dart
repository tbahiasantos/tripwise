import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/primary_button.dart';
import 'match_screen.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  final categorias = ['praia', 'aventura', 'cultura', 'natureza', 'urbano'];
  String selecionada = 'praia';
  double orcamento = 2500;
  int dias = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.turquesa,
      appBar: AppBar(title: const Text('preferências')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'como você quer viajar?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.azulMarinho,
                ),
              ),
              const SizedBox(height: 20),
              const Text('tipo de viagem',
                  style: TextStyle(color: AppColors.textSecondary)),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: categorias.map((categoria) {
                  final ativo = categoria == selecionada;
                  return ChoiceChip(
                    label: Text(categoria),
                    selected: ativo,
                    onSelected: (_) => setState(() => selecionada = categoria),
                    selectedColor: AppColors.coral,
                    backgroundColor: AppColors.branco,
                    labelStyle: TextStyle(
                      color: ativo ? AppColors.branco : AppColors.azulMarinho,
                      fontWeight: FontWeight.w600,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
              Text('orçamento: R\$ ${orcamento.toInt()}',
                  style: const TextStyle(color: AppColors.textSecondary)),
              Slider(
                value: orcamento,
                min: 500,
                max: 10000,
                divisions: 19,
                activeColor: AppColors.verdePetroleo,
                inactiveColor: AppColors.creme,
                onChanged: (v) => setState(() => orcamento = v),
              ),
              const SizedBox(height: 12),
              Text('duração: $dias dias',
                  style: const TextStyle(color: AppColors.textSecondary)),
              Slider(
                value: dias.toDouble(),
                min: 1,
                max: 21,
                divisions: 20,
                activeColor: AppColors.verdePetroleo,
                inactiveColor: AppColors.creme,
                onChanged: (v) => setState(() => dias = v.round()),
              ),
              const SizedBox(height: 28),
              PrimaryButton(
                label: 'buscar match',
                icon: Icons.travel_explore,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const MatchScreen()),
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
