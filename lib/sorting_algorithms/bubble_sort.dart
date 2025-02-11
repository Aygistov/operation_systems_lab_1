import 'dart:core';

import 'package:operation_systems/constants.dart';
import 'package:operation_systems/data_set.dart';
import 'package:operation_systems/is_sorted.dart';
import 'package:operation_systems/sorting_result.dart';

SortingResult bubbleSort(DataSet dataset) {
  final array = dataset.data.toList();
  int n = array.length;
  int operations = 0;
  int elementSize = getElementSize(dataset.dataType);
  int memoryUsage = n * elementSize;

  var stopwatch = Stopwatch()..start();

  for (int i = 0; i < n - 1; i++) {
    for (int j = 0; j < n - i - 1; j++) {
      operations++;
      if (array[j] > array[j + 1]) {
        num temp = array[j];
        operations++;
        array[j] = array[j + 1];
        operations++;
        array[j + 1] = temp;
        operations++;
      }
    }
  }

  stopwatch.stop();

  assert(isSorted(array));

  return SortingResult(
    sortingAlgorithm: SortingAlgorithm.bubbleSort,
    array: array,
    memoryUsage: memoryUsage,
    operations: operations,
    executionTimeMs: stopwatch.elapsedMilliseconds,
    distribution: dataset.distribution,
  );
}
