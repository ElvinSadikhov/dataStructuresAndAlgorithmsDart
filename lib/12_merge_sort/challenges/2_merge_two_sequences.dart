//! Challenge 2: Merge Two Sequences
// In this chapter you created a _merge function that merges two sorted lists. The challenge here is to generalize _merge so that it takes two iterables as inputs rather than lists. Here’s the function signature to start off:

List<E> _merge<E extends Comparable<dynamic>>(Iterable<E> first, Iterable<E> second) {
  final List<E> result = [];
  final Iterator<E> firstIterator = first.iterator;
  final Iterator<E> secondIterator = second.iterator;

  bool firstHasValue = firstIterator.moveNext();
  bool secondHasValue = secondIterator.moveNext();

  while (firstHasValue && secondHasValue) {
    final E valueA = firstIterator.current;
    final E valueB = secondIterator.current;
    final int comparisonResult = valueA.compareTo(valueB);
    if (comparisonResult < 0) {
      result.add(valueA);
      firstIterator.moveNext();
    } else if (comparisonResult > 0) {
      result.add(valueB);
      secondIterator.moveNext();
    } else {
      result.add(valueA);
      result.add(valueB);
      firstIterator.moveNext();
      secondIterator.moveNext();
    }
  }

  if (firstHasValue) {
    do {
      result.add(firstIterator.current);
    } while (firstIterator.moveNext());
  }
  
  if (secondHasValue) {
    do {
      result.add(secondIterator.current);
    } while (secondIterator.moveNext());
  }
  return result;
}