import 'package:app_flutter_biometry_access/domain/entities/user.dart';
import 'package:app_flutter_biometry_access/presentation/providers/users/user_instance_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
