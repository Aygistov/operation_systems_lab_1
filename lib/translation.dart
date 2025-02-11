import 'package:operation_systems/data_set.dart';
import 'package:operation_systems/sorting_result.dart';

String complexityToString(Complexity complexity) {
  final map = {
    Complexity.n2: 'O(n^2)',
    Complexity.nLogN: 'O(n log n)',
    Complexity.n: 'O(n)',
  };
  return map[complexity] ?? '';
}

String distributionToString(Distribution distribution) {
  final map = {
    Distribution.asymptoticBest: 'найкращий',
    Distribution.asymptoticWorst: 'найгірший',
    Distribution.normal: 'нормальний',
    Distribution.uniform: 'рівномірний',
  };
  return map[distribution] ?? '';
}

String sortingAlgorithmToString(SortingAlgorithm sortingAlgorithm) {
  final map = {
    SortingAlgorithm.bubbleSort: 'Бульбашки',
    SortingAlgorithm.insertionSort: 'Вставки',
    SortingAlgorithm.mergeSort: 'Злиття',
    SortingAlgorithm.quickSort: 'Швидке',
    //SortingAlgorithm.buildSort: 'Вбудована',
  };
  return map[sortingAlgorithm] ?? '';
}
