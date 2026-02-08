import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';
import 'package:test_flutter_bnj/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:test_flutter_bnj/features/cart/presentation/bloc/cart_bloc.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => getIt.init();

// Cart registrations are handled by injectable annotations. Ensure generated config includes them.
// If manual registration is needed:
// getIt.registerLazySingleton<CartRepository>(() => CartRepositoryImpl());
// getIt.registerFactory(() => CartBloc(getIt<CartRepository>()));
