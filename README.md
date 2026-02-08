# Test Flutter BNJ — Application Web Live Shopping

## Comment lancer l'application

Prérequis:
- Flutter (stable) avec support web activé
- Dart SDK via Flutter

Commandes:
- Installer les dépendances:
  - `flutter pub get`
- Lancer en mode web (Chrome):
  - `flutter run -d chrome`
- Builder la version web:
  - `flutter build web`

Notes:
- Les données mock sont chargées depuis `lib/assets/mock-api-data.json` (référencé dans `pubspec.yaml`).
- Si nécessaire, activer le support web: `flutter config --enable-web`.

## Structure du projet

```
lib/
├── main.dart
├── app.dart
├── injection.dart
│
├── core/
│   ├── config/
│   │   ├── app_config.dart
│   │   └── theme_config.dart
│   ├── constants/
│   │   ├── api_constants.dart
│   │   └── breakpoints.dart
│   ├── error/
│   │   ├── failures.dart
│   │   └── exceptions.dart
│   └── utils/
│       ├── responsive.dart
│       └── extensions.dart
│
├── features/
│   ├── live_event/
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   ├── live_event.dart
│   │   │   │   ├── product.dart
│   │   │   │   └── chat_message.dart
│   │   │   ├── repositories/
│   │   │   │   └── live_event_repository.dart
│   │   │   └── usecases/
│   │   │       ├── get_live_events.dart
│   │   │       └── get_live_events_live_only.dart
│   │   ├── data/
│   │   │   ├── models/
│   │   │   │   ├── live_event_model.dart
│   │   │   │   ├── product_model.dart
│   │   │   │   └── chat_message_model.dart
│   │   │   ├── datasources/
│   │   │   │   ├── live_event_remote_datasource.dart
│   │   │   │   └── mock_socket_service.dart
│   │   │   └── repositories/
│   │   │       └── live_event_repository_impl.dart
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   ├── live_event_bloc.dart
│   │       │   └── authentication_bloc.dart
│   │       ├── pages/
│   │       │   └── live_event_page.dart
│   │       └── widgets/
│   │           ├── video_player_widget.dart
│   │           ├── chat_widget.dart
│   │           └── product_grid_widget.dart
│   ├── cart/
│   │   ├── domain/
│   │   ├── data/
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   └── cart_bloc.dart
│   │       └── pages/
│   │           └── cart_page.dart
│   └── home/
│       └── presentation/
│           ├── pages/
│           │   └── home_page.dart
│           └── widgets/
│               └── home_page_live_now_carousel.dart
│
└── widgets/
    └── common/
        ├── app_button.dart
        ├── error_view.dart
        └── loading_overlay.dart
```

Assets:
- `lib/assets/mock-api-data.json` — données simulées (événements, produits, utilisateurs, messages)

Tests:
- `test/` — tests unitaires et widgets (datasource live events, carousel "live maintenant", cas live vs scheduled)

## Choix techniques

- État: `flutter_bloc`
  - LiveEventBloc: chargement des événements via usecases
  - AuthenticationBloc (mock): état d’authentification et utilisateur courant
  - CartBloc: panier (ajout/suppression/quantités), badge et UI checkout
- Injection: `GetIt` dans `injection.dart`
- Données Mock: `live_event_remote_datasource.dart` lit `mock-api-data.json`
- Socket Mock: `mock_socket_service.dart` (streams viewers, messages, etc.)
- Responsive: `core/constants/breakpoints.dart` + `core/utils/responsive.dart`
- Icônes: `lucide_icons_flutter` (migration cohérente)
- Format: `intl` (€, fr_FR) pour prix/compteurs
- Animation: `flutter_number_flow` pour le compteur viewers
- Persistance: `shared_preferences` (prévu) pour le panier

Packages:
- flutter_bloc, get_it, intl, lucide_icons_flutter, shared_preferences (prévu), flutter_number_flow

## Difficultés rencontrées

- Génération des models: ajustements nécessaires pour coller au format `mock-api-data.json` (ex: `products` en liste d’IDs)
- Streams chat/viewers: gestion des abonnements (LateInitializationError sur subscription) et filtrage par `eventId`
- Responsive et reconstructions: éviter la perte d’état (chat) via conservation côté bloc/datasource
- UI checkout multi-étapes: validation et feedback visuel avec listeners + InheritedWidget (`CartFormScope`) pour accès propre aux contrôleurs

## Améliorations possibles

- Validation avancée (email/téléphone/CP) et messages de précision
- Persistance panier via SharedPreferences + restauration
- Optimisations web (lazy loading images, const constructors, keepAlive)
- Chat: lecture seule hors live, filtrage par `eventId`, pas de simulation hors live
- UX LiveEvent: compteur viewers uniquement en live, debounce + easeInOutCubic, formatage milliers, icône store avec pulse/fade, repositionnée sous le lecteur
- Architecture: usecases dédiés (live-only, scheduled-only, ended-recently), extraction `_LiveInfoBar`
- Tests: élargir la couverture (repos, blocs, widgets responsive)
- Accessibilité: navigation clavier, alt texts

---

## Livrables

1. Code source complet
2. README (ce fichier) expliquant:
   - Comment lancer l'application
   - Structure du projet
   - Choix techniques (état management, packages, etc.)
   - Difficultés rencontrées
   - Améliorations possibles
3. Screenshots/Vidéo de l’application en fonctionnement (à ajouter)
4. Documentation des APIs mock (à compléter au besoin)
5. Tests unitaires et widgets (bonus apprécié)

## Instructions de soumission

1. Copier `mock-api-data.json` dans `lib/assets/` et s’assurer de l’entrée dans `pubspec.yaml`
2. Créer un repository Git (GitHub/GitLab)
3. Commiter avec des messages clairs et un `.gitignore` adapté
4. Envoyer le lien du repository + ce README détaillé
5. Temps estimé: 7h30 (répartissable)

Ressources utiles:
- Flutter Web: https://docs.flutter.dev/platform-integration/web
- Bloc: https://bloclibrary.dev/
- GetIt: https://pub.dev/packages/get_it
- Intl: https://pub.dev/packages/intl
- Lucide Icons: https://pub.dev/packages/lucide_icons_flutter
