import 'package:app_flutter_biometry_access/domain/entities/metricas.dart';
import 'package:app_flutter_biometry_access/presentation/providers/metricas/metrices_instance_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final metricesProvider = StateNotifierProvider<MetricasNotifier, Metricas>((
  ref,
) {
  return MetricasNotifier(
    loadMetricasCallback: ref.read(metricesInstanceProvider).getMetricas,
  );
});

typedef MetricasCallback = Future<Metricas> Function();

class MetricasNotifier extends StateNotifier<Metricas> {
  final MetricasCallback loadMetricasCallback;

  MetricasNotifier({required this.loadMetricasCallback})
    : super(
        Metricas(
          registrosEntradaDia: 0,
          totalUsuarios: 0,
          registrosHuella: 0,
          registrosPin: 0,
          ultimos10: [],
        ),
      );
  bool isLoading = false;

  Future<void> loadMetricas() async {
    isLoading = true;
    state = await loadMetricasCallback();
    isLoading = false;
  }
}
