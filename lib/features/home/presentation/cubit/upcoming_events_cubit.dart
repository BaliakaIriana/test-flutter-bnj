import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:test_flutter_bnj/features/live_event/domain/entities/live_event.dart';
import 'package:test_flutter_bnj/features/live_event/domain/usecases/get_upcoming_events.dart';

part 'upcoming_events_state.dart';

@injectable
class UpcomingEventsCubit extends Cubit<UpcomingEventsState> {
  final GetUpcomingEvents getUpcomingEvents;

  UpcomingEventsCubit(this.getUpcomingEvents) : super(UpcomingEventsInitial());

  Future<void> loadEvents() async {
    emit(UpcomingEventsLoading());
    final result = await getUpcomingEvents();
    result.fold(
      (failure) => emit(const UpcomingEventsError('Impossible de charger les lives à venir.')),
      (events) => emit(UpcomingEventsLoaded(events)),
    );
  }
}
