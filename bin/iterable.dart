class ImageCollection<T> extends Iterable<T> {
  List<T> _images;

  ImageCollection(this._images);
  ImageCollection.empty() : _images = [];

  void clear() {
    _images.clear();
  }

  void add(T item){
    _images.add(item);
  }

  @override
  Iterator<T> get iterator => ImageIterator(_images);
}

class ImageIterator<T> implements Iterator<T> {
  List<T> _images;
  int _index = 0;
  T _current;

  ImageIterator(this._images);

  @override
  bool moveNext() {
    if (_index == _images.length) {
      _current = null;
      return false;
    }
    _current = _images[_index++];
    return true;
  }

  @override
  T get current => _current;
}