
part of 'live_event_bloc.dart';
abstract class LiveEventEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadLiveEvents extends LiveEventEvent {}

class LoadLiveEventById extends LiveEventEvent {
  final String eventId;
  LoadLiveEventById(this.eventId);

  @override
  List<Object?> get props => [eventId];
}

class JoinLiveEvent extends LiveEventEvent {
  final String eventId;
  final String? currentUserId;
  JoinLiveEvent(this.eventId, {this.currentUserId});

  @override
  List<Object?> get props => [eventId, currentUserId];
}