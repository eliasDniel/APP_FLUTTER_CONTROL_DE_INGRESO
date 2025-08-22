import 'package:app_flutter_biometry_access/domain/entities/metricas.dart';
import 'package:flutter/material.dart';
import '../../../config/const/constantes.dart';
import '../../../config/helpers/card_dasboard.dart';
import '../../../config/helpers/responsive.dart';
import 'file_info_card.dart';

class MyFiles extends StatelessWidget {
  final Metricas myFilesMetrics;
  const MyFiles({super.key, required this.myFilesMetrics});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Mis ingresos",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical:
                      defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text("Agregar"),
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        Responsive(
          mobile: FileInfoCardGridView(
            myFilesMetrics: myFilesMetrics,
            crossAxisCount: size.width < 650 ? 2 : 4,
            childAspectRatio: size.width < 650 && size.width > 350 ? 1.3 : 1,
          ),
          tablet: FileInfoCardGridView(myFilesMetrics: myFilesMetrics),
          desktop: FileInfoCardGridView(
            myFilesMetrics: myFilesMetrics,
            childAspectRatio: size.width < 1400 ? 1.1 : 1.4,
          ),
        ),
      ],
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    super.key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
    required this.myFilesMetrics,
  });
  final Metricas myFilesMetrics;
  final int crossAxisCount;
  final double childAspectRatio;
  String getPercent(int value) {
    final int total =
        myFilesMetrics.registrosPin +
        myFilesMetrics.registrosHuella +
        myFilesMetrics.totalUsuarios +
        myFilesMetrics.registrosEntradaDia;
    if (total == 0) return "0%";
    double percent = (value / total) * 100;
    return "${percent.toStringAsFixed(1)}%";
  }

  double getPercent2(int value) {
    final int total =
        myFilesMetrics.registrosPin +
        myFilesMetrics.registrosHuella +
        myFilesMetrics.totalUsuarios +
        myFilesMetrics.registrosEntradaDia;
    if (total == 0) return 0;
    double percent = (value / total) * 100;
    return percent;
  }

  @override
  Widget build(BuildContext context) {
    List demoMyFiles = [
      CloudStorageInfo(
        title: "Huella",
        numOfFiles: myFilesMetrics.registrosHuella,
        iconData: Icons.fingerprint,
        totalStorage: getPercent(myFilesMetrics.registrosHuella),
        color: primaryColor,
        percentage: getPercent2(myFilesMetrics.registrosHuella).toInt(),
      ),
      CloudStorageInfo(
        title: "PIN",
        numOfFiles: myFilesMetrics.registrosPin,
        iconData: Icons.dialpad,
        totalStorage: getPercent(myFilesMetrics.registrosPin),
        color: const Color(0xFFFFA113),
        percentage: getPercent2(myFilesMetrics.registrosPin).toInt(),
      ),
      CloudStorageInfo(
        title: "Administradores",
        numOfFiles: myFilesMetrics.registrosEntradaDia,
        iconData: Icons.admin_panel_settings,
        totalStorage: getPercent(myFilesMetrics.registrosEntradaDia),
        color: const Color(0xFFA4CDFF),
        percentage: getPercent2(myFilesMetrics.registrosEntradaDia).toInt(),
      ),
      CloudStorageInfo(
        title: "Usuarios",
        numOfFiles: myFilesMetrics.totalUsuarios,
        iconData: Icons.person,
        totalStorage: getPercent(myFilesMetrics.totalUsuarios),
        color: const Color(0xFF007EE5),
        percentage: getPercent2(myFilesMetrics.totalUsuarios).toInt(),
      ),
    ];

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: demoMyFiles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => FileInfoCard(info: demoMyFiles[index]),
    );
  }
}
