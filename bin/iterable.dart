abstract class IIterable<T> {
  void add(T item);
  void clear();

  List<T> get collection;
  IIterator get iterator;
}

abstract class IIterator<T> {
  T? _current;
  bool hasNext();
  T? getNext();

  T? get current => _current;
}

class ImageCollection<T> implements IIterable<T> {
  List<T> _collection;

  ImageCollection(this._collection);
  ImageCollection.empty() : _collection = [];

  @override
  void add(T item) {
    _collection.add(item);
  }

  void clear() {
    _collection.clear();
  }

  @override
  List<T> get collection => _collection;

  @override
  IIterator<T> get iterator => ImageIterator(_collection);
}

class ImageIterator<T> implements IIterator<T> {
  List<T> images = [];
  int index = 0;
  T? _current;

  ImageIterator(this.images);

  bool hasNext() {
    return index < images.length;
  }

  T? getNext() {
    if (!hasNext()) {
      _current = null;
      return null;
    }
    _current = images[index++];
    return _current;
  }

  T? get current => _current;
}
