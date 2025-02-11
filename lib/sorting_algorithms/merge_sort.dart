import 'dart:core';

import 'package:operation_systems/constants.dart';
import 'package:operation_systems/data_set.dart';
import 'package:operation_systems/is_sorted.dart';
import 'package:operation_systems/sorting_result.dart';

SortingResult mergeSort(DataSet dataset) {
  final array = dataset.data.toList();
  int operations = 0;
  int elementSize = getElementSize(dataset.dataType);
  int memoryUsage = array.length * elementSize;

  List<num> merge(List<num> left, List<num> right) {
    List<num> result = [];
    int i = 0, j = 0;
    while (i < left.length && j < right.length) {
      operations++;
      if (left[i] <= right[j]) {
        result.add(left[i++]);
        operations++;
      } else {
        result.add(right[j++]);
        operations++;
      }
    }
    while (i < left.length) {
      result.add(left[i++]);
      operations++;
    }
    while (j < right.length) {
      result.add(right[j++]);
      operations++;
    }
    return result;
  }

  List<num> mergeSortHelper(List<num> arr) {
    if (arr.length <= 1) return arr;
    int mid = arr.length ~/ 2;
    List<num> left = mergeSortHelper(arr.sublist(0, mid));
    List<num> right = mergeSortHelper(arr.sublist(mid));
    return merge(left, right);
  }

  var stopwatch = Stopwatch()..start();
  List<num> sortedArray = mergeSortHelper(array);
  stopwatch.stop();

  assert(isSorted(sortedArray));

  return SortingResult(
    sortingAlgorithm: SortingAlgorithm.mergeSort,
    array: sortedArray,
    memoryUsage: memoryUsage,
    operations: operations,
    executionTimeMs: stopwatch.elapsedMilliseconds,
    distribution: dataset.distribution,
  );
}
