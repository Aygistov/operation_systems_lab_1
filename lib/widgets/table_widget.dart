import 'package:flutter/material.dart';
import 'package:operation_systems/constants.dart';
import 'package:operation_systems/sorting_result.dart';
import 'package:operation_systems/translation.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({
    super.key,
    required this.results,
  });

  final List<ResultsRaw> results;

  @override
  Widget build(BuildContext context) {
    final Map<int, TableColumnWidth> columns = {};
    columns[0] = FixedColumnWidth(100);
    int i = 1;
    for (var _ in counts) {
      columns[i] = FlexColumnWidth();
      columns[i + 1] = FlexColumnWidth();
      columns[i + 2] = FlexColumnWidth();
      columns[i + 3] = FlexColumnWidth();
      i += 4;
    }
    final firstRowCells = <Widget>[];
    final secondRowCells = <Widget>[];
    firstRowCells.add(TableCell(
      child: SizedBox.shrink(),
    ));
    secondRowCells.add(TableCell(
      child: SizedBox.shrink(),
    ));
    for (var c in counts) {
      firstRowCells.add(TableCell(child: Center(child: Text('$c ел-тів'))));
      firstRowCells.add(TableCell(child: SizedBox.shrink()));
      firstRowCells.add(TableCell(child: SizedBox.shrink()));
      firstRowCells.add(TableCell(child: SizedBox.shrink()));

      secondRowCells.add(TableCell(child: Center(child: Text('V'))));
      secondRowCells.add(TableCell(child: Center(child: Text('K'))));
      secondRowCells.add(TableCell(child: Center(child: Text('T'))));
      secondRowCells.add(TableCell(child: Center(child: Text('O'))));
    }

    return Table(
      border: TableBorder.all(),
      columnWidths: columns,
      children: [
        TableRow(children: firstRowCells),
        TableRow(children: secondRowCells),
        ...results.map((r) {
          final cells = [];
          r.results.forEach((c, r) {
            cells.add(TableCellWidget(r.memoryUsage.toString()));
            cells.add(TableCellWidget(r.operations.toString()));
            cells.add(TableCellWidget(r.executionTimeMs.toString()));
            cells.add(TableCellWidget(complexityToString(r.complexity)));
          });
          return TableRow(
            children: <Widget>[
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                      '${sortingAlgorithmToString(r.sortingAlgorithm)}, ${distributionToString(r.distribution)}'),
                ),
              ),
              ...cells
            ],
          );
        }),
      ],
    );
  }
}

class TableCellWidget extends StatelessWidget {
  const TableCellWidget(
    this.text, {
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return TableCell(
        child: Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Text(text, textAlign: TextAlign.end),
    ));
  }
}
