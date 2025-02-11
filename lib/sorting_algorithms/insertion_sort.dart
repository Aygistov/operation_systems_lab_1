import 'dart:core';

import 'package:operation_systems/constants.dart';
import 'package:operation_systems/data_set.dart';
import 'package:operation_systems/is_sorted.dart';
import 'package:operation_systems/sorting_result.dart';

SortingResult insertionSort(DataSet dataset) {
  final array = dataset.data.toList();
  int n = array.length;
  int operations = 0;
  int elementSize = getElementSize(dataset.dataType);
  int memoryUsage = n * elementSize;

  var stopwatch = Stopwatch()..start();

  for (int i = 1; i < n; i++) {
    num key = array[i];
    operations++;
    int j = i - 1;

    while (j >= 0 && array[j] > key) {
      operations++;
      array[j + 1] = array[j];
      operations++;
      j--;
    }
    array[j + 1] = key;
    operations++;
  }

  stopwatch.stop();
  assert(isSorted(array));

  return SortingResult(
    sortingAlgorithm: SortingAlgorithm.insertionSort,
    array: array,
    memoryUsage: memoryUsage,
    operations: operations,
    executionTimeMs: stopwatch.elapsedMilliseconds,
    distribution: dataset.distribution,
  );
}
