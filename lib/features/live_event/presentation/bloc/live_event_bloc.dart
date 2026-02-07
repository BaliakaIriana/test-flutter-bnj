import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:test_flutter_bnj/features/live_event/data/datasources/mock_socket_service.dart';
import 'package:test_flutter_bnj/features/live_event/domain/entities/live_event.dart';
import 'package:test_flutter_bnj/features/live_event/domain/repositories/live_event_repository.dart';
import 'package:test_flutter_bnj/features/live_event/domain/usecases/get_live_events.dart';

part 'live_event_event.dart';
part 'live_event_state.dart';

@injectable
class LiveEventBloc extends Bloc<LiveEventEvent, LiveEventState> {
  final GetLiveEvents getLiveEvents;
  final LiveEventRepository repository;
  final MockSocketService socketService;

  LiveEventBloc({
    required this.getLiveEvents,
    required this.repository,
    required this.socketService,
  }) : super(LiveEventInitial()) {
    on<LoadLiveEvents>(_onLoadLiveEvents);
    on<LoadLiveEventById>(_onLoadLiveEventById);
    on<JoinLiveEvent>(_onJoinLiveEvent);
  }

  Future<void> _onLoadLiveEvents(
      LoadLiveEvents event,
      Emitter<LiveEventState> emit,
      ) async {
    emit(LiveEventLoading());

    final result = await getLiveEvents();

    result.fold(
          (failure) => emit(LiveEventError('Failed to load events')),
          (events) => emit(LiveEventLoaded(events)),
    );
  }

  Future<void> _onLoadLiveEventById(
      LoadLiveEventById event,
      Emitter<LiveEventState> emit,
      ) async {
    emit(LiveEventLoading());

    final result = await repository.getLiveEventById(event.eventId);

    result.fold(
          (failure) => emit(LiveEventError('Failed to load event')),
          (liveEvent) => emit(LiveEventDetailLoaded(liveEvent, liveEvent.viewerCount)),
    );
  }

  Future<void> _onJoinLiveEvent(
      JoinLiveEvent event,
      Emitter<LiveEventState> emit,
      ) async {
    socketService.joinLiveEvent(event.eventId, currentUserId: event.currentUserId);

    // Listen to viewer count updates
    await emit.forEach(
      socketService.viewerCount,
      onData: (count) {
        if (state is LiveEventDetailLoaded) {
          final currentState = state as LiveEventDetailLoaded;
          return LiveEventDetailLoaded(currentState.event, count);
        }
        return state;
      },
    );
  }
}