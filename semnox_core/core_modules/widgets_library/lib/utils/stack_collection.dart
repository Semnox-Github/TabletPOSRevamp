import 'dart:collection';

class StackCollection<T> {
  final Queue<T> _queue;

  StackCollection() : _queue = Queue<T>();

  void push(T element) {
    _queue.addLast(element);
  }

  /// special case - to add element at initial pos
  void insertAtStart(T element) {
    _queue.addFirst(element);
  }

  T? pop() {
    return this.isEmpty ? null : _queue.removeLast();
  }

  void clear() {
    _queue.clear();
  }

  bool get isEmpty => _queue.isEmpty;
  bool get isNotEmpty => _queue.isNotEmpty;
  int get length => this._queue.length;
}