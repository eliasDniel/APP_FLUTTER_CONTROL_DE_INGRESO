import 'package:app_flutter_biometry_access/domain/entities/entrada.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../config/const/constantes.dart';


class RecentFiles extends StatelessWidget {
  final List<Ingreso> ingresos;
  const RecentFiles({super.key, required this.ingresos});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Ultimos ingresos",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  context.go('/home/1');
                },
                child: const Text("Ver todos"),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columnSpacing: defaultPadding,
              // minWidth: 600,
              columns: const [
                DataColumn(label: Text("Metodo")),
                DataColumn(label: Text("Nombre")),
                DataColumn(label: Text("hora")),
              ],
              rows: List.generate(
                ingresos.length,
                (index) => recentFileDataRow(ingresos[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(Ingreso ingreso) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            SvgPicture.asset("assets/icons/${ingreso.metodo == "Huella Digital" ? "huella" : "pin"}.svg", height: 25, width: 25, color: Colors.white),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(ingreso.metodo == "Huella Digital" ? "Huella" : "Pin"),
            ),
          ],
        ),
      ),
      DataCell(Text(ingreso.username)),
      DataCell(Text(ingreso.formatearFechaHora())),
    ],
  );
}
