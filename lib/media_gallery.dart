import 'dart:io';
import 'package:path/path.dart' as p;

import 'iterable.dart';
import 'model.dart';

class MediaGallery {
  static final MediaGallery _mediaGallery = MediaGallery._internal();

  final List<FileSystemEntity> list = [];
  final pngList = ImagesCollection<PngImage>();
  final jpgList = ImagesCollection<JpgImage>();

  void getFilesFromPath(String path) async {
    if (await FileSystemEntity.isFile(path)) {
      stderr.writeln('error: $path is a file, please provide a directory');
    } else {
      exitCode = 2;
    }

    list.addAll(Directory(path).listSync());

    list.forEach((item) {
      final itemType = p.extension(item.path);
      if (itemType == '.png') {
        var pngImage = PngImage.fromFileSystemEntity(item);
        pngList.add(pngImage);
      } else if (itemType == '.jpg') {
        var jpgItem = JpgImage.fromFileSystemEntity(item);
        jpgList.add(jpgItem);
      }
    });
  }

  void proceedOption(String option) {
    switch (option) {
      case '1':
        listAllFiles(list);
        break;
      case '2':
        listPngFiles(pngList, details: false);
        break;
      case '2 -d':
        listPngFiles(pngList, details: true);
        break;
      case '3':
        listJpgFiles(jpgList, details: false);
        break;
      case '3 -d':
        listJpgFiles(jpgList, details: true);
        break;
    }
  }

  void listAllFiles(List<FileSystemEntity> list) {
    for (var item in list) {
      stdout.writeln(p.basename(item.path));
    }
  }

  void listPngFiles(IIterable<PngImage> pngList, {bool details = false}) {
    pngList.forEach((image) {
      details
          ? stdout.writeln(image.showDetails())
          : stdout.writeln(image.name);
    });
  }

  void listJpgFiles(IIterable<JpgImage> jpgList, {bool details = false}) {
    jpgList.forEach((image) {
      details
          ? stdout.writeln(image.showDetails())
          : stdout.writeln(image.name);
    });
  }

  void clear() {
    list.clear();
    pngList.clear();
    jpgList.clear();
  }

  factory MediaGallery() => _mediaGallery;

  MediaGallery._internal();
}
