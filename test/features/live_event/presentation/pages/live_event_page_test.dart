import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_flutter_bnj/features/live_event/presentation/pages/live_event_page.dart';
import 'package:test_flutter_bnj/features/live_event/presentation/bloc/live_event_bloc.dart';
import 'package:test_flutter_bnj/features/live_event/domain/entities/live_event.dart';
import 'package:test_flutter_bnj/features/live_event/domain/entities/seller.dart';
import 'package:test_flutter_bnj/features/live_event/presentation/widgets/video_player_widget.dart';
import 'package:test_flutter_bnj/injection.dart';

class MockLiveEventBloc extends Mock implements LiveEventBloc {}

void main() {
  group('LiveEventPage', () {
    testWidgets('shows VideoPlayerWidget when status is live', (tester) async {
      final mockBloc = MockLiveEventBloc();

      final event = LiveEvent(
        id: 'evt_live',
        title: 'Live Test',
        description: 'Desc',
        startTime: DateTime.parse('2024-01-15T10:00:00Z'),
        status: LiveEventStatus.live,
        seller: const Seller(id: 'seller_001', name: 'Marie', storeName: 'Store', avatar: 'url'),
        products: const [],
        viewerCount: 100,
        thumbnailUrl: '',
        streamUrl: 'https://example.com/stream.m3u8',
      );

      when(() => mockBloc.state).thenReturn(LiveEventDetailLoaded(event, 100));
      when(() => mockBloc.stream).thenAnswer((_) => Stream<LiveEventState>.value(LiveEventDetailLoaded(event, 100)));

      // Register mock bloc into getIt used by LiveEventPage's internal BlocProvider
      getIt.registerSingleton<LiveEventBloc>(mockBloc);

      await tester.pumpWidget(
        MaterialApp(
          home: LiveEventPage(eventId: 'evt_live'),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(VideoPlayerWidget), findsWidgets);
      expect(find.text('À venir'), findsNothing);
    });

    testWidgets('shows Upcoming banner text when status is scheduled', (tester) async {
      final mockBloc = MockLiveEventBloc();

      final event = LiveEvent(
        id: 'evt_scheduled',
        title: 'Scheduled Test',
        description: 'Desc',
        startTime: DateTime.parse('2024-02-15T10:00:00Z'),
        status: LiveEventStatus.scheduled,
        seller: const Seller(id: 'seller_001', name: 'Marie', storeName: 'Store', avatar: 'url'),
        products: const [],
        viewerCount: 0,
        thumbnailUrl: '',
        streamUrl: null,
      );

      when(() => mockBloc.state).thenReturn(LiveEventDetailLoaded(event, 0));
      when(() => mockBloc.stream).thenAnswer((_) => Stream<LiveEventState>.value(LiveEventDetailLoaded(event, 0)));

      // Replace any previous registration
      if (getIt.isRegistered<LiveEventBloc>()) {
        getIt.unregister<LiveEventBloc>();
      }
      getIt.registerSingleton<LiveEventBloc>(mockBloc);

      await tester.pumpWidget(
        MaterialApp(
          home: LiveEventPage(eventId: 'evt_scheduled'),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('À venir'), findsWidgets);
      expect(find.byType(VideoPlayerWidget), findsNothing);
    });
  });
}
