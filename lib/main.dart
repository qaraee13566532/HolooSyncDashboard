import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:holoo_dashboard/src/features/presentation/Pages/sync_result.dart';

import 'src/features/domain/base_responses/base_response.dart';
import 'src/features/domain/dto/authentication/user_token.dart';
import 'src/features/domain/dto/sync/sync.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Directionality(
        // add this
        textDirection: TextDirection.rtl, // set this property
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  ApiResponse<SyncResponses>? userData;

  Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://localhost:5001',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );

  Future<String?> login() async {
    String? token;
    try {
      Response response = await dio.post(
        '/api/User/authenticate',
        data: {'username': 'tozintech', 'password': 'ttech'},
      );
      ApiResponse<UserToken> resp = ApiResponse.fromJson(response.data,
          (Object? json) => UserToken.fromJson(response.data['data']));
      token = resp.data?.token;
    } on DioException catch (e) {
      token = null;
      print(e.message);
    }
    return token;
  }

  Future<ApiResponse<SyncResponses>?> getSyncStatus(SyncRequest request) async {
    ApiResponse<SyncResponses>? resault = null;
    try {
      Response response =
          await dio.post('/api/SyncStatus/Info', data: json.encode(request));
      if (response.statusCode == 200) {
        resault = ApiResponse.fromJson(response.data,
            (Object? json) => SyncResponses.fromJson(response.data));
        print(resault);
      } else {
        print('API call failed: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      print(e.message);
      resault = null;
    }
    return resault;
  }

  Future<String?> refreshToken() async {
    return login();
  }

  void getFailedSyncs() async {
    String? token = await login();
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Add the access token to the request header

          options.headers['Authorization'] = 'Bearer $token';
          return handler.next(options);
        },
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == 401) {
            // If a 401 response is received, refresh the access token
            String? newAccessToken = await refreshToken();

            // Update the request header with the new access token
            e.requestOptions.headers['Authorization'] =
                'Bearer $newAccessToken';

            // Repeat the request with the updated header
            return handler.resolve(await dio.fetch(e.requestOptions));
          }
          return handler.next(e);
        },
      ),
    );
    const request = SyncRequest(Issuccessfull: false);
    userData = await getSyncStatus(request);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Directionality(
          textDirection: TextDirection.rtl,
          child: SyncResult(
              title: "گزارش فاکتورهای ارسال نشده",
              items: userData!.data!.data!.length,
              syncResponses: userData!.data),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
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
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () => {},
                    child: Text(
                      'تنظیم ارتباط',
                      textAlign: TextAlign.center,
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(
                          double.infinity, 40), // Set minimum width and height
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () => {},
                    child: Text(
                      'بررسی ارتباط',
                      textAlign: TextAlign.center,
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 40),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () => {},
                    child: Text(
                      'مشاهده فاکتور فروش',
                      textAlign: TextAlign.center,
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 40),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () => {},
                    child: Text(
                      'مشاهده سند حسابداری',
                      textAlign: TextAlign.center,
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 40),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      getFailedSyncs();
                    },
                    child: Text(
                      'گزارش فاکتورهای ارسال نشده',
                      textAlign: TextAlign.center,
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 40),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () => {},
                    child: Text(
                      'گزارش های پیشرفته',
                      textAlign: TextAlign.center,
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 40),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () => {},
                    child: Text(
                      'درباره برنامه',
                      textAlign: TextAlign.center,
                    ),
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
              ),
            ),
            Expanded(
              flex: 15,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
