import 'package:flaury_business/app/authentication/repositories/auth_repository.dart';
import 'package:flaury_business/services/shared_preference_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum AuthStatus {
  inital,
  loading,
  error,
  success,
}

class AuthState {
  final AuthStatus status;
  final String message;

  AuthState({
    required this.status,
    this.message = '',
  });

  factory AuthState.initial() {
    return AuthState(
      status: AuthStatus.inital,
      message: '',
    );
  }

  factory AuthState.loading() {
    return AuthState(
      status: AuthStatus.loading,
      message: '',
    );
  }
  factory AuthState.error(String message) {
    return AuthState(
      status: AuthStatus.error,
      message: message,
    );
  }
  factory AuthState.success(String message) {
    return AuthState(
      status: AuthStatus.success,
      message: message,
    );
  }
}

final authControllerProvider =
    StateNotifierProvider<AuthController, AuthState>((ref) {
  return AuthController(
      ref.read(
        authrepositoryProvider,
      ),
      ref.read(authTokenManagerProvider));
});

class AuthController extends StateNotifier<AuthState> {
  final AuthRepository authRepository;
  final AuthTokenManager _authTokenManager;
  AuthController(this.authRepository, this._authTokenManager)
      : super(AuthState.initial());

  Future<void> signUp(String email, String password, String firstName,
      String lastName, String userName) async {
    state = AuthState.loading();
    try {
      final response = await authRepository.signUp(
        email,
        password,
        firstName,
        lastName,
        userName,
      );
      // save tokens to secure storage
      await _authTokenManager.saveAuthToken(response.accessToken);
      await _authTokenManager.saveRefreshAuthToken(response.refreshToken);
      state = AuthState.success(response.message);
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> login(String email, String password) async {
    state = AuthState.loading();
    try {
      final response = await authRepository.login(email, password);
      state = AuthState.success(response.responseDescription);
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }
}
