import 'package:operation_systems/constants.dart';
import 'package:operation_systems/data_set.dart';
import 'package:operation_systems/sorting_result.dart';

class DataSets {
  final intDataSets = <DataSet>[];
  final doubleDataSets = <DataSet>[];

  List<ResultsRaw> get intResultRaws {
    final results = intResults;
    final resultsRaws = <ResultsRaw>[];
    if (results.isEmpty) return [];
    for (var a in SortingAlgorithm.values) {
      for (var d in Distribution.values) {
        resultsRaws.add(ResultsRaw(
            results: results[a]![d]!, distribution: d, sortingAlgorithm: a));
      }
    }
    return resultsRaws;
  }

  List<ResultsRaw> get doubleResultRaws {
    final results = doubleResults;
    final resultsRaws = <ResultsRaw>[];
    if (results.isEmpty) return [];
    for (var a in SortingAlgorithm.values) {
      for (var d in Distribution.values) {
        resultsRaws.add(ResultsRaw(
            results: results[a]![d]!, distribution: d, sortingAlgorithm: a));
      }
    }
    return resultsRaws;
  }

  Map<SortingAlgorithm, Map<Distribution, Map<int, SortingResult>>>
      get intResults {
    if (intDataSets.isEmpty) return {};
    final Map<SortingAlgorithm, Map<Distribution, Map<int, SortingResult>>>
        sortingAlgorithm = {};
    for (var a in SortingAlgorithm.values) {
      final Map<Distribution, Map<int, SortingResult>> distribution = {};
      for (var d in Distribution.values) {
        final Map<int, SortingResult> countsResults = {};
        for (var c in counts) {
          final res = intDataSets
              .firstWhere((s) => s.distribution == d && s.count == c)
              .results
              .firstWhere((r) => r.sortingAlgorithm == a);
          countsResults[c] = res;
        }
        distribution[d] = countsResults;
      }
      sortingAlgorithm[a] = distribution;
    }

    return sortingAlgorithm;
  }

  Map<SortingAlgorithm, Map<Distribution, Map<int, SortingResult>>>
      get doubleResults {
    if (doubleDataSets.isEmpty) return {};
    final Map<SortingAlgorithm, Map<Distribution, Map<int, SortingResult>>>
        sortingAlgorithm = {};
    for (var a in SortingAlgorithm.values) {
      final Map<Distribution, Map<int, SortingResult>> distribution = {};
      for (var d in Distribution.values) {
        final Map<int, SortingResult> countsResults = {};
        for (var c in counts) {
          final res = doubleDataSets
              .firstWhere((s) => s.distribution == d && s.count == c)
              .results
              .firstWhere((r) => r.sortingAlgorithm == a);
          countsResults[c] = res;
        }
        distribution[d] = countsResults;
      }
      sortingAlgorithm[a] = distribution;
    }

    return sortingAlgorithm;
  }

  init() {
    intDataSets.clear();
    doubleDataSets.clear();

    for (var c in counts) {
      for (var d in Distribution.values) {
        intDataSets.add(DataSet(
          distribution: d,
          dataType: int,
          count: c,
        ));
        doubleDataSets.add(DataSet(
          distribution: d,
          dataType: double,
          count: c,
        ));
      }
    }
  }
}
