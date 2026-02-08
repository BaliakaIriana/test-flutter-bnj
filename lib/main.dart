import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter_bnj/core/config/theme_config.dart';
import 'package:test_flutter_bnj/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:test_flutter_bnj/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:test_flutter_bnj/injection.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(
    MultiBlocProvider(
      providers: [

        BlocProvider<AuthBloc>(
          create: (context) => getIt<AuthBloc>()..add(AppStarted()),
        ),

        BlocProvider<CartBloc>(
          create: (context) => getIt<CartBloc>()..add(CartLoad()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Live Shopping',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,themeMode: ThemeMode.light,
      routerConfig: router,
    );
  }
}
