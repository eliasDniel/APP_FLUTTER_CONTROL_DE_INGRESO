import 'package:app_flutter_biometry_access/domain/entities/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef UserCallBack = Future<List<User>> Function();

class UserNotifier extends StateNotifier<List<User>> {
  UserNotifier({required this.loadUsers}) : super([]);
  bool isLoading = false;
  final UserCallBack loadUsers;


  // Future<vo>
}
