
part of 'live_event_bloc.dart';

abstract class LiveEventState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LiveEventInitial extends LiveEventState {}

class LiveEventLoading extends LiveEventState {}

class LiveEventLoaded extends LiveEventState {
  final List<LiveEvent> events;
  LiveEventLoaded(this.events);

  @override
  List<Object?> get props => [events];
}

class LiveEventDetailLoaded extends LiveEventState {
  final LiveEvent event;
  final int viewerCount;

  LiveEventDetailLoaded(this.event, this.viewerCount);

  @override
  List<Object?> get props => [event, viewerCount];
}

class LiveEventError extends LiveEventState {
  final String message;
  LiveEventError(this.message);

  @override
  List<Object?> get props => [message];
}