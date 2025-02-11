import 'package:collection/collection.dart';

bool isSorted(List<num> list) {
  List<num> sortedList = List.from(list)..sort();
  return list.equals(sortedList);
}
