import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:test_flutter_bnj/core/utils/responsive.dart';
import 'package:test_flutter_bnj/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:test_flutter_bnj/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:test_flutter_bnj/features/home/presentation/widgets/home_page_live_now_carousel.dart';
import 'package:test_flutter_bnj/features/home/presentation/widgets/home_page_recently_ended_lives.dart';
import 'package:test_flutter_bnj/features/home/presentation/widgets/home_page_upcoming_lives.dart';
import 'package:test_flutter_bnj/core/widgets/page_container.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Flow'),
        actions: [
          IconButton(icon: const Icon(LucideIcons.search), onPressed: () {}),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, cartState) {
              final qty = cartState.items.length;
              return Badge.count(
                count: qty,
                isLabelVisible: qty > 0,
                child: IconButton(
                  icon: const Icon(LucideIcons.shoppingCart),
                  onPressed: () => context.push('/cart'),
                  tooltip: 'Panier',
                ),
              );
            },
          ),
          IconButton(icon: const Icon(LucideIcons.user), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if(state is! Authenticated) {
                  return const Text('Veuillez vous connecter pour accéder au contenu en direct.');
                }
                return PageContainer(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  maxWidth: 1200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Gap(24),
                      const Text(
                        'Découvrez les dernières tendances en direct !',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const Gap(12),
                      const Text(
                        'Explorez nos catégories de produits, suivez vos influenceurs préférés et profitez d\'offres exclusives en temps réel.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                      const Gap(24),
                      const Flexible(child: HomePageLiveNowCarousel()),
                      const Gap(32),
                      Responsive(
                        mobile: const _HomeSectionsMobile(),
                        desktop: const _HomeSectionsDesktop(),
                      ),
                      const Gap(24),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _HomeSectionsDesktop extends StatelessWidget {
  const _HomeSectionsDesktop();

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: HomePageRecentlyEndedLives()),
        Gap(32),
        Expanded(child: HomePageUpcomingLives()),
      ],
    );
  }
}

class _HomeSectionsMobile extends StatelessWidget {
  const _HomeSectionsMobile();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HomePageRecentlyEndedLives(),
        Gap(32),
        HomePageUpcomingLives(),
      ],
    );
  }
}
