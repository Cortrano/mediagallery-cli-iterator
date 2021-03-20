import 'dart:io';
import 'media_gallery.dart';
import 'messenger.dart';

void main(List<String> arguments) async {
  MediaGallery mediaGallery = MediaGallery();
  Messenger messenger = Messenger();
  bool repeat = true;

  messenger.printInitial();
  var path = messenger.writePath();
  while (repeat) {
    mediaGallery.getFilesFromPath(path);

    messenger.printOptions();
    var option = messenger.writeOption();

    mediaGallery.proceedOption(option);

    messenger.printRepeat();
    repeat = messenger.writeRepeat();
    mediaGallery.jpgList.clear();
    mediaGallery.pngList.clear();
    mediaGallery.list.clear();
  }

  exitCode = 1;
}