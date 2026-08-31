class Destination {
  final String name;
  final String state;
  final String category;
  final int matchPercent;
  final double estimatedCost;
  final String description;

  const Destination({
    required this.name,
    required this.state,
    required this.category,
    required this.matchPercent,
    required this.estimatedCost,
    required this.description,
  });
}

const mockDestinations = [
  Destination(
    name: 'Porto Seguro',
    state: 'BA',
    category: 'praia',
    matchPercent: 94,
    estimatedCost: 2100,
    description:
        'Praias tranquilas, clima quente o ano todo e boa estrutura pra quem busca economia sem abrir mão de conforto.',
  ),
  Destination(
    name: "Arraial d'Ajuda",
    state: 'BA',
    category: 'praia',
    matchPercent: 89,
    estimatedCost: 2300,
    description:
        'Clima mais tranquilo que Porto Seguro, praias de águas calmas e vida noturna mais discreta.',
  ),
  Destination(
    name: 'Salvador',
    state: 'BA',
    category: 'cultura',
    matchPercent: 83,
    estimatedCost: 1950,
    description:
        'Centro histórico rico, gastronomia forte e boa opção pra combinar praia com cultura na mesma viagem.',
  ),
];
