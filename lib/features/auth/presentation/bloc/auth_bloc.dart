import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AppStarted>(_onAppStarted);
  }

  void _onAppStarted(AppStarted event, Emitter<AuthState> emit) {
    // Mocking user for now
    final mockUser = User(
      id: "user_001",
      email: "alice@example.com",
      name: "Alice Martin",
      avatar: "https://i.pravatar.cc/150?img=5",
      createdAt: DateTime.parse("2023-12-01T00:00:00Z"),
    );

    emit(Authenticated(mockUser));
  }
}
