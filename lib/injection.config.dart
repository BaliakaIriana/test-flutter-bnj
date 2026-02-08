// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:test_flutter_bnj/features/auth/data/datasources/user_remote_datasource.dart'
    as _i422;
import 'package:test_flutter_bnj/features/auth/data/repositories/user_repository_impl.dart'
    as _i397;
import 'package:test_flutter_bnj/features/auth/domain/repositories/user_repository.dart'
    as _i56;
import 'package:test_flutter_bnj/features/auth/presentation/bloc/auth_bloc.dart'
    as _i923;
import 'package:test_flutter_bnj/features/cart/data/repositories/cart_repository_impl.dart'
    as _i475;
import 'package:test_flutter_bnj/features/cart/domain/repositories/cart_repository.dart'
    as _i262;
import 'package:test_flutter_bnj/features/cart/presentation/bloc/cart_bloc.dart'
    as _i714;
import 'package:test_flutter_bnj/features/home/presentation/cubit/recently_ended_lives_cubit.dart'
    as _i529;
import 'package:test_flutter_bnj/features/home/presentation/cubit/upcoming_events_cubit.dart'
    as _i113;
import 'package:test_flutter_bnj/features/live_event/data/datasources/live_event_remote_datasource.dart'
    as _i1053;
import 'package:test_flutter_bnj/features/live_event/data/datasources/mock_socket_service.dart'
    as _i99;
import 'package:test_flutter_bnj/features/live_event/data/repositories/chat_repository_impl.dart'
    as _i355;
import 'package:test_flutter_bnj/features/live_event/data/repositories/live_event_repository_impl.dart'
    as _i141;
import 'package:test_flutter_bnj/features/live_event/domain/repositories/chat_repository.dart'
    as _i456;
import 'package:test_flutter_bnj/features/live_event/domain/repositories/live_event_repository.dart'
    as _i1020;
import 'package:test_flutter_bnj/features/live_event/domain/usecases/get_live_events.dart'
    as _i611;
import 'package:test_flutter_bnj/features/live_event/domain/usecases/get_recently_ended_events.dart'
    as _i951;
import 'package:test_flutter_bnj/features/live_event/domain/usecases/get_upcoming_events.dart'
    as _i780;
import 'package:test_flutter_bnj/features/live_event/presentation/bloc/live_event_bloc.dart'
    as _i725;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i923.AuthBloc>(() => _i923.AuthBloc());
    gh.lazySingleton<_i1053.LiveEventRemoteDataSource>(
      () => _i1053.LiveEventRemoteDataSourceImpl(),
    );
    gh.lazySingleton<_i422.UserRemoteDataSource>(
      () => _i422.UserRemoteDataSourceImpl(),
    );
    gh.lazySingleton<_i262.CartRepository>(() => _i475.CartRepositoryImpl());
    gh.lazySingleton<_i456.ChatRepository>(
      () => _i355.ChatRepositoryImpl(
        remoteDataSource: gh<_i1053.LiveEventRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i1020.LiveEventRepository>(
      () => _i141.LiveEventRepositoryImpl(
        remoteDataSource: gh<_i1053.LiveEventRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i56.UserRepository>(
      () => _i397.UserRepositoryImpl(gh<_i422.UserRemoteDataSource>()),
    );
    gh.lazySingleton<_i99.MockSocketService>(
      () => _i99.MockSocketService(
        gh<_i1020.LiveEventRepository>(),
        gh<_i56.UserRepository>(),
        gh<_i456.ChatRepository>(),
      ),
    );
    gh.factory<_i714.CartBloc>(
      () => _i714.CartBloc(gh<_i262.CartRepository>()),
    );
    gh.factory<_i611.GetLiveEvents>(
      () => _i611.GetLiveEvents(gh<_i1020.LiveEventRepository>()),
    );
    gh.factory<_i951.GetRecentlyEndedEvents>(
      () => _i951.GetRecentlyEndedEvents(gh<_i1020.LiveEventRepository>()),
    );
    gh.factory<_i780.GetUpcomingEvents>(
      () => _i780.GetUpcomingEvents(gh<_i1020.LiveEventRepository>()),
    );
    gh.factory<_i529.RecentlyEndedLivesCubit>(
      () => _i529.RecentlyEndedLivesCubit(gh<_i951.GetRecentlyEndedEvents>()),
    );
    gh.factory<_i113.UpcomingEventsCubit>(
      () => _i113.UpcomingEventsCubit(gh<_i780.GetUpcomingEvents>()),
    );
    gh.factory<_i725.LiveEventBloc>(
      () => _i725.LiveEventBloc(
        getLiveEvents: gh<_i611.GetLiveEvents>(),
        repository: gh<_i1020.LiveEventRepository>(),
        socketService: gh<_i99.MockSocketService>(),
      ),
    );
    return this;
  }
}
