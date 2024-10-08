// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../services/auth_service.dart';

// final authProvider =
//     StateNotifierProvider<AuthController, AuthState>((ref) => AuthController());

// class AuthState {
//   final bool isLoading;
//   final String? error;
//   final bool isAuthenticated;

//   AuthState({this.isLoading = false, this.error, this.isAuthenticated = false});
// }

// class AuthController extends StateNotifier<AuthState> {
//   final AuthService _authService = AuthService();

//   AuthController() : super(AuthState());

//   Future<void> signUp(String email, String password) async {
//     state = AuthState(isLoading: true);
//     final response = await _authService.signUp(email, password);
//     if (response.containsKey('token')) {
//       state = AuthState(isAuthenticated: true);
//     } else {
//       state = AuthState(error: response['error']);
//     }
//   }

//   Future<void> login(String email, String password) async {
//     state = AuthState(isLoading: true);
//     final response = await _authService.login(email, password);
//     if (response.containsKey('token')) {
//       state = AuthState(isAuthenticated: true);
//     } else {
//       state = AuthState(error: response['error']);
//     }
//   }
// }

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/auth_service.dart';

final authProvider =
    StateNotifierProvider<AuthController, AuthState>((ref) => AuthController());

class AuthState {
  final bool isLoading;
  final String? error;
  final bool isAuthenticated;

  AuthState({this.isLoading = false, this.error, this.isAuthenticated = false});
}

class AuthController extends StateNotifier<AuthState> {
  final AuthService _authService = AuthService();

  AuthController() : super(AuthState());

  Future<void> signUp(String email, String password) async {
    state = AuthState(isLoading: true);
    final response = await _authService.signUp(email, password);
    if (response.containsKey('token')) {
      state = AuthState(isAuthenticated: true);
    } else {
      state = AuthState(error: response['error']);
    }
  }

  Future<void> login(String email, String password) async {
    state = AuthState(isLoading: true);
    final response = await _authService.login(email, password);
    if (response.containsKey('token')) {
      state = AuthState(isAuthenticated: true);
    } else {
      state = AuthState(error: response['error']);
    }
  }
}
