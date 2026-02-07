import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:test_flutter_bnj/features/live_event/domain/entities/product.dart';
import 'package:test_flutter_bnj/features/live_event/domain/entities/live_event.dart';
import 'package:test_flutter_bnj/features/live_event/domain/repositories/live_event_repository.dart';
import 'package:test_flutter_bnj/features/live_event/data/models/live_event_model.dart';
import 'package:test_flutter_bnj/features/live_event/data/models/product_model.dart';
import 'package:test_flutter_bnj/features/live_event/data/datasources/live_event_remote_datasource.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/exceptions.dart';

@LazySingleton(as: LiveEventRepository)
class LiveEventRepositoryImpl implements LiveEventRepository {
  final LiveEventRemoteDataSource remoteDataSource;

  LiveEventRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<LiveEvent>>> getLiveEvents() async {
    try {
      final List<LiveEventModel> models = await remoteDataSource.getLiveEvents();
      final productModels = await remoteDataSource.getProducts();
      final products = productModels.map((m) => m.toEntity()).toList();

      final entities = models.map((model) {
        final List<String> modelProductIds = model.products;
        final resolvedProducts = products
            .where((p) => modelProductIds.contains(p.id))
            .toList();

        Product? resolvedFeaturedProduct;
        final String? featuredId = model.featuredProduct;
        if (featuredId != null) {
          try {
            resolvedFeaturedProduct = products.firstWhere(
              (p) => p.id == featuredId
            );
          } catch (_) {}
        }

        return model.toEntity(
          resolvedProducts: resolvedProducts,
          resolvedFeaturedProduct: resolvedFeaturedProduct,
        );
      }).toList();

      return Right(entities);
    } on ServerException catch (e) {
      Logger().e(e);
      return Left(ServerFailure());
    } catch (e) {
      Logger().e(e);
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, LiveEvent>> getLiveEventById(String id) async {
    try {
      final LiveEventModel model = await remoteDataSource.getLiveEventById(id);
      final productModels = await remoteDataSource.getProducts();
      final products = productModels.map((m) => m.toEntity()).toList();

      final List<String> modelProductIds = model.products;
      final resolvedProducts = products
          .where((p) => modelProductIds.contains(p.id))
          .toList();

      Product? resolvedFeaturedProduct;
      final String? featuredId = model.featuredProduct;
      if (featuredId != null) {
        try {
          resolvedFeaturedProduct = products.firstWhere(
            (p) => p.id == featuredId
          );
        } catch (_) {}
      }

      return Right(model.toEntity(
        resolvedProducts: resolvedProducts,
        resolvedFeaturedProduct: resolvedFeaturedProduct,
      ));
    } on ServerException catch (e) {
      Logger().e(e);
      return Left(ServerFailure());
    } catch (e) {
      Logger().e(e);
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<LiveEvent>>> getLiveNowEvents() async {
    final result = await getLiveEvents();
    return result.map((events) =>
        events.where((event) => event.status == LiveEventStatus.live).toList());
  }

  @override
  Future<Either<Failure, List<LiveEvent>>> getRecentlyEndedEvents() async {
    final result = await getLiveEvents();
    return result.map((events) =>
        events.where((event) => event.status == LiveEventStatus.ended).toList());
  }

  @override
  Future<Either<Failure, List<LiveEvent>>> getUpcomingEvents() async {
    final result = await getLiveEvents();
    return result.map((events) =>
        events.where((event) => event.status == LiveEventStatus.scheduled).toList());
  }
}