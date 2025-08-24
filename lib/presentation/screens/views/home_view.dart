

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../config/config.dart';
import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    ref.read(metricesProvider.notifier).loadMetricas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    
    final registroProvider = ref.watch(metricesProvider);
    final isLoading = ref.watch(metricesProvider.notifier).isLoading;
    if (isLoading) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              Text('Cargando...', style: GoogleFonts.poppins(fontSize: 16)),
            ],
          ),
        ),
      );
    }

    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const Header(),
            const SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      MyFiles(myFilesMetrics: registroProvider),
                      const SizedBox(height: defaultPadding),
                      RecentFiles(ingresos: registroProvider.ultimos10),
                      if (Responsive.isMobile(context))
                        const SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context)) StorageDetails(admin: registroProvider.registrosEntradaDia, huella: registroProvider.registrosHuella, users: registroProvider.totalUsuarios, pint: registroProvider.registrosPin),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  const SizedBox(width: defaultPadding),
                // On Mobile means if the screen is less than 850 we don't want to show it
                if (!Responsive.isMobile(context))
                  Expanded(flex: 2, child: StorageDetails(
                    admin: registroProvider.registrosEntradaDia,
                    huella: registroProvider.registrosHuella,
                    users: registroProvider.totalUsuarios,
                    pint: registroProvider.registrosPin,
                  )),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}

