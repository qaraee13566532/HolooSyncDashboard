import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holoo_dashboard/src/features/presentation/bloc/sync_result_bloc.dart';

import '../../../core/utils/injections.dart';
import '../../domain/models/sync.dart';
import '../../domain/usecases/sunc_result_usecase.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final SyncResultCubit _cubit = SyncResultCubit(const SyncResponses(),
      synResultUseCase: sl<SynResultUseCase>());

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SyncResultCubit>(
      create: (context) => _cubit,
      child: Scaffold(
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(
            widget.title,
            style: TextStyle(
              fontFamily: 'BNazanin',
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(
                flex: 15,
                child: Container(),
              ),
              Expanded(
                flex: 70,
                child: BlocBuilder(
                  bloc: _cubit,
                  builder: (context, state) {
                    return Column(
                      children: [
                        ElevatedButton(
                          onPressed: () => {},
                          child: Text('تنظیم ارتباط',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity,
                                40), // Set minimum width and height
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () => {},
                          child: Text('بررسی ارتباط',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 40),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () => {},
                          child: Text('مشاهده فاکتور فروش',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 40),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () => {},
                          child: Text('مشاهده سند حسابداری',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 40),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: context
                              .read<SyncResultCubit>()
                              .synResultUseCase
                              .getFailedItems,
                          child: Text('گزارش فاکتورهای ارسال نشده',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 40),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () => {},
                          child: Text('گزارش های پیشرفته',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 40),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () => {},
                          child: Text('درباره برنامه',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 40),
                          ),
                        ),
                        Expanded(child: Container()),
                        ElevatedButton(
                          onPressed: () => {
                            if (Platform.isAndroid)
                              {SystemNavigator.pop()}
                            else if (Platform.isIOS || Platform.isWindows)
                              {exit(0)}
                          },
                          child: Text(
                            'خروج',
                            textAlign: TextAlign.center,
                          ),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 40),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Expanded(
                flex: 15,
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
