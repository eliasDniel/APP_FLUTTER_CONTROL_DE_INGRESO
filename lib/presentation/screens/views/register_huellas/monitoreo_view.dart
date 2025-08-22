import 'package:animate_do/animate_do.dart';
import 'package:app_flutter_biometry_access/domain/entities/entrada.dart';
import 'package:app_flutter_biometry_access/presentation/providers/ingresos/ingresos_provider_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../../config/const/constantes.dart';

class MonitoreoView extends ConsumerStatefulWidget {
  const MonitoreoView({super.key});

  @override
  MonitoreoViewState createState() => MonitoreoViewState();
}

class MonitoreoViewState extends ConsumerState<MonitoreoView>
    with AutomaticKeepAliveClientMixin {
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
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {},
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: ingresos.length,
            itemBuilder: (context, index) {
              final registro = ingresos[index];
              return CustomMonitoreo(registro: registro);
            },
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class CustomMonitoreo extends StatelessWidget {
  const CustomMonitoreo({
    super.key,
    required this.registro,
  });

  final Ingreso registro;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 8),
        decoration:  BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.white10, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
             Image.asset( "assets/images/${registro.isAdmin ? 'admin':'user'}.png", width: 50, height: 50),
             const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ingreso detectado",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${registro.firstName} ${registro.lastName}',
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    registro.email,
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600,color: Colors.white54),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(registro.formatearFechaHora(),style: const TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 5),
                  SvgPicture.asset("assets/icons/${registro.metodo == "Huella Digital" ? "huella" : "pin"}.svg", height: 35, width: 35, color: Colors.white),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
