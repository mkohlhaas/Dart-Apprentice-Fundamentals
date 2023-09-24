class HundredSquares extends Iterable<int> {
  @override
  Iterator<int> get iterator => SquaredIterator();
}

// An Iterable uses an Iterator to determine the next element in the collection.
class SquaredIterator implements Iterator<int> {
  int _index = 0;

  @override
  bool moveNext() {
    _index++;
    return _index <= 10;
  }

  @override
  int get current => _index * _index;
}
