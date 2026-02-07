import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/live_event.dart';
import '../repositories/live_event_repository.dart';

@injectable
class GetLiveEvents {
  final LiveEventRepository repository;

  GetLiveEvents(this.repository);

  Future<Either<Failure, List<LiveEvent>>> call() async {
    return await repository.getLiveNowEvents();
  }
}
