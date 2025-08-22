

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

