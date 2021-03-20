import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:path/path.dart';

abstract class Image {
  double size;
  int heigth;
  int width;
  Type type;
}

class PngImage extends Image {
  double size;
  int height;
  int width;
  String name;
 
  PngImage({
    this.size,
    this.height,
    this.width,
    this.name,
  });

  factory PngImage.fromFileSystemEntity(FileSystemEntity entity) {
    final img.Image image =
        img.decodeImage(List.from(File(entity.path).readAsBytesSync()));
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
  double size;
  int height;
  int width;
  String name;

  JpgImage({
    this.size,
    this.height,
    this.width,
    this.name,
  });

  factory JpgImage.fromFileSystemEntity(FileSystemEntity entity) {
    final img.Image image =
        img.decodeImage(List.from(File(entity.path).readAsBytesSync()));
    return JpgImage(
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
