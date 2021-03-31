import 'dart:io';
import 'media_gallery.dart';
import 'messenger.dart';

void main() async {
  MediaGallery mediaGallery = MediaGallery();
  Messenger messenger = Messenger();
  bool repeat = true;

  messenger.printInitial();
  var path = messenger.writePath();
  while (repeat) {
    await mediaGallery.getFilesFromPath(path);

    messenger.printOptions();
    var option = messenger.writeOption();

    mediaGallery.proceedOption(option);

    messenger.printRepeat();
    repeat = messenger.writeRepeat();
    mediaGallery.clear();
  }

  exitCode = 1;
}