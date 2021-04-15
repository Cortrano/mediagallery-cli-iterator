import 'dart:io';
import 'package:exif/exif.dart';
import 'package:image/image.dart' as img;
import 'package:path/path.dart';

abstract class Image {
  double? size;
  int? heigth;
  int? width;
  String? name;

  String showDetails();
}

class PngImage extends Image {
  double? size;
  int? height;
  int? width;
  String? name;

  PngImage({
    this.size,
    this.height,
    this.width,
    this.name,
  });

  factory PngImage.fromFileSystemEntity(FileSystemEntity entity) {
    final img.Image image =
        img.decodeImage(List.from(File(entity.path).readAsBytesSync()))!;
    return PngImage(
      height: image.height,
      width: image.width,
      size: File(entity.path).readAsBytesSync().lengthInBytes / 1000,
      name: basename(entity.path),
    );
  }

  String showDetails() {
    return 'Name: $name, Size: $size KB, Height: $height, Width: $width';
  }
}

class JpgImage extends Image {
  double? size;
  int? height;
  int? width;
  String? name;
  IfdTag? orientation;

  JpgImage({
    this.size,
    this.height,
    this.width,
    this.name,
    this.orientation,
  });

  static Future<JpgImage> fromFileSystemEntity(FileSystemEntity entity) async {
    final img.Image image =
        img.decodeImage(List.from(File(entity.path).readAsBytesSync()))!;
    var exif = await readExifFromFile(File(entity.path));
    return JpgImage(
      height: image.height,
      width: image.width,
      size: File(entity.path).readAsBytesSync().lengthInBytes / 1000,
      name: basename(entity.path),
      orientation: exif!['Image Orientation'],
    );
  }

  String showDetails() {
    return 'Name: $name, Size: $size KB, Height: $height, Width: $width, Orientation: $orientation';
  }
}
