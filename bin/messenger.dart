import 'dart:io';

class Messenger {
  void printInitial() {
    stdout.writeln('MediaGallery_CLI 0.1');
    stdout.writeln('Print your path with media files:');
  }

  void printOptions() {
    stdout.writeln('Select option:');
    stdout.writeln('1: List all files');
    stdout.writeln('2: List png files (add -d for details)');
    stdout.writeln('3: List jpg files (add -d for details)');
  }

  void printRepeat() {
    stdout.writeln('To Exit print "0"');
  }

  String writePath() {
    return stdin.readLineSync();
  }

  String writeOption() {
    return stdin.readLineSync();
  }

  bool writeRepeat() {
    if (stdin.readLineSync() == '0')
      return false;
    else {
      return true;
    }
  }
}
