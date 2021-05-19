import 'model.dart';
import 'iterable.dart';

abstract class IIterator<T extends Image> {
  T? get current;
  bool hasNext();
  T? getNext();
}

class ImagesIterator<T extends Image> implements IIterator<T> {
  final IIterable<T> _iterable;
  final int _length;
  int _index;
  T? _current;

  ImagesIterator(IIterable<T> iterable)
      : _iterable = iterable,
        _length = iterable.length,
        _index = 0;

  T? get current => _current;

  @override
  T? getNext() {
    if (!hasNext()) {
      _current = null;
      return null;
    }
    _current = _iterable.at(_index);
    _index++;
    return _current;
  }

  @override
  bool hasNext() => _index < _length;
}
