import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:test_flutter_bnj/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:test_flutter_bnj/features/home/presentation/widgets/home_page_live_now_carousel.dart';
import 'package:test_flutter_bnj/features/home/presentation/widgets/home_page_recently_ended_lives.dart';
import 'package:test_flutter_bnj/features/home/presentation/widgets/home_page_upcoming_lives.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Flow'),
        actions: [
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if(state is! Authenticated) {
                return const Text('Veuillez vous connecter pour accéder au contenu en direct.');
              }
              return SingleChildScrollView(
                child: SizedBox(
                  width: MediaQuery
                      .sizeOf(context)
                      .width * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Gap(24),
                      const Text(
                        'Découvrez les dernières tendances en direct !',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight
                            .bold),
                        textAlign: TextAlign.center,
                      ),
                      Gap(12),
                      const Text(
                        'Explorez nos catégories de produits, suivez vos influenceurs préférés et profitez d\'offres exclusives en temps réel.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                      Gap(24),
                      Flexible(
                        child: HomePageLiveNowCarousel(),
                      ),
                      Gap(32),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          if (constraints.maxWidth > 900) {
                            return const Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(child: HomePageRecentlyEndedLives()),
                                Gap(32),
                                Expanded(child: HomePageUpcomingLives()),
                              ],
                            );
                          } else {
                            return const Column(
                              children: [
                                HomePageRecentlyEndedLives(),
                                Gap(32),
                                HomePageUpcomingLives(),
                              ],
                            );
                          }
                        },
                      ),
                      Gap(24),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
