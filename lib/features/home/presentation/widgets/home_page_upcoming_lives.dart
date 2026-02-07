import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:test_flutter_bnj/features/home/presentation/cubit/upcoming_events_cubit.dart';
import 'package:test_flutter_bnj/injection.dart';

class HomePageUpcomingLives extends StatelessWidget {
  const HomePageUpcomingLives({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UpcomingEventsCubit>()..loadEvents(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Live à venir',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Gap(12),
          BlocBuilder<UpcomingEventsCubit, UpcomingEventsState>(
            builder: (context, state) {
              if (state is UpcomingEventsLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is UpcomingEventsLoaded) {
                if (state.events.isEmpty) {
                  return const Text('Aucun live à venir.');
                }
                return SizedBox(
                  height: 180,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.events.length,
                    separatorBuilder: (context, index) => const Gap(12),
                    itemBuilder: (context, index) {
                      final event = state.events[index];
                      final startTime = DateFormat('dd/MM HH:mm').format(event.startTime);

                      return GestureDetector(
                        onTap: () => context.push('/live/${event.id}'),
                        child: SizedBox(
                          width: 140,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Stack(
                                  children: [
                                    Image.network(
                                      event.thumbnailUrl ?? 'https://via.placeholder.com/140x100',
                                      width: 140,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                    Positioned(
                                      top: 4,
                                      right: 4,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: Colors.blue.withValues(alpha: 0.8),
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: Text(
                                          startTime,
                                          style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(8),
                              Text(
                                event.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Text(
                                event.seller.storeName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
              if (state is UpcomingEventsError) {
                return Text(state.message);
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
