import 'package:app_flutter_biometry_access/presentation/providers/ingresos/ingresos_provider_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

class MonitoreoView extends StatelessWidget {
  const MonitoreoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Monitoreo en tiempo real',
          style: GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.w400),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const HeroIcon(HeroIcons.signal)),
        ],
      ),
      body: const _ListaRegistros(),
    );
  }
}

class _ListaRegistros extends ConsumerStatefulWidget {
  const _ListaRegistros();

  @override
  _ListaRegistrosState createState() => _ListaRegistrosState();
}

class _ListaRegistrosState extends ConsumerState<_ListaRegistros> {
  @override
  void initState() {
    super.initState();
    ref.read(ingresosRepositoryProvider.notifier).loadIngresosMethod();
  }

  @override
  Widget build(BuildContext context) {
    final ingresos = ref.watch(ingresosRepositoryProvider);
    return RefreshIndicator(
      onRefresh: () async {},
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: ingresos.length,
        itemBuilder: (context, index) {
          final registro = ingresos[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Card(
              child: ListTile(
                title: Text(
                  "${registro.firstName} ${registro.lastName}",
                  style: GoogleFonts.poppins(),
                ),
                subtitle: Text(registro.email, style: GoogleFonts.poppins()),
                leading: registro.metodo == "Huella Digital"
                    ? const Icon(Icons.fingerprint)
                    : const Icon(Icons.dialpad),
                trailing: Text(
                  registro.formatearFechaHora(),
                  style: GoogleFonts.poppins(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
