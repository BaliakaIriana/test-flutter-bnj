import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:test_flutter_bnj/features/live_event/domain/entities/live_event.dart';
import 'package:test_flutter_bnj/features/live_event/domain/usecases/get_recently_ended_events.dart';

part 'recently_ended_lives_state.dart';

@injectable
class RecentlyEndedLivesCubit extends Cubit<RecentlyEndedLivesState> {
  final GetRecentlyEndedEvents getRecentlyEndedEvents;

  RecentlyEndedLivesCubit(this.getRecentlyEndedEvents) : super(RecentlyEndedLivesInitial());

  Future<void> loadEvents() async {
    emit(RecentlyEndedLivesLoading());
    final result = await getRecentlyEndedEvents();
    result.fold(
      (failure) => emit(const RecentlyEndedLivesError('Impossible de charger les lives terminés.')),
      (events) => emit(RecentlyEndedLivesLoaded(events)),
    );
  }
}
