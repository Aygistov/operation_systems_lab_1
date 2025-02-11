import 'dart:core';

import 'package:operation_systems/constants.dart';
import 'package:operation_systems/data_set.dart';
import 'package:operation_systems/is_sorted.dart';
import 'package:operation_systems/sorting_result.dart';

SortingResult quickSort(DataSet dataset) {
  final array = dataset.data.toList();
  int elementSize = getElementSize(dataset.dataType);
  int memoryUsage = array.length * elementSize;
  int operations = 0;

  int partition(List<num> arr, int low, int high) {
    num pivot = arr[high];
    operations++;

    int i = low - 1;

    for (int j = low; j < high; j++) {
      operations++;
      if (arr[j] < pivot) {
        i++;
        num temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
        operations += 3;
      }
    }

    num temp = arr[i + 1];
    arr[i + 1] = arr[high];
    arr[high] = temp;
    operations += 3;

    return i + 1;
  }

  void sort(
    List<num> arr,
    int low,
    int high,
  ) {
    if (low < high) {
      operations++;
      int pi = partition(arr, low, high);
      sort(arr, low, pi - 1);
      sort(arr, pi + 1, high);
    }
  }

  final stopwatch = Stopwatch()..start();
  sort(array, 0, array.length - 1);
  stopwatch.stop();
  assert(isSorted(array));
  return SortingResult(
    sortingAlgorithm: SortingAlgorithm.quickSort,
    array: array,
    memoryUsage: memoryUsage,
    operations: operations,
    executionTimeMs: stopwatch.elapsedMilliseconds,
    distribution: dataset.distribution,
  );
}
