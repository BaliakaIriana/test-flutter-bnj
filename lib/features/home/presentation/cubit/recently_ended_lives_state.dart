part of 'recently_ended_lives_cubit.dart';

abstract class RecentlyEndedLivesState extends Equatable {
  const RecentlyEndedLivesState();

  @override
  List<Object> get props => [];
}

class RecentlyEndedLivesInitial extends RecentlyEndedLivesState {}

class RecentlyEndedLivesLoading extends RecentlyEndedLivesState {}

class RecentlyEndedLivesLoaded extends RecentlyEndedLivesState {
  final List<LiveEvent> events;

  const RecentlyEndedLivesLoaded(this.events);

  @override
  List<Object> get props => [events];
}

class RecentlyEndedLivesError extends RecentlyEndedLivesState {
  final String message;

  const RecentlyEndedLivesError(this.message);

  @override
  List<Object> get props => [message];
}
