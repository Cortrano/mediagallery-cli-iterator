import 'model.dart';

abstract class IIterator<T> {
  bool hasNext();
  T getNext();
}

class JpgIterator extends IIterator<JpgImage> {
  List<JpgImage> images = [];
  int index = 0;
  JpgImage _current;

  JpgIterator(this.images);

  bool hasNext() {
    return index < images.length;
  }

  JpgImage getNext() {
    if (!hasNext()) {
      _current = null;
      return null;
    }
    _current = images[index++];
    return _current;
  }

  JpgImage get current => _current;
}

class PngIterator extends IIterator<PngImage> {
  List<PngImage> images = [];
  int index = 0;
  PngImage _current;

  PngIterator(this.images);

  bool hasNext() {
    return index < images.length;
  }

  PngImage getNext() {
    if (!hasNext()) {
      _current = null;
      return null;
    }
    _current = images[index++];
    return _current;
  }

  PngImage get current => _current;
}