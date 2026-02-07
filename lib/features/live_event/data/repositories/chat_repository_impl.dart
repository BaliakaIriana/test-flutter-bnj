import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:test_flutter_bnj/features/live_event/data/datasources/live_event_remote_datasource.dart';
import 'package:test_flutter_bnj/features/live_event/data/models/chat_message_model.dart';
import 'package:test_flutter_bnj/features/live_event/domain/entities/chat_message.dart';
import 'package:test_flutter_bnj/features/live_event/domain/repositories/chat_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/exceptions.dart';

@LazySingleton(as: ChatRepository)
class ChatRepositoryImpl implements ChatRepository {
  final LiveEventRemoteDataSource remoteDataSource;

  ChatRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ChatMessage>>> getChatMessages(String eventId) async {
    try {
      final models = await remoteDataSource.getChatMessages(eventId);
      final entities = models.map((model) => model.toEntity()).toList();
      return Right(entities);
    } on ServerException catch (e) {
      Logger().e(e);
      return Left(ServerFailure());
    } catch (e) {
      Logger().e(e);
      return Left(ServerFailure());
    }
  }
}
