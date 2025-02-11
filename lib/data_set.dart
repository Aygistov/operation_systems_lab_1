import 'package:calc/calc.dart';
import 'package:operation_systems/sorting_result.dart';

import 'sorting_algorithms/bubble_sort.dart';
import 'sorting_algorithms/insertion_sort.dart';
import 'sorting_algorithms/merge_sort.dart';
import 'sorting_algorithms/quick_sort.dart';

enum Distribution { asymptoticWorst, uniform, normal, asymptoticBest }

enum SortingAlgorithm {
  bubbleSort,
  insertionSort,
  mergeSort,
  quickSort,
  //buildSort,
}

class DataSet {
  DataSet({
    required this.distribution,
    required this.dataType,
    required this.count,
  }) {
    init();
    sort();
  }
  final data = <num>[];
  final Distribution distribution;
  final Type dataType;
  final int count;
  final List<SortingResult> results = [];

  sort() {
    results.add(bubbleSort(this));
    results.add(insertionSort(this));
    results.add(mergeSort(this));
    results.add(quickSort(this));
    // results.add(buildSort(this));
  }

  init() {
    switch (distribution) {
      case Distribution.asymptoticBest:
        data.addAll(List.generate(
            count, (int index) => dataType == int ? index : index.toDouble(),
            growable: true));
      case Distribution.asymptoticWorst:
        data.addAll(List.generate(
            count,
            (int index) =>
                dataType == int ? count - index : (count - index).toDouble(),
            growable: true));
      case Distribution.normal:
        var dataDistribution =
            NormalDistribution(mean: count.toDouble(), variance: count / 3)
                .sampleList(count);
        if (dataType == int) {
          data.addAll(dataDistribution.map((e) => (e).toInt()));
        } else {
          data.addAll(dataDistribution);
        }
      case Distribution.uniform:
        var dataDistribution =
            UniformDistribution(0, count.toDouble()).sampleList(count);
        if (dataType == int) {
          data.addAll(dataDistribution.map((e) => (e).toInt()));
        } else {
          data.addAll(dataDistribution);
        }
    }
  }
}
