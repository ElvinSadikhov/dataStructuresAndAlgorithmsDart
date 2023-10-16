// ignore_for_file: unnecessary_this, avoid_function_literals_in_foreach_calls

import 'dart:math';

extension Digits on int {
  static const _base = 10;

  int digits() {
    int count = 0;
    int number = this;
    while (number != 0) {
      count += 1;
      number ~/= _base;
    }
    return count;
  }

  int? digitAt(int position) {
    if (position >= digits()) {
      return null;
    }
    int number = this;
    while (number ~/ pow(_base, position + 1) != 0) {
      number ~/= _base;
    }
    return number % _base;  
  }
}

extension MSDRadixSort on List<int> {
  int maxDigits() {
    if (isEmpty) return 0;
    return reduce(max).digits();
  }
  
  void lexicographicalSort() {
    final List<int> sorted = _msdRadixSorted(this, 0);
    this.clear();
    this.addAll(sorted);
  }

  List<int> _msdRadixSorted(List<int> list, int position) {
    if (list.length < 2 || position >= list.maxDigits())  return list;

    final List<List<int>> buckets = List.generate(10, (_) => <int>[]);
    final List<int> priorityBucket = <int>[];

    for (int number in list) {
      final int? digit = number.digitAt(position);
      if (digit == null) {
        priorityBucket.add(number);
        continue; 
      }
      buckets[digit].add(number);
    }

    print(buckets);
    final List<int> bucketOrder = buckets.reduce((result, bucket) {
      if (bucket.isEmpty) return result;
      final List<int> sorted = _msdRadixSorted(bucket, position + 1);
      return result..addAll(sorted);
    });

    return priorityBucket..addAll(bucketOrder);
  }
}

void main() {
  final List<int> list = [46, 500, 459, 1345, 13, 999];
  print("Original list: $list");
  
  list.lexicographicalSort();
  print("Radix sorted: $list");
}