part of 'upcoming_events_cubit.dart';

abstract class UpcomingEventsState extends Equatable {
  const UpcomingEventsState();

  @override
  List<Object> get props => [];
}

class UpcomingEventsInitial extends UpcomingEventsState {}

class UpcomingEventsLoading extends UpcomingEventsState {}

class UpcomingEventsLoaded extends UpcomingEventsState {
  final List<LiveEvent> events;

  const UpcomingEventsLoaded(this.events);

  @override
  List<Object> get props => [events];
}

class UpcomingEventsError extends UpcomingEventsState {
  final String message;

  const UpcomingEventsError(this.message);

  @override
  List<Object> get props => [message];
}
