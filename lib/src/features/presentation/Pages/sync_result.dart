import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/dto/sync/sync.dart';

class SyncResult extends StatelessWidget {
  final String title;
  final int items;
  final SyncResponses? syncResponses;

  const SyncResult(
      {super.key,
      required this.title,
      required this.items,
      this.syncResponses});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('بازگشت')),
                ),
                Expanded(
                  flex: 20,
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
            Expanded(
              child: DataTable2(
                columnSpacing: 12,
                horizontalMargin: 12,
                minWidth: 600,
                columns: [
                  DataColumn(
                    label: Text('ردیف'),
                  ),
                  DataColumn2(
                    label: Text('شماره فاکتور فروش'),
                    size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('شماره فاکتور هلو'),
                    size: ColumnSize.L,
                  ),
                  DataColumn(
                    label: Text('کد خطا'),
                    numeric: true,
                  ),
                  DataColumn(
                    label: Text('دلیل عدم ارسال'),
                  ),
                  DataColumn(
                    label: Text('تاریخ اخرین ارسال'),
                    numeric: true,
                  ),
                  DataColumn(
                    label: Text('زمان اخرین ارسال'),
                    numeric: true,
                  ),
                ],
                rows: List<DataRow>.generate(items, (index) {
                  return DataRow(
                    cells: [
                      DataCell(Text((index + 1).toString())),
                      DataCell(Text(
                        syncResponses!.data![index].objectCode!,
                        textAlign: TextAlign.center,
                      )),
                      DataCell(Text(
                        syncResponses!.data![index].receiptNumber!,
                        textAlign: TextAlign.center,
                      )),
                      DataCell(Text(
                        syncResponses!.data![index].errorCode ?? '',
                        textAlign: TextAlign.center,
                      )),
                      DataCell(Text(
                        syncResponses!.data![index].errorMessage ?? '',
                        textAlign: TextAlign.center,
                      )),
                      DataCell(
                        Text(
                          DateFormat('yyyy-MM-dd')
                              .format(syncResponses!.data![index].updatedTime!),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      DataCell(
                        Text(
                          DateFormat('kk:mm')
                              .format(syncResponses!.data![index].updatedTime!),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
