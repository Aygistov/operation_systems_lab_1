/*
import 'dart:core';

import 'package:operation_systems/constants.dart';
import 'package:operation_systems/data_set.dart';
import 'package:operation_systems/is_sorted.dart';
import 'package:operation_systems/sorting_result.dart';

SortingResult buildSort(DataSet dataset) {
  final array = dataset.data.toList();
  int n = array.length;
  int operations = 0;
  int elementSize = getElementSize(dataset.dataType);
  int memoryUsage = n * elementSize;

  var stopwatch = Stopwatch()..start();
  array.sort((a, b) => a.compareTo(b));

  stopwatch.stop();

  assert(isSorted(array));

  return SortingResult(
    sortingAlgorithm: SortingAlgorithm.buildSort,
    array: array,
    memoryUsage: memoryUsage,
    operations: operations,
    executionTimeMs: stopwatch.elapsedMilliseconds,
    distribution: dataset.distribution,
  );
}
*/
