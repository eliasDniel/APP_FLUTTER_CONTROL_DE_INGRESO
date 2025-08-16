import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';
import '../../../providers/registro_users_entradas.dart/registero_entradas.dart';
import '../home_screen.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final registroProvider = Provider.of<RegistroProvider>(context);
    return Scaffold(
      body: _BodyDasboard(
        registroProvider: registroProvider,
      ),
    );
  }
}

class _BodyDasboard extends StatefulWidget {
  final RegistroProvider registroProvider;
  const _BodyDasboard({
    required this.registroProvider,
  });

  @override
  State<_BodyDasboard> createState() => _BodyDasboardState();
}

class _BodyDasboardState extends State<_BodyDasboard> {
  @override
  void initState() {
    super.initState();
    widget.registroProvider.obtenerMtericas();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.registroProvider.isLoadingMetricas) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              Text(
                'Cargando...',
                style: GoogleFonts.poppins(fontSize: 16),
              ),
            ],
          ),
        ),
      );
    }

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(
            'Dasboard',
            style:
                GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.w400),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  context.push('/home/0/notification');
                },
                icon: const HeroIcon(HeroIcons.bell)),
          ],
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const SizedBox(height: 15),
                Text(
                  'Project Summary',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500, fontSize: 18),
                ),
                const SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomDateDasboard(
                          color: Colors.purple.shade300,
                          descrip: 'Ingresos por huella',
                          number:
                              '${widget.registroProvider.ingresosPorHuella}',
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        CustomDateDasboard(
                          color: Colors.pink.shade200,
                          descrip: 'Ingresos por PIN',
                          number: '${widget.registroProvider.ingresosPorPIN}',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        CustomDateDasboard(
                          color: Colors.orange.shade300,
                          descrip: 'Administradores',
                          number: '${widget.registroProvider.admin}',
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        CustomDateDasboard(
                          color: Colors.green.shade200,
                          descrip: 'Users',
                          number: '${widget.registroProvider.userNormales}',
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Project Statistics',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500, fontSize: 18),
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 290, // 👈 le damos altura para evitar el error
                  child: CustomBarChart(),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(children: [
              CustomDateFinales(
                  descrip: 'Total de Usuarios',
                  number:
                      '${'${widget.registroProvider.totalUsuarios}'} usuarios'),
              const SizedBox(
                width: 5,
              ),
              CustomDateFinales(
                  descrip: 'Total de ingresos',
                  number:
                      '${'${widget.registroProvider.totalIngresos}'} ingresos por hoy'),
            ]),
          ),
        )
      ],
    );
  }
}
