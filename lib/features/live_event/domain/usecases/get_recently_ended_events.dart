import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/live_event.dart';
import '../repositories/live_event_repository.dart';

@injectable
class GetRecentlyEndedEvents {
  final LiveEventRepository repository;

  GetRecentlyEndedEvents(this.repository);

  Future<Either<Failure, List<LiveEvent>>> call() async {
    return await repository.getRecentlyEndedEvents();
  }
}
