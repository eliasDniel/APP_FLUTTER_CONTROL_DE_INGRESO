import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infrastructure/infrastructure.dart';



final metricesInstanceProvider = Provider((ref) {
  return MetricasRepositoryImpl(MetricasDataSourcesImpl());
});
