import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_flutter_bnj/features/home/presentation/widgets/live_now_card_item.dart';
import 'package:test_flutter_bnj/features/live_event/presentation/bloc/live_event_bloc.dart';

class HomePageLiveNowCarousel extends StatelessWidget {
  const HomePageLiveNowCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<LiveEventBloc, LiveEventState>(
      builder: (context, state) {
        if (state is LiveEventLoading) {
          return const LiveEventsCarouselLoading();
        } else if (state is LiveEventLoaded) {
          return SizedBox(
            width: double.infinity,
            height: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "En direct maintenant",
                  style: textTheme.headlineLarge,
                  textAlign: TextAlign.start,
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return CarouselViewTheme(
                        data: CarouselViewThemeData(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: CarouselView(
                          onTap: (index) {
                            final event = state.events.elementAt(index);
                            context.go('/live/${event.id}');
                          },
                          itemExtent: getItemExtent(constraints),
                          children: state.events
                              .map((event) => LiveNowCardItem(event: event))
                              .toList(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox(
          width: double.infinity,
          height: 400,
          child: Center(child: Text('Aucun live en cours')),
        );
      },
    );
  }

  double getItemExtent(BoxConstraints constraints) {
    // if mobile, show 1.5 items, if desktop show 3 items
    if (constraints.maxWidth < 600) {
      return constraints.maxWidth;
    }
    // if tablet, show 2 items, if desktop show 3 items
    if (constraints.maxWidth < 900) {
      return constraints.maxWidth / 2;
    }
    return constraints.maxWidth / 4;
  }
}

class LiveEventsCarouselLoading extends StatelessWidget {
  const LiveEventsCarouselLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: 400,
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
