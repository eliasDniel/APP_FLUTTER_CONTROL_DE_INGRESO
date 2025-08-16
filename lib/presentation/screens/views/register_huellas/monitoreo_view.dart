
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';

import '../../../providers/registro_users_entradas.dart/registero_entradas.dart';


class MonitoreoView extends StatelessWidget {
  const MonitoreoView({super.key});

  @override
  Widget build(BuildContext context) {
    final registroProvider = Provider.of<RegistroProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Monitoreo en tiempo real',
          style: GoogleFonts.poppins(
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const HeroIcon(HeroIcons.signal),
          ),
        ],
      ),
      body: _ListaRegistros(registroProvider: registroProvider),
    );
  }
}

class _ListaRegistros extends StatefulWidget {
  final RegistroProvider registroProvider;
  const _ListaRegistros({required this.registroProvider});

  @override
  State<_ListaRegistros> createState() => _ListaRegistrosState();
}

class _ListaRegistrosState extends State<_ListaRegistros> {
  @override
  void initState() {
    super.initState();
    widget.registroProvider.obtenerRegistros();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.registroProvider.isLoading &&
        widget.registroProvider.listaMonitoreo.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              Text(
                'Cargando registros...',
                style: GoogleFonts.poppins(fontSize: 16),
              ),
            ],
          ),
        ),
      );
    }

    if (!widget.registroProvider.isLoading &&
        widget.registroProvider.listaMonitoreo.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Text(
            'No hay registros aún 😶‍🌫️',
            style: GoogleFonts.poppins(fontSize: 16),
          ),
        ),
      );
    }

        return RefreshIndicator(
          onRefresh: () async {
        widget.registroProvider.inicializar();
        widget.registroProvider.obtenerRegistros();
          },
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
        itemCount: widget.registroProvider.listaMonitoreo.length,
            itemBuilder: (context, index) {
          final registro = widget.registroProvider.listaMonitoreo[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Card(
                  child: ListTile(
                title: Text("${registro.firstName} ${registro.lastName}",style: GoogleFonts.poppins(),),
                subtitle: Text(registro.email,style: GoogleFonts.poppins(),),
                    leading: registro.metodo == "Huella Digital"
                        ? const Icon(Icons.fingerprint)
                        : const Icon(Icons.dialpad),
                trailing: Text(registro.formatearFechaHora(),style: GoogleFonts.poppins(),),
                  ),
                ),
              );
            },
          ),
        );
  }
}
