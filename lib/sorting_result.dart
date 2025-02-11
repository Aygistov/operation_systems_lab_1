import 'package:operation_systems/data_set.dart';

enum Complexity { n, n2, nLogN }

class SortingResult {
  final List array;
  final int memoryUsage;
  final int operations;
  final int executionTimeMs;
  final Distribution distribution;
  final SortingAlgorithm sortingAlgorithm;

  SortingResult({
    required this.array,
    required this.memoryUsage,
    required this.operations,
    required this.executionTimeMs,
    required this.distribution,
    required this.sortingAlgorithm,
  });

  Complexity get complexity => getComplexity(sortingAlgorithm, distribution);
  int get count => array.length;
}

Complexity getComplexity(
    SortingAlgorithm sortingAlgorithm, Distribution distribution) {
  const map = {
    (SortingAlgorithm.bubbleSort, Distribution.asymptoticBest): Complexity.n,
    (SortingAlgorithm.bubbleSort, Distribution.asymptoticWorst): Complexity.n2,
    (SortingAlgorithm.bubbleSort, Distribution.normal): Complexity.n2,
    (SortingAlgorithm.bubbleSort, Distribution.uniform): Complexity.n2,
    (SortingAlgorithm.insertionSort, Distribution.asymptoticBest): Complexity.n,
    (SortingAlgorithm.insertionSort, Distribution.asymptoticWorst):
        Complexity.n2,
    (SortingAlgorithm.insertionSort, Distribution.normal): Complexity.n2,
    (SortingAlgorithm.insertionSort, Distribution.uniform): Complexity.n2,
    (SortingAlgorithm.mergeSort, Distribution.asymptoticBest): Complexity.nLogN,
    (SortingAlgorithm.mergeSort, Distribution.asymptoticWorst):
        Complexity.nLogN,
    (SortingAlgorithm.mergeSort, Distribution.normal): Complexity.nLogN,
    (SortingAlgorithm.mergeSort, Distribution.uniform): Complexity.nLogN,
    (SortingAlgorithm.quickSort, Distribution.asymptoticBest): Complexity.nLogN,
    (SortingAlgorithm.quickSort, Distribution.asymptoticWorst): Complexity.n2,
    (SortingAlgorithm.quickSort, Distribution.normal): Complexity.nLogN,
    (SortingAlgorithm.quickSort, Distribution.uniform): Complexity.nLogN,
  };
  return map[(sortingAlgorithm, distribution)] ?? Complexity.n;
}

class ResultsRaw {
  final Distribution distribution;
  final SortingAlgorithm sortingAlgorithm;
  final Map<int, SortingResult> results;

  ResultsRaw(
      {required this.results,
      required this.distribution,
      required this.sortingAlgorithm});
}
