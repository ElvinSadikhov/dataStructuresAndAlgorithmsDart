List<E> mergeSort<E extends Comparable<dynamic>>(List<E> list) {
  if (list.length < 2)  return list;

  final int middleIndex = list.length ~/ 2;
  final List<E> leftPart = mergeSort(list.sublist(0, middleIndex).toList());
  final List<E> rightPart = mergeSort(list.sublist(middleIndex).toList());

  return _merge(leftPart, rightPart);
}

List<E> _merge<E extends Comparable<dynamic>>(List<E> listA, List<E> listB) {
  final List<E> result = [];
  int indexA = 0;
  int indexB = 0;

  while (indexA < listA.length && indexB < listB.length) {
    final E valueA = listA[indexA];
    final E valueB = listB[indexB];
    final int comparisonResult = valueA.compareTo(valueB);
    if (comparisonResult < 0) {
      result.add(valueA);
      indexA++;
    } else if (comparisonResult > 0) {
      result.add(valueB);
      indexB++;
    } else {
      result.add(valueA);
      result.add(valueB);
      indexA++;
      indexB++;
    }
  }

  if (indexA < listA.length) {
    result.addAll(listA.getRange(indexA, listA.length));
  } 

  if (indexB < listB.length) {
    result.addAll(listB.getRange(indexB, listB.length));
  }

  return result;
}

void main() {
  final List<int> list = [7, 2, 6, 3, 9];
  final List<int> sorted = mergeSort(list);
  print('Original: $list');
  print('Merge sorted: $sorted');
}