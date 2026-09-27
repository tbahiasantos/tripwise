/// Item da estimativa de gastos de um destino.
class CostItem {
  final String label;
  final double valor;

  const CostItem(this.label, this.valor);
}

/// Um dia do roteiro sugerido.
class DayPlan {
  final String dia;
  final String titulo;
  final String descricao;

  const DayPlan(this.dia, this.titulo, this.descricao);
}

/// Destino recomendado pelo Travel Match (dados mockados nesta sprint).
class Destination {
  final String name;
  final String state;
  final String category;
  final String travelInfo;
  final int matchPercent;
  final String description;
  final List<String> reasons;
  final List<CostItem> costs;
  final List<DayPlan> itinerary;

  const Destination({
    required this.name,
    required this.state,
    required this.category,
    required this.travelInfo,
    required this.matchPercent,
    required this.description,
    required this.reasons,
    required this.costs,
    required this.itinerary,
  });

  double get estimatedCost => costs.fold(0, (sum, c) => sum + c.valor);
}

const _roteiroPortoSeguro = [
  DayPlan('DIA 1 · QUI 12', 'Chegada + passeio',
      'Check-in e fim de tarde na Passarela do Álcool'),
  DayPlan('DIA 2 · SEX 13', 'Praia + restaurante',
      'Praia de Taperapuã e jantar com frutos do mar'),
  DayPlan('DIA 3 · SÁB 14', 'Passeio de barco',
      'Recife de Fora e pôr do sol no rio Buranhém'),
  DayPlan('DIA 4 · DOM 15', 'Atrações locais',
      'Centro Histórico e compras no centro'),
  DayPlan('DIA 5 · SEG 16', 'Retorno', 'Café da manhã e voo de volta para BH'),
];

const mockDestinations = [
  Destination(
    name: 'Porto Seguro',
    state: 'BA',
    category: 'praia',
    travelInfo: 'voo 1h50',
    matchPercent: 94,
    description:
        'Praias tranquilas, clima quente o ano todo e boa estrutura pra quem busca economia sem abrir mão de conforto.',
    reasons: [
      'Praias tranquilas e mar quente em novembro',
      'Cabe no seu orçamento para 2 pessoas',
      'Voo direto de Belo Horizonte',
    ],
    costs: [
      CostItem('Passagens', 980),
      CostItem('Hospedagem (4 noites)', 750),
      CostItem('Alimentação', 420),
      CostItem('Passeios', 300),
    ],
    itinerary: _roteiroPortoSeguro,
  ),
  Destination(
    name: "Arraial d'Ajuda",
    state: 'BA',
    category: 'praia',
    travelInfo: 'voo + balsa',
    matchPercent: 89,
    description:
        'Clima mais tranquilo que Porto Seguro, praias de águas calmas e vida noturna mais discreta.',
    reasons: [
      'Praias de águas calmas, ideais para descansar',
      'Pousadas com bom custo-benefício',
      'Pertinho de Porto Seguro, com mais sossego',
    ],
    costs: [
      CostItem('Passagens', 980),
      CostItem('Hospedagem (4 noites)', 640),
      CostItem('Alimentação', 400),
      CostItem('Passeios', 300),
    ],
    itinerary: [
      DayPlan('DIA 1 · QUI 12', 'Chegada + balsa',
          'Voo até Porto Seguro e travessia para Arraial'),
      DayPlan('DIA 2 · SEX 13', 'Praia de Pitinga',
          'Dia de praia e almoço pé na areia'),
      DayPlan('DIA 3 · SÁB 14', 'Trancoso',
          'Quadrado de Trancoso e pôr do sol'),
      DayPlan('DIA 4 · DOM 15', 'Centrinho',
          'Rua do Mucugê e artesanato local'),
      DayPlan('DIA 5 · SEG 16', 'Retorno', 'Balsa e voo de volta para BH'),
    ],
  ),
  Destination(
    name: 'Salvador',
    state: 'BA',
    category: 'praia + cultura',
    travelInfo: 'voo 1h30',
    matchPercent: 83,
    description:
        'Centro histórico rico, gastronomia forte e boa opção pra combinar praia com cultura na mesma viagem.',
    reasons: [
      'Combina praia com cultura na mesma viagem',
      'Passagens mais baratas saindo de BH',
      'Gastronomia baiana famosa',
    ],
    costs: [
      CostItem('Passagens', 820),
      CostItem('Hospedagem (4 noites)', 650),
      CostItem('Alimentação', 430),
      CostItem('Passeios', 250),
    ],
    itinerary: [
      DayPlan('DIA 1 · QUI 12', 'Chegada + Barra',
          'Farol da Barra e pôr do sol'),
      DayPlan('DIA 2 · SEX 13', 'Pelourinho',
          'Centro Histórico e Elevador Lacerda'),
      DayPlan('DIA 3 · SÁB 14', 'Praia do Flamengo',
          'Dia de praia e acarajé no fim da tarde'),
      DayPlan('DIA 4 · DOM 15', 'Rio Vermelho', 'Feirinha e restaurantes locais'),
      DayPlan('DIA 5 · SEG 16', 'Retorno', 'Mercado Modelo e voo para BH'),
    ],
  ),
];
