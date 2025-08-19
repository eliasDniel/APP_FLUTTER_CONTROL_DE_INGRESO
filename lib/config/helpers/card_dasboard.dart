

import 'package:flutter/material.dart';

import '../const/constantes.dart';

class CloudStorageInfo {
  final String? title, totalStorage;
  final int? numOfFiles, percentage;
  final Color? color;
  final IconData ?iconData;

  CloudStorageInfo({
    this.iconData,
    this.title,
    this.totalStorage,
    this.numOfFiles,
    this.percentage,
    this.color,
  });
}

List demoMyFiles = [
  CloudStorageInfo(
    title: "Huella",
    numOfFiles: 1328,
    iconData: Icons.fingerprint,
    totalStorage: "1.9GB",
    color: primaryColor,
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "PIN",
    numOfFiles: 1328,
    iconData: Icons.dialpad,
    totalStorage: "2.9GB",
    color: const Color(0xFFFFA113),
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "Administradores",
    numOfFiles: 1328,
    iconData: Icons.admin_panel_settings,
    totalStorage: "1GB",
    color: const Color(0xFFA4CDFF),
    percentage: 10,
  ),
  CloudStorageInfo(
    title: "Usuarios",
    numOfFiles: 5328,
    iconData: Icons.person,
    totalStorage: "7.3GB",
    color: const Color(0xFF007EE5),
    percentage: 78,
  ),
];
