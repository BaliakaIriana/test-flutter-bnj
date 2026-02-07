import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_flutter_bnj/features/home/presentation/pages/home_page.dart';
import 'package:test_flutter_bnj/features/live_event/presentation/bloc/live_event_bloc.dart';
import 'package:test_flutter_bnj/features/live_event/presentation/pages/live_event_page.dart';
import 'package:test_flutter_bnj/injection.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) =>
          BlocProvider(
            create: (context) => getIt<LiveEventBloc>()..add(LoadLiveEvents()),
            child: HomePage(),
          ),
      routes: [

        GoRoute(
          path: '/live/:eventId',
          builder: (context, state) {
            final eventId = state.pathParameters['eventId']!;
            return LiveEventPage(eventId: eventId);
          },
        ),
      ]
    ),
  ],
);