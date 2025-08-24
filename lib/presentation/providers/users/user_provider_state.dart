
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/domain.dart';
import '../providers.dart';

final userRepositoryProvider = StateNotifierProvider<UserNotifier, List<User>>((
  ref,
) {
  final userRepository = ref.watch(userIntanceProvider);
  return UserNotifier(loadUsers: userRepository.getNowUsers);
});

typedef UserVoidCallBack = Future<List<User>> Function();

class UserNotifier extends StateNotifier<List<User>> {
  bool isLoading = false;
  final UserVoidCallBack loadUsers;

  UserNotifier({required this.loadUsers}) : super([]);

  Future<void> loadUserMethod() async {
    if (isLoading) return;
    isLoading = true;
    final users = await loadUsers();
    state = [...state, ...users];
    isLoading = false;
  }
}
