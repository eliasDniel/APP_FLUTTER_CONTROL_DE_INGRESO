import 'package:flutter/material.dart';
import '../../../config/const/constantes.dart';
import 'chart.dart';
import 'storage_info_card.dart';

class StorageDetails extends StatelessWidget {
  String getPercent(int value) {
    final int total = pint + huella + users + admin;
    if (total == 0) return "0%";
    double percent = (value / total) * 100;
    return "${percent.toStringAsFixed(1)}%";
  }

    double getPercent2(int value) {
    final int total = pint + huella + users + admin;
    if (total == 0) return 0;
    double percent = (value / total) * 100;
    return percent;
  }
  final int pint;
  final int huella;
  final int users;
  final int admin;
  const StorageDetails({super.key, required this.pint, required this.huella, required this.users, required this.admin});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Detalles del monitoreo",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: defaultPadding),
          Chart(values: [getPercent2(pint), getPercent2(huella), getPercent2(users), getPercent2(admin)], totalActividades: pint + huella + users + admin),
          StorageInfoCard(
            svgSrc: "assets/icons/pin.svg",
            title: "Ingresos por PIN",
            amountOfFiles: getPercent(pint),
            numOfFiles: pint,
          ),
          StorageInfoCard(
            svgSrc: "assets/icons/huella.svg",
            title: "Ingresos por Huella",
            amountOfFiles: getPercent(huella),
            numOfFiles: huella,
          ),
          StorageInfoCard(
            svgSrc: "assets/icons/user.svg",
            title: "Usuarios",
            amountOfFiles: getPercent(users),
            numOfFiles: users,
          ),
          StorageInfoCard(
            svgSrc: "assets/icons/admin.svg",
            title: "Administradores",
            amountOfFiles: getPercent(admin),
            numOfFiles: admin,
          ),
        ],
      ),
    );
  }
}
