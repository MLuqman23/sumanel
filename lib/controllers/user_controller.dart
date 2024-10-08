import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sumanel/services/user_services.dart';
import '../models/user_model.dart';
// import '../services/user_service.dart';

final userProvider = FutureProvider<List<User>>((ref) async {
  final userService = UserService();
  return userService.fetchUsers();
});
