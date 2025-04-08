import 'package:flutter/material.dart';

import '../constants.dart';

class CloudStorageInfo {
  final String? svgSrc, title, totalStorage;
  final int? numOfFiles, percentage;
  final Color? color;

  CloudStorageInfo({
    this.svgSrc,
    this.title,
    this.totalStorage,
    this.numOfFiles,
    this.percentage,
    this.color,
  });
}

List demoMyFiles = [
  CloudStorageInfo(
    title: "Documents",
    numOfFiles: 1328,
    svgSrc: "assets/icons/Documents.svg",
    totalStorage: "1.9GB",
    color: primaryColorDark,
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "Google Drive",
    numOfFiles: 1328,
    svgSrc: "assets/icons/google_drive.svg",
    totalStorage: "2.9GB",
    color: const Color(0xFFFFA113),
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "One Drive",
    numOfFiles: 1328,
    svgSrc: "assets/icons/one_drive.svg",
    totalStorage: "1GB",
    color: const Color(0xFFA4CDFF),
    percentage: 10,
  ),
  CloudStorageInfo(
    title: "Dropbox",
    numOfFiles: 5328,
    svgSrc: "assets/icons/drop_box.svg",
    totalStorage: "7.3GB",
    color: Color(0xFF007EE5),
    percentage: 78,
  ),
  CloudStorageInfo(
    title: "Products",
    numOfFiles: 5328,
    svgSrc: "assets/icons/card.svg",
    totalStorage: "7.3GB",
    color: const Color.fromARGB(255, 229, 0, 0),
    percentage: 50,
  ),
  CloudStorageInfo(
    title: "Photos",
    numOfFiles: 2432,
    svgSrc: "assets/icons/photos.svg",
    totalStorage: "5.2GB",
    color: const Color(0xFFFFC300),
    percentage: 60,
  ),
  CloudStorageInfo(
    title: "Videos",
    numOfFiles: 1120,
    svgSrc: "assets/icons/videos.svg",
    totalStorage: "10GB",
    color: const Color(0xFF4CAF50),
    percentage: 85,
  ),
  CloudStorageInfo(
    title: "Music",
    numOfFiles: 3400,
    svgSrc: "assets/icons/music.svg",
    totalStorage: "3.5GB",
    color: const Color(0xFF9C27B0),
    percentage: 40,
  ),
];
