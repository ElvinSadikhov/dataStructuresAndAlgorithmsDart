// ignore_for_file: unnecessary_this, avoid_function_literals_in_foreach_calls

extension LSDRadixSort on List<int> {
  void lsdRadixSort() {
    const baseNumber = 10;
    // bool done = false;
    int unsorted = this.length;

    int place = 1;  // 1, 10, 100...
    // while (!done) {
    while (unsorted > 0) {
      // done = true;
      unsorted = 0;
      final List<List<int>> buckets = List.generate(baseNumber, (_) => <int>[]);
      this.forEach((number) {
        final int remainingPart = number ~/ place;
        final int digit = remainingPart % baseNumber;

        buckets[digit].add(number);
        if (remainingPart ~/ baseNumber > 0) {
          // done = false;
          unsorted++;
        }
      });
      place *= baseNumber;
      this.clear();
      this.addAll(buckets.expand((element) => element));
      print(buckets);
    }
  }
}

void main() {
  final List<int> list = [88, 410, 1772, 20];
  print("Original list: $list");
  
  list.lsdRadixSort();
  print("Radix sorted: $list");
}