//! Challenge 1: What Are in the Buckets?
// Add a print statement to your radixSort implementation so that it’ll tell you what’s in the buckets after each round of sorting.
// Do the same for each recursion of lexicographicalSort.

// ignore_for_file: unused_import

import 'package:data_structures_and_algorithms/13_radix_sort/lsd_radix_sort.dart';
import 'package:data_structures_and_algorithms/13_radix_sort/msd_radix_sort.dart';

void main() {
  final List<int> list = [46, 500, 459, 1345, 13, 999];
  print("Original list: $list");
  
  list.lsdRadixSort();
  print("Radix sorted: $list\n");

  list.lexicographicalSort();
  print("Radix sorted: $list");
}