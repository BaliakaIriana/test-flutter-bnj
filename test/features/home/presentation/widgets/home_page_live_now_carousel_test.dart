import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_flutter_bnj/features/home/presentation/widgets/home_page_live_now_carousel.dart';
import 'package:test_flutter_bnj/features/live_event/presentation/bloc/live_event_bloc.dart';
import 'package:test_flutter_bnj/features/live_event/domain/entities/live_event.dart';
import 'package:test_flutter_bnj/features/live_event/domain/entities/seller.dart';

class MockLiveEventBloc extends Mock implements LiveEventBloc {}

void main() {
  testWidgets('HomePageLiveNowCarousel shows one card with exact title', (tester) async {
    final mockBloc = MockLiveEventBloc();

    final event = LiveEvent(
      id: 'evt_001',
      title: 'Vente Flash',
      description: 'Desc',
      startTime: DateTime.parse('2024-01-15T10:00:00Z'),
      status: LiveEventStatus.live,
      seller: Seller(id: 'seller_001', name: 'Marie', storeName: 'Store', avatar: 'url'),
      products: const [],
      viewerCount: 100,
      thumbnailUrl: '',
      streamUrl: null,
    );

    when(() => mockBloc.state).thenReturn(LiveEventLoaded([event]));
    when(() => mockBloc.stream).thenAnswer((_) => Stream<LiveEventState>.value(LiveEventLoaded([event])));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<LiveEventBloc>.value(
          value: mockBloc,
          child: const Scaffold(body: HomePageLiveNowCarousel()),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('En direct maintenant'), findsOneWidget);
    expect(find.text('Vente Flash'), findsOneWidget);
  });
}
