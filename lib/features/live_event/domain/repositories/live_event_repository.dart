import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/live_event.dart';

abstract class LiveEventRepository {
  Future<Either<Failure, List<LiveEvent>>> getLiveEvents();
  Future<Either<Failure, List<LiveEvent>>> getLiveNowEvents();
  Future<Either<Failure, List<LiveEvent>>> getRecentlyEndedEvents();
  Future<Either<Failure, List<LiveEvent>>> getUpcomingEvents();
  Future<Either<Failure, LiveEvent>> getLiveEventById(String id);
}