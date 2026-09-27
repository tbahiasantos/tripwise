<div align="center">

# TripWise

**Planeje melhor. Viaje mais.**

Aplicação para recomendação e planejamento personalizado de viagens.

</div>

---

## Sobre

O **TripWise** é uma aplicação que busca facilitar o planejamento de viagens por meio de recomendações personalizadas.

Em vez de o usuário precisar escolher primeiro um destino e pesquisar separadamente por hospedagem, passeios, transporte e custos, o TripWise parte das características da viagem que ele deseja realizar.

O usuário informa seu **perfil, preferências, período e orçamento**, e o sistema utiliza essas informações para encontrar destinos compatíveis.

> **O usuário não precisa saber para onde quer ir. Ele só precisa saber como quer viajar.**

---

## Como funciona

```text
Perfil + Preferências + Orçamento + Período
                    |
                    v
             Travel Match
                    |
                    v
        Destinos mais compatíveis
                    |
                    v
        Planejamento da viagem
                    |
                    v
                 Roteiro
```

O sistema apresenta os destinos de acordo com seu nível de compatibilidade com o perfil informado pelo usuário.

---

---

## Sprint 2 · Interface do App

| # | Tela | Arquivo |
|---|------|---------|
| 1 | Splash | `lib/screens/splash_screen.dart` |
| 2 | **Tela inicial** | `lib/screens/welcome_screen.dart` |
| 3 | Login | `lib/screens/login_screen.dart` |
| 4 | **Cadastro** (com perfil de viajante) | `lib/screens/signup_screen.dart` |
| 5 | Home | `lib/screens/home_screen.dart` |
| 6 | Preferências (questionário do Travel Match) | `lib/screens/preferences_screen.dart` |
| 7 | **Travel Match** (funcionalidade principal) | `lib/screens/match_screen.dart` |
| 8 | Destino + estimativa de gastos | `lib/screens/destination_detail_screen.dart` |
| 9 | Roteiro | `lib/screens/itinerary_screen.dart` |
| 10 | **Sobre o App** | `lib/screens/about_screen.dart` |

A navegação usa rotas nomeadas (`lib/app_routes.dart`) e uma barra inferior com Início, Match, Viagens e Sobre.

### Como rodar

```bash
flutter pub get
flutter run -d chrome     # ou um emulador Android
flutter test
```

---

## Equipe

* Ana Luiza Ribas
* Ana Paula Lopes
* Débora Lino
* Thiago Bahia
