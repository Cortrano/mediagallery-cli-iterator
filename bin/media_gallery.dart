import 'dart:io';
import 'package:path/path.dart' as p;
import 'iterable.dart';
import 'model.dart';

class MediaGallery {
  static final MediaGallery _mediaGallery = MediaGallery._internal();

  final List<FileSystemEntity> list = [];
  final ImageCollection<PngImage> pngList = ImageCollection.empty();
  final ImageCollection<JpgImage> jpgList = ImageCollection.empty();

  void getFilesFromPath(String path) {
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

  void listPngFiles(ImageCollection<PngImage> pngList, {bool details}) {
    for (var image in pngList) {
      details
          ? stdout.writeln(image.showDetails())
          : stdout.writeln(image.name);
    }
  }

  void listJpgFiles(ImageCollection<JpgImage> jpgList, {bool details}) {
    for (var image in jpgList) {
      details
          ? stdout.writeln(image.showDetails())
          : stdout.writeln(image.name);
    }
  }

  void clear() {
    list.clear();
    pngList.clear();
    jpgList.clear();
  }

  factory MediaGallery() => _mediaGallery;

  MediaGallery._internal();
}
