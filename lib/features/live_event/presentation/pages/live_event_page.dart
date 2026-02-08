import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:test_flutter_bnj/core/utils/responsive.dart';
import 'package:test_flutter_bnj/features/live_event/domain/entities/live_event.dart';
import 'package:test_flutter_bnj/features/live_event/presentation/bloc/live_event_bloc.dart';
import 'package:test_flutter_bnj/features/live_event/presentation/widgets/chat_widget.dart';
import 'package:test_flutter_bnj/features/live_event/presentation/widgets/product_grid_widget.dart';
import 'package:test_flutter_bnj/features/live_event/presentation/widgets/video_player_widget.dart';
import 'package:test_flutter_bnj/features/live_event/presentation/widgets/live_info_bar.dart';
import 'package:test_flutter_bnj/injection.dart';
import 'package:test_flutter_bnj/widgets/common/error_view.dart';

class LiveEventPage extends StatefulWidget {
  final String eventId;

  const LiveEventPage({super.key, required this.eventId});

  @override
  State<LiveEventPage> createState() => _LiveEventPageState();
}

class _LiveEventPageState extends State<LiveEventPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<LiveEventBloc>()..add(LoadLiveEventById(widget.eventId)),
      child: Scaffold(
        appBar: AppBar(title: Text('Live Flow'), centerTitle: false,
        actions: [
          // cart button with badge
          IconButton(
            icon: const Icon(LucideIcons.shoppingCart),
            onPressed: () {

            }),
          // profile button
          IconButton(
            icon: const Icon(LucideIcons.user),
            onPressed: () {

            }
          )
        ],),
        body: BlocBuilder<LiveEventBloc, LiveEventState>(
          builder: (context, state) {
            final isLoading = state is LiveEventLoading;

            if (state is LiveEventError) {
              return ErrorView(
                message: state.message,
                onRetry: () => context.read<LiveEventBloc>().add(
                  LoadLiveEventById(widget.eventId),
                ),
              );
            }

            if (state is LiveEventDetailLoaded) {
              final content = Responsive(
                mobile: MobileLiveEventLayout(
                  event: state.event,
                  viewerCount: state.viewerCount,
                  tabController: _tabController,
                ),
                desktop: DesktopLiveEventLayout(
                  event: state.event,
                  viewerCount: state.viewerCount,
                ),
              );
              return Stack(
                children: [
                  content,
                  if (isLoading)
                    Container(
                      color: Colors.black.withValues(alpha: 0.3),
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                ],
              );
            }

            return Stack(
              children: [
                const SizedBox.shrink(),
                if (isLoading)
                  Container(
                    color: Colors.black.withValues(alpha: 0.3),
                    child: const Center(child: CircularProgressIndicator()),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class DesktopLiveEventLayout extends StatelessWidget {
  final LiveEvent event;
  final int viewerCount;

  const DesktopLiveEventLayout({
    super.key,
    required this.event,
    required this.viewerCount,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isScheduled = event.status == LiveEventStatus.scheduled;
    return Column(
      children: [
        LiveInfoBar(event: event),
        Expanded(
          child: Row(
            children: [
              Expanded(
                flex: 7,
                child: Column(
                  children: [
                    Expanded(
                      flex: 6,
                      child: isScheduled
                          ? _UpcomingBanner(theme: theme)
                          : RepaintBoundary(
                              child: VideoPlayerWidget(streamUrl: event.streamUrl),
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      child: Row(
                        children: [
                          const Icon(LucideIcons.store, size: 18),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              event.seller.name,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: ProductGridWidget(products: event.products),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: ChatWidget(
                  key: ValueKey('chat_${event.id}'),
                  eventId: event.id,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MobileLiveEventLayout extends StatelessWidget {
  final LiveEvent event;
  final int viewerCount;
  final TabController tabController;

  const MobileLiveEventLayout({
    super.key,
    required this.event,
    required this.viewerCount,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isScheduled = event.status == LiveEventStatus.scheduled;
    return Column(
      children: [
        LiveInfoBar(event: event),
        Expanded(
          child: isScheduled
              ? _UpcomingBanner(theme: theme)
              : VideoPlayerWidget(streamUrl: event.streamUrl),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              const Icon(LucideIcons.store, size: 18),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  event.seller.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              TabBar(
                tabs: const [
                  Tab(text: 'Chat'),
                  Tab(text: 'Produits'),
                ],
                controller: tabController,
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    ChatWidget(
                      key: ValueKey('chat_${event.id}'),
                      eventId: event.id,
                    ),
                    ProductGridWidget(products: event.products),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _UpcomingBanner extends StatelessWidget {
  final ThemeData theme;
  const _UpcomingBanner({required this.theme});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [theme.colorScheme.primary.withValues(alpha: 0.08), Colors.transparent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.primary.withValues(alpha: 0.2)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(LucideIcons.calendarClock, size: 20),
              const SizedBox(width: 8),
              Text(
                'À venir',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
