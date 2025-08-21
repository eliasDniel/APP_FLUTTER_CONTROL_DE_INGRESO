import 'package:animate_do/animate_do.dart';
import 'package:app_flutter_biometry_access/presentation/providers/ingresos/ingresos_provider_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

class MonitoreoView extends ConsumerStatefulWidget {
  const MonitoreoView({super.key});

  @override
  MonitoreoViewState createState() => MonitoreoViewState();
}

class MonitoreoViewState extends ConsumerState<MonitoreoView> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    ref.read(ingresosRepositoryProvider.notifier).loadIngresosMethod();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final ingresos = ref.watch(ingresosRepositoryProvider);
    final isLoading = ref.watch(ingresosRepositoryProvider.notifier).isLoading;
    if (isLoading) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              Text(
                'Cargando datos...',
                style: GoogleFonts.poppins(fontSize: 16),
              ),
            ],
          ),
        ),
      );
    }
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
      body: RefreshIndicator(
        onRefresh: () async {},
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: ingresos.length,
          itemBuilder: (context, index) {
            final registro = ingresos[index];
            return FadeInUp(
              child: Padding(
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
              ),
            );
          },
        ),
      ),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}

