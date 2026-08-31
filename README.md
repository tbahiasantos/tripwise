# TripWise

Protótipo mobile em Flutter das 8 telas do app: splash, login, cadastro,
preferências, match, detalhe do destino, estimativa de gastos e roteiro.

## Como rodar

1. Extraia o zip em uma pasta sem espaço no caminho (ex: `C:\dev\tripwise`).
2. Abra a pasta no VS Code.
3. No terminal, dentro da pasta do projeto, rode:

```
flutter pub get
```

4. Escolha o Chrome como dispositivo (canto inferior direito do VS Code,
   ou `flutter devices` pra ver as opções) e rode:

```
flutter run -d chrome
```

O app abre com hot reload ativo — qualquer alteração salva no código
atualiza a tela sem precisar reiniciar.
