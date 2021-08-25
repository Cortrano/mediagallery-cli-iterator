import 'iterator.dart';
import 'model.dart';

abstract class IIterable<T extends Image> {
  IIterator<T> get iterator;
  T at(int index);
  int get length;

  void add(T item);
  void forEach(void Function(T image) action);

  void clear();
}

class ImagesCollection<T extends Image> implements IIterable<T> {
  List<T> _images = [];
  int index = 0;

  ImagesCollection([List<T>? images]) : _images = images ?? [];

  @override
  IIterator<T> get iterator => ImagesIterator<T>(this);

  @override
  int get length => _images.length;

  @override
  T at(int index) {
    return _images.elementAt(index);
  }

  @override
  void add(T item) {
    _images.add(item);
  }

  @override
  void forEach(void action(T image)) {
    for (int i = 0; i < _images.length; i++) {
      action(_images[i]);
    }
  }

  @override
  void clear() {
    _images.clear();
  }
}
