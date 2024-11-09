import 'dart:convert';

import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/models/base_response.dart';
import '../../domain/models/user_token.dart';
import '../../domain/models/sync.dart';

class ReportFailedPage extends StatefulWidget {
  final String title;
  final int items;
  final SyncResponses? syncResponses;

  const ReportFailedPage(
      {super.key,
        required this.title,
        required this.items,
        this.syncResponses});


  @override
  State<ReportFailedPage> createState() => _ReportFailedPageState();
}

class _ReportFailedPageState extends State<ReportFailedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 50,
              child: Stack(
                children: <Widget>[
                  Row(children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('بروزرسانی')),
                    SizedBox(width: 20,),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('باز گشت')),
                  ],),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      widget.title,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
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
                rows: List<DataRow>.generate(widget.items, (index) {
                  return DataRow(
                    cells: [
                      DataCell(Text((index + 1).toString())),
                      DataCell(Text(
                        widget.syncResponses!.data![index].objectCode!,
                        textAlign: TextAlign.center,
                      )),
                      DataCell(Text(
                        widget.syncResponses!.data![index].receiptNumber!,
                        textAlign: TextAlign.center,
                      )),
                      DataCell(Text(
                        widget.syncResponses!.data![index].errorCode ?? '',
                        textAlign: TextAlign.center,
                      )),
                      DataCell(Text(
                        widget.syncResponses!.data![index].errorMessage ?? '',
                        textAlign: TextAlign.center,
                      )),
                      DataCell(
                        Text(
                          DateFormat('yyyy-MM-dd')
                              .format(widget.syncResponses!.data![index].updatedTime!),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      DataCell(
                        Text(
                          DateFormat('kk:mm')
                              .format(widget.syncResponses!.data![index].updatedTime!),
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
