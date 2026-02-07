import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter_bnj/features/live_event/domain/entities/live_event.dart';
import 'package:test_flutter_bnj/features/live_event/presentation/bloc/live_event_bloc.dart';
import 'package:test_flutter_bnj/features/live_event/presentation/widgets/chat_widget.dart';
import 'package:test_flutter_bnj/features/live_event/presentation/widgets/product_grid_widget.dart';
import 'package:test_flutter_bnj/features/live_event/presentation/widgets/video_player_widget.dart';
import 'package:test_flutter_bnj/injection.dart';

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
      create: (context) => getIt<LiveEventBloc>()
        ..add(LoadLiveEventById(widget.eventId)),
      child: Scaffold(
        appBar: AppBar(title: Text('Live Shopping')),
        body: BlocBuilder<LiveEventBloc, LiveEventState>(
          builder: (context, state) {
            if (state is LiveEventLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (state is LiveEventDetailLoaded) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 900) {
                    return _buildDesktopLayout(state.event, state.viewerCount);
                  } else {
                    return _buildMobileLayout(state.event, state.viewerCount);
                  }
                },
              );
            }

            return Center(child: Text('Error'));
          },
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(LiveEvent event, int viewerCount) {
    return Row(
      children: [
        // Video + Products (70%)
        Expanded(
          flex: 7,
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: VideoPlayerWidget(streamUrl: event.streamUrl),
              ),
              Expanded(
                flex: 4,
                child: ProductGridWidget(products: event.products),
              ),
            ],
          ),
        ),
        // Chat (30%)
        Expanded(
          flex: 3,
          child: ChatWidget(
            key: ValueKey('chat_${event.id}'),
            eventId: event.id,
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(LiveEvent event, int viewerCount) {
    return Column(
      children: [
        Expanded(child: VideoPlayerWidget(streamUrl: event.streamUrl)),
        Expanded(
          child: Column(
            children: [
              TabBar(
                tabs: [
                  Tab(text: 'Chat'),
                  Tab(text: 'Produits'),
                ],
                controller: _tabController,
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
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
