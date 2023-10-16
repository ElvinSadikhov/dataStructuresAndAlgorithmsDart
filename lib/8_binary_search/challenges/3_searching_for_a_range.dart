// ignore_for_file: public_member_api_docs, sort_constructors_first
//! Challenge 3: Searching for a Range
// Write a function that searches a sorted list and finds the range of indices for a particular element. You can start by creating a class named Range that holds the start and end indices.

class Range {
  int start;
  int end;

  Range({required this.start, required this.end}); 

  @override
  String toString() => 'Range(start: $start, end: $end)';
}

Range? findRange(List<int> list, int value) {
  if (list.isEmpty) return null;

  final int? startIndex = _firstIndexOf(list, value);
  int? endIndex;
  if (startIndex == null) return null;

  int curIndex = startIndex;
  final int listLength = list.length;
  while (curIndex < listLength) {
    if (value.compareTo(list[curIndex]) == 0) {
      endIndex = curIndex + 1;
    } else if (endIndex != null) {
      return Range(start: startIndex, end: endIndex);
    }
    curIndex++;
  }

  return Range(start: startIndex, end: endIndex ?? startIndex);
}

int? _firstIndexOf(List<int> list, int value) {
  int startIndex = 0;
  int endIndex = list.length;
  late int middleIndex;

  while (endIndex > startIndex) {
    middleIndex = (startIndex + endIndex) ~/ 2;
    final int foundElement = list[middleIndex];

    if (value.compareTo(foundElement) == 0 && value.compareTo(list[middleIndex -1]) != 0) {
      return middleIndex;
    } else if (value.compareTo(foundElement) > 0) {
      startIndex = middleIndex + 1;
    } else {  // < 0
      endIndex = middleIndex;
    }
  }
  
  return null;
}

void main() {
  final List<int> list = [1, 2, 3, 3, 3, 4, 5, 5];
  final Range? range = findRange(list, 3);
  print(range);
}