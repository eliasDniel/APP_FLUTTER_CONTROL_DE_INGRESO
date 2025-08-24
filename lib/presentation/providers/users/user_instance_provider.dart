
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infrastructure/infrastructure.dart';

final userIntanceProvider = Provider((ref) {
  return UsersRepositoryImpl(datasources: UsersDatasourcesImpl());
});
