import 'package:app_flutter_biometry_access/domain/entities/entrada.dart';
import 'package:app_flutter_biometry_access/presentation/providers/ingreso_intance_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ingresosRepositoryProvider =
    StateNotifierProvider<IngresosNotifier, List<Ingreso>>((ref) {
      final ingresosProvider = ref.watch(ingresosIntanceProvider);
      return IngresosNotifier(loadIngresos: ingresosProvider.getNowIngresos);
    });

typedef IngresosCallBack = Future<List<Ingreso>> Function();

class IngresosNotifier extends StateNotifier<List<Ingreso>> {
  final IngresosCallBack loadIngresos;
  bool isLoading = false;
  IngresosNotifier({required this.loadIngresos}) : super([]);

  Future<void> loadIngresosMethod() async {
    if (isLoading) return;
    isLoading = true;
    final ingresos = await loadIngresos();
    state = [...state, ...ingresos];
    isLoading = false;
  }
}
